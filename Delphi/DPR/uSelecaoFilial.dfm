inherited frmSelecaoFilial: TfrmSelecaoFilial
  Caption = 'Filial'
  ClientHeight = 102
  ClientWidth = 435
  FormStyle = fsStayOnTop
  OnPaint = FormPaint
  ExplicitWidth = 441
  ExplicitHeight = 131
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 435
    Height = 102
    object Bevel1: TBevel
      Left = 16
      Top = 6
      Width = 393
      Height = 50
    end
    object Label1: TLabel
      Left = 30
      Top = 27
      Width = 31
      Height = 15
      Align = alCustom
      Alignment = taRightJustify
      Caption = 'Filial :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object iFilial: TDBLookupComboBox
      Left = 67
      Top = 23
      Width = 328
      Height = 21
      KeyField = 'ID'
      ListField = 'vNomeFantasia'
      ListSource = DM.DS_Filial
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 168
      Top = 62
      Width = 90
      Height = 26
      Caption = '&OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
end
