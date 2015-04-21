object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Active Object Engine'
  ClientHeight = 231
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    359
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 121
    Top = 13
    Width = 52
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Stop after '
  end
  object Label2: TLabel
    Left = 216
    Top = 13
    Width = 39
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'seconds'
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 353
    Height = 187
    Margins.Top = 41
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object btnRun: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = btnRunClick
  end
  object edtStop: TEdit
    Left = 179
    Top = 10
    Width = 31
    Height = 21
    Anchors = [akTop, akRight]
    NumbersOnly = True
    TabOrder = 1
    Text = '10'
  end
  object btnStop: TButton
    Left = 276
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Stop'
    Enabled = False
    TabOrder = 2
    OnClick = btnStopClick
  end
end
