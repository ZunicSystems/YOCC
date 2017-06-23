inherited frmFornecedor_Edicao_Contato: TfrmFornecedor_Edicao_Contato
  Caption = 'Contato'
  ClientHeight = 238
  ClientWidth = 440
  Position = poScreenCenter
  ExplicitWidth = 446
  ExplicitHeight = 267
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 440
    Height = 238
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 440
    ExplicitHeight = 241
    object Label1: TLabel
      Left = 58
      Top = 102
      Width = 54
      Height = 15
      Caption = 'Telefone :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 66
      Top = 132
      Width = 46
      Height = 15
      Caption = 'Celular :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 13
      Width = 104
      Height = 15
      Alignment = taRightJustify
      Caption = 'Data de Cadastro :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 3
      Top = 5
      Width = 430
      Height = 188
    end
    object vContato: TLabeledEdit
      Left = 115
      Top = 38
      Width = 214
      Height = 24
      EditLabel.Width = 50
      EditLabel.Height = 15
      EditLabel.Caption = 'Contato :'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
    end
    object vDepartamento: TLabeledEdit
      Left = 115
      Top = 68
      Width = 214
      Height = 24
      EditLabel.Width = 87
      EditLabel.Height = 15
      EditLabel.Caption = 'Departamento :'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 1
    end
    object vTelefone: TMaskEdit
      Left = 115
      Top = 98
      Width = 86
      Height = 21
      EditMask = '!\(99\)0000-0000;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '(  )    -    '
    end
    object vCelular: TMaskEdit
      Left = 115
      Top = 128
      Width = 86
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
    object vEmail: TLabeledEdit
      Left = 115
      Top = 158
      Width = 310
      Height = 24
      EditLabel.Width = 41
      EditLabel.Height = 15
      EditLabel.Caption = 'E-mail :'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 4
    end
    object bAtivo: TCheckBox
      Left = 246
      Top = 13
      Width = 43
      Height = 17
      Caption = 'Ativo'
      TabOrder = 5
    end
    object dData: TDateTimePicker
      Left = 115
      Top = 9
      Width = 99
      Height = 23
      CalColors.BackColor = clBtnFace
      CalColors.TitleTextColor = clBtnFace
      CalColors.MonthBackColor = clBtnFace
      Date = 42881.000000000000000000
      Time = 42881.000000000000000000
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object btnAlterar: TBitBtn
      Left = 3
      Top = 199
      Width = 81
      Height = 34
      Caption = 'Alterar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object btnSalvar: TBitBtn
      Left = 90
      Top = 199
      Width = 81
      Height = 34
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object btnCancelar: TBitBtn
      Left = 177
      Top = 199
      Width = 81
      Height = 34
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object btnSair: TBitBtn
      Left = 347
      Top = 199
      Width = 86
      Height = 34
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
  end
end
