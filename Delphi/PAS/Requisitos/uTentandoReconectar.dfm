object frmTentandoReconectar: TfrmTentandoReconectar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmTentandoReconectar'
  ClientHeight = 179
  ClientWidth = 635
  Color = 14742261
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 81
    Top = 8
    Width = 473
    Height = 133
    Align = alCustom
    AutoSize = False
    Caption = 'Tentando reestabelecer conex'#227'o ...'
    Color = 867528
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object pnlSair: TPanel
    Left = 224
    Top = 129
    Width = 185
    Height = 41
    TabOrder = 0
    object btnExit: TSpeedButton
      Left = 1
      Top = 1
      Width = 183
      Height = 39
      Align = alClient
      Caption = 'Finalizar (09)'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExitClick
      ExplicitLeft = 24
      ExplicitTop = -1
      ExplicitWidth = 161
      ExplicitHeight = 42
    end
  end
  object TimerBotao: TTimer
    OnTimer = TimerBotaoTimer
    Left = 488
    Top = 128
  end
  object TimerTexto: TTimer
    Interval = 500
    OnTimer = TimerTextoTimer
    Left = 568
    Top = 128
  end
end
