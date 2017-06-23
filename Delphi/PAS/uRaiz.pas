unit uRaiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmRaiz = class(TForm)
    pnlTitulo: TPanel;
    pnlWorkArea: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure setTema();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRaiz: TfrmRaiz;

implementation

{$R *.dfm}

uses uTema;

procedure TfrmRaiz.FormCreate(Sender: TObject);
begin
   setTema();
end;

procedure TfrmRaiz.setTema;
begin
   {:: Troca o tema baseado na unit uTema ::}
   pnlTitulo.Color := frmTema.pnlCorBtn.Color;
   pnlWorkArea.Color := frmTema.pnlCorWA.Color;
end;

end.
