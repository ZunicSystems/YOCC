object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 441
  Width = 805
  object Conexao: TADOConnection
    ConnectionString = 'FILE NAME=\\paulo\prjTCC\Delphi\EXEC\Base.udl'
    LoginPrompt = False
    Provider = '\\paulo\prjTCC\Delphi\EXEC\Base.udl'
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
