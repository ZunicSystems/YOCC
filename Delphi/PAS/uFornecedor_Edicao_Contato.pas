unit uFornecedor_Edicao_Contato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmFornecedor_Edicao_Contato = class(TfrmRaiz_Edicao)
    vContato: TLabeledEdit;
    vDepartamento: TLabeledEdit;
    vTelefone: TMaskEdit;
    Label1: TLabel;
    vCelular: TMaskEdit;
    Label2: TLabel;
    vEmail: TLabeledEdit;
    bAtivo: TCheckBox;
    dData: TDateTimePicker;
    Label3: TLabel;
    Bevel1: TBevel;
    btnAlterar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor_Edicao_Contato: TfrmFornecedor_Edicao_Contato;

implementation

{$R *.dfm}

end.
