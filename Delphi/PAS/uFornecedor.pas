unit uFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uFornecedor_Edicao,
  uFornecedor_db;

type
  TfrmFornecedor = class(TfrmRaiz)
    DBGrid1: TDBGrid;
    btnCriar: TBitBtn;
    btnAlterar: TBitBtn;
    pnlPesquisa: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edNomeFantasia: TEdit;
    edRazaoSocial: TEdit;
    edCidade: TEdit;
    edID: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    lblReferencia: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edUF: TEdit;
    DataSource1: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;
  FornecedorDB : TFornecedorDB;

implementation

{$R *.dfm}

procedure TfrmFornecedor.btnAlterarClick(Sender: TObject);
begin
  inherited;
   frmFornecedor_Edicao := TfrmFornecedor_Edicao.create(Self);
   FornecedorDB.doCarregaForm(frmFornecedor_Edicao);
   frmFornecedor_Edicao.ShowModal;
   frmFornecedor_Edicao.Disposeof;
   FornecedorDB.doAbreDados();
end;

procedure TfrmFornecedor.btnCriarClick(Sender: TObject);
begin
  inherited;
   FornecedorDB.setModoEdicao('cria');

   btnAlterarClick(Self);
end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
   FornecedorDB := TFornecedorDB.Create(Self);

   DataSource1.DataSet := FornecedorDB.qryPrincipal;
end;

procedure TfrmFornecedor.FormShow(Sender: TObject);
begin
  inherited;
   FornecedorDB.doAbreDados();
end;

end.
