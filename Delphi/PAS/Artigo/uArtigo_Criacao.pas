unit uArtigo_Criacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient,
  uDM, Math, Data.Win.ADODB;

type
  TfrmArtigo_Criacao = class(TfrmRaiz_Edicao)
    Panel1: TPanel;
    vReferencia: TLabeledEdit;
    vUnidade: TLabeledEdit;
    vNCM: TLabeledEdit;
    vCST: TLabeledEdit;
    vNome: TLabeledEdit;
    mPrecoCusto: TLabeledEdit;
    mMarkup: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    cdsCoresDisponiveis: TClientDataSet;
    dsCoresDisponiveis: TDataSource;
    Label4: TLabel;
    btnCriar: TBitBtn;
    btnCancelar: TBitBtn;
    FK_IDFornecedor: TDBLookupComboBox;
    FK_IDRGrupo: TDBLookupComboBox;
    FK_IDRColecao: TDBLookupComboBox;
    cdsCoresDisponiveisbSelecao1: TBooleanField;
    cdsCoresDisponiveisID1: TIntegerField;
    cdsCoresDisponiveisNomeCor1: TStringField;
    cdsCoresDisponiveisbSelecao2: TBooleanField;
    cdsCoresDisponiveisbSelecao3: TBooleanField;
    cdsCoresDisponiveisbSelecao4: TBooleanField;
    cdsCoresDisponiveisID2: TIntegerField;
    cdsCoresDisponiveisID3: TIntegerField;
    cdsCoresDisponiveisID4: TIntegerField;
    cdsCoresDisponiveisNomeCor2: TStringField;
    cdsCoresDisponiveisNomeCor3: TStringField;
    cdsCoresDisponiveisNomeCor4: TStringField;
    procedure btnCriarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure doPreencheCds;
    function doVerificaCamposObrigatorios():Boolean;
    procedure doInformacaoReferencia(Ref : String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtigo_Criacao: TfrmArtigo_Criacao;

implementation

{$R *.dfm}

uses uArtigo;

procedure TfrmArtigo_Criacao.btnCancelarClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TfrmArtigo_Criacao.btnCriarClick(Sender: TObject);
var
   CriouProd : Boolean;
begin
  inherited;
  CriouProd := False;

   uArtigo.artigoDB.setModoEdicao('cria');

   if not doVerificaCamposObrigatorios() then
      exit;

   cdsCoresDisponiveis.First;
   while not cdsCoresDisponiveis.Eof  do begin
      //Cria os produtos da primeira coluna
      if cdsCoresDisponiveisbSelecao1.AsBoolean then
      begin
         uArtigo.artigoDB.doInsere(cdsCoresDisponiveisID1.AsInteger);
         CriouProd := True;
      end;

      //Cria os produtos da segunda coluna
      if cdsCoresDisponiveisbSelecao2.AsBoolean then
      begin
         uArtigo.artigoDB.doInsere(cdsCoresDisponiveisID2.AsInteger);
         CriouProd := True;
      end;

      //Cria os produtos da terceira coluna
      if cdsCoresDisponiveisbSelecao3.AsBoolean then
      begin
         uArtigo.artigoDB.doInsere(cdsCoresDisponiveisID3.AsInteger);
         CriouProd := True;
      end;

      //Cria os produtos da quarta coluna
      if cdsCoresDisponiveisbSelecao4.AsBoolean then
      begin
         uArtigo.artigoDB.doInsere(cdsCoresDisponiveisID4.AsInteger);
         CriouProd := True;
      end;
      cdsCoresDisponiveis.Next;
   end;

   if CriouProd then
   begin
      ShowMessage('Produtos Criados com Sucesso');
      Close;
   end
   else
      ShowMessage('É necessário seleciona pelo menos uma Cor.');
end;

procedure TfrmArtigo_Criacao.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
   if Column.FieldName = 'Aux1' then begin
      cdsCoresDisponiveis.Edit;
      cdsCoresDisponiveisbSelecao1.Value := NOT cdsCoresDisponiveisbSelecao1.AsBoolean;
      cdsCoresDisponiveis.Post;
   end;

   if Column.FieldName = 'Aux2' then begin
      cdsCoresDisponiveis.Edit;
      cdsCoresDisponiveisbSelecao2.Value := NOT cdsCoresDisponiveisbSelecao2.AsBoolean;
      cdsCoresDisponiveis.Post;
   end;

   if Column.FieldName = 'Aux3' then begin
      cdsCoresDisponiveis.Edit;
      cdsCoresDisponiveisbSelecao3.Value := NOT cdsCoresDisponiveisbSelecao3.AsBoolean;
      cdsCoresDisponiveis.Post;
   end;

   if Column.FieldName = 'Aux4' then begin
      cdsCoresDisponiveis.Edit;
      cdsCoresDisponiveisbSelecao4.Value := NOT cdsCoresDisponiveisbSelecao4.AsBoolean;
      cdsCoresDisponiveis.Post;
   end;
end;

procedure TfrmArtigo_Criacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
   Check, nLarguraCol: Integer;
   R: TRect;
begin
  inherited;
  nLarguraCol := 20;

  //Coluna de chec da primeira coluna de cores
   if (Column.FieldName = 'Aux1') and (cdsCoresDisponiveisNomeCor1.AsString <> '')  then
   begin
      Column.Width := nLarguraCol;
      DBGrid1.Canvas.FillRect(Rect);
      if cdsCoresDisponiveisbSelecao1.AsBoolean then
         Check := DFCS_CHECKED
      else
         Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

  //Coluna de chec da segunda coluna de cores
   if (Column.FieldName = 'Aux2') and (cdsCoresDisponiveisNomeCor2.AsString <> '') then
   begin
      Column.Width := nLarguraCol;
      DBGrid1.Canvas.FillRect(Rect);
      if cdsCoresDisponiveisbSelecao2.AsBoolean then
         Check := DFCS_CHECKED
      else
         Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

  //Coluna de chec da terceira coluna de cores
   if (Column.FieldName = 'Aux3') and (cdsCoresDisponiveisNomeCor3.AsString <> '') then
   begin
      Column.Width := nLarguraCol;
      DBGrid1.Canvas.FillRect(Rect);
      if cdsCoresDisponiveisbSelecao3.AsBoolean then
         Check := DFCS_CHECKED
      else
         Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

  //Coluna de chec da Quarta coluna de cores
   if (Column.FieldName = 'Aux4') and (cdsCoresDisponiveisNomeCor4.AsString <> '') then
   begin
      Column.Width := nLarguraCol;
      DBGrid1.Canvas.FillRect(Rect);
      if cdsCoresDisponiveisbSelecao4.AsBoolean then
         Check := DFCS_CHECKED
      else
         Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

end;

procedure TfrmArtigo_Criacao.doInformacaoReferencia(Ref: String);
var
   qryRef : TADOQuery;
begin
   qryRef := TADOQuery.Create(Self);
   qryRef.Connection := DM.Conexao;

   with qryRef, qryRef.SQL do begin
      Close;
      Clear;
      Add('SELECT TOP 1  A.vReferencia, A.vNome, A.vNCM, A.vCST, A.vUnidade, A.FK_IDFornecedor, A.FK_IDRColecao, A.FK_IDRGrupo');
      Add('FROM dbo.Artigo A WHERE A.vReferencia = ' + QuotedStr(Ref));
      Open;
   end;

end;

procedure TfrmArtigo_Criacao.doPreencheCds;
var
   MaiorWidth1, MaiorWidth2, MaiorWidth3, MaiorWidth4  : Integer;
begin

   DM.qryCor.First;
   while not DM.qryCor.Eof do begin
      //Coluna 1
      cdsCoresDisponiveis.Append;
      cdsCoresDisponiveisbSelecao1.Value := False;
      cdsCoresDisponiveisID1.Value := DM.qryCor.Fields[0].AsInteger;
      cdsCoresDisponiveisNomeCor1.Value := DM.qryCor.Fields[1].AsString;

      MaiorWidth1 := IfThen(length(DM.qryCor.Fields[1].AsString) <  MaiorWidth1, MaiorWidth1,
                                         length(DM.qryCor.Fields[1].AsString));

      DM.qryCor.Next;
      if DM.qryCor.Eof then
      begin
         cdsCoresDisponiveis.Post;
         Break;
      end;

      //Coluna 2
      cdsCoresDisponiveisbSelecao2.Value := False;
      cdsCoresDisponiveisID2.Value := DM.qryCor.Fields[0].AsInteger;
      cdsCoresDisponiveisNomeCor2.Value := DM.qryCor.Fields[1].AsString;

      MaiorWidth2 := IfThen(length(DM.qryCor.Fields[1].AsString) <  MaiorWidth2, MaiorWidth2,
                                         length(DM.qryCor.Fields[1].AsString));

      DM.qryCor.Next;
      if DM.qryCor.Eof then
      begin
         cdsCoresDisponiveis.Post;
         Break;
      end;

      //Coluna3
      cdsCoresDisponiveisbSelecao3.Value := False;
      cdsCoresDisponiveisID3.Value := DM.qryCor.Fields[0].AsInteger;
      cdsCoresDisponiveisNomeCor3.Value := DM.qryCor.Fields[1].AsString;

      MaiorWidth3 := IfThen(length(DM.qryCor.Fields[1].AsString) <  MaiorWidth3, MaiorWidth3,
                                         length(DM.qryCor.Fields[1].AsString));

      DM.qryCor.Next;
      if DM.qryCor.Eof then
      begin
         cdsCoresDisponiveis.Post;
         Break;
      end;

      //Coluna4
      cdsCoresDisponiveisbSelecao4.Value := False;
      cdsCoresDisponiveisID4.Value := DM.qryCor.Fields[0].AsInteger;
      cdsCoresDisponiveisNomeCor4.Value := DM.qryCor.Fields[1].AsString;

      MaiorWidth4 := IfThen(length(DM.qryCor.Fields[1].AsString) <  MaiorWidth4, MaiorWidth4,
                                         length(DM.qryCor.Fields[1].AsString));

      DM.qryCor.Next;
      if DM.qryCor.Eof then
      begin
         cdsCoresDisponiveis.Post;
         Break;
      end;

      cdsCoresDisponiveis.Post;
   end;

   {:: Coloca a Largura das colunas com o nome das cores}
   DBGrid1.Columns[1].Width := MaiorWidth1 * 13;
   DBGrid1.Columns[3].Width := MaiorWidth2 * 13;
   DBGrid1.Columns[5].Width := MaiorWidth3 * 13;
   DBGrid1.Columns[7].Width := MaiorWidth4 * 13;
end;

function TfrmArtigo_Criacao.doVerificaCamposObrigatorios: Boolean;
begin
   if vReferencia.Text = '' then
   begin
      ShowMessage('O campo Referencia é de preenchimento Obrigatório!');
      vReferencia.SetFocus;
      Result := False;
      exit;
   end;

   if vNome.Text = '' then
   begin
      ShowMessage('O campo Nome é de preenchimento Obrigatório!');
      vNome.SetFocus;
      Result := False;
      exit;
   end;

   if FK_IDFornecedor.Text = '' then
   begin
      ShowMessage('O campo Fornecedor é de preenchimento Obrigatório!');
      FK_IDFornecedor.SetFocus;
      Result := False;
      exit;
   end;

   if FK_IDRGrupo.Text = '' then
   begin
      ShowMessage('O campo Grupo é de preenchimento Obrigatório!');
      FK_IDRGrupo.SetFocus;
      Result := False;
      exit;
   end;

   if FK_IDRColecao.Text = '' then
   begin
      ShowMessage('O campo Coleção é de preenchimento Obrigatório!');
      FK_IDRColecao.SetFocus;
      Result := False;
      exit;
   end;

   Result := True;
end;

procedure TfrmArtigo_Criacao.FormShow(Sender: TObject);
begin
  inherited;
  //Preenche o client data set com as cores
  doPreencheCds();
end;

end.
