unit uSelecaoFilial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, uRaiz_Edicao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, uPrincipal;

type
  TfrmSelecaoFilial = class(TfrmRaiz_Edicao)
    Bevel1: TBevel;
    Label1: TLabel;
    iFilial: TDBLookupComboBox;
    btnOK: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoFilial: TfrmSelecaoFilial;

implementation

{$R *.dfm}

procedure TfrmSelecaoFilial.btnOKClick(Sender: TObject);
begin
  inherited;
  if iFilial.Text = '' then
  begin
     ShowMessage('Selecione uma Filial');
     exit;
  end;

  uPrincipal.Usuario.setFilialAtual(iFilial.KeyValue);
  Close;
end;

procedure TfrmSelecaoFilial.FormPaint(Sender: TObject);
begin
  inherited;
  //Se tiver apenas uma filial seleciona ela e sai
   if DM.qryFilial.RecordCount = 1 then
   begin
     uPrincipal.Usuario.setFilialAtual(DM.qryFilial.FieldByName('ID').AsInteger);
     Close;
   end;
end;

end.
