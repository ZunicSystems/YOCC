unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, WinInet, System.Types,
  Vcl.Dialogs, Forms;

type
  TDM = class(TDataModule)
    Conexao: TADOConnection;
    qryCor: TADOQuery;
    procedure ConexaoWillExecute(Connection: TADOConnection;
      var CommandText: WideString; var CursorType: TCursorType;
      var LockType: TADOLockType; var CommandType: TCommandType;
      var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
      const Command: _Command; const Recordset: _Recordset);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
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
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(frmTentandoReconectar);
end;

end.
