{::
   AO COPIAR PARA OUTRA TELA:
   1 - LEMBRAR DE TROCAR A CONSTANTE 'NOMEPROCEDURE' PARA O NOME DESEJADO.
   2 - LEMBRAR DE INCLURI NA SUA PROCEDURE O CAMPO 'ID' e 'RETORNO'
   3 - LEMBRAR DE ALTERAR O [doAbreDados] -- Dados que aparecem no grid
   4 - LEMBRAR DE ALTERAR O [doCarregaRegistro] -- Dados que aparecem no grid + dados da tabela base
::}

unit uFornecedor_Edicao_Contato_db;

interface

uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, uFuncoesBD, Vcl.Forms, Vcl.Dialogs, Vcl.Graphics,
   Vcl.Controls, Vcl.ExtCtrls;

type TFornecedor_ContatoDB = class(TObject)
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
      procedure doCarregaForm(Tela : TForm);
      procedure doGrava();
      procedure doCancelaAlteracao();
      procedure doAbreDados();
      procedure setModoEdicao(modo : String);
      function getModoEdicao():String;
      constructor Create(FormLOG : TForm);
      destructor Destroy();
   const
      NOMEPROCEDURE : String = 'pFornecedor_Contato;1';
end;

implementation

uses uDM, uFornecedor;

{ TArtigoDB }

constructor TFornecedor_ContatoDB.Create(FormLOG : TForm);
begin
   // Operação padrão será a EDICAO
   setModoEdicao('edita');
   fsChavePrimaria := 0;

   fsTelaLOG := FormLOG;

   doCriaQuery();
   doCriaSP();
end;

procedure TFornecedor_ContatoDB.doCriaQuery;
begin
   {:: Cria o objeto QUERY e configura ::}
   qryPrincipal := TADOQuery.Create(nil);
   qryPrincipal.Connection := DM.Conexao;
   qryPrincipal.CommandTimeout := 60000; // 60 segundos.
   qryPrincipal.Close;
   qryPrincipal.SQL.Clear;
end;

procedure TFornecedor_ContatoDB.doCriaSP;
begin
   {:: Cria procedure e CONFIGURA os parametros ::}
   sProcedure := TADOStoredProc.Create(nil);
   sProcedure.Connection := DM.Conexao;
   sProcedure.ProcedureName := NOMEPROCEDURE;
   sProcedure.Parameters.Clear;
   sProcedure.Parameters.Refresh;
end;

destructor TFornecedor_ContatoDB.Destroy;
begin
   {:: Libera os objetos da memoria ::}
   qryPrincipal.Close;
   FreeAndNil(qryPrincipal);
   FreeAndNil(sProcedure);
end;

procedure TFornecedor_ContatoDB.doAbreDados;
begin
   {:: dados que serão exibidos no DBGRID ::}
   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SELECT vContato, vDepartamento, vTelefone, vCelular, vEmail, dData');
      Add('FROM dbo.Fornecedor_Contato');
      Add('WHERE FK_IDFornecedor = :IDFornecedor');

      //Pega o ID do fornecedor que esta,os editando
      Parameters.ParamByName('IDFornecedor').Value := uFornecedor.FornecedorDB.getChavePrimaria();
      Open;
   end;

   qryPrincipal.Locate('ID', fsChavePrimaria, []);
end;

procedure TFornecedor_ContatoDB.doAltera;
begin
   ERPparaDB(sProcedure, fsForm, 'u', qryPrincipal);

   getErro()
end;

procedure TFornecedor_ContatoDB.doCancelaAlteracao;
begin
   doCarregaRegistro();
   doRefreshTela();
end;

procedure TFornecedor_ContatoDB.doCarregaForm(Tela: TForm);
begin
   fsForm := Tela;

   doCarregaRegistro();
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TFornecedor_ContatoDB.doCarregaRegistro;
begin
   {:: Carrega a linha que vai sofrer alterações ::}
   fsChavePrimaria := qryPrincipal.Fields[0].AsInteger;

   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT *');
      Add('FROM dbo.Fornecedor_Contato');
      Add('WHERE ID = :ID');

      if fsModoEdicao = 'edita' then Parameters.ParamByName('ID').Value := fsChavePrimaria
      else Parameters.ParamByName('ID').Value := 0;

      Open;
   end;
end;

procedure TFornecedor_ContatoDB.doGrava();
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

procedure TFornecedor_ContatoDB.doInsere;
begin
   ERPparaDB(sProcedure, fsForm, 'c', qryPrincipal);

   getErro();

   Source := sProcedure.Parameters.FindParam('@V_ID');
   if Source <> nil then fsChavePrimaria := Source.Value;
end;

procedure TFornecedor_ContatoDB.doRefreshTela;
begin
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TFornecedor_ContatoDB.getErro;
begin
   if getRetorno() <> 'ok' then
   begin
      ShowMessage('OOPS. Algo deu errado. Tente novamente dentro de alguns minutos ... ' + ^m +
                  'Ou entre em contato com o nosso suporte.');
      Exit;
   end;
end;

function TFornecedor_ContatoDB.getModoEdicao: String;
begin
   Result := fsModoEdicao;
end;

function TFornecedor_ContatoDB.getRetorno: String;
begin
   // Verifica o RETORNO.
   Result := '';

   Source := sProcedure.Parameters.FindParam('@V_Retorno');
   if Source <> nil then Result := LowerCase(Source.Value);
end;

procedure TFornecedor_ContatoDB.setModoEdicao(modo : String);
begin
   // Altera o modo de EDIÇÃO.
   fsModoEdicao := LowerCase(modo);
end;

end.
