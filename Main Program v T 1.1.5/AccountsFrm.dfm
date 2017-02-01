object AccountsForm: TAccountsForm
  Left = 0
  Top = 0
  Caption = 'Accounts Form'
  ClientHeight = 398
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 577
    Height = 369
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Account Detail'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Acc No:'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 46
        Height = 13
        Caption = 'Surname:'
      end
      object Label3: TLabel
        Left = 287
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Name:'
      end
      object Label4: TLabel
        Left = 16
        Top = 75
        Width = 79
        Height = 13
        Caption = 'Company Name:'
      end
      object Label5: TLabel
        Left = 287
        Top = 75
        Width = 56
        Height = 13
        Caption = 'Id / Vat No:'
      end
      object Label6: TLabel
        Left = 16
        Top = 102
        Width = 30
        Height = 13
        Caption = 'P Adr:'
      end
      object Label7: TLabel
        Left = 287
        Top = 102
        Width = 30
        Height = 13
        Caption = 'S Adr:'
      end
      object Label8: TLabel
        Left = 16
        Top = 173
        Width = 18
        Height = 13
        Caption = 'Tel:'
      end
      object Label9: TLabel
        Left = 172
        Top = 173
        Width = 27
        Height = 13
        Caption = 'Tel F:'
      end
      object Label10: TLabel
        Left = 16
        Top = 200
        Width = 28
        Height = 13
        Caption = 'Tel C:'
      end
      object Label11: TLabel
        Left = 178
        Top = 200
        Width = 31
        Height = 13
        Caption = 'E Mail:'
      end
      object Label12: TLabel
        Left = 16
        Top = 229
        Width = 56
        Height = 13
        Caption = 'Begin Date:'
      end
      object Label13: TLabel
        Left = 233
        Top = 229
        Width = 48
        Height = 13
        Caption = 'End Date:'
      end
      object Label19: TLabel
        Left = 287
        Top = 22
        Width = 47
        Height = 13
        Caption = 'Balance:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 336
        Top = 173
        Width = 37
        Height = 13
        Caption = 'Ref No:'
      end
      object Label22: TLabel
        Left = 165
        Top = 16
        Width = 4
        Height = 13
        Caption = '/'
      end
      object DBText6: TDBText
        Left = 181
        Top = 16
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'AccNo'
        DataSource = DataForm2.AccountsSource
      end
      object DBText7: TDBText
        Left = 112
        Top = 16
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'BranchNo'
        DataSource = DataForm2.AccountsSource
      end
      object DBText8: TDBText
        Left = 385
        Top = 22
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'Total'
        DataSource = DataForm2.AccountsSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 385
        Top = -1
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'BeginTotal'
        DataSource = DataForm2.AccountsSource
      end
      object Label23: TLabel
        Left = 285
        Top = -1
        Width = 84
        Height = 13
        Caption = 'Opening Balance:'
      end
      object Label24: TLabel
        Left = 233
        Top = 252
        Width = 45
        Height = 13
        Caption = 'Discount:'
      end
      object Label25: TLabel
        Left = 16
        Top = 252
        Width = 61
        Height = 13
        Caption = 'Allow Credit:'
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 45
        Width = 169
        Height = 21
        DataField = 'Surname'
        DataSource = DataForm2.AccountsSource
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 384
        Top = 45
        Width = 169
        Height = 21
        DataField = 'Name'
        DataSource = DataForm2.AccountsSource
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 112
        Top = 72
        Width = 169
        Height = 21
        DataField = 'CompanyName'
        DataSource = DataForm2.AccountsSource
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 384
        Top = 72
        Width = 169
        Height = 21
        DataField = 'ID'
        DataSource = DataForm2.AccountsSource
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 112
        Top = 99
        Width = 169
        Height = 21
        DataField = 'PAdr1'
        DataSource = DataForm2.AccountsSource
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 112
        Top = 121
        Width = 169
        Height = 21
        DataField = 'PAdr2'
        DataSource = DataForm2.AccountsSource
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 112
        Top = 143
        Width = 129
        Height = 21
        DataField = 'PAdr3'
        DataSource = DataForm2.AccountsSource
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 242
        Top = 143
        Width = 39
        Height = 21
        DataField = 'PCode'
        DataSource = DataForm2.AccountsSource
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 384
        Top = 99
        Width = 169
        Height = 21
        DataField = 'HAdr1'
        DataSource = DataForm2.AccountsSource
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 384
        Top = 121
        Width = 169
        Height = 21
        DataField = 'HAdr2'
        DataSource = DataForm2.AccountsSource
        TabOrder = 9
      end
      object DBEdit12: TDBEdit
        Left = 384
        Top = 143
        Width = 169
        Height = 21
        DataField = 'HAdr3'
        DataSource = DataForm2.AccountsSource
        TabOrder = 10
      end
      object DBEdit13: TDBEdit
        Left = 40
        Top = 170
        Width = 117
        Height = 21
        DataField = 'Tel'
        DataSource = DataForm2.AccountsSource
        TabOrder = 11
      end
      object DBEdit14: TDBEdit
        Left = 205
        Top = 170
        Width = 117
        Height = 21
        DataField = 'TelF'
        DataSource = DataForm2.AccountsSource
        TabOrder = 12
      end
      object DBEdit15: TDBEdit
        Left = 50
        Top = 197
        Width = 117
        Height = 21
        DataField = 'TelC'
        DataSource = DataForm2.AccountsSource
        TabOrder = 14
      end
      object DBEdit16: TDBEdit
        Left = 215
        Top = 197
        Width = 164
        Height = 21
        DataField = 'EMail'
        DataSource = DataForm2.AccountsSource
        TabOrder = 15
      end
      object AddAccount: TJvBitBtn
        Left = 0
        Top = 313
        Width = 105
        Height = 25
        Caption = 'Add New Account'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 22
        OnClick = AddAccountClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object SaveAccount: TJvBitBtn
        Left = 491
        Top = 313
        Width = 75
        Height = 25
        Caption = 'Save'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 19
        OnClick = SaveAccountClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object BeginDateEdit: TJvDateTimePicker
        Left = 112
        Top = 224
        Width = 97
        Height = 21
        Date = 39641.554116203710000000
        Time = 39641.554116203710000000
        TabOrder = 16
        OnChange = BeginDateEditChange
        DropDownDate = 39641.000000000000000000
        NullText = 'No Date'
      end
      object EndDateEdit: TJvDateTimePicker
        Left = 304
        Top = 224
        Width = 97
        Height = 21
        Date = 39641.557721527780000000
        Time = 39641.557721527780000000
        TabOrder = 21
        OnChange = EndDateEditChange
        DropDownDate = 39641.000000000000000000
        NullText = 'No Date'
      end
      object JvBitBtn2: TJvBitBtn
        Left = 407
        Top = 224
        Width = 146
        Height = 21
        Caption = 'Enable / Disable End Date'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 20
        OnClick = JvBitBtn2Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 266
        Width = 565
        Height = 41
        Caption = 'Ageing'
        TabOrder = 23
        object Label14: TLabel
          Left = 3
          Top = 16
          Width = 42
          Height = 11
          Caption = 'Current:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 50
          Top = 16
          Width = 36
          Height = 11
          AutoSize = True
          DataField = 'Current'
          DataSource = DataForm2.AccountsSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 157
          Top = 16
          Width = 36
          Height = 11
          AutoSize = True
          DataField = 'Days30'
          DataSource = DataForm2.AccountsSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 272
          Top = 16
          Width = 36
          Height = 11
          AutoSize = True
          DataField = 'Days60'
          DataSource = DataForm2.AccountsSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 384
          Top = 16
          Width = 36
          Height = 11
          AutoSize = True
          DataField = 'Days90'
          DataSource = DataForm2.AccountsSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 512
          Top = 16
          Width = 36
          Height = 11
          AutoSize = True
          DataField = 'Days120'
          DataSource = DataForm2.AccountsSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 108
          Top = 16
          Width = 44
          Height = 11
          Caption = '30 Days:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 223
          Top = 16
          Width = 44
          Height = 11
          Caption = '60 Days:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 335
          Top = 16
          Width = 44
          Height = 11
          Caption = '90 Days:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 457
          Top = 16
          Width = 51
          Height = 11
          Caption = '120 Days:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBEdit18: TDBEdit
        Left = 385
        Top = 170
        Width = 168
        Height = 21
        DataField = 'RefNo'
        DataSource = DataForm2.AccountsSource
        TabOrder = 13
      end
      object AllowCreditSel: TJvDBComboBox
        Left = 111
        Top = 248
        Width = 98
        Height = 21
        DataField = 'AllowCredit'
        DataSource = DataForm2.AccountsSource
        ItemHeight = 0
        Items.Strings = (
          'True'
          'False')
        TabOrder = 17
        Values.Strings = (
          'True'
          'False')
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object DiscountEdit: TDBEdit
        Left = 305
        Top = 248
        Width = 75
        Height = 21
        DataField = 'Discount'
        DataSource = DataForm2.AccountsSource
        TabOrder = 18
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Transactions'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label26: TLabel
        Left = 160
        Top = 311
        Width = 81
        Height = 13
        Caption = 'Statement Total:'
      end
      object Label27: TLabel
        Left = 344
        Top = 311
        Width = 93
        Height = 13
        Caption = 'Choose Statement:'
      end
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 3
        Width = 569
        Height = 302
        DataSource = DataForm2.TransQuerySource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = TransactionMenu
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid1DrawColumnCell
        AutoAppend = False
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'PaymentType'
            Title.Caption = 'Transaction Type'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ammount'
            Title.Caption = 'Amount'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RefNo'
            Title.Caption = 'Ref No'
            Width = 143
            Visible = True
          end>
      end
      object ComboBox1: TComboBox
        Left = 443
        Top = 308
        Width = 100
        Height = 21
        ItemHeight = 0
        TabOrder = 1
        OnChange = ComboBox1Change
      end
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 502
    Top = 370
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
    TabOrder = 1
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object AddTransactions: TJvBitBtn
    Left = 4
    Top = 370
    Width = 105
    Height = 25
    Caption = 'Add Transactions'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = AddTransactionsClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvBitBtn3: TJvBitBtn
    Left = 115
    Top = 370
    Width = 98
    Height = 25
    Caption = 'Print Statement'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = JvBitBtn3Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object FormResizer1: TFormResizer
    ResizeFonts = True
    MinFontSize = 8
    MaxFontSize = 38
    Left = 360
    Top = 368
  end
  object RvSystem1: TRvSystem
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
    OnPrint = RvSystem1Print
    Left = 392
    Top = 368
  end
  object TransactionMenu: TPopupMenu
    Left = 424
    Top = 368
    object PaymentforInvoice: TMenuItem
      Caption = 'Add Payment for selected invoice Transaction'
      OnClick = PaymentforInvoiceClick
    end
  end
end
