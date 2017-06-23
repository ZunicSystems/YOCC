unit uArtigo_Edicao_Tamanho_Edicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  uRaiz_Edicao, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmArtigo_Edicao_Tamanho_Edicao = class(TfrmRaiz_Edicao)
    SpeedButton1: TSpeedButton;
    pnlWorkArea: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtigo_Edicao_Tamanho_Edicao: TfrmArtigo_Edicao_Tamanho_Edicao;

implementation

{$R *.dfm}

end.
