unit uGrupo_Edicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, uFuncoes;

type
  TfrmGrupo_Edicao = class(TfrmRaiz_Edicao)
    Bevel1: TBevel;
    vNome: TLabeledEdit;
    ID: TLabeledEdit;
    btnAlterar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo_Edicao: TfrmGrupo_Edicao;

implementation

{$R *.dfm}

uses uGrupo;

{ TfrmGrupo_Edicao }

procedure TfrmGrupo_Edicao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  btnAlterar.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  EdicaoCampos(Self ,True);
end;

procedure TfrmGrupo_Edicao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmGrupo_Edicao.btnSalvarClick(Sender: TObject);
begin
  inherited;
  uGrupo.GrupoDB.doGrava(Self);
  Close;
end;

procedure TfrmGrupo_Edicao.FormShow(Sender: TObject);
begin
  inherited;
  EdicaoCampos(Self ,False);

  {::Se o campo ID não estiver preencido, demonstra que se trata de uma criação}
  if ID.Text = '' then
    btnAlterarClick(Self);

end;

end.
