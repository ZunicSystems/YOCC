unit uArtigo_Edicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, uFuncoes, Vcl.ComCtrls, Data.DB, uFuncoesBD,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtDlgs, JPEG, Data.Win.ADODB, uDM;

type
  TfrmArtigo_Edicao = class(TfrmRaiz_Edicao)
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    PageControl1: TPageControl;
    tabTecnica: TTabSheet;
    tabAtacado: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FK_IDFornecedor: TDBLookupComboBox;
    FK_IDRCor: TDBLookupComboBox;
    FK_IDRColecao: TDBLookupComboBox;
    FK_IDRGrupo: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    ID: TLabeledEdit;
    vReferencia: TLabeledEdit;
    vNome: TLabeledEdit;
    mPrecoCusto: TLabeledEdit;
    mMarkup: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    tabVarejo: TTabSheet;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    vUnidade: TLabeledEdit;
    vCST: TLabeledEdit;
    vNCM: TLabeledEdit;
    btnTamanhos: TBitBtn;
    Bevel1: TBevel;
    pnlImage: TPanel;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    CarregarImagem1: TMenuItem;
    BaixarImagem1: TMenuItem;
    Rotacionar90D1: TMenuItem;
    Rotacionar90E1: TMenuItem;
    N1: TMenuItem;
    procedure VerificaMenuFilial();
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTamanhosClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CarregarImagem1Click(Sender: TObject);
    procedure setImagemArtigo(JPEG : TJPEGImage);
    procedure getFoto();
    procedure Rotacionar90D1Click(Sender: TObject);
    procedure Rotacionar90E1Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure doRedimencionaTImagem(AumentaDiminui:boolean;nPixel : integer);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    Source : TParameter;
  public
    { Public declarations }
  end;

var
  frmArtigo_Edicao: TfrmArtigo_Edicao;

implementation

{$R *.dfm}

uses uArtigo, uVariaveis, uArtigo_Edicao_Tamanho, uFuncoesImagem;

procedure TfrmArtigo_Edicao.btnAlterarClick(Sender: TObject);
begin
  inherited;
   btnAlterar.Enabled := False;
   btnSalvar.Enabled := True;
   btnCancelar.Enabled := True;
   btnSair.Enabled := False;

   Image1.PopupMenu := PopupMenu1;
   pnlImage.PopupMenu := PopupMenu1;

   EdicaoCampos(Self, True);
end;

procedure TfrmArtigo_Edicao.btnCancelarClick(Sender: TObject);
begin
  inherited;
   btnAlterar.Enabled := True;
   btnSalvar.Enabled := False;
   btnCancelar.Enabled := False;
   btnSair.Enabled := True;

   Image1.PopupMenu := nil;
   pnlImage.PopupMenu := nil;

   EdicaoCampos(Self, False);
end;

procedure TfrmArtigo_Edicao.btnSairClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TfrmArtigo_Edicao.btnSalvarClick(Sender: TObject);
begin
   EdicaoCampos(Self, False);

   btnAlterar.Enabled := True;
   btnSalvar.Enabled := False;
   btnCancelar.Enabled := False;
   btnSair.Enabled := True;

   Image1.PopupMenu := nil;
   pnlImage.PopupMenu := nil;

   uArtigo.artigoDB.doGrava();
end;

procedure TfrmArtigo_Edicao.btnTamanhosClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Edicao_Tamanho := TfrmArtigo_Edicao_Tamanho.Create(Self);
   frmArtigo_Edicao_Tamanho.ShowModal();
   FreeAndNil(frmArtigo_Edicao_Tamanho);
end;

procedure TfrmArtigo_Edicao.CarregarImagem1Click(Sender: TObject);
var jpg : TJPEGImage;
begin
  inherited;
   try
      jpg := TJPEGImage.Create();
      jpg := getImagemFromFile();
      jpg := setCompression(jpg);

      setImagemArtigo(jpg);
      getFoto();
   finally
      FreeAndNil(JPG);
   end;
end;

procedure TfrmArtigo_Edicao.doRedimencionaTImagem(AumentaDiminui: boolean;
  nPixel: integer);
begin
   if AumentaDiminui then
   begin
      pnlImage.Height := pnlImage.Height + nPixel;
      pnlImage.Width := pnlImage.Width + nPixel;

      Image1.Height := Image1.Height + nPixel;
      Image1.Width := Image1.Width + nPixel;

      pnlImage.Left := pnlImage.Left - nPixel;
   end
   else
   begin
      pnlImage.Height := pnlImage.Height - nPixel;
      pnlImage.Width := pnlImage.Width - nPixel;

      Image1.Height := Image1.Height - nPixel;
      Image1.Width := Image1.Width - nPixel;

      pnlImage.Left := pnlImage.Left + nPixel;
   end;
end;

procedure TfrmArtigo_Edicao.getFoto;
Var MS: TMemoryStream;
    Jpeg: TJpegImage;
    ADOqq : TADOQuery;
