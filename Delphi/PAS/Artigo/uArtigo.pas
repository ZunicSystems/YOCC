unit uArtigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uArtigo_Edicao, uArtigo_db,
  Vcl.ComCtrls, Vcl.DBCtrls, math, uDM;

type
  TfrmArtigo = class(TfrmRaiz)
    DBGrid1: TDBGrid;
    btnCriar: TBitBtn;
    btnAlterar: TBitBtn;
    btnDeletar: TBitBtn;
    pnlPesquisa: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edNome: TEdit;
    edReferencia: TEdit;
    lblNome: TLabel;
    Label3: TLabel;
    lblFor: TLabel;
    lblReferencia: TLabel;
    DataSource1: TDataSource;
    iGrupo: TDBLookupComboBox;
    Label2: TLabel;
    iColecao: TDBLookupComboBox;
    iFornecedor: TDBLookupComboBox;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtigo: TfrmArtigo;
  artigoDB : TArtigoDB;

implementation

{$R *.dfm}

uses uArtigo_Criacao;

procedure TfrmArtigo.BitBtn1Click(Sender: TObject);
begin
  inherited;
   edNome.Text := '';
   edReferencia.Text := '';
   iFornecedor.KeyValue := '0';
   iGrupo.KeyValue := '0';
   iColecao.KeyValue := '0';
end;

procedure TfrmArtigo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //Tratamento Para evitar combos vazias
   if iFornecedor.Text = '' then
      iFornecedor.KeyValue := '0';

   if iGrupo.Text = '' then
      iGrupo.KeyValue := '0';

   if iColecao.Text = '' then
      iColecao.KeyValue := '0';

   artigoDB.doAbreDados(edReferencia.Text, edNome.Text,
                        iFornecedor.KeyValue, iGrupo.KeyValue,
                        iColecao.KeyValue);
end;

procedure TfrmArtigo.btnAlterarClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Edicao := TfrmArtigo_Edicao.Create(Self);
   artigoDB.setModoEdicao('edita');
   artigoDB.doCarregaForm(frmArtigo_Edicao);
   frmArtigo_Edicao.ShowModal;
   frmArtigo_Edicao.DisposeOf;
   artigoDB.doAbreDados();
end;

procedure TfrmArtigo.btnCriarClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Criacao := TfrmArtigo_Criacao.Create(Self);
   artigoDB.setModoEdicao('cria');
   frmArtigo_Criacao.ShowModal;
   frmArtigo_Criacao.DisposeOf;
end;

procedure TfrmArtigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   artigoDB.Destroy;
end;

procedure TfrmArtigo.FormCreate(Sender: TObject);
begin
  inherited;

   artigoDB := TArtigoDB.Create(Self);
   DataSource1.DataSet := artigoDB.qryPrincipal;
end;

procedure TfrmArtigo.FormShow(Sender: TObject);
begin
  inherited;
   artigoDB.doAbreDados();
end;

end.
