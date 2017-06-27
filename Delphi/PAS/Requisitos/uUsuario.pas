unit uUsuario;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.Win.ADODB, Data.DB, json, idHTTP, uDM, Vcl.Grids, Vcl.DBGrids;

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
      fsFilialAtual : Integer;
      fsConfigGrids : TADOQuery;
      function getIPExtreno() : String;
      function getNomeComputador(): String;
      procedure setInformacoesUsuario(IDUsuario : Integer);
      function getConfigGrids(IDUsuario : Integer): TADOQuery;
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
      function getFilialAtual() : Integer;
      procedure setFilialAtual(Filial : Integer);
      procedure setConfigGrid(Form : TForm; Grid :TDBGrid);
      procedure doConfigGrid(Form : TForm; Grid :TDBGrid);
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
      Add('INSERT INTO dbo.RUsuario_HistoricoAcesso');
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
         fsConfigGrids := getConfigGrids(fsID);
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

procedure TUsuario.setConfigGrid(Form: TForm; Grid: TDBGrid);
var
   qryGrids : TADOQuery;
   i : Integer;
begin
   {:: pega a ordem e o tamanho de todas as colunas}
   qryGrids := TADOQuery.Create(nil);
   qryGrids.Connection := DM.Conexao;

   for i := 0 to Grid.Columns.Count - 1 do
   begin
      with qryGrids, qryGrids.SQL do begin
         Close;
         Clear;
         Add('declare @Posicao Int, @Largura int, @FK_IDUsuario int,');
         Add('	@Form Varchar(255), @Grid Varchar(255), @Coluna varchar(255)');
         Add('SET @Posicao = :Posicao');
         Add('SET @Largura = :Largura');
         Add('SET @FK_IDUsuario = :ID');
         Add('SET @Form = :Form');
         Add('SET @Grid = :Grid');
         Add('SET @Coluna = :Coluna');

         Parameters.ParamByName('Posicao').Value := i;
         Parameters.ParamByName('Largura').Value := Grid.Columns[i].Width;
         Parameters.ParamByName('ID').Value := fsID;
         Parameters.ParamByName('Form').Value := Form.Name;
         Parameters.ParamByName('Grid').Value := Grid.Name;
         Parameters.ParamByName('Coluna').Value := Grid.Columns[i].FieldName;

         Add('IF Exists (Select *');
         Add('		 from RUsuario_Grid_Ordenacao');
         Add('		 where');
         Add('			 vForm = @Form and');
         Add('			 vGrid = @Grid and');
         Add('			 vColuna = @Coluna and');
         Add('			 FK_IDUsuario = FK_IDUsuario');
         Add('         )');
         Add('BEGIN');
         Add('	UPDATE RUsuario_Grid_Ordenacao');
         Add('	SET iPosicao = @Posicao,');
         Add('		iLargura = @Largura');
         Add('	where');
         Add('		vForm = @Form and');
         Add('		vGrid = @Grid and');
         Add('		vColuna = @Coluna and');
         Add('		FK_IDUsuario = @FK_IDUsuario');
         Add('END');
         Add('ELSE');
         Add('BEGIN');
         Add('	INSERT INTO RUsuario_Grid_Ordenacao');
         Add('	      (vForm, vGrid, vColuna, iPosicao, iLargura, FK_IDUsuario)');
         Add('	VALUES');
         Add('	      (@Form, @Grid, @Coluna, @Posicao, @Largura, @FK_IDUsuario)');
         Add('END');
         ExecSQL;
      end;
   end;

   fsConfigGrids := getConfigGrids(fsID);
end;

procedure TUsuario.setFilialAtual(Filial: Integer);
begin
   fsFilialAtual := Filial;
end;

function TUsuario.getConfigGrids(IDUsuario: Integer): TADOQuery;
var
   qryGrids : TADOQuery;
   Posicoes : String;
begin
   {:: pega a ordem e o tamanho de todas as colunas de todos os grids que esse usuario usa::}
   qryGrids := TADOQuery.Create(nil);
   qryGrids.Connection := DM.Conexao;

   //pego todas as posições definidas
   with qryGrids, qryGrids.SQL do begin
      Close;
      Clear;
      Add('DECLARE @SQLStr VARCHAR(5000)');
      Add('SET @SQLStr = ''''');
      Add('SELECT @SQLStr = @SQLStr + ''['' +[a].[Column]+''], ''');
      Add('FROM');
      Add('(SELECT DISTINCT CONVERT(VARCHAR(2), iPosicao )as[Column]');
      Add('FROM RUsuario_Grid_Ordenacao where FK_IDUsuario = :ID');
      Add(')as a');
      Add('SET @SQLStr = LEFT(@SQLStr,len(@SQLStr)-1)');
      Add('select @SQLStr ');

      Parameters.ParamByName('ID').Value := IDUsuario;
      Open;
   end;

   Posicoes := qryGrids.Fields[0].AsString;

   //Faz o select com pivot

   with qryGrids, qryGrids.SQL do begin
      Close;
      Clear;
      Add('select vForm, vGrid, '+ Posicoes +'');
      Add('	from(select vForm, vGrid,');
      Add('		iPosicao,CAST(iLargura as varchar(5))+ '' | '' + vColuna Largura_Coluna');
      Add('		from RUsuario_Grid_Ordenacao where FK_IDUsuario = :ID');
      Add('		Group by vForm, vGrid, iPosicao, iLargura, vColuna');
      Add('		)sq Pivot (MAX(Largura_Coluna) FOR iPosicao in');
      Add('					('+ Posicoes +')');
      Add('		           ) as pt');

      Parameters.ParamByName('ID').Value := IDUsuario;
      Open;
   end;

   Result := qryGrids;
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

function TUsuario.getFilialAtual: Integer;
begin
   Result := fsFilialAtual;
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

procedure TUsuario.doConfigGrid(Form: TForm; Grid: TDBGrid);
var
  i,j, Largura, nAux: Integer;
  Field : String;
begin
   //faz o locate
   if fsConfigGrids.Locate('vForm;vGrid',VarArrayOf([Form.Name, Grid.Name]),[])then
   begin

      for i := 2 to fsConfigGrids.FieldCount - 1 do
      begin

         if fsConfigGrids.Fields[i].AsString <> '' then
         begin

            nAux := Pos('|',fsConfigGrids.Fields[i].AsString);
            Field := copy(fsConfigGrids.Fields[i].AsString, nAux + 2, length(fsConfigGrids.Fields[i].AsString));
            Largura := StrToInt(copy(fsConfigGrids.Fields[i].AsString,1,nAux-2));

            for j := 0 to Grid.Columns.Count - 1 do
            begin

               if Field = Grid.Columns[j].FieldName then
               begin

               Grid.Columns[j].Index := i - 2;
               Grid.Columns[i - 2].Width := Largura;
               Break;

               end;

            end;

         end;

      end;
   end;
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
