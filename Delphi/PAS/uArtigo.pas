unit uArtigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uArtigo_Edicao, uArtigo_db;

type
  TfrmArtigo = class(TfrmRaiz)
    DBGrid1: TDBGrid;
    btnCriar: TBitBtn;
    btnAlterar: TBitBtn;
    btnDeletar: TBitBtn;
    pnlPesquisa: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edColecao: TEdit;
    edFornecedor: TEdit;
    edGrupo: TEdit;
    edNome: TEdit;
    edReferencia: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblNome: TLabel;
    lblReferencia: TLabel;
    DataSource1: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TfrmArtigo.btnAlterarClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Edicao := TfrmArtigo_Edicao.Create(Self);
   artigoDB.doCarregaForm(frmArtigo_Edicao);
   frmArtigo_Edicao.ShowModal;
   frmArtigo_Edicao.DisposeOf;
   artigoDB.doAbreDados();
end;

procedure TfrmArtigo.btnCriarClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Criacao := TfrmArtigo_Criacao.Create(Self);
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
