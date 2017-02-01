object AddTransactionForm: TAddTransactionForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add Transaction'
  ClientHeight = 175
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvPageControl1: TJvPageControl
    Left = 0
    Top = 0
    Width = 289
    Height = 145
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Type'
      object Label1: TLabel
        Left = 16
        Top = 27
        Width = 87
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Transaction Type:'
      end
      object TType: TJvComboBox
        Left = 120
        Top = 24
        Width = 145
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ItemHeight = 13
        TabOrder = 0
        Text = 'Not Chosen'
        OnChange = TTypeChange
        Items.Strings = (
          'Payment'
          'Journal'
          'Invoice'
          'CR-Note')
      end
      object JvBitBtn2: TJvBitBtn
        Left = 203
        Top = 81
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Next >'
        DoubleBuffered = True
        Enabled = False
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = JvBitBtn2Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Payment'
      Enabled = False
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label33: TLabel
        Left = 16
        Top = 6
        Width = 71
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Payment type:'
      end
      object Label2: TLabel
        Left = 16
        Top = 53
        Width = 41
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Amount:'
      end
      object Label3: TLabel
        Left = 16
        Top = 75
        Width = 37
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Ref No:'
      end
      object Label4: TLabel
        Left = 16
        Top = 31
        Width = 23
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Date'
      end
      object PType: TJvComboBox
        Left = 112
        Top = 2
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ItemHeight = 0
        TabOrder = 0
        Text = 'Cash'
        Items.Strings = (
          'Cash'
          'CreditCard'
          'Cheque'
          'Other')
        ItemIndex = 0
      end
      object PAmount: TJvValidateEdit
        Left = 112
        Top = 48
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        TabOrder = 2
      end
      object PRefNo: TJvEdit
        Left = 112
        Top = 70
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 3
      end
      object JvBitBtn3: TJvBitBtn
        Left = 184
        Top = 92
        Width = 94
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Do Payment'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = JvBitBtn3Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object PDate: TJvDateTimePicker
        Left = 112
        Top = 25
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Date = 39645.793416875000000000
        Time = 39645.793416875000000000
        TabOrder = 1
        DropDownDate = 39645.000000000000000000
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Journal'
      Enabled = False
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 16
        Top = 31
        Width = 23
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Date'
      end
      object Label6: TLabel
        Left = 16
        Top = 53
        Width = 41
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Amount:'
      end
      object Label7: TLabel
        Left = 16
        Top = 75
        Width = 37
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Ref No:'
      end
      object Label8: TLabel
        Left = 16
        Top = 9
        Width = 58
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'To Account:'
      end
      object Label9: TLabel
        Left = 155
        Top = 9
        Width = 53
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Branch No:'
      end
      object Label10: TLabel
        Left = 160
        Top = 52
        Width = 28
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Days:'
      end
      object JDate: TJvDateTimePicker
        Left = 112
        Top = 25
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Date = 39645.793416875000000000
        Time = 39645.793416875000000000
        TabOrder = 2
        DropDownDate = 39645.000000000000000000
      end
      object JAmount: TJvValidateEdit
        Left = 63
        Top = 48
        Width = 88
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        TabOrder = 3
      end
      object JRefNo: TJvEdit
        Left = 112
        Top = 70
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 5
      end
      object JAccNo: TEdit
        Left = 78
        Top = 3
        Width = 73
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 0
      end
      object JBranchNo: TEdit
        Left = 212
        Top = 3
        Width = 40
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 1
        Text = '0'
      end
      object JvBitBtn4: TJvBitBtn
        Left = 203
        Top = 92
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Do Journal'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = JvBitBtn4Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JAge: TJvComboBox
        Left = 198
        Top = 48
        Width = 75
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ItemHeight = 0
        TabOrder = 4
        Text = 'Current'
        Items.Strings = (
          'Current'
          '30 Days'
          '60 Days'
          '90 Days'
          '120 Days')
        ItemIndex = 0
      end
    end
    object TabSheet5: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Invoice'
      Enabled = False
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label11: TLabel
        Left = 16
        Top = 15
        Width = 23
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Date'
      end
      object Label16: TLabel
        Left = 16
        Top = 37
        Width = 41
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Amount:'
      end
      object Label17: TLabel
        Left = 16
        Top = 59
        Width = 37
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Ref No:'
      end
      object IDate: TJvDateTimePicker
        Left = 112
        Top = 9
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Date = 39645.793416875000000000
        Time = 39645.793416875000000000
        TabOrder = 0
        DropDownDate = 39645.000000000000000000
      end
      object IAmount: TJvValidateEdit
        Left = 112
        Top = 32
        Width = 91
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        TabOrder = 1
      end
      object IRefNo: TJvEdit
        Left = 112
        Top = 54
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 2
      end
      object JvBitBtn6: TJvBitBtn
        Left = 184
        Top = 92
        Width = 94
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add Invoice'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = JvBitBtn6Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
    end
    object TabSheet4: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Credit Note'
      Enabled = False
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label12: TLabel
        Left = 16
        Top = 15
        Width = 23
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Date'
      end
      object Label13: TLabel
        Left = 16
        Top = 37
        Width = 41
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Amount:'
      end
      object Label14: TLabel
        Left = 16
        Top = 59
        Width = 37
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Ref No:'
      end
      object Label15: TLabel
        Left = 160
        Top = 36
        Width = 28
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Days:'
      end
      object CDate: TJvDateTimePicker
        Left = 112
        Top = 9
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Date = 39645.793416875000000000
        Time = 39645.793416875000000000
        TabOrder = 0
        DropDownDate = 39645.000000000000000000
      end
      object CAmount: TJvValidateEdit
        Left = 63
        Top = 32
        Width = 91
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        TabOrder = 1
      end
      object CRefNo: TJvEdit
        Left = 112
        Top = 54
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 3
      end
      object JvBitBtn5: TJvBitBtn
        Left = 184
        Top = 92
        Width = 94
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add Credit Note'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = JvBitBtn5Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object CAge: TJvComboBox
        Left = 198
        Top = 32
        Width = 75
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ItemHeight = 0
        TabOrder = 2
        Text = 'Current'
        Items.Strings = (
          'Current'
          '30 Days'
          '60 Days'
          '90 Days'
          '120 Days')
        ItemIndex = 0
      end
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 210
    Top = 147
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
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
    TabOrder = 1
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
end
