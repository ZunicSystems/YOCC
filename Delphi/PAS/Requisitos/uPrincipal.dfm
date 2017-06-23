object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmPrincipal'
  ClientHeight = 476
  ClientWidth = 1127
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 22
    Align = alTop
    BevelEdges = [beTop, beBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = 16319
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1127
      22)
    object lblCaption: TLabel
      Left = 1
      Top = 1
      Width = 1125
      Height = 20
      Align = alClient
      AutoSize = False
      Caption = '  NomeDaEmpresa 123123'
      Color = 867528
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 25
    end
    object btnMinimiza: TSpeedButton
      AlignWithMargins = True
      Left = 1076
      Top = 0
      Width = 23
      Height = 19
      Anchors = [akTop, akRight]
      Caption = #9644
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = btnMinimizaClick
    end
    object btnFinalizar: TSpeedButton
      AlignWithMargins = True
      Left = 1099
      Top = 0
      Width = 23
      Height = 19
      Anchors = [akTop, akRight]
      Caption = 'X'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFinalizarClick
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 22
    Width = 158
    Height = 429
    Align = alLeft
    BevelEdges = [beLeft, beBottom]
    BevelOuter = bvNone
    Color = 14742261
    ParentBackground = False
    TabOrder = 1
  end
  object pnlWorkArea: TPanel
    Left = 158
    Top = 22
    Width = 969
    Height = 429
    Align = alClient
    BevelEdges = [beLeft]
    BevelKind = bkFlat
    Color = 16055807
    ParentBackground = False
    TabOrder = 2
  end
  object pnlBarraStatus: TPanel
    Left = 0
    Top = 451
    Width = 1127
    Height = 25
    Align = alBottom
    Color = 14742261
    ParentBackground = False
    TabOrder = 3
  end
end
