inherited frmArtigo_Criacao: TfrmArtigo_Criacao
  Caption = 'Artigo'
  ClientHeight = 548
  ClientWidth = 596
  OnShow = FormShow
  ExplicitTop = 7
  ExplicitWidth = 602
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 596
    Height = 548
    ExplicitWidth = 596
    ExplicitHeight = 596
    object Panel1: TPanel
      Left = 10
      Top = 13
      Width = 575
      Height = 483
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Label1: TLabel
        Left = 299
        Top = 144
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
      object Label2: TLabel
        Left = 56
        Top = 144
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
      object Label3: TLabel
        Left = 25
        Top = 118
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
      object Bevel1: TBevel
        Left = 17
        Top = 195
        Width = 542
        Height = 278
      end
      object Label4: TLabel
        Left = 33
        Top = 206
        Width = 102
        Height = 15
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Cores Dispon'#237'veis'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vUnidade: TLabeledEdit
        Left = 98
        Top = 60
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
        TabOrder = 1
      end
      object vNCM: TLabeledEdit
        Left = 209
        Top = 60
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
        TabOrder = 2
      end
      object vCST: TLabeledEdit
        Left = 346
        Top = 60
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
        TabOrder = 3
      end
      object vNome: TLabeledEdit
        Left = 98
        Top = 87
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
        TabOrder = 4
      end
      object mPrecoCusto: TLabeledEdit
        Left = 98
        Top = 168
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
        Left = 299
        Top = 168
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
        Top = 168
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
      object DBGrid1: TDBGrid
        Left = 33
        Top = 227
        Width = 509
        Height = 230
        DataSource = dsCoresDisponiveis
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Aux1'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeCor1'
            Title.Caption = 'Cor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Aux2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeCor2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Aux3'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeCor3'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Aux4'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeCor4'
            Width = 64
            Visible = True
          end>
      end
      object FK_IDFornecedor: TDBLookupComboBox
        Left = 98
        Top = 114
        Width = 461
        Height = 21
        KeyField = 'ID'
        ListField = 'vRazaoSocial'
        ListSource = DM.DS_Fornecedor
        TabOrder = 5
      end
      object FK_IDRGrupo: TDBLookupComboBox
        Left = 98
        Top = 141
        Width = 174
        Height = 21
        KeyField = 'ID'
        ListField = 'vNome'
        ListSource = DM.DS_Grupo
        TabOrder = 6
      end
      object FK_IDRColecao: TDBLookupComboBox
        Left = 354
        Top = 141
        Width = 205
        Height = 21
        KeyField = 'ID'
        ListField = 'vNome'
        ListSource = DM.DS_Colecao
        TabOrder = 7
      end
      object vReferencia: TLabeledEdit
        Left = 98
        Top = 22
        Width = 63
        Height = 21
        EditLabel.Width = 68
        EditLabel.Height = 15
        EditLabel.Caption = 'Refer'#234'ncia :'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Arial'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        TabOrder = 0
      end
    end
    object btnCriar: TBitBtn
      Left = 182
      Top = 502
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Criar'
      TabOrder = 0
      OnClick = btnCriarClick
      ExplicitTop = 492
    end
    object btnCancelar: TBitBtn
      Left = 315
      Top = 502
      Width = 99
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      ExplicitTop = 492
    end
  end
  object cdsCoresDisponiveis: TClientDataSet
    PersistDataPacket.Data = {
      060100009619E0BD01000000180000000C000000000003000000060109625365
      6C6563616F310200030000000000034944310400010000000000084E6F6D6543
      6F72310100490000000100055749445448020002006400096253656C6563616F
      320200030000000000034944320400010000000000084E6F6D65436F72320100
      490000000100055749445448020002006400096253656C6563616F3302000300
      00000000034944330400010000000000084E6F6D65436F723301004900000001
      00055749445448020002006400096253656C6563616F34020003000000000003
      4944340400010000000000084E6F6D65436F7234010049000000010005574944
      54480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 269
    object cdsCoresDisponiveisbSelecao1: TBooleanField
      FieldName = 'bSelecao1'
    end
    object cdsCoresDisponiveisID1: TIntegerField
      FieldName = 'ID1'
    end
    object cdsCoresDisponiveisNomeCor1: TStringField
      FieldName = 'NomeCor1'
      Size = 100
    end
    object cdsCoresDisponiveisbSelecao2: TBooleanField
      FieldName = 'bSelecao2'
    end
    object cdsCoresDisponiveisID2: TIntegerField
      FieldName = 'ID2'
    end
    object cdsCoresDisponiveisNomeCor2: TStringField
      FieldName = 'NomeCor2'
      Size = 100
    end
    object cdsCoresDisponiveisbSelecao3: TBooleanField
      FieldName = 'bSelecao3'
    end
    object cdsCoresDisponiveisID3: TIntegerField
      FieldName = 'ID3'
    end
    object cdsCoresDisponiveisNomeCor3: TStringField
      FieldName = 'NomeCor3'
      Size = 100
    end
    object cdsCoresDisponiveisbSelecao4: TBooleanField
      FieldName = 'bSelecao4'
    end
    object cdsCoresDisponiveisID4: TIntegerField
      FieldName = 'ID4'
    end
    object cdsCoresDisponiveisNomeCor4: TStringField
      FieldName = 'NomeCor4'
      Size = 100
    end
  end
  object dsCoresDisponiveis: TDataSource
    DataSet = cdsCoresDisponiveis
    Left = 162
    Top = 317
  end
end
