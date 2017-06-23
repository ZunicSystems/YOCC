inherited frmFornecedor: TfrmFornecedor
  Caption = 'frmFornecedor'
  ClientHeight = 515
  ClientWidth = 1093
  OnShow = FormShow
  ExplicitWidth = 1093
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Width = 1093
    ExplicitWidth = 1093
    inherited Label1: TLabel
      Width = 215
      Caption = 'Cadastro de Fornecedores'
      ExplicitWidth = 215
    end
  end
  inherited pnlWorkArea: TPanel
    Width = 1093
    Height = 495
    ExplicitTop = 20
    ExplicitWidth = 1093
    ExplicitHeight = 495
    object DBGrid1: TDBGrid
      Left = 6
      Top = 83
      Width = 1082
      Height = 352
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vRazaoSocial'
          Title.Caption = 'Raz'#227'o Social'
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vNomeFantasia'
          Title.Caption = 'Nome Fantasia'
          Width = 309
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vCNPJ'
          Title.Caption = 'CNPJ'
          Width = 256
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vInscricaoEstadual'
          Title.Caption = 'IE'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vCEP'
          Title.Caption = 'CEP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vEndereco'
          Title.Caption = 'Endere'#231'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vBairro'
          Title.Caption = 'Bairro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vCidade'
          Title.Caption = 'Cidade'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vUF'
          Title.Caption = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dData'
          Title.Caption = 'Data Cria'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vNome'
          Title.Caption = 'Usuario Cadastro'
          Visible = True
        end>
    end
    object btnCriar: TBitBtn
      Left = 6
      Top = 441
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Criar'
      TabOrder = 1
      OnClick = btnCriarClick
    end
    object btnAlterar: TBitBtn
      Left = 111
      Top = 441
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object pnlPesquisa: TPanel
      Left = 102
      Top = 4
      Width = 889
      Height = 74
      Anchors = [akTop]
      BevelOuter = bvLowered
      TabOrder = 3
      object Label3: TLabel
        Left = 177
        Top = 15
        Width = 90
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Nome Fantasia :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 558
        Top = 14
        Width = 45
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Cidade :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblReferencia: TLabel
        Left = 74
        Top = 15
        Width = 17
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'ID :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 9
        Top = 41
        Width = 79
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Raz'#227'o Social :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 583
        Top = 41
        Width = 20
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'UF :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 789
        Top = 9
        Width = 92
        Height = 25
        Caption = 'Limpar'
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 789
        Top = 39
        Width = 92
        Height = 25
        Caption = 'Buscar'
        TabOrder = 1
      end
      object edNomeFantasia: TEdit
        Left = 270
        Top = 12
        Width = 271
        Height = 21
        TabOrder = 2
      end
      object edRazaoSocial: TEdit
        Left = 94
        Top = 39
        Width = 447
        Height = 21
        TabOrder = 3
      end
      object edCidade: TEdit
        Left = 606
        Top = 12
        Width = 160
        Height = 21
        TabOrder = 4
      end
      object edID: TEdit
        Left = 94
        Top = 12
        Width = 71
        Height = 21
        TabOrder = 5
      end
      object edUF: TEdit
        Left = 606
        Top = 39
        Width = 25
        Height = 21
        TabOrder = 6
      end
    end
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 116
  end
end
