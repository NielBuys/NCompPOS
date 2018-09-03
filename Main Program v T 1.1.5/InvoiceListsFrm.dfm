object InvoiceListsForm: TInvoiceListsForm
  Left = 343
  Top = 464
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Invoice Lists'
  ClientHeight = 215
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 281
    Height = 145
    Caption = 'Daily Print Info'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 58
      Height = 13
      Caption = 'Select User:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 115
      Height = 13
      Caption = 'Select Date for Day List:'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 104
      Top = 24
      Width = 161
      Height = 21
      KeyField = 'UserName'
      ListSource = DataForm2.UserSource
      TabOrder = 0
    end
    object DateListEdit: TJvDateTimePicker
      Left = 168
      Top = 56
      Width = 97
      Height = 21
      Date = 38827.987647569450000000
      Format = 'yyyy/MM/dd'
      Time = 38827.987647569450000000
      TabOrder = 1
      DropDownDate = 38827.000000000000000000
    end
    object PrintDailyInvoiceListBtn: TButton
      Left = 142
      Top = 83
      Width = 123
      Height = 25
      Caption = 'Invoice List'
      TabOrder = 2
      OnClick = PrintDailyInvoiceListBtnClick
    end
    object PrintDailyLayBuyPaymentList: TButton
      Left = 142
      Top = 110
      Width = 123
      Height = 25
      Caption = 'Lay Buy Payments List'
      TabOrder = 3
      OnClick = PrintDailyLayBuyPaymentListClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 312
    Top = 8
    Width = 377
    Height = 170
    Caption = 'Monthly List'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 52
      Height = 13
      Caption = 'From Date:'
    end
    object Label4: TLabel
      Left = 176
      Top = 32
      Width = 42
      Height = 13
      Caption = 'To Date:'
    end
    object Fromdate: TJvDateTimePicker
      Left = 72
      Top = 24
      Width = 97
      Height = 21
      Date = 38828.027060902780000000
      Format = 'yyyy/MM/dd'
      Time = 38828.027060902780000000
      TabOrder = 0
      DropDownDate = 38828.000000000000000000
    end
    object ToDate: TJvDateTimePicker
      Left = 232
      Top = 24
      Width = 97
      Height = 21
      Date = 38828.027269780090000000
      Format = 'yyyy/MM/dd'
      Time = 38828.027269780090000000
      TabOrder = 1
      DropDownDate = 38828.000000000000000000
    end
    object PrintInvListDateRange: TButton
      Left = 248
      Top = 56
      Width = 121
      Height = 25
      Caption = 'Print Invoice List'
      TabOrder = 2
      OnClick = PrintInvListDateRangeClick
    end
    object JvBitBtn1: TJvBitBtn
      Left = 8
      Top = 83
      Width = 129
      Height = 25
      Caption = 'Print Open Lay Buy list'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = JvBitBtn1Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn2: TJvBitBtn
      Left = 8
      Top = 56
      Width = 129
      Height = 25
      Caption = 'Print Closed Lay Buy List'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = JvBitBtn2Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn3: TJvBitBtn
      Left = 248
      Top = 83
      Width = 121
      Height = 25
      Caption = 'Print Purchase Inv List'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = JvBitBtn3Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn4: TJvBitBtn
      Left = 151
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Inv Export'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = JvBitBtn4Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn5: TJvBitBtn
      Left = 151
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Tax Report'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = JvBitBtn5Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn6: TJvBitBtn
      Left = 8
      Top = 110
      Width = 169
      Height = 25
      Caption = 'Sales Report'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 8
      OnClick = JvBitBtn6Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object CheckBox1: TCheckBox
      Left = 183
      Top = 114
      Width = 162
      Height = 17
      Caption = 'Enable Detailed Sales Report'
      TabOrder = 9
    end
    object JvBitBtn7: TJvBitBtn
      Left = 8
      Top = 137
      Width = 169
      Height = 25
      Caption = 'Invoice Supplier Stock Report'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
      OnClick = JvBitBtn7Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object BitBtn1: TBitBtn
    Left = 617
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Close'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000202020404040
      4040404040404040404040404040404040404040404040404040404040404040
      404040404040402020207F7F7FC0C0C0C0C0C0C0C0C0606060606060C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04040407F7F7FC0C0C0
      C0C0C0C0C0C0303030909090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C04040407F7F7FC0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04040407F7F7FC0C0C0
      C0C0C0909090606060C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C04040407F7F7FC0C0C0C0C0C0303030909090C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C09090906060606060606060604040407F7F7FC0C0C0
      C0C0C0000000606060909090C0C0C0C0C0C0909090303030000000000000BFBF
      BFFFFFFF7F7F7F4040407F7F7FC0C0C06060600000000000000000000000007F
      7F7FBFBFBF000000000000000000FFFFFFFFFFFF6060604040407F7F7FC0C0C0
      6060600000000000000000003F3F3FFFFFFF7F7F7F0000003F3F3F0000000000
      000000006060604040407F7F7FC0C0C06060603F3F3F7F7F7F0000003F3F3F3F
      3F3F000000BFBFBFFFFFFF000000000000000000C0C0C04040407F7F7FC0C0C0
      0000007F7F7FFFFFFFBFBFBF0000000000007F7F7FFFFFFFBFBFBF0000000000
      00303030C0C0C04040407F7F7FC0C0C0000000FFFFFFFFFFFF3F3F3F00000000
      00007F7F7F7F7F7F0000007F7F7F7F7F7F606060C0C0C04040407F7F7FC0C0C0
      000000000000000000BFBFBFFFFFFF7F7F7F0000000000007F7F7FFFFFFF7F7F
      7FC0C0C0C0C0C04040407F7F7F606060000000000000000000FFFFFFFFFFFF3F
      3F3F000000000000303030606060909090C0C0C0C0C0C04040407F7F7F606060
      0000000000003F3F3F7F7F7F6F6F6F606060909090C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C04040403F3F3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F202020}
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Report: TRvSystem
    TitleSetup = 'POS Invoice'
    TitleStatus = 'POS Invoice'
    TitlePreview = 'POS Invoice'
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'POS Invoice'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = ReportPrint
    OnBeforePrint = ReportBeforePrint
    Left = 232
    Top = 160
  end
end
