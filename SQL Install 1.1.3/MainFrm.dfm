object MainForm: TMainForm
  Left = 588
  Top = 224
  BorderIcons = [biSystemMenu]
  Caption = 'NCompPOS SQL Install / Link'
  ClientHeight = 142
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 6
    Width = 116
    Height = 13
    Caption = 'My SQL root User name:'
  end
  object Label2: TLabel
    Left = 0
    Top = 38
    Width = 111
    Height = 13
    Caption = 'My SQL root Password:'
  end
  object Label3: TLabel
    Left = 0
    Top = 70
    Width = 71
    Height = 13
    Caption = 'Schema name:'
  end
  object Label4: TLabel
    Left = 0
    Top = 94
    Width = 12
    Height = 13
    Caption = 'Ip:'
  end
  object Label5: TLabel
    Left = 180
    Top = 96
    Width = 22
    Height = 13
    Caption = 'Port:'
  end
  object login: TEdit
    Left = 128
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'root'
  end
  object Password: TEdit
    Left = 128
    Top = 32
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Schema: TEdit
    Left = 128
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'ncomp'
  end
  object Ip: TEdit
    Left = 53
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'localhost'
  end
  object JvBitBtn2: TJvBitBtn
    Left = 80
    Top = 115
    Width = 169
    Height = 25
    Hint = 'Press here to setup a link to the MySQL Database'
    Caption = 'Install, Update or Link Database'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object PortEdit: TEdit
    Left = 208
    Top = 91
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '3306'
  end
  object CheckBox1: TCheckBox
    Left = 0
    Top = 118
    Width = 74
    Height = 17
    Hint = 'Check this if you are installing a Client NCompPOS'
    Caption = 'Client Install'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object ADConnection: TADConnection
    Params.Strings = (
      'Database=riskfin'
      'User_Name=root'
      'Password=djb115'
      'Host=localhost'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    LoginPrompt = False
    Left = 16
    Top = 71
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    ScreenCursor = gcrDefault
    Left = 48
    Top = 79
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 96
    Top = 79
  end
  object Query: TADQuery
    Connection = ADConnection
    Left = 56
    Top = 48
  end
  object Query2: TADQuery
    Connection = ADConnection
    Left = 24
    Top = 48
  end
end
