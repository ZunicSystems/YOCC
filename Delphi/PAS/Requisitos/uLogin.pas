unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, QRCtrls, QuickRpt, Vcl.Buttons, uUsuario, uPrincipal,
  Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    Shape1: TShape;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    edUsuario: TEdit;
    edSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnEntrar: TBitBtn;
    btnCancela: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
    Usuario : TUsuario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCancelaClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
   if trim(edUsuario.Text) <> '' then
   begin
      if not Usuario.getUsuarioExiste(Trim(edUsuario.Text)) then
      begin
         ShowMessage('O usuário não existe ou está inativo!');
         edUsuario.Clear;
         edUsuario.SetFocus;
      end
      else
      begin
         if trim(edSenha.Text) <> '' then
         begin
            if Usuario.doValidaUsuario(Trim(edUsuario.Text),Trim(edSenha.Text)) then
            begin
               uPrincipal.Usuario := Usuario;
               ModalResult := mrOk;
            end
            else
            begin
               ShowMessage('O senha informada não confere!');
               edSenha.Clear;
               edSenha.SetFocus;
            end;
         end
         else
         begin
            ShowMessage('Por Favor, preencher o campo Senha!');
            edSenha.SetFocus;
         end;
      end;
   end
   else
   begin
      ShowMessage('Por Favor, preencher o campo Usuario!');
      edUsuario.SetFocus;
   end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  region : hrgn;
begin
   {::Colocar as bordas aredondadas}
  region:= CreateRoundRectRgn(0, 0, width, height, 60, 60);
  setwindowrgn(handle, region, true);

  {::Cria o obj usuario}
  Usuario := TUsuario.Create;
end;

end.
