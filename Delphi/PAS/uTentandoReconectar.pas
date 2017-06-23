unit uTentandoReconectar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, WinInet;

type
  TfrmTentandoReconectar = class(TForm)
    lblStatus: TLabel;
    TimerBotao: TTimer;
    TimerTexto: TTimer;
    pnlSair: TPanel;
    btnExit: TSpeedButton;
    procedure btnExitClick(Sender: TObject);
    procedure TimerTextoTimer(Sender: TObject);
    procedure TimerBotaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure doReiniciarContador();
    procedure doControlaTexto();
  private
    { Private declarations }
    liberarBotaoFechar : Integer;
    fasesTexto : Integer;
  public
    { Public declarations }
  end;

var
  frmTentandoReconectar: TfrmTentandoReconectar;

implementation

{$R *.dfm}

procedure TfrmTentandoReconectar.btnExitClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmTentandoReconectar.doControlaTexto;
begin
   {:: Controla o texto da label de notificação. ::}

   if fasesTexto = 1 then
   begin
      lblStatus.Caption := 'Tentando reestabelecer conexão    ';
      fasesTexto := fasesTexto + 1;
      Exit;
   end;

   if fasesTexto = 2 then
   begin
      lblStatus.Caption := 'Tentando reestabelecer conexão .  ';
      fasesTexto := fasesTexto + 1;
      Exit;
   end;

   if fasesTexto = 3 then
   begin
      lblStatus.Caption := 'Tentando reestabelecer conexão .. ';
      fasesTexto := fasesTexto + 1;
      Exit;
   end;

   if fasesTexto = 4 then
   begin
      lblStatus.Caption := 'Tentando reestabelecer conexão ...';
      fasesTexto := 1;
      Exit;
   end;
end;

procedure TfrmTentandoReconectar.doReiniciarContador;
begin
   {:: Reinicia a contagem ::}
   liberarBotaoFechar := 8;
   fasesTexto := 1;
   TimerBotao.Enabled := True;
   btnExit.Caption := 'Finalizar (09)';
   btnExit.Enabled := False;
end;

procedure TfrmTentandoReconectar.FormShow(Sender: TObject);
begin
   doReiniciarContador();
end;

procedure TfrmTentandoReconectar.TimerBotaoTimer(Sender: TObject);
begin
   if liberarBotaoFechar > 0 then
   begin
      btnExit.Caption := 'Finalizar (0' + IntToStr(liberarBotaoFechar) + ')';
      liberarBotaoFechar := liberarBotaoFechar - 1;
   end
   else
   begin
      btnExit.Enabled := True;
      btnExit.Caption := 'Finalizar';
      TimerBotao.Enabled := False;
   end;
end;

procedure TfrmTentandoReconectar.TimerTextoTimer(Sender: TObject);
var i : dword;
begin
   // Verifica a conexão.
   try
      if InternetGetConnectedState(@i, 0) then
         Close
   Except
      ShowMessage('OOOPS. Ocorreu um erro, a aplicação será finalizada.');
      Application.Terminate;
   end;

   doControlaTexto();
end;

end.
