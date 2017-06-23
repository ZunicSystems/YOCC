unit uRaiz_Edicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uTema;

type
  TfrmRaiz_Edicao = class(TForm)
    pnlWorkArea: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure setTema();
  public
    { Public declarations }
  end;

var
  frmRaiz_Edicao: TfrmRaiz_Edicao;

implementation

{$R *.dfm}

procedure TfrmRaiz_Edicao.setTema;
begin
   {:: Troca o tema baseado na unit uTema ::}
   pnlWorkArea.Color := frmTema.pnlCorWA.Color;
end;

procedure TfrmRaiz_Edicao.FormCreate(Sender: TObject);
begin
   setTema();
end;

end.
