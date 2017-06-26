inherited frmArtigo: TfrmArtigo
  Caption = 'frmArtigo'
  ClientHeight = 515
  ClientWidth = 1093
  OnClose = FormClose
  ExplicitLeft = -74
  ExplicitWidth = 1093
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Width = 1093
    ExplicitWidth = 1093
    inherited Label1: TLabel
      Width = 1091
      Caption = 'Cadastro de Artigos'
      ExplicitWidth = 163
    end
  end
  inherited pnlWorkArea: TPanel
    Width = 1093
    Height = 495
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vReferencia'
          Title.Caption = 'Refer'#234'ncia'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vNome'
          Title.Caption = 'Nome'
          Width = 309
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeFornecedor'
          Title.Caption = 'Fornecedor'
          Width = 283
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeColecao'
          Title.Caption = 'Cole'#231#227'o'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeGrupo'
          Title.Caption = 'Grupo'
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dCriacao'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Cria'#231#227'o'
          Width = 79
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
      Top = 442
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnDeletar: TBitBtn
      Left = 216
      Top = 442
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Deletar'
      TabOrder = 3
    end
    object pnlPesquisa: TPanel
      Left = 6
      Top = 3
      Width = 1082
      Height = 74
      Anchors = [akTop]
      BevelOuter = bvLowered
      TabOrder = 4
      object lblNome: TLabel
        Left = 222
        Top = 15
        Width = 39
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Nome :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 577
        Top = 15
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
      object lblFor: TLabel
        Left = 30
        Top = 43
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
      object lblReferencia: TLabel
        Left = 33
        Top = 15
        Width = 68
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Refer'#234'ncia :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 589
        Top = 43
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
      object BitBtn1: TBitBtn
        Left = 951
        Top = 10
        Width = 92
        Height = 25
        Caption = 'Limpar'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 951
        Top = 40
        Width = 92
        Height = 25
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object edNome: TEdit
        Left = 267
        Top = 12
        Width = 301
        Height = 21
        TabOrder = 2
      end
      object edReferencia: TEdit
        Left = 107
        Top = 12
        Width = 71
        Height = 21
        TabOrder = 3
      end
      object iColecao: TDBLookupComboBox
        Left = 635
        Top = 12
        Width = 234
        Height = 21
        KeyField = 'ID'
        ListField = 'vNome'
        ListSource = DM.DS_Colecao
        TabOrder = 4
      end
      object iGrupo: TDBLookupComboBox
        Left = 635
        Top = 40
        Width = 234
        Height = 21
        KeyField = 'ID'
        ListField = 'vNome'
        ListSource = DM.DS_Grupo
        TabOrder = 5
      end
      object iFornecedor: TDBLookupComboBox
        Left = 107
        Top = 40
        Width = 461
        Height = 21
        KeyField = 'ID'
        ListField = 'vRazaoSocial'
        ListSource = DM.DS_Fornecedor
        TabOrder = 6
      end
    end
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 124
  end
end
