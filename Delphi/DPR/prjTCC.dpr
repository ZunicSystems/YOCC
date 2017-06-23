program prjTCC;

uses
  Vcl.Forms,
  uPrincipal in '..\PAS\uPrincipal.pas' {frmPrincipal},
  uDM in '..\PAS\uDM.pas' {DM: TDataModule},
  uTentandoReconectar in '..\PAS\uTentandoReconectar.pas' {frmTentandoReconectar},
  uRaiz in '..\PAS\uRaiz.pas' {frmRaiz},
  uMenu in '..\PAS\uMenu.pas',
  uTema in '..\PAS\uTema.pas' {frmTema},
  SpeedButtonMenu in '..\PAS\SpeedButtonMenu.pas',
  uUsuario in '..\PAS\uUsuario.pas',
  uLogin in '..\PAS\uLogin.pas' {frmLogin},
  uArtigo in '..\PAS\uArtigo.pas' {frmArtigo},
  uFornecedor in '..\PAS\uFornecedor.pas' {frmFornecedor},
  uArtigo_db in '..\PAS\uArtigo_db.pas',
  uFornecedor_db in '..\PAS\uFornecedor_db.pas',
  uFuncoesBD in '..\PAS\uFuncoesBD.pas',
  uVariaveis in '..\PAS\uVariaveis.pas',
  uRaiz_Edicao in '..\PAS\uRaiz_Edicao.pas' {frmRaiz_Edicao},
  uArtigo_Edicao in '..\PAS\uArtigo_Edicao.pas' {frmArtigo_Edicao},
  uFuncoes in '..\PAS\uFuncoes.pas',
  uFornecedor_Edicao in '..\PAS\uFornecedor_Edicao.pas' {frmFornecedor_Edicao},
  uFornecedor_Edicao_Contato in '..\PAS\uFornecedor_Edicao_Contato.pas' {frmFornecedor_Edicao_Contato},
  uArtigo_Edicao_Tamanho in '..\PAS\uArtigo_Edicao_Tamanho.pas' {frmArtigo_Edicao_Tamanho},
  uFuncoesImagem in '..\PAS\uFuncoesImagem.pas',
  uFornecedor_Edicao_Contato_db in '..\PAS\uFornecedor_Edicao_Contato_db.pas',
  uArtigo_Edicao_Tamanho_Edicao in '..\PAS\uArtigo_Edicao_Tamanho_Edicao.pas' {frmArtigo_Edicao_Tamanho_Edicao},
  uArtigo_Criacao in '..\PAS\uArtigo_Criacao.pas' {frmArtigo_Criacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  frmLogin := TfrmLogin.Create(nil);
  frmLogin.ShowModal;
  if frmLogin.ModalResult = 1 then
  begin
     frmLogin.DisposeOf;
     frmTema := TfrmTema.Create(nil);
     Application.CreateForm(TfrmPrincipal, frmPrincipal);
     Application.Run;
  end;
end.
