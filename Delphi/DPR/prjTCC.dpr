program prjTCC;

uses
  Vcl.Forms,
  uPrincipal in '..\PAS\Requisitos\uPrincipal.pas' {frmPrincipal},
  uDM in '..\PAS\DM\uDM.pas' {DM: TDataModule},
  uTentandoReconectar in '..\PAS\Requisitos\uTentandoReconectar.pas' {frmTentandoReconectar},
  uRaiz in '..\PAS\Requisitos\uRaiz.pas' {frmRaiz},
  uMenu in '..\PAS\Requisitos\uMenu.pas',
  uTema in '..\PAS\Requisitos\uTema.pas' {frmTema},
  SpeedButtonMenu in '..\PAS\Requisitos\SpeedButtonMenu.pas',
  uUsuario in '..\PAS\Requisitos\uUsuario.pas',
  uLogin in '..\PAS\Requisitos\uLogin.pas' {frmLogin},
  uArtigo in '..\PAS\Artigo\uArtigo.pas' {frmArtigo},
  uFornecedor in '..\PAS\Fornecedor\uFornecedor.pas' {frmFornecedor},
  uArtigo_db in '..\PAS\Artigo\uArtigo_db.pas',
  uFornecedor_db in '..\PAS\Fornecedor\uFornecedor_db.pas',
  uFuncoesBD in '..\PAS\Requisitos\uFuncoesBD.pas',
  uVariaveis in '..\PAS\Requisitos\uVariaveis.pas',
  uRaiz_Edicao in '..\PAS\Requisitos\uRaiz_Edicao.pas' {frmRaiz_Edicao},
  uArtigo_Edicao in '..\PAS\Artigo\uArtigo_Edicao.pas' {frmArtigo_Edicao},
  uFuncoes in '..\PAS\Requisitos\uFuncoes.pas',
  uFornecedor_Edicao in '..\PAS\Fornecedor\uFornecedor_Edicao.pas' {frmFornecedor_Edicao},
  uFornecedor_Edicao_Contato in '..\PAS\Fornecedor\uFornecedor_Edicao_Contato.pas' {frmFornecedor_Edicao_Contato},
  uArtigo_Edicao_Tamanho in '..\PAS\Artigo\uArtigo_Edicao_Tamanho.pas' {frmArtigo_Edicao_Tamanho},
  uFuncoesImagem in '..\PAS\Requisitos\uFuncoesImagem.pas',
  uFornecedor_Edicao_Contato_db in '..\PAS\Fornecedor\uFornecedor_Edicao_Contato_db.pas',
  uArtigo_Edicao_Tamanho_Edicao in '..\PAS\Artigo\uArtigo_Edicao_Tamanho_Edicao.pas' {frmArtigo_Edicao_Tamanho_Edicao},
  uArtigo_Criacao in '..\PAS\Artigo\uArtigo_Criacao.pas' {frmArtigo_Criacao},
  uGrupo in '..\PAS\Grupo\uGrupo.pas' {frmGrupo},
  uGrupo_Edicao in '..\PAS\Grupo\uGrupo_Edicao.pas' {frmGrupo_Edicao},
  uGrupo_db in '..\PAS\Grupo\uGrupo_db.pas';

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
