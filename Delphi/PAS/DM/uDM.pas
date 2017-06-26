unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, WinInet, System.Types,
  Vcl.Dialogs, Forms;

type
  TDM = class(TDataModule)
    Conexao: TADOConnection;
    qryCor: TADOQuery;
    qryGrupo: TADOQuery;
    qryColecao: TADOQuery;
    DS_Cor: TDataSource;
    DS_Grupo: TDataSource;
    DS_Colecao: TDataSource;
    qryFornecedor: TADOQuery;
    DS_Fornecedor: TDataSource;
    procedure ConexaoWillExecute(Connection: TADOConnection;
      var CommandText: WideString; var CursorType: TCursorType;
      var LockType: TADOLockType; var CommandType: TCommandType;
      var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
      const Command: _Command; const Recordset: _Recordset);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure doOpenQuery();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uTentandoReconectar;

{$R *.dfm}

procedure TDM.ConexaoWillExecute(Connection: TADOConnection;
  var CommandText: WideString; var CursorType: TCursorType;
  var LockType: TADOLockType; var CommandType: TCommandType;
  var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
  const Command: _Command; const Recordset: _Recordset);
var i : dword;
begin
   try
      if InternetGetConnectedState(@i, 0) then
         Exit
      else
      begin
         frmTentandoReconectar.ShowModal;
      end;
   Except
      ShowMessage('OOOPS. Ocorreu um erro, a aplicação será finalizada.');
      Application.Terminate;
   end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   frmTentandoReconectar := tfrmTentandoReconectar.Create(Self);
   // Conexão com o banco de dados
   Conexao.Close;
   Conexao.ConnectionString := 'FILE NAME=' + ExtractFilePath(Application.ExeName) + 'Base.udl';
   Conexao.Open;

   //Abre as querys
   doOpenQuery();
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(frmTentandoReconectar);
end;

procedure TDM.doOpenQuery;
begin
   qryCor.Open;
   qryGrupo.Open;
   qryColecao.Open;
   qryFornecedor.Open;
end;

end.
