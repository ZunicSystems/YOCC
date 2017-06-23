unit uTema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, QuickRpt, QRCtrls;

type
  TfrmTema = class(TForm)
    gbTema1: TGroupBox;
    pnlCorTop1: TPanel;
    pnlCorWA1: TPanel;
    pnlCorMenu1: TPanel;
    pnlCorBtn1: TPanel;
    gbTema2: TGroupBox;
    pnlCorTop2: TPanel;
    pnlCorWA2: TPanel;
    pnlCorMenu2: TPanel;
    pnlCorBtn2: TPanel;
    gbTema3: TGroupBox;
    pnlCorTop3: TPanel;
    pnlCorWA3: TPanel;
    pnlCorMenu3: TPanel;
    pnlCorBtn3: TPanel;
    gbTema4: TGroupBox;
    pnlCorTop4: TPanel;
    pnlCorWA4: TPanel;
    pnlCorMenu4: TPanel;
    pnlCorBtn4: TPanel;
    GroupBox1: TGroupBox;
    pnlCorTop: TPanel;
    pnlCorWA: TPanel;
    pnlCorMenu: TPanel;
    pnlCorBtn: TPanel;
    ImOrdem: TImage;
    Setabaixo: TQRImage;
    SetaCima: TQRImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTema: TfrmTema;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmTema.FormCreate(Sender: TObject);
var
   Tema : String;
begin
   Tema := IntToStr(uPrincipal.Usuario.getTema());

   pnlCorTop.Color := TPanel(FindComponent('pnlCorTop' + Tema)).Color;
   pnlCorWA.Color := TPanel(FindComponent('pnlCorWA' + Tema)).Color;
   pnlCorMenu.Color := TPanel(FindComponent('pnlCorMenu' + Tema)).Color;
   pnlCorMenu.Font.Color := TPanel(FindComponent('pnlCorMenu' + Tema)).Font.Color;
   pnlCorBtn.Color := TPanel(FindComponent('pnlCorBtn' + Tema)).Color;
   pnlCorBtn.Font.Color := TPanel(FindComponent('pnlCorBtn' + Tema)).Font.Color;
end;

end.
