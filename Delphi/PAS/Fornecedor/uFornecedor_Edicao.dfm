inherited frmFornecedor_Edicao: TfrmFornecedor_Edicao
  Caption = ''
  ClientHeight = 458
  ClientWidth = 896
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 902
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 896
    Height = 458
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 896
    ExplicitHeight = 458
    object btnAlterar: TBitBtn
      Left = 9
      Top = 414
      Width = 81
      Height = 34
      Caption = 'Alterar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnSalvar: TBitBtn
      Left = 96
      Top = 414
      Width = 81
      Height = 34
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 183
      Top = 414
      Width = 81
      Height = 34
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSair: TBitBtn
      Left = 799
      Top = 414
      Width = 86
      Height = 34
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
    end
    object PageControl1: TPageControl
      Left = 9
      Top = 8
      Width = 876
      Height = 398
      ActivePage = tabContatos
      TabOrder = 4
      OnChange = PageControl1Change
      object tabDadosCadastraiss: TTabSheet
        Caption = 'Dados Cadastrais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        object gbDadosPessoais: TGroupBox
          Left = 16
          Top = 12
          Width = 833
          Height = 167
          Caption = 'Dados Pessoais'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 593
            Top = 34
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
          object ID: TLabeledEdit
            Left = 102
            Top = 30
            Width = 49
            Height = 24
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
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            LabelPosition = lpLeft
            ParentFont = False
            TabOrder = 0
          end
          object vRazaoSocial: TLabeledEdit
            Left = 102
            Top = 62
            Width = 697
            Height = 24
            EditLabel.Width = 79
            EditLabel.Height = 15
            EditLabel.Caption = 'Raz'#227'o Social :'
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
          object vNomeFantasia: TLabeledEdit
            Left = 102
            Top = 94
            Width = 697
            Height = 24
            EditLabel.Width = 90
            EditLabel.Height = 15
            EditLabel.Caption = 'Nome Fantasia :'
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
            TabOrder = 2
          end
          object vInscricaoEstadual: TLabeledEdit
            Left = 615
            Top = 126
            Width = 184
            Height = 24
            EditLabel.Width = 111
            EditLabel.Height = 15
            EditLabel.Caption = 'Inscri'#231#227'o Estadual :'
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
            TabOrder = 3
          end
          object vCNPJ: TLabeledEdit
            Left = 102
            Top = 126
            Width = 209
            Height = 24
            EditLabel.Width = 68
            EditLabel.Height = 15
            EditLabel.Caption = 'CPF / CNPJ :'
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
          object dData: TDateTimePicker
            Left = 700
            Top = 29
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
            TabOrder = 5
          end
        end
        object Endereco: TGroupBox
          Left = 16
          Top = 191
          Width = 833
          Height = 131
          Caption = 'Endere'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 175
            Top = 28
            Width = 26
            Height = 24
          end
          object vCEP: TLabeledEdit
            Left = 102
            Top = 28
            Width = 67
            Height = 24
            EditLabel.Width = 29
            EditLabel.Height = 15
            EditLabel.Caption = 'CEP :'
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
          object vEndereco: TLabeledEdit
            Left = 102
            Top = 58
            Width = 697
            Height = 24
            EditLabel.Width = 60
            EditLabel.Height = 15
            EditLabel.Caption = 'Endere'#231'o :'
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
          object vBairro: TLabeledEdit
            Left = 102
            Top = 88
            Width = 187
            Height = 24
            EditLabel.Width = 41
            EditLabel.Height = 15
            EditLabel.Caption = 'Bairro :'
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
            TabOrder = 2
          end
          object vCidade: TLabeledEdit
            Left = 423
            Top = 88
            Width = 234
            Height = 24
            EditLabel.Width = 45
            EditLabel.Height = 15
            EditLabel.Caption = 'Cidade :'
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
            TabOrder = 3
          end
          object vUF: TLabeledEdit
            Left = 773
            Top = 88
            Width = 26
            Height = 24
            EditLabel.Width = 20
            EditLabel.Height = 15
            EditLabel.Caption = 'UF :'
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
        end
      end
      object tabContatos: TTabSheet
        Caption = 'Contatos'
        ImageIndex = 1
        object btnNovoContato: TSpeedButton
          Left = 11
          Top = 321
          Width = 45
          Height = 45
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000C40E0000C40E00000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFF087272727208FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7A7A7A
            7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67A7A7A7A7A7AF6FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF67A7A7A7A7A7AF6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF67A7A7A7A7A7AF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67A7A7A7A7A
            7AF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67A7A7A7A7A7AF6FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF67A7A7A7A7A7AF6FFFFFFFFFFFFFFFFFFFFF6F6F6F6
            F6F6F67A7A7A7A7A7AF6F6F6F6F6F6F6FFFF0872727272727272727A7A7A7A7A
            7A7272727272727272087B7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
            7A7B7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
            7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7B7A7A7A7A7A7A7A7A7A7A7A7A7A
            7A7A7A7A7A7A7A7A7A7B087B7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
            7B08FFFFF6F6F6F6F6F6F67B7A7A7B7A7BF6F6F6F6F6F6F6FFFFFFFFFFFFFFFF
            FFFFF67B7B7B7B7B7BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67B7B7B7B7B
            7BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67B7B7B7B7B7BF6FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF67B7B7B7B7B7BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF67B7B7B7B7B7BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67B7B7B7B7B
            7BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B7B7B7BFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF087B7B7B7B08FFFFFFFFFFFFFFFFFF}
        end
        object btnEditaContato: TSpeedButton
          Left = 62
          Top = 321
          Width = 45
          Height = 45
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000C40E0000C40E00000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60092FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404092FFFF929292929BED
            FFFFFFFFFFFFFFF79B9292929240404092FF4040404040404008FFFFFFED4040
            40404040404040404092404040404040404008FFED4040404040404040404040
            4092929292924040404040FF40404040409292929240404092FFFFFFFFFFFFA4
            4040409B074040EDFFFFFFFFFF404092FFFFFFFFFFFFFFFF92404040FF409BFF
            FFFFFFFFF60092FFFFFFFFFFFFFFFFFFFF4040409BEDFFFFFFFFFFFFFF92FFFF
            FFFFFFFFFFFFFFFFFF92404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF6404040A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60849404040FFFF
            FFFFFFFFFF92FFFFFFFFFFFFFFFFFFFF4952084040409BFFFFFFFFFFF60092FF
            FFFFFFFFFFFFFFA44040FF49404040EDFFFFFFFFFF404092FFFF929292924040
            404049FF40404040499292929240404092FF404040404040404007FFED404040
            404040404040404040924040404040404008FFFFFFED40404040404040404040
            4092929292929BEDFFFFFFFFFFFFFFF7929292929240404092FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF404092FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFF60092FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object dgContatos: TDBGrid
          Left = 11
          Top = 12
          Width = 842
          Height = 303
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Contato'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Departamento'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Telefone'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Celular'
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Email'
              Width = 270
              Visible = True
            end>
        end
      end
      object tabAtuacao: TTabSheet
        Caption = #193'reas de Atua'#231#227'o'
        ImageIndex = 2
      end
    end
    object btnAnterior: TBitBtn
      Left = 670
      Top = 367
      Width = 93
      Height = 29
      Caption = 'Anterior'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF4A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4A0000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A00000000004AFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A000000
        0000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004A
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A00000000
        00004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A
        00000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000004AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4AFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 5
      OnClick = btnAnteriorClick
    end
    object btnProximo: TBitBtn
      Left = 767
      Top = 367
      Width = 94
      Height = 29
      Caption = 'Pr'#243'ximo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        4A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000004AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4A00000000004AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A
        0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004A
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A000000
        0000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4A000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4A000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000
        000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A000000000000
        4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF4A0000000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A00
        00000000004AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A00000000004AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A0000004AFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF4A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
      ParentFont = False
      TabOrder = 6
      OnClick = btnProximoClick
    end
  end
end
