{::
   AO COPIAR PARA OUTRA TELA:
   1 - LEMBRAR DE TROCAR A CONSTANTE 'NOMEPROCEDURE' PARA O NOME DESEJADO.
   2 - LEMBRAR DE INCLURI NA SUA PROCEDURE O CAMPO 'ID' e 'RETORNO'
   3 - LEMBRAR DE ALTERAR O [doAbreDados] -- Dados que aparecem no grid
   4 - LEMBRAR DE ALTERAR O [doCarregaRegistro] -- Dados que aparecem no grid + dados da tabela base
::}

unit uFornecedor_db;

interface

uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, uFuncoesBD, Vcl.Forms, Vcl.Dialogs, Vcl.Graphics,
   Vcl.Controls, Vcl.ExtCtrls;

type TFornecedorDB = class(TObject)
   sProcedure : TADOStoredProc;
   qryPrincipal : TADOQuery;
   private
      fsModoEdicao : String;
      fsModoEdicaoContato : String;
      fsForm : TForm;
      fsTelaLOG : TForm;
      fsChavePrimaria : integer;
      Source : TParameter;
      procedure doCarregaRegistro();
      procedure doAltera();
      procedure doInsere();
      procedure doCriaQuery();
      procedure doCriaSP();
      procedure getErro();
      procedure doRefreshTela();
      function getRetorno() : String;
   public
      procedure doDeleta();
      procedure doCarregaForm(Tela : TForm);
      procedure doGrava();
      procedure doCancelaAlteracao();
      procedure doAbreDados();
      procedure setModoEdicao(modo : String);
      function getModoEdicao():String;
      function getChavePrimaria():Integer;
      constructor Create(FormLOG : TForm);
      destructor Destroy();
   const
      NOMEPROCEDURE : String = 'pFornecedor;1';
end;

implementation

uses uDM;

{ TArtigoDB }

constructor TFornecedorDB.Create(FormLOG : TForm);
begin
   // Operação padrão será a EDICAO
   setModoEdicao('edita');
   fsChavePrimaria := 0;

   fsTelaLOG := FormLOG;

   doCriaQuery();
   doCriaSP();
end;

procedure TFornecedorDB.doCriaQuery;
begin
   {:: Cria o objeto QUERY e configura ::}
   qryPrincipal := TADOQuery.Create(nil);
   qryPrincipal.Connection := DM.Conexao;
   qryPrincipal.CommandTimeout := 60000; // 60 segundos.
   qryPrincipal.Close;
   qryPrincipal.SQL.Clear;
end;

procedure TFornecedorDB.doCriaSP;
begin
   {:: Cria procedure e CONFIGURA os parametros ::}
   sProcedure := TADOStoredProc.Create(nil);
   sProcedure.Connection := DM.Conexao;
   sProcedure.ProcedureName := NOMEPROCEDURE;
   sProcedure.Parameters.Clear;
   sProcedure.Parameters.Refresh;
end;

