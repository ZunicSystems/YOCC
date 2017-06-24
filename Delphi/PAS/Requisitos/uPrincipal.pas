unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB, uMenu, SpeedButtonMenu, QuickRpt, QRCtrls, uUsuario;

type
  TfrmPrincipal = class(TForm)
    pnlTitulo: TPanel;
    pnlMenu: TPanel;
    pnlWorkArea: TPanel;
    lblCaption: TLabel;
    btnMinimiza: TSpeedButton;
    btnFinalizar: TSpeedButton;
    pnlBarraStatus: TPanel;
    procedure AjustaTamanhoTela;
    procedure FormShow(Sender: TObject);
    procedure btnMinimizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMinimizaMenuClick(Sender: TObject);
    procedure MinimizaMenu;
    procedure doCarregaMenu();
    procedure setTema();
    procedure doRegistraForm();
    procedure btnFinalizarClick(Sender: TObject);
  private
      Menu : TMenu;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Usuario : TUsuario;

implementation

{$R *.dfm}

uses uDM,uTema, uRaiz, uArtigo, uFornecedor, uGrupo;

procedure TfrmPrincipal.AjustaTamanhoTela;
begin
   {:: Ajusta o tamanho da tela, à area disponível de trabalho. ::}
   Self.Height := Screen.WorkAreaHeight;
   Self.Width := Screen.WorkAreaWidth;
end;

procedure TfrmPrincipal.btnMinimizaClick(Sender: TObject);
begin
   Application.Minimize;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   setTema();
   doCarregaMenu();
   doRegistraForm();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   AjustaTamanhoTela();
end;

procedure TfrmPrincipal.MinimizaMenu();
begin
//   if pnlMenu.Width = 0 then
//   begin
//      pnlMenu.Width := 170;
//      btnMinimizaMenu.Caption := '<<';
//   end
//   else
//   begin
//      pnlMenu.Width := 0;
//      btnMinimizaMenu.Caption := '>>';
//   end;
end;

procedure TfrmPrincipal.setTema;
begin
   {:: Carrega o tema a partir da UNIT de temas. ::}
   pnlTitulo.Color := frmTema.pnlCorTop.Color;
   pnlWorkArea.Color := frmTema.pnlCorWA.Color;
   pnlMenu.Color := frmTema.pnlCorMenu.Color;
   pnlBarraStatus.Color := frmTema.pnlCorMenu.Color;
end;

procedure TfrmPrincipal.btnFinalizarClick(Sender: TObject);
begin
   Application.Terminate();
end;

procedure TfrmPrincipal.btnMinimizaMenuClick(Sender: TObject);
begin
   //MinimizaMenu();
end;

procedure TfrmPrincipal.doCarregaMenu;
var
   qMenu : TADOQuery;
begin
   {:: Cria o menu de acordo com a tabela no banco [Menu]. ::}
   qMenu := TADOQuery.Create(self);
   qMenu.Connection := DM.Conexao;

   with qMenu, qMenu.SQL do begin
      Close;
      Clear;
      Add('SELECT ID, Ordem, Caption, Nome');
      Add('FROM dbo.Menu');
      Add('WHERE Ativo = 1');
      Add('ORDER BY Ordem');
      Open;
   end;

   Menu := TMenu.Create(pnlMenu,qMenu);
end;

procedure TfrmPrincipal.doRegistraForm;
begin
   {:: Registra os forms chamados à partir do menu ::}
   RegisterClass(TfrmRaiz);
   RegisterClass(TfrmArtigo);
   RegisterClass(TfrmFornecedor);
   RegisterClass(TfrmGrupo);
end;

end.
