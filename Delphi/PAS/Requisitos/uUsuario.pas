unit uUsuario;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.Win.ADODB, Data.DB, json, idHTTP, uDM;

type TUsuario = Class(TObject)
   private
      fsID : Integer;
      fsUsuario : String;
      fsSenha : String;
      fsNome : String;
      fsCep : String;
      fsEndereco : String;
      fsComplemento : String;
      fsBairro : String;
      fsCidade : String;
      fsUF : String;
      fsCPF : String;
      fsRG : String;
      fsPrivilegio : integer;
      fsDataCriacao : TDateTime;
      fsIP : String;
      fsHost : String;
      fsTema : Integer;
      function getIPExtreno() : String;
      function getNomeComputador(): String;
      procedure setInformacoesUsuario(IDUsuario : Integer);
      procedure doAtualizaUsuario;
   public
      constructor Create;
      destructor Destroy;
      function doValidaUsuario(Usuario, Senha:String) : boolean;
      function getUsuarioExiste(Usuario:String) : Boolean;
      function getIDUsuario() : Integer;
      function getUsuario() : String;
      function getNome() : String;
      function getCEP() : String;
      function getEndereco() : String;
      function getComplemento() : String;
      function getBairro() : String;
      function getCidade() : String;
      function getUF() : String;
      function getCPF() : String;
      function getRG() : String;
      function getPrivilegio() : Integer;
      function getDataCriacao() : TDateTime;
      function getIP() : String;
      function getHost() : String;
      function getTema() : Integer;
End;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
   {:: Obtêm os dados do usuario ::}
   fsHost := getNomeComputador();
   fsIP := getIPExtreno();
end;

destructor TUsuario.Destroy;
begin
//
end;

procedure TUsuario.doAtualizaUsuario;
var
   qryUsuario : TADOQuery;
begin
   {:: Atualiza o registro do usuário ::}
   qryUsuario := TADOQuery.Create(nil);
   qryUsuario.Connection := DM.Conexao;

   {::Insere o historico de acesso do usuario}
   with qryUsuario, qryUsuario.SQL do
   begin
      Close;
      Clear;
      Add('INSERT INTO dbo.RUsusario_HistoricoAcesso');
      Add('         ( FK_iUsuario, dData, VHost, vIP)');
      Add('VALUES  ( :ID, GETDATE(), :Host, :IP)');

      Parameters.ParamByName('IP').Value := fsIP;
      Parameters.ParamByName('Host').Value := fsHost;
      Parameters.ParamByName('ID').Value := fsID;
      ExecSQL;
   end;

   with qryUsuario, qryUsuario.SQL do
   begin
      Close;
      Clear;
      Add('SET DATEFORMAT DMY');
      Add('UPDATE dbo.RUsuario');
      Add('SET dDataUltimoAcesso = GETDATE(),');
      Add('    vIPUltimoAcesso = :IP,');
      Add('    vHostUltimoAcesso = :Host');
      Add('WHERE ID = :ID');

      Parameters.ParamByName('IP').Value := fsIP;
      Parameters.ParamByName('Host').Value := fsHost;
      Parameters.ParamByName('ID').Value := fsID;
      ExecSQL;
   end;
end;

function TUsuario.doValidaUsuario(Usuario, Senha: String): boolean;
var
   qryUsuario : TADOQuery;
begin
   {:: Procura se o usuario existe e depois verifica se a senha está correta ::}
   qryUsuario := TADOQuery.Create(nil);
   qryUsuario.Connection := DM.Conexao;

   with qryUsuario, qryUsuario.SQL do
   begin
      Close;
      Clear;
      Add('SELECT ID, vUsuario, vSenha');
      Add('FROM dbo.RUsuario');
      Add('WHERE bAtivo = 1');
      Open;
   end;

   if qryUsuario.Locate('vUsuario', LowerCase(Usuario) , []) then
   begin
      if LowerCase(qryUsuario.Fields[2].AsString) = LowerCase(Senha) then
      begin
         fsID := qryUsuario.Fields[2].AsInteger;
         setInformacoesUsuario(fsID);
         Result := True;
      end
      else
      begin
         Result := False;
      end;
   end
   else
   begin
      Result := False;
   end;
end;

function TUsuario.getBairro: String;
begin
   Result := fsBairro;
end;

function TUsuario.getCEP: String;
begin
   Result := fsCep;
end;

function TUsuario.getCidade: String;
begin
   Result := fsCidade;
end;

function TUsuario.getComplemento: String;
begin
   Result := fsComplemento;
end;

function TUsuario.getCPF: String;
begin
   Result := fsCPF;
end;

function TUsuario.getDataCriacao: TDateTime;
begin
   Result := fsDataCriacao;