procedure TFornecedorDB.doDeleta;
begin
   if (MessageDlg('Atenção. Deseja realmente deletar esse registro ?',
       mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
   begin
      ShowMessage('Operação cancelada pelo usuário.');
      Exit;
   end;

   qryPrincipal.Prior();
   fsChavePrimaria := qryPrincipal.Fields[0].AsInteger;
   qryPrincipal.Next();

   Source := sProcedure.Parameters.FindParam('@V_ID');
   if Source <> nil then Source.Value := qryPrincipal.Fields[0].AsInteger;

   Source := sProcedure.Parameters.FindParam('@V_TipoOperacao');
   if Source <> nil then Source.Value := 'D';

   ExecutaStoredProc(sProcedure);

   doAbreDados();
end;

destructor TFornecedorDB.Destroy;
begin
   {:: Libera os objetos da memoria ::}
   qryPrincipal.Close;
   FreeAndNil(qryPrincipal);
   FreeAndNil(sProcedure);
end;

procedure TFornecedorDB.doAbreDados;
begin
   {:: dados que serão exibidos no DBGRID ::}
   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT F.ID, F.vRazaoSocial, F.vNomeFantasia, F.vCNPJ, F.vInscricaoEstadual, F.vCEP, F.vEndereco, F.vBairro, F.vCidade,');
      Add('       F.vUF, F.dData, RU.vNome');
      Add('FROM dbo.Fornecedor F');
      Add('LEFT JOIN dbo.RUsuario RU ON (RU.ID = F.FK_iUsuarioCadastro)');
      Add('WHERE');
      Add('      F.bDeletado = 0');
      Open;
   end;

   qryPrincipal.Locate('ID', fsChavePrimaria, []);
end;

procedure TFornecedorDB.doAltera;
begin
   ERPparaDB(sProcedure, fsForm, 'u', qryPrincipal);

   getErro()
end;

procedure TFornecedorDB.doCancelaAlteracao;
begin
   doCarregaRegistro();
   doRefreshTela();
end;

procedure TFornecedorDB.doCarregaForm(Tela: TForm);
begin
   fsForm := Tela;

   doCarregaRegistro();
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TFornecedorDB.doCarregaRegistro;
begin
   {:: Carrega a linha que vai sofrer alterações ::}
   fsChavePrimaria := qryPrincipal.Fields[0].AsInteger;

   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('DECLARE @AreaAtuacao VARCHAR(5000), @ID INT');
      Add('SET @ID = :ID');

      Add('SET @AreaAtuacao = ''''');
      Add('SELECT @AreaAtuacao = @AreaAtuacao + RA.vDescricao +''; ''');
      Add('FROM dbo.Fornecedor_NN_AreaAtuacao FNNA');
      Add('LEFT JOIN dbo.RAreaAtuacao RA ON (RA.ID = FNNA.FK_iAreaAtuacao)');
      Add('WHERE FNNA.FK_iFornecedor = @ID');
      Add('IF LEN(@AreaAtuacao) >= 2 BEGIN');
      Add('	SET @AreaAtuacao = LEFT(@AreaAtuacao,len(@AreaAtuacao)- 2)');
      Add('END');
      Add('');
      Add('SELECT F.*, @AreaAtuacao AreaAtuacao');
      Add('FROM dbo.Fornecedor F');
      Add('WHERE f.ID = @ID');

      if fsModoEdicao = 'edita' then Parameters.ParamByName('ID').Value := fsChavePrimaria
      else Parameters.ParamByName('ID').Value := 0;

      Open;
   end;
end;

procedure TFornecedorDB.doGrava();
begin
   {:: EDITA ou GRAVA ::}
   if fsModoEdicao = 'edita' then
   begin
      doAltera();
   end;

   if fsModoEdicao = 'cria' then
   begin
      doInsere();
      setModoEdicao('edita');
   end;

   doCarregaRegistro();
   doRefreshTela();
end;

procedure TFornecedorDB.doInsere;
begin
   ERPparaDB(sProcedure, fsForm, 'c', qryPrincipal);

   getErro();

   Source := sProcedure.Parameters.FindParam('@V_ID');
   if Source <> nil then fsChavePrimaria := Source.Value;
end;

procedure TFornecedorDB.doRefreshTela;
begin
   DBparaERP(qryPrincipal, fsForm);
end;

function TFornecedorDB.getChavePrimaria: Integer;
begin
   Result := qryPrincipal.Fields[0].AsInteger;
end;

procedure TFornecedorDB.getErro;
begin
   if getRetorno() <> 'ok' then
   begin
      ShowMessage('OOPS. Algo deu errado. Tente novamente dentro de alguns minutos ... ' + ^m +
                  'Ou entre em contato com o nosso suporte.');
      Exit;
   end;
end;

function TFornecedorDB.getModoEdicao: String;
begin
   Result := fsModoEdicao;
end;

function TFornecedorDB.getRetorno: String;
begin
   // Verifica o RETORNO.
   Result := '';

   Source := sProcedure.Parameters.FindParam('@V_Retorno');
   if Source <> nil then Result := LowerCase(Source.Value);
end;

procedure TFornecedorDB.setModoEdicao(modo : String);
begin
   // Altera o modo de EDIÇÃO.
   fsModoEdicao := LowerCase(modo);
end;

end.