begin
   ADOqq := TADOQuery.Create(nil);
   ADOqq.Connection := DM.Conexao;

   // Mostra a foto Local
   with ADOqq, ADOqq.SQL do begin
      Close;
      Clear;
      Add('Select Foto From Artigo_Foto');
      Add('Where FK_IDArtigo = :ID');
      Parameters.ParamByName('ID').Value := artigoDB.getIDArtigo();
      Open;
   end;
   if not TBlobField(ADOqq.FieldByName('Foto')).IsNull then begin
      // Carrega a imagem
      MS := TMemoryStream.Create;
      Jpeg := TJPEGImage.Create;
      try
         TBlobField(ADOqq.FieldByName('Foto')).SaveToStream(MS);
         MS.Position := 0;
         Jpeg.LoadFromStream(MS);
         Image1.Picture.Assign(Jpeg);
      finally
         MS.Free;
         Jpeg.Free;
      end;
   end;
end;

procedure TfrmArtigo_Edicao.Image1Click(Sender: TObject);
var
   jpg : TJPEGImage;
begin
  inherited;
   if Image1.Picture.Graphic = nil then
   begin
      try
         jpg := TJPEGImage.Create();
         jpg := getImagemFromFile();
         jpg := setCompression(jpg);

         setImagemArtigo(jpg);
         getFoto();
      finally
         FreeAndNil(JPG);
      end;
   end;
end;

procedure TfrmArtigo_Edicao.Image1MouseEnter(Sender: TObject);
begin
  inherited;
  if Image1.Picture.Graphic <> nil then
     doRedimencionaTImagem(True,80);
end;

procedure TfrmArtigo_Edicao.Image1MouseLeave(Sender: TObject);
begin
  inherited;
  if Image1.Picture.Graphic <> nil then
     doRedimencionaTImagem(False,80);
end;

procedure TfrmArtigo_Edicao.Rotacionar90D1Click(Sender: TObject);
var jpgTMP : TJPEGImage;
    MS : TMemoryStream;
begin
  inherited;
   jpgTMP := TJPEGImage.Create();
   MS := TMemoryStream.Create();

   Image1.Picture.Graphic.SaveToStream(MS);
   MS.Position := 0;
   jpgTMP.LoadFromStream(MS);

   jpgTMP := rotate90G_Direita(jpgTMP);
   setImagemArtigo(jpgTMP);
   getFoto();

   jpgTMP.Free;
   MS.Free;   
end;

procedure TfrmArtigo_Edicao.Rotacionar90E1Click(Sender: TObject);
var jpgTMP : TJPEGImage;
    MS : TMemoryStream;
begin
  inherited;
   jpgTMP := TJPEGImage.Create();
   MS := TMemoryStream.Create();

   Image1.Picture.Graphic.SaveToStream(MS);
   MS.Position := 0;
   jpgTMP.LoadFromStream(MS);

   jpgTMP := rotate90G_Esquerda(jpgTMP);
   setImagemArtigo(jpgTMP);
   getFoto();

   jpgTMP.Free;
   MS.Free; 
end;

procedure TfrmArtigo_Edicao.setImagemArtigo(JPEG : TJPEGImage);
var sProcedure : TADOStoredProc;
    MS: TMemoryStream;
    tmp : String;
begin
   try
      {:: Cria procedure e CONFIGURA os parametros ::}
      sProcedure := TADOStoredProc.Create(nil);
      sProcedure.Connection := DM.Conexao;
      sProcedure.ProcedureName := 'pArtigo_Foto';
      sProcedure.Parameters.Clear;
      sProcedure.Parameters.Refresh;

      {:: Configura mStream ::}
      MS := TMemoryStream.Create;
      JPEG.SaveToStream(MS);
      MS.Position := 0;

      {:: Carrega Parâmetros da STORED ::}
      Zera_Parameter(sProcedure);

      Source := sProcedure.Parameters.FindParam('@V_FK_IDArtigo');
      if Source <> nil then Source.Value := artigoDB.getIDArtigo;

      Source := sProcedure.Parameters.FindParam('@V_Foto');
      if Source <> nil then Source.LoadFromStream(MS, ftBlob);

      // Executa a Storad Procedure
      ExecutaStoredProc(sProcedure);

      {:: Verifica se a operação não retornou ERRO ::}
      Source := sProcedure.Parameters.FindParam('@V_Retorno');
      if Source <> nil then tmp := LowerCase(Source.Value);

      if tmp <> 'ok' then
      begin
         ShowMessage('OOPS. Algo deu errado. Tente novamente dentro de alguns minutos ... ' + ^m +
                     'Ou entre em contato com o nosso suporte.');
         Exit;
      end;
   finally
      FreeAndNil(MS);
   end;
end;

procedure TfrmArtigo_Edicao.VerificaMenuFilial;
begin
   // DESABILITA as outras guias por filial se a empresa tiver apenas uma filial.
   if uVariaveis.nQtdFiliaisEmpresa <= 1 then
   begin
      tabAtacado.TabVisible := False;
      tabVarejo.TabVisible := False;
   end;
end;

procedure TfrmArtigo_Edicao.FormCreate(Sender: TObject);
begin
  inherited;
   // Pagina ativa como DEFAULT é sempre a primeira.
   PageControl1.ActivePageIndex := 0;

   VerificaMenuFilial();
end;

procedure TfrmArtigo_Edicao.FormShow(Sender: TObject);
begin
   {:: Desabilita TODOS os campos, e troca os botões. :}
   EdicaoCampos(Self, False);

   btnAlterar.Enabled := True;
   btnSalvar.Enabled := False;
   btnCancelar.Enabled := False;
   btnSair.Enabled := True;

   getFoto();
end;

end.
