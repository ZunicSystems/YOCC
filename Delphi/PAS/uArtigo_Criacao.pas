unit uArtigo_Criacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient;

type
  TfrmArtigo_Criacao = class(TfrmRaiz_Edicao)
    Panel1: TPanel;
    vReferencia: TLabeledEdit;
    vUnidade: TLabeledEdit;
    vNCM: TLabeledEdit;
    vCST: TLabeledEdit;
    vNome: TLabeledEdit;
    iFornecedor: TDBLookupComboBox;
    iGrupo: TDBLookupComboBox;
    iColecao: TDBLookupComboBox;
    mPrecoCusto: TLabeledEdit;
    mMarkup: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    cdsCoresDisponiveis: TClientDataSet;
    cdsCoresParaCriacao: TClientDataSet;
    dsCoresDisponiveis: TDataSource;
    dsCoresParaCriacao: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    btnCriar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsCoresDisponiveisbSelecao: TBooleanField;
    cdsCoresDisponiveisNomeCor: TStringField;
    cdsCoresDisponiveisIDcor: TIntegerField;
    procedure btnCriarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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
begin
  inherited;
   uArtigo.artigoDB.setModoEdicao('cria');

   Close;
end;

end.
