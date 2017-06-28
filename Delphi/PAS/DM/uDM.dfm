object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 441
  Width = 805
  object Conexao: TADOConnection
    LoginPrompt = False
    Provider = 'C:\Users\alexd\Documents\Zunic\YOCC\Delphi\EXE\DEBUG\Base.udl'
    OnWillExecute = ConexaoWillExecute
    Left = 56
    Top = 24
  end
  object qryCor: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, vNome, dCriacao, bDeletado  FROM dbo.RCor')
    Left = 368
    Top = 24
  end
  object qryGrupo: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, vNome, dCriacao, bDeletado FROM dbo.RGrupo')
    Left = 424
    Top = 24
  end
  object qryColecao: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, vNome, dCriacao, bDeletado FROM dbo.RColecao')
    Left = 480
    Top = 24
  end
  object DS_Cor: TDataSource
    DataSet = qryCor
    Left = 368
    Top = 80
  end
  object DS_Grupo: TDataSource
    DataSet = qryGrupo
    Left = 424
    Top = 80
  end
  object DS_Colecao: TDataSource
    DataSet = qryColecao
    Left = 480
    Top = 81
  end
  object qryFornecedor: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, vRazaoSocial, vNomeFantasia '
      'FROM dbo.Fornecedor'
      'WHERE ISNULL(bDeletado,0) = 0')
    Left = 560
    Top = 24
  end
  object DS_Fornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 560
    Top = 80
  end
  object qryFilial: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 640
    Top = 24
  end
  object DS_Filial: TDataSource
    DataSet = qryFilial
    Left = 640
    Top = 80
  end
end
