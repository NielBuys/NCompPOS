object CashUpForm: TCashUpForm
  Left = 285
  Top = 175
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cash Up / End of Shift'
  ClientHeight = 241
  ClientWidth = 593
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
  object DBText4: TDBText
    Left = 448
    Top = 32
    Width = 65
    Height = 17
    DataField = 'TotalInvoices'
    DataSource = DataForm2.CashUpSource
  end
  object DBText5: TDBText
    Left = 40
    Top = 184
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'CashDiff'
    DataSource = DataForm2.CashUpSource
  end
  object DBText6: TDBText
    Left = 200
    Top = 184
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'CreditCardDiff'
    DataSource = DataForm2.CashUpSource
  end
  object DBText7: TDBText
    Left = 344
    Top = 184
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'ChequesDiff'
    DataSource = DataForm2.CashUpSource
  end
  object DBText9: TDBText
    Left = 488
    Top = 184
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'OtherDiff'
    DataSource = DataForm2.CashUpSource
  end
  object GroupBox1: TGroupBox
    Left = 88
    Top = 0
    Width = 345
    Height = 49
    Caption = 'User Info'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 58
      Height = 13
      Caption = 'Select User:'
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 88
      Top = 16
      Width = 145
      Height = 23
      LookupField = 'UserName'
      LookupSource = DataForm2.Query1Source
      TabOrder = 0
    end
    object Button1: TButton
      Left = 248
      Top = 16
      Width = 81
      Height = 25
      Caption = 'Start Cash Up'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 55
    Width = 593
    Height = 57
    Caption = 'Real Totals'
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Cash:'
    end
    object DBText1: TDBText
      Left = 40
      Top = 24
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'RealCashTotal'
      DataSource = DataForm2.CashUpSource
    end
    object Label3: TLabel
      Left = 136
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Credit Card:'
    end
    object DBText2: TDBText
      Left = 200
      Top = 24
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'RealCreditCardTotal'
      DataSource = DataForm2.CashUpSource
    end
    object Label4: TLabel
      Left = 296
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Cheques:'
    end
    object DBText3: TDBText
      Left = 352
      Top = 24
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'RealChequesTotal'
      DataSource = DataForm2.CashUpSource
    end
    object Label8: TLabel
      Left = 440
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Other:'
    end
    object DBText8: TDBText
      Left = 488
      Top = 24
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'RealOtherTotal'
      DataSource = DataForm2.CashUpSource
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 112
    Width = 593
    Height = 65
    Caption = 'Counted Totals'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 30
      Width = 27
      Height = 13
      Caption = 'Cash:'
    end
    object Label6: TLabel
      Left = 136
      Top = 30
      Width = 55
      Height = 13
      Caption = 'Credit Card:'
    end
    object Label7: TLabel
      Left = 296
      Top = 30
      Width = 45
      Height = 13
      Caption = 'Cheques:'
    end
    object Label9: TLabel
      Left = 440
      Top = 30
      Width = 29
      Height = 13
      Caption = 'Other:'
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 24
      Width = 89
      Height = 21
      DataField = 'CountCashTotal'
      DataSource = DataForm2.CashUpSource
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 200
      Top = 24
      Width = 89
      Height = 21
      DataField = 'CountCreditCardTotal'
      DataSource = DataForm2.CashUpSource
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 344
      Top = 24
      Width = 89
      Height = 21
      DataField = 'CountChequesTotal'
      DataSource = DataForm2.CashUpSource
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 488
      Top = 24
      Width = 89
      Height = 21
      DataField = 'CountOtherTotal'
      DataSource = DataForm2.CashUpSource
      TabOrder = 3
    end
  end
  object Button2: TButton
    Left = 417
    Top = 216
    Width = 89
    Height = 25
    Caption = 'Accept Cash Up'
    TabOrder = 3
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 216
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
    TabOrder = 4
    OnClick = BitBtn1Click
  end
end
