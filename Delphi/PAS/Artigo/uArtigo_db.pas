{::
   AO COPIAR PARA OUTRA TELA:
   1 - LEMBRAR DE INCLUIR A CONSTANTE 'NOMEPROCEDURE' PARA O NOME DESEJADO.
   2 - LEMBRAR DE INCLUIR NA SUA PROCEDURE O CAMPO 'ID' e 'RETORNO'
   3 - LEMBRAR DE INCLUIR O [doAbreDados] -- Dados que aparecem no grid
   4 - LEMBRAR DE INCLUIR O [doCarregaRegistro] -- Dados que aparecem no grid + dados da tabela base
::}
unit uArtigo_db;

interface
uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, uFuncoesBD, Vcl.Forms, Vcl.Dialogs, Vcl.Graphics,
   Vcl.Controls, Vcl.ExtCtrls;

type TArtigoDB = class(TObject)
   sProcedure : TADOStoredProc;
   qryPrincipal : TADOQuery;
   private
      fsModoEdicao : String;
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
      function getIDArtigo():integer;
      procedure doCarregaForm(Tela : TForm);
      procedure doGrava();
      procedure doCancelaAlteracao();
      procedure doAbreDados(vReferencia: String = ''; vNome : String = '';iFornecedor: Integer = 0; iGrupo: Integer = 0; iColecao : Integer = 0);
      procedure setModoEdicao(modo : String);
      function getModoEdicao():String;
      constructor Create(FormLOG : TForm);
      destructor Destroy();
   const
      NOMEPROCEDURE : String = 'pArtigo;1';
end;

implementation

uses uDM;

{ TArtigoDB }

constructor TArtigoDB.Create(FormLOG : TForm);
begin
   // Operação padrão será a EDICAO
   setModoEdicao('edita');
   fsChavePrimaria := 0;

   fsTelaLOG := FormLOG;

   doCriaQuery();
   doCriaSP();
end;

procedure TArtigoDB.doCriaQuery;
begin
   {:: Cria o objeto QUERY e configura ::}
   qryPrincipal := TADOQuery.Create(nil);
   qryPrincipal.Connection := DM.Conexao;
   qryPrincipal.CommandTimeout := 60000; // 60 segundos.
   qryPrincipal.Close;
   qryPrincipal.SQL.Clear;
end;

procedure TArtigoDB.doCriaSP;
begin
   {:: Cria procedure e CONFIGURA os parametros ::}
   sProcedure := TADOStoredProc.Create(nil);
   sProcedure.Connection := DM.Conexao;
   sProcedure.ProcedureName := NOMEPROCEDURE;
   sProcedure.Parameters.Clear;
   sProcedure.Parameters.Refresh;
end;

procedure TArtigoDB.doDeleta;
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

destructor TArtigoDB.Destroy;
begin
   {:: Libera os objetos da memoria ::}
   qryPrincipal.Close;
   FreeAndNil(qryPrincipal);
   FreeAndNil(sProcedure);
end;

procedure TArtigoDB.doAbreDados(vReferencia: String = ''; vNome : String = '';
                                 iFornecedor: Integer = 0; iGrupo: Integer = 0;
                                 iColecao : Integer = 0);
begin
   {:: dados que serão exibidos no DBGRID ::}
   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT A.ID ,');
      Add('       A.dCriacao ,');
      Add('       A.vReferencia ,');
      Add('       A.vNome,');
      Add('       RCol.vNome NomeColecao,');
      Add('       RGru.vNome NomeGrupo,');
      Add('       Forn.vRazaoSocial NomeFornecedor');
      Add('FROM');
      Add('     Artigo A');
      Add('LEFT JOIN dbo.RColecao RCol ON(RCol.ID = A.FK_IDRColecao)');
      Add('LEFT JOIN dbo.RGrupo RGru ON(RGru.ID = A.FK_IDRGrupo)');
      Add('LEFT JOIN dbo.Fornecedor Forn ON(Forn.ID = A.FK_IDFornecedor)');
      Add('WHERE');
      Add('      A.bDeletado = 0');
      if vReferencia <> '' then
         Add('AND A.vReferencia LIKE ''%'+ vReferencia +'%''  ');

      if vNome <> '' then
         Add('AND A.vNome LIKE ''%'+ vNome +'%'' ');

      if iFornecedor <> 0 then
         Add('AND A.FK_IDFornecedor = '+ IntToStr(iFornecedor));

      if iGrupo <> 0 then
         Add('AND A.FK_IDRGrupo = '+ IntToStr(iGrupo));

      if iColecao <> 0 then
         Add('AND A.FK_IDRColecao = '+ IntToStr(iColecao));

      Open;
   end;

   qryPrincipal.Locate('ID', fsChavePrimaria, []);
end;

procedure TArtigoDB.doAltera;
begin
   ERPparaDB(sProcedure, fsForm, 'U', qryPrincipal);

   getErro()
end;

procedure TArtigoDB.doCancelaAlteracao;
begin
   doCarregaRegistro();
   doRefreshTela();
end;

procedure TArtigoDB.doCarregaForm(Tela: TForm);
begin
   fsForm := Tela;

   doCarregaRegistro();
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TArtigoDB.doCarregaRegistro;
begin
   {:: Carrega a linha que vai sofrer alterações ::}
   fsChavePrimaria := qryPrincipal.Fields[0].AsInteger;

   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT A.*,');
      Add('       RCol.vNome NomeColecao,');
      Add('       RGru.vNome NomeGrupo,');
      Add('       Forn.vRazaoSocial NomeFornecedor');
      Add('FROM');
      Add('     Artigo A');
      Add('LEFT JOIN dbo.RColecao RCol ON(RCol.ID = A.FK_IDRColecao)');
      Add('LEFT JOIN dbo.RGrupo RGru ON(RGru.ID = A.FK_IDRGrupo)');
      Add('LEFT JOIN dbo.Fornecedor Forn ON(Forn.ID = A.FK_IDFornecedor)');
      Add('WHERE');
      Add('      A.ID = :ID');

      if fsModoEdicao = 'edita' then Parameters.ParamByName('ID').Value := fsChavePrimaria
      else Parameters.ParamByName('ID').Value := 0;

      Open;
   end;
end;

procedure TArtigoDB.doGrava();
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

procedure TArtigoDB.doInsere;
begin
   ERPparaDB(sProcedure, fsForm, 'C', qryPrincipal);

   getErro();

   Source := sProcedure.Parameters.FindParam('@V_ID');
   if Source <> nil then fsChavePrimaria := Source.Value;
end;

procedure TArtigoDB.doRefreshTela;
begin
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TArtigoDB.getErro;
begin
   if getRetorno <> 'ok' then
   begin
      ShowMessage('OOPS. Algo deu errado. Tente novamente dentro de alguns minutos ... ' + ^m +
                  'Ou entre em contato com o nosso suporte.');
      Exit;
   end;
end;

function TArtigoDB.getIDArtigo: integer;
begin
   Result := fsChavePrimaria;
end;

function TArtigoDB.getModoEdicao: String;
begin
   Result := fsModoEdicao;
end;

function TArtigoDB.getRetorno: String;
begin
   // Verifica o RETORNO.
   Result := '';

   Source := sProcedure.Parameters.FindParam('@V_Retorno');
   if Source <> nil then Result := LowerCase(Source.Value);
end;

procedure TArtigoDB.setModoEdicao(modo : String);
begin
   // Altera o modo de EDIÇÃO.
   fsModoEdicao := LowerCase(modo);
end;

end.
