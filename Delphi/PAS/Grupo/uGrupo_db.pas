{::
   AO COPIAR PARA OUTRA TELA:
   1 - LEMBRAR DE INCLUIR A CONSTANTE 'NOMEPROCEDURE' PARA O NOME DESEJADO.
   2 - LEMBRAR DE INCLUIR NA SUA PROCEDURE O CAMPO 'ID' e 'RETORNO'
   3 - LEMBRAR DE INCLUIR O [doAbreDados] -- Dados que aparecem no grid
   4 - LEMBRAR DE INCLUIR O [doCarregaRegistro] -- Dados que aparecem no grid + dados da tabela base
::}

unit uGrupo_db;

interface
uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, Vcl.Forms, Vcl.Dialogs, Vcl.Graphics,
   Vcl.Controls, Vcl.ExtCtrls, uFuncoesBD;

type TGrupoDB = class(TObject)
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
      procedure doGrava(Tela: TForm);
      procedure doCancelaAlteracao();
      procedure doAbreDados();
      procedure setModoEdicao(modo : String);
      function getModoEdicao():String;
      constructor Create(FormLOG : TForm);
      destructor Destroy();
   const
      NOMEPROCEDURE : String = 'pGrupo;1';
end;

implementation

uses uDM;

{ TArtigoDB }

constructor TGrupoDB.Create(FormLOG : TForm);
begin
   // Operação padrão será a EDICAO
   setModoEdicao('edita');
   fsChavePrimaria := 0;

   fsTelaLOG := FormLOG;

   doCriaQuery();
   doCriaSP();
end;

procedure TGrupoDB.doCriaQuery;
begin
   {:: Cria o objeto QUERY e configura ::}
   qryPrincipal := TADOQuery.Create(nil);
   qryPrincipal.Connection := DM.Conexao;
   qryPrincipal.CommandTimeout := 60000; // 60 segundos.
   qryPrincipal.Close;
   qryPrincipal.SQL.Clear;
end;

procedure TGrupoDB.doCriaSP;
begin
   {:: Cria procedure e CONFIGURA os parametros ::}
   sProcedure := TADOStoredProc.Create(nil);
   sProcedure.Connection := DM.Conexao;
   sProcedure.ProcedureName := NOMEPROCEDURE;
   sProcedure.Parameters.Clear;
   sProcedure.Parameters.Refresh;
end;

procedure TGrupoDB.doDeleta;
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

destructor TGrupoDB.Destroy;
begin
   {:: Libera os objetos da memoria ::}
   qryPrincipal.Close;
   FreeAndNil(qryPrincipal);
   FreeAndNil(sProcedure);
end;

procedure TGrupoDB.doAbreDados;
begin
   {:: dados que serão exibidos no DBGRID ::}
   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT G.ID ,');
      Add('       G.dCriacao ,');
      Add('       G.vNome');
      Add('FROM');
      Add('     dbo.RGrupo G');
      Add('WHERE');
      Add('      ISNULL(G.bDeletado,0) <> 1');
      Open;
   end;

   qryPrincipal.Locate('ID', fsChavePrimaria, []);
end;

procedure TGrupoDB.doAltera;
begin
   ERPparaDB(sProcedure, fsForm, 'U', qryPrincipal);

   getErro()
end;

procedure TGrupoDB.doCancelaAlteracao;
begin
   doCarregaRegistro();
   doRefreshTela();
end;

procedure TGrupoDB.doCarregaForm(Tela: TForm);
begin
   fsForm := Tela;

   doCarregaRegistro();
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TGrupoDB.doCarregaRegistro;
begin
   {:: Carrega a linha que vai sofrer alterações ::}
   fsChavePrimaria := qryPrincipal.Fields[0].AsInteger;

   with qryPrincipal, qryPrincipal.SQL do
   begin
      Close;
      Clear;
      Add('SET DateFormat DMY');
      Add('SELECT G.*');
      Add('FROM');
      Add('     dbo.RGrupo G');
      Add('WHERE');
      Add('      G.ID = :ID');

      if fsModoEdicao = 'edita' then Parameters.ParamByName('ID').Value := fsChavePrimaria
      else Parameters.ParamByName('ID').Value := 0;

      Open;
   end;
end;

procedure TGrupoDB.doGrava(Tela: TForm);
begin
  fsForm := Tela;
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

procedure TGrupoDB.doInsere;
begin
   ERPparaDB(sProcedure, fsForm, 'C', qryPrincipal);

   getErro();

   Source := sProcedure.Parameters.FindParam('@V_ID');
   if Source <> nil then fsChavePrimaria := Source.Value;
end;

procedure TGrupoDB.doRefreshTela;
begin
   DBparaERP(qryPrincipal, fsForm);
end;

procedure TGrupoDB.getErro;
begin
   if getRetorno() <> 'ok' then
   begin
      ShowMessage('OOPS. Algo deu errado. Tente novamente dentro de alguns minutos ... ' + ^m +
                  'Ou entre em contato com o nosso suporte.');
      Exit;
   end;
end;

function TGrupoDB.getIDArtigo: integer;
begin
   Result := fsChavePrimaria;
end;

function TGrupoDB.getModoEdicao: String;
begin
   Result := fsModoEdicao;
end;

function TGrupoDB.getRetorno: String;
begin
   // Verifica o RETORNO.
   Result := '';

   Source := sProcedure.Parameters.FindParam('@V_Retorno');
   if Source <> nil then Result := LowerCase(Source.Value);
end;

procedure TGrupoDB.setModoEdicao(modo : String);
begin
   // Altera o modo de EDIÇÃO.
   fsModoEdicao := LowerCase(modo);
end;

end.
