unit uFornecedor_Edicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRaiz_Edicao, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uFuncoes;

type
  TfrmFornecedor_Edicao = class(TfrmRaiz_Edicao)
    btnAlterar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    PageControl1: TPageControl;
    tabDadosCadastraiss: TTabSheet;
    gbDadosPessoais: TGroupBox;
    Label1: TLabel;
    ID: TLabeledEdit;
    vRazaoSocial: TLabeledEdit;
    vNomeFantasia: TLabeledEdit;
    vInscricaoEstadual: TLabeledEdit;
    vCNPJ: TLabeledEdit;
    dData: TDateTimePicker;
    Endereco: TGroupBox;
    SpeedButton1: TSpeedButton;
    vCEP: TLabeledEdit;
    vEndereco: TLabeledEdit;
    vBairro: TLabeledEdit;
    vCidade: TLabeledEdit;
    vUF: TLabeledEdit;
    tabContatos: TTabSheet;
    dgContatos: TDBGrid;
    btnNovoContato: TSpeedButton;
    btnEditaContato: TSpeedButton;
    tabAtuacao: TTabSheet;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure doAbilitaAlteracao(Status : Boolean);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor_Edicao: TfrmFornecedor_Edicao;

implementation

{$R *.dfm}

uses uFornecedor;

procedure TfrmFornecedor_Edicao.btnProximoClick(Sender: TObject);
begin
  inherited;
   PageControl1.SelectNextPage(True,True);

   {::Controla para que na primeira aba o anterior fique inativo
       e na ultima o proximo fique inativo::}
   btnAnterior.Enabled := True;
   if PageControl1.ActivePageIndex = PageControl1.PageCount - 1 then
   begin
      btnProximo.Enabled := False;
   end
   else
   begin
      btnProximo.Enabled := True;
   end;
end;

procedure TfrmFornecedor_Edicao.btnAlterarClick(Sender: TObject);
begin
  inherited;
   doAbilitaAlteracao(True);
end;

procedure TfrmFornecedor_Edicao.btnAnteriorClick(Sender: TObject);
begin
  inherited;
   PageControl1.SelectNextPage(False,True);

   {::Controla para que na primeira aba o anterior fique inativo
       e na ultima o proximo fique inativo::}
   btnProximo.Enabled := True;
   if PageControl1.ActivePageIndex = 0 then
   begin
      btnAnterior.Enabled := False;
   end
   else
   begin
      btnAnterior.Enabled := True;
   end;
end;

procedure TfrmFornecedor_Edicao.btnCancelarClick(Sender: TObject);
begin
  inherited;
   doAbilitaAlteracao(False);
   uFornecedor.FornecedorDB.doCarregaForm(Self);
end;

procedure TfrmFornecedor_Edicao.btnSairClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TfrmFornecedor_Edicao.btnSalvarClick(Sender: TObject);
begin
  inherited;
   doAbilitaAlteracao(False);
   uFornecedor.FornecedorDB.doGrava();
end;

procedure TfrmFornecedor_Edicao.doAbilitaAlteracao(Status: Boolean);
begin
   if Status then
   begin
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;
      btnAlterar.Enabled := False;
      btnSair.Enabled := False;
      EdicaoCampos(Self,True);
   end
   else
   begin
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnAlterar.Enabled := True;
      btnSair.Enabled := True;
      EdicaoCampos(Self,False);
   end;
end;

procedure TfrmFornecedor_Edicao.FormCreate(Sender: TObject);
begin
   inherited;
   // A guia ativa será sempre a de dados cadastrais.
   PageControl1.ActivePageIndex := 0;
   //Como sempre começa na primeira guia o botão anterior deve estar inativo
   btnAnterior.Enabled := False;
end;

procedure TfrmFornecedor_Edicao.FormShow(Sender: TObject);
begin
  inherited;
   doAbilitaAlteracao(False);
   if uFornecedor.FornecedorDB.getModoEdicao() = 'cria' then
   begin
      btnAlterarClick(Self);
   end;
end;

procedure TfrmFornecedor_Edicao.PageControl1Change(Sender: TObject);
begin
  inherited;
   //desabilita/abilita o btnAnterior
   if PageControl1.ActivePageIndex = 0 then
   begin
      btnAnterior.Enabled := False;
   end
   else
   begin
      btnAnterior.Enabled := True;
   end;

   //desabilita/abilita o btnProximo
   if PageControl1.ActivePageIndex = PageControl1.PageCount - 1 then
   begin
      btnProximo.Enabled := False;
   end
   else
   begin
      btnProximo.Enabled := True;
   end;
end;

end.
