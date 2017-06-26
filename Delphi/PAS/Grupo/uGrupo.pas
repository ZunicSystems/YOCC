unit uGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uGrupo_db, Vcl.OleCtrls, SHDocVw,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart;

type
  TfrmGrupo = class(TfrmRaiz)
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnInativar: TSpeedButton;
    DataSource1: TDataSource;
    Chart1: TChart;
    Chart2: TChart;
    Series2: TPieSeries;
    Series1: TBarSeries;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInativarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo: TfrmGrupo;
  GrupoDB : TGrupoDB;

implementation

{$R *.dfm}

uses uGrupo_Edicao;

procedure TfrmGrupo.btnInativarClick(Sender: TObject);
begin
  inherited;

  GrupoDB.doDeleta();
end;

procedure TfrmGrupo.btnNovoClick(Sender: TObject);
begin
  inherited;

  frmGrupo_Edicao := TfrmGrupo_Edicao.Create(Self);
  GrupoDB.setModoEdicao('cria');
  frmGrupo_Edicao.ShowModal;
  frmGrupo_Edicao.DisposeOf;
end;

procedure TfrmGrupo.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  frmGrupo_Edicao := TfrmGrupo_Edicao.Create(Self);
  GrupoDB.setModoEdicao('edita');
  GrupoDB.doCarregaForm(frmGrupo_Edicao);
  frmGrupo_Edicao.ShowModal;
  frmGrupo_Edicao.DisposeOf;
  GrupoDB.doAbreDados();
end;

procedure TfrmGrupo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key = 13 then DBGrid1DblClick(Self);
end;

procedure TfrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  GrupoDB.Destroy;
end;

procedure TfrmGrupo.FormCreate(Sender: TObject);
begin
  inherited;

  GrupoDB := TGrupoDB.Create(Self);
  DataSource1.DataSet := GrupoDB.qryPrincipal;
end;

procedure TfrmGrupo.FormShow(Sender: TObject);
begin
  inherited;

  GrupoDB.doAbreDados();
end;

end.
