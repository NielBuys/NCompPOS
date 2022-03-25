object StockForm: TStockForm
  Left = 203
  Top = 110
  Caption = 'Stock Administration'
  ClientHeight = 529
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    755
    529)
  PixelsPerInch = 96
  TextHeight = 13
  object JvSpeedButton2: TJvSpeedButton
    Left = 248
    Top = 504
    Width = 26
    Height = 25
    Hint = 'Print Barcode for selected stock item.'
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
      33333F3FFFFFFFFFFF3F03000000000003037377777777777F73330800808080
      03333F7F77F7F7F77F3F0308008080800303737F77F737F77F73330080080008
      03333F77F77F777F7F3F03000000000003037377777777777373333333333333
      33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    NumGlyphs = 2
    OnClick = JvSpeedButton2Click
  end
  object JvSpeedButton1: TJvSpeedButton
    Left = 639
    Top = 504
    Width = 25
    Height = 25
    Anchors = [akRight, akBottom]
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF20202040404040404040404040404040404020
      20207F7F007F7F007F7F007F7F003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
      606060808080808080808080606060BFBF00FFFF00FFFF00FFFF005F5F208080
      805F5F5FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF606060808080606060BFBF00FF
      FF00FFFF00FFFF005F5F208080808080808080805F5F5FFFFFFFFFFFFFFFFFFF
      FFFFFFBFBFBF404040BFBF00FFFF00FFFF00FFFF003F3F004040404040404040
      404040404040407F7F7FFFFFFFFFFFFFFFFFFFBFBFBFBFBF00FFFF00FFFF00FF
      FF005F5F20606060BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      BFBFBFBFBF00FFFF00FFFF00FFFF005F5F20808080808080606060BFBFBFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBF00FFFF00FFFF00FFFF007F7F3F60
      6060808080808080808080606060BFBFBFFFFFFFFFFFFFFFFFFFBFBFBFBFBF00
      FFFF00FFFF00FFFF007F7F3FFFFFFFBFBFBF6060608080808080808080806060
      60BFBFBFFFFFFFFFFFFF3F3F007F7F007F7F007F7F007F7F3FFFFFFFFFFFFFFF
      FFFFBFBFBF404040404040404040404040202020BFBFBFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    OnClick = JvSpeedButton1Click
  end
  object Label2: TLabel
    Left = 14
    Top = 7
    Width = 37
    Height = 13
    Caption = 'Search:'
  end
  object Label3: TLabel
    Left = 263
    Top = 8
    Width = 11
    Height = 13
    Caption = 'by'
  end
  object StockGrid: TJvDBGrid
    Left = 1
    Top = 35
    Width = 753
    Height = 463
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataForm2.StockSource
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = StockGridDrawColumnCell
    OnDblClick = StockGridDblClick
    OnKeyPress = StockGridKeyPress
    AutoAppend = False
    MultiSelect = True
    TitleButtons = True
    TitleButtonAllowMove = True
    OnTitleBtnClick = StockGridTitleBtnClick
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TCStockNo'
        Title.Caption = 'Stock No'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BranchNo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CostPrice'
        Title.Caption = 'Cost Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AvgCost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesPrice'
        Title.Caption = 'Sales Price 1'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesPrice2'
        Title.Caption = 'Sales Price 2'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qty'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ModelNo'
        Title.Caption = 'Model No'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ExtraDescr'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barcode'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateCreated'
        Title.Caption = 'Date Created'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateChanged'
        Title.Caption = 'Date Changed'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AlertQty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StartingQty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NonStockItem'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_nontaxitem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_created_by'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_changed_by'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditorLink'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nr'
        Title.Caption = 'No'
        Width = 83
        Visible = True
      end>
  end
  object SearchStockBtn: TButton
    Left = 632
    Top = 4
    Width = 115
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Search for Stock (F3)'
    TabOrder = 4
    OnClick = SearchStockBtnClick
  end
  object JvBitBtn1: TJvBitBtn
    Left = 671
    Top = 504
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
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
    TabOrder = 3
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn2: TJvBitBtn
    Left = 1
    Top = 504
    Width = 128
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Insert Non Stock Item'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn3: TJvBitBtn
    Left = 135
    Top = 504
    Width = 98
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Insert Stock Item'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = JvBitBtn3Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 280
    Top = 508
    Width = 101
    Height = 17
    Hint = 
      'If this is selected the barcode will print the qty of the stock ' +
      'item.'
    Anchors = [akLeft, akBottom]
    Caption = 'Barcode Item Qty'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object SearchEditBox: TEdit
    Left = 57
    Top = 3
    Width = 200
    Height = 21
    TabOrder = 6
  end
  object SearchByCombo: TJvComboBox
    Left = 284
    Top = 3
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Items.Strings = (
      'Stock No'
      'Description'
      'Extra Description'
      'Barcode'
      'Model No')
  end
  object SearchBtn: TJvBitBtn
    Left = 387
    Top = 1
    Width = 89
    Height = 25
    Caption = 'Search (F1)'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000303030404040
      4040404040404040404040404040404040404040404040404040404040404040
      404040404040402020207F7F7FBFBFBFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
      A0A0A0A0A0A0A0A0A0A0A09090904040406060608080804040407F7F7FDFDFDF
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B0B0B0404040AFAF
      AF5050509090904040407F7F7FDFDFDFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0B0B0B0404040BFBFBFBFBFBF6F6F6FA0A0A04040407F7F7FDFDFDF
      C0C0C0C0C0C0B0B0B0A0A0A0A0A0A0B0B0B0B0B0B0404040BFBFBFBFBFBF6F6F
      6FC0C0C0A0A0A04040407F7F7FDFDFDFC0C0C090909040404040404040404080
      8080404040BFBFBFBFBFBF6F6F6FC0C0C0C0C0C0A0A0A04040407F7F7FDFDFDF
      707070606060909090606060909090606060707070CFCFCF6F6F6FC0C0C0C0C0
      C0C0C0C0A0A0A04040407F7F7F9F9F9F9090906F6F6F9F9F9FDFDFDFAFAFAF60
      6060B0B0B0202020B0B0B0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F6F6F6F
      606060DFDFDFDFDFDFDFDFDFDFDFDFDFDFDF606060505050A0A0A0C0C0C0C0C0
      C0C0C0C0A0A0A04040407F7F7F6060606F6F6FDFDFDFDFDFDFDFDFDFDFDFDFDF
      DFDF6F6F6F606060A0A0A0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F606060
      6F6F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF7F7F7F606060A0A0A0C0C0C0C0C0
      C0C0C0C0A0A0A04040407F7F7F6060606F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF6F6F6F606060C0C0C0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F7F7F7F
      909090404040404040404040404040404040909090606060C0C0C0C0C0C0C0C0
      C0C0C0C0A0A0A04040403F3F3F7F7F7F30303090909030303000000030303090
      90903030307F7F7FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF505050FFFFFFFFFFFF
      FFFFFF000000606060606060606060000000FFFFFF000000FF0000FF0000FF00
      00FF00007F0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF}
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = SearchBtnClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object CheckBox2: TCheckBox
    Left = 485
    Top = 8
    Width = 141
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Include all Branch Stock'
    TabOrder = 9
    OnClick = CheckBox2Click
  end
  object MainMenu1: TMainMenu
    Left = 556
    Top = 128
    object File1: TMenuItem
      Caption = 'Edit'
      object FullBarcodeList1: TMenuItem
        Caption = 'Full Barcode List'
        OnClick = FullBarcodeList1Click
      end
      object ShowallInvoicesthathasselectedStockItem1: TMenuItem
        Caption = 'Show all Invoices that has selected Stock Item'
        OnClick = ShowallInvoicesthathasselectedStockItem1Click
      end
      object ShowallTransfersthathasaselectedStockItem1: TMenuItem
        Caption = 'Show all Transfers that has a selected Stock Item'
        OnClick = ShowallTransfersthathasaselectedStockItem1Click
      end
      object ListallInvoicesthathasaselectedStockItem1: TMenuItem
        Caption = 'Export all Invoices that has a selected Stock Item'
        OnClick = ListallInvoicesthathasaselectedStockItem1Click
      end
      object ListallTransfersthathasaselectedStockItem1: TMenuItem
        Caption = 'Export all Transfers that has a selected Stock Item'
        OnClick = ListallTransfersthathasaselectedStockItem1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DeleteStockItem1: TMenuItem
        Caption = 'Delete Stock Item'
        OnClick = DeleteStockItem1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ClearallHQStock1: TMenuItem
        Caption = 'Clear all HQ Stock'
        OnClick = ClearallHQStock1Click
      end
      object ClearAllStock1: TMenuItem
        Caption = 'Clear All Stock'
        OnClick = ClearAllStock1Click
      end
    end
    object ImportStock1: TMenuItem
      Caption = 'Imports'
      object ImportStock2: TMenuItem
        Caption = 'Import Stock'
        OnClick = ImportStock2Click
      end
    end
    object ExtraRuns1: TMenuItem
      Caption = 'Extra Runs'
      object FixHQStockQtys: TMenuItem
        Caption = 'Fix HQ Stock Qty'#39's'
        OnClick = FixHQStockQtysClick
      end
      object FixDuplicatelocalstockitems1: TMenuItem
        Caption = 'Fix Duplicate local stock items'
        Visible = False
        OnClick = FixDuplicatelocalstockitems1Click
      end
      object estandfixBranchstockwithoutHQStock1: TMenuItem
        Caption = 'Test and fix Branch stock without HQ Stock'
        Visible = False
        OnClick = estandfixBranchstockwithoutHQStock1Click
      end
      object FixDuplicateBarcodeitems1: TMenuItem
        Caption = 'Fix Duplicate Barcode items'
        Visible = False
        OnClick = FixDuplicateBarcodeitems1Click
      end
      object FixDuplicatemodelnoitems1: TMenuItem
        Caption = 'Fix Duplicate model no items'
        Visible = False
        OnClick = FixDuplicatemodelnoitems1Click
      end
    end
    object Shortcuts1: TMenuItem
      Caption = 'Shortcut'#39's'
      object SearchforStock1: TMenuItem
        Caption = 'Search for Stock'
        ShortCut = 114
        OnClick = SearchforStock1Click
      end
    end
  end
  object RvProject1: TRvProject
    ProjectFile = 'Barcode.rav'
    Left = 440
    Top = 496
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnBeforePrint = RvSystem1BeforePrint
    Left = 408
    Top = 496
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'csv files|*.csv|All Files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 448
    Top = 376
  end
  object CSVExport: TJvDBGridCSVExport
    Caption = 'Exporting to CSV/Text...'
    Grid = StockGrid
    ExportSeparator = esComma
    Left = 520
    Top = 376
  end
end
