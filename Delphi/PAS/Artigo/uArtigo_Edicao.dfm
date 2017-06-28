inherited frmArtigo_Edicao: TfrmArtigo_Edicao
  Caption = ''
  ClientHeight = 352
  ClientWidth = 607
  OnShow = FormShow
  ExplicitWidth = 613
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 607
    Height = 352
    ExplicitWidth = 607
    ExplicitHeight = 352
    object btnSair: TBitBtn
      Left = 522
      Top = 316
      Width = 75
      Height = 30
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnAlterar: TBitBtn
      Left = 10
      Top = 316
      Width = 75
      Height = 30
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 172
      Top = 316
      Width = 75
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSalvar: TBitBtn
      Left = 91
      Top = 316
      Width = 75
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object PageControl1: TPageControl
      Left = 10
      Top = 7
      Width = 593
      Height = 303
      ActivePage = tabTecnica
      MultiLine = True
      TabOrder = 4
      TabStop = False
      object tabTecnica: TTabSheet
        Caption = 'Ficha T'#233'cnica'
        object Bevel1: TBevel
          Left = 3
          Top = 2
          Width = 574
          Height = 240
          Style = bsRaised
        end
        object Label4: TLabel
          Left = 24
          Top = 146
          Width = 71
          Height = 15
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Fornecedor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 180
          Top = 45
          Width = 26
          Height = 15
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Cor :'
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 299
          Top = 180
          Width = 52
          Height = 15
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Cole'#231#227'o :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 55
          Top = 180
          Width = 40
          Height = 15
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Grupo :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 191
          Top = 11
          Width = 96
          Height = 15
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Data de Cria'#231#227'o :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object FK_IDFornecedor: TDBLookupComboBox
          Left = 98
          Top = 144
          Width = 461
          Height = 21
          KeyField = 'ID'
          ListField = 'vRazaoSocial'
          ListSource = DM.DS_Fornecedor
          TabOrder = 0
        end
        object FK_IDRCor: TDBLookupComboBox
          Left = 209
          Top = 43
          Width = 174
          Height = 21
          Color = clBtnFace
          Enabled = False
          KeyField = 'ID'
          ListField = 'vNome'
          ListSource = DM.DS_Cor
          ReadOnly = True
          TabOrder = 1
          TabStop = False
        end
        object FK_IDRColecao: TDBLookupComboBox
          Left = 354
          Top = 178
          Width = 205
          Height = 21
          KeyField = 'ID'
          ListField = 'vNome'
          ListSource = DM.DS_Colecao
          TabOrder = 2
        end
        object FK_IDRGrupo: TDBLookupComboBox
          Left = 98
          Top = 178
          Width = 174
          Height = 21
          KeyField = 'ID'
          ListField = 'vNome'
          ListSource = DM.DS_Grupo
          TabOrder = 3
        end
        object DateTimePicker1: TDateTimePicker
          Left = 290
          Top = 9
          Width = 93
          Height = 21
          Date = 42884.000000000000000000
          Time = 42884.000000000000000000
          Color = clBtnFace
          Enabled = False
          TabOrder = 4
        end
        object ID: TLabeledEdit
          Left = 98
          Top = 9
          Width = 38
          Height = 21
          Color = clBtnFace
          EditLabel.Width = 17
          EditLabel.Height = 15
          EditLabel.Caption = 'ID :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 5
        end
        object vReferencia: TLabeledEdit
          Left = 98
          Top = 43
          Width = 54
          Height = 21
          CharCase = ecUpperCase
          Color = clBtnFace
          EditLabel.Width = 68
          EditLabel.Height = 15
          EditLabel.Caption = 'Referencia :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 6
        end
        object vNome: TLabeledEdit
          Left = 98
          Top = 110
          Width = 461
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 7
        end
        object mPrecoCusto: TLabeledEdit
          Left = 98
          Top = 212
          Width = 63
          Height = 21
          Alignment = taRightJustify
          EditLabel.Width = 76
          EditLabel.Height = 15
          EditLabel.Caption = 'Pre'#231'o Custo :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 8
        end
        object mMarkup: TLabeledEdit
          Left = 283
          Top = 212
          Width = 49
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          EditLabel.Width = 49
          EditLabel.Height = 15
          EditLabel.Caption = 'Markup :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 9
        end
        object LabeledEdit1: TLabeledEdit
          Left = 499
          Top = 212
          Width = 60
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          EditLabel.Width = 94
          EditLabel.Height = 15
          EditLabel.Caption = 'Pre'#231'o Sugerido :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 10
        end
        object vUnidade: TLabeledEdit
          Left = 98
          Top = 76
          Width = 38
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 15
          EditLabel.Caption = 'Un. de Medida :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 11
        end
        object vCST: TLabeledEdit
          Left = 354
          Top = 76
          Width = 29
          Height = 21
          EditLabel.Width = 29
          EditLabel.Height = 15
          EditLabel.Caption = 'CST :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 12
        end
        object vNCM: TLabeledEdit
          Left = 209
          Top = 76
          Width = 70
          Height = 21
          EditLabel.Width = 32
          EditLabel.Height = 15
          EditLabel.Caption = 'NCM :'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -12
          EditLabel.Font.Name = 'Arial'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 13
        end
        object btnTamanhos: TBitBtn
          Left = 243
          Top = 244
          Width = 89
          Height = 28
          Caption = 'SKU'#39's'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnClick = btnTamanhosClick
        end
        object pnlImage: TPanel
          Left = 415
          Top = 2
          Width = 133
          Height = 102
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 15
          object Image1: TImage
            Left = 1
            Top = 1
            Width = 127
            Height = 97
            Center = True
            Stretch = True
            OnClick = Image1Click
            OnMouseEnter = Image1MouseEnter
            OnMouseLeave = Image1MouseLeave
          end
        end
      end
      object tabAtacado: TTabSheet
        Caption = 'Atacado - Filiais'
        ImageIndex = 1
        object Label1: TLabel
          Left = 255
          Top = 19
          Width = 75
          Height = 18
          AutoSize = False
          Caption = 'Atacado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 5
          Top = 55
          Width = 573
          Height = 178
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object tabVarejo: TTabSheet
        Caption = 'Varejo - Filiais'
        ImageIndex = 2
        object Label2: TLabel
          Left = 255
          Top = 19
          Width = 75
          Height = 18
          AutoSize = False
          Caption = 'Varejo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid2: TDBGrid
          Left = 5
          Top = 55
          Width = 573
          Height = 178
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 572
    Top = 6
    object CarregarImagem1: TMenuItem
      Caption = 'Carregar Imagem'
      OnClick = CarregarImagem1Click
    end
    object BaixarImagem1: TMenuItem
      Caption = 'Baixar Imagem'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Rotacionar90D1: TMenuItem
      Caption = 'Rotacionar 90'#186' D'
      OnClick = Rotacionar90D1Click
    end
    object Rotacionar90E1: TMenuItem
      Caption = 'Rotacionar 90'#186' E'
      OnClick = Rotacionar90E1Click
    end
  end
end
