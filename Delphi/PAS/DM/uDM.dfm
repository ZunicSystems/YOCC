object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 441
  Width = 805
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Users\alexd\Documents\Zunic\YOCC\Delphi\EXE\DEBUG\B' +
      'ase.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    OnWillExecute = ConexaoWillExecute
    Left = 56
    Top = 24
  end
  object qryCor: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 64
    Top = 112
  end
end
