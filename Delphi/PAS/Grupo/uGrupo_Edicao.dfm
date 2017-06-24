inherited frmGrupo_Edicao: TfrmGrupo_Edicao
  Caption = 'Edi'#231#227'o / Cria'#231#227'o'
  ClientHeight = 153
  ClientWidth = 396
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 402
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkArea: TPanel
    Width = 396
    Height = 153
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 396
    ExplicitHeight = 121
    object Bevel1: TBevel
      Left = 9
      Top = 8
      Width = 377
      Height = 105
      Anchors = [akLeft, akTop, akRight]
    end
    object vNome: TLabeledEdit
      Left = 34
      Top = 75
      Width = 328
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'Grupo'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 0
    end
    object ID: TLabeledEdit
      Left = 34
      Top = 32
      Width = 47
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 11
      EditLabel.Height = 15
      EditLabel.Caption = 'ID'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 1
    end
    object btnAlterar: TBitBtn
      Left = 9
      Top = 117
      Width = 75
      Height = 30
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnSalvar: TBitBtn
      Left = 90
      Top = 117
      Width = 75
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 171
      Top = 117
      Width = 75
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
  end
end
