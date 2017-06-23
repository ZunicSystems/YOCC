unit uArtigo_Edicao_Tamanho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmArtigo_Edicao_Tamanho = class(TfrmRaiz_Edicao)
    btnSair: TBitBtn;
    DBGrid2: TDBGrid;
    btnNovo: TSpeedButton;
    btnInativar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtigo_Edicao_Tamanho: TfrmArtigo_Edicao_Tamanho;

implementation

{$R *.dfm}

uses uArtigo_Edicao_Tamanho_Edicao;

procedure TfrmArtigo_Edicao_Tamanho.btnNovoClick(Sender: TObject);
begin
  inherited;
   frmArtigo_Edicao_Tamanho_Edicao := TfrmArtigo_Edicao_Tamanho_Edicao.Create(Self);
   frmArtigo_Edicao_Tamanho_Edicao.ShowModal;
   frmArtigo_Edicao_Tamanho_Edicao.DisposeOf;
end;

procedure TfrmArtigo_Edicao_Tamanho.btnSairClick(Sender: TObject);
begin
   Close;
end;

end.