end;

function TUsuario.getEndereco: String;
begin
   Result := fsEndereco;
end;

function TUsuario.getHost: String;
begin
   Result := fsHost;
end;

function TUsuario.getIDUsuario: Integer;
begin
   Result := fsID;
end;

function TUsuario.getIP: String;
begin
   Result := fsIP;
end;

function TUsuario.getIPExtreno: String;
var
  RetornoSite: TStringStream;
  JSONObject: TJSONObject;
  IdHTTP: TIdHTTP;
begin
   {:: Função que retorna o IP externo :}
   RetornoSite := TStringStream.Create(EmptyStr);
   try
      IdHTTP := TIdHTTP.Create(nil);
      try
         IdHTTP.Tag := 0;
         try
            IdHTTP.Get('http://ipinfo.io/json', RetornoSite);
            IdHTTP.Tag := 1;
         except
            RetornoSite.Clear;
         end;

         if IdHTTP.Tag = 1 then
         begin
            JSONObject := TJSONObject.Create;
            try
               JSONObject.Parse(RetornoSite.Bytes, 0);
               Result := JSONObject.Values['ip'].Value;
            finally
               FreeAndNil(JSONObject);
            end;
         end
         else
            Result := 'Impossível Obter TCP/IP.';
      finally
         FreeAndNil(IdHTTP);
      end;
   finally
      FreeAndNil(RetornoSite);
   end;
end;

function TUsuario.getNome: String;
begin
   Result := fsNome;
end;

function TUsuario.getNomeComputador: String;
var
   Nome : String;
   Tamanho : dword;
begin
   {:: Função que retorna o nome do computador ::}
   Tamanho := MAX_COMPUTERNAME_LENGTH + 1;
   SetLength(Nome,Tamanho);
   if Winapi.Windows.GetComputerName(pChar(Nome),Tamanho) then
   begin
      Result := Nome;
   end
   else
   begin
      Result := 'Não foi Possivel capturar o nome do computador.';
   end;
end;

function TUsuario.getPrivilegio: Integer;
begin
   Result := fsPrivilegio;
end;

function TUsuario.getRG: String;
begin
   Result := fsRG;
end;

function TUsuario.getTema: Integer;
begin
   Result := fsTema;
end;

function TUsuario.getUF: String;
begin
   Result := fsUF;
end;

function TUsuario.getUsuario: String;
begin
   Result := fsUsuario;
end;

function TUsuario.getUsuarioExiste(Usuario: String): Boolean;
var
   qryUsuario : TADOQuery;
begin
   qryUsuario := TADOQuery.Create(nil);
   qryUsuario.Connection := DM.Conexao;

   with qryUsuario, qryUsuario.SQL do
   begin
      Close;
      Clear;
      Add('SELECT ID, vUsuario, vSenha');
      Add('FROM dbo.RUsuario');
      Add('WHERE bAtivo = 1');
      Open;
   end;

   {::Procura se o usuario existe}
   result := qryUsuario.Locate('vUsuario', LowerCase(Usuario) , []);
end;

procedure TUsuario.setInformacoesUsuario(IDUsuario: Integer);
var
   qryUsuario : TADOQuery;
begin
   qryUsuario := TADOQuery.Create(nil);
   qryUsuario.Connection := DM.Conexao;

   with qryUsuario, qryUsuario.SQL do begin
      Close;
      Clear;
      Add('SET DATEFORMAT DMY');
      Add('SELECT * FROM dbo.RUsuario');
      Add('WHERE ID = :ID');

      Parameters.ParamByName('ID').Value := IDUsuario;
      Open;
   end;

   fsUsuario := qryUsuario.FieldByName('vUsuario').AsString;
   fsNome := qryUsuario.FieldByName('vNome').AsString;
   fsCep := qryUsuario.FieldByName('vCep').AsString;
   fsEndereco := qryUsuario.FieldByName('vEndereco').AsString;
   fsComplemento := qryUsuario.FieldByName('vComplemento').AsString;
   fsBairro := qryUsuario.FieldByName('vBairro').AsString;
   fsCidade := qryUsuario.FieldByName('vCidade').AsString;
   fsUF := qryUsuario.FieldByName('vUF').AsString;
   fsCPF := qryUsuario.FieldByName('vCPF').AsString;
   fsRG := qryUsuario.FieldByName('vRG').AsString;
   fsPrivilegio := qryUsuario.FieldByName('iPrivilegio').AsInteger;
   fsDataCriacao := qryUsuario.FieldByName('dDataCriacao').AsDateTime;
   fsTema := qryUsuario.FieldByName('iTema').AsInteger;

   //Atualiza os campus de data/ip/host
   doAtualizaUsuario();
end;

end.
