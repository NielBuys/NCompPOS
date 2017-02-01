object TCSettingsForm: TTCSettingsForm
  Left = 313
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Turbocash Settings'
  ClientHeight = 176
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 16
    Top = 7
    Width = 673
    Height = 130
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'TurboCash Settings'
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 216
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Path to TurboCash "Set of Books" Data Files:'
    end
    object Label9: TLabel
      Left = 523
      Top = 18
      Width = 70
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Output Tax ID:'
    end
    object Label10: TLabel
      Left = 8
      Top = 70
      Width = 64
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Bank Acc ID:'
    end
    object Label11: TLabel
      Left = 160
      Top = 102
      Width = 78
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'TC Date Format:'
    end
    object JvSpeedButton1: TJvSpeedButton
      Left = 648
      Top = 12
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton1Click
    end
    object Label17: TLabel
      Left = 531
      Top = 38
      Width = 62
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Input Tax ID:'
    end
    object JvSpeedButton2: TJvSpeedButton
      Left = 648
      Top = 32
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton2Click
    end
    object Label18: TLabel
      Left = 528
      Top = 57
      Width = 65
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Sales Acc ID:'
    end
    object JvSpeedButton3: TJvSpeedButton
      Left = 648
      Top = 52
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton3Click
    end
    object Label19: TLabel
      Left = 513
      Top = 77
      Width = 79
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Cost of Sales ID:'
    end
    object JvSpeedButton4: TJvSpeedButton
      Left = 648
      Top = 72
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton4Click
    end
    object Label20: TLabel
      Left = 512
      Top = 97
      Width = 81
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Stock Control ID:'
    end
    object JvSpeedButton5: TJvSpeedButton
      Left = 648
      Top = 92
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton5Click
    end
    object Label24: TLabel
      Left = 176
      Top = 50
      Width = 102
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Lay Buy Cred Acc ID:'
    end
    object Label25: TLabel
      Left = 176
      Top = 70
      Width = 100
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Lay Buy Deb Acc ID:'
    end
    object JvSpeedButton7: TJvSpeedButton
      Left = 152
      Top = 64
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton7Click
    end
    object JvSpeedButton8: TJvSpeedButton
      Left = 328
      Top = 44
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton8Click
    end
    object JvSpeedButton9: TJvSpeedButton
      Left = 328
      Top = 64
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton9Click
    end
    object Label26: TLabel
      Left = 350
      Top = 50
      Width = 72
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Batch Type ID:'
    end
    object JvSpeedButton10: TJvSpeedButton
      Left = 472
      Top = 44
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton10Click
    end
    object Label27: TLabel
      Left = 352
      Top = 70
      Width = 69
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Deb Cntrl Acc:'
    end
    object JvSpeedButton11: TJvSpeedButton
      Left = 472
      Top = 64
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton11Click
    end
    object Label29: TLabel
      Left = 352
      Top = 90
      Width = 65
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Crd Cntrl Acc:'
    end
    object JvSpeedButton12: TJvSpeedButton
      Left = 472
      Top = 84
      Width = 17
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '...'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton12Click
    end
    object Edit2: TEdit
      Left = 600
      Top = 12
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 9
      Text = 'Edit2'
      OnChange = Edit2Change
    end
    object Edit3: TEdit
      Left = 104
      Top = 64
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 1
      Text = 'Edit3'
      OnChange = Edit3Change
    end
    object Edit4: TEdit
      Left = 248
      Top = 96
      Width = 97
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 5
      Text = 'Edit4'
      OnChange = Edit4Change
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 105
      Width = 137
      Height = 17
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'TC Stock Management'
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object JvDirectoryEdit1: TJvDirectoryEdit
      Left = 232
      Top = 16
      Width = 265
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DialogKind = dkWin32
      DialogOptions = []
      ButtonWidth = 26
      TabOrder = 0
      Text = 'JvDirectoryEdit1'
      OnChange = JvDirectoryEdit1Change
    end
    object Edit7: TEdit
      Left = 600
      Top = 32
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 10
      Text = 'Edit7'
      OnChange = Edit7Change
    end
    object Edit8: TEdit
      Left = 600
      Top = 52
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 11
      Text = 'Edit8'
      OnChange = Edit8Change
    end
    object Edit9: TEdit
      Left = 600
      Top = 72
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 12
      Text = 'Edit9'
      OnChange = Edit9Change
    end
    object Edit10: TEdit
      Left = 600
      Top = 92
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 13
      Text = 'Edit10'
      OnChange = Edit10Change
    end
    object Edit14: TEdit
      Left = 280
      Top = 44
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 3
      Text = 'Edit14'
      OnChange = Edit14Change
    end
    object Edit15: TEdit
      Left = 280
      Top = 64
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 4
      Text = 'Edit15'
      OnChange = Edit15Change
    end
    object Edit16: TEdit
      Left = 424
      Top = 44
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 6
      Text = 'Edit16'
      OnChange = Edit16Change
    end
    object Edit17: TEdit
      Left = 424
      Top = 64
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 7
      Text = 'Edit17'
      OnChange = Edit17Change
    end
    object Edit19: TEdit
      Left = 424
      Top = 84
      Width = 49
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 8
      Text = 'Edit19'
      OnChange = Edit19Change
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 608
    Top = 144
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 1
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
end
