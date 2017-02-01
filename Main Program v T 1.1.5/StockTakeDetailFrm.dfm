object StockTakeDetailForm: TStockTakeDetailForm
  Left = 0
  Top = 0
  Caption = 'Stocktake Detail'
  ClientHeight = 544
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    565
    544)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 27
    Height = 13
    Caption = 'Date:'
  end
  object Label2: TLabel
    Left = 149
    Top = 11
    Width = 107
    Height = 13
    Caption = 'Stocktake Description:'
  end
  object Label3: TLabel
    Left = 8
    Top = 39
    Width = 151
    Height = 13
    Caption = 'Barcode scanner counting (F1):'
  end
  object JvSpeedButton1: TJvSpeedButton
    Left = 455
    Top = 515
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
      4040606060606060FFFFFF404040202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF202020606060202020505050303030202020606060AFAFAF5F5F
      5F202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020404040AFAFAF40404060
      60606060606060609F9F9FEFEFEFEFEFEF5F5F5F202020FFFFFFFFFFFFFFFFFF
      202020404040808080DFDFDF404040AFAFAF6F6F6F606060DFDFDFEFEFEFEFEF
      EFEFEFEF5F5F5FFFFFFFFFFFFF2020204040408080808080809F9F9F7F7F7F7F
      7F7FBFBFBF9F9F9FDFDFDFEFEFEFEFEFEFCFCFCFFFFFFF000000FFFFFF000000
      8080808080809090909F9F9F000000BFBFBF808080DFDFDFBFBFBFDFDFDFCFCF
      CFFFFFFF3F3F3FFFFFFFFFFFFF000000808080808080CFCFCFB0B0B070707000
      0000202020BFBFBFDFDFDFBFBFBFDFDFDF5F5F5F404040FFFFFFFFFFFF000000
      808080BFBFBFEFEFEFAFAFAFA0A0A0707070000000202020A0A0A0BFBFBF3F3F
      3F7F7F7F404040202020FFFFFF000000808080EFEFEFDFDFDFDFDFDFAFAFAFA0
      A0A0707070000000202020202020AFAFAF505050202020FFFFFFFFFFFFFFFFFF
      4040409FBFBFDFDFDFDFDFDFDFDFDFAFAFAFA0A0A0707070000000AFAFAF5050
      50202020FFFFFFFFFFFFFFFFFFFFFFFF2020207090909FBFBFDFDFDFDFDFDFDF
      DFDFAFAFAFA0A0A0505050606060000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF3030307090909FBFBFDFDFDFDFDFDFDFDFDFAFAFAF6060607070700000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030307090909FBFBFDF
      DFDFDFDFDFDFDFDF7F7F7F303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF3030307090909FBFBFDFDFDFDFDFDF303030FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20202020
      20208F8F8F303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    OnClick = JvSpeedButton1Click
  end
  object StocktakeDate: TJvDatePickerEdit
    Left = 41
    Top = 8
    Width = 97
    Height = 21
    AllowNoDate = True
    Checked = True
    TabOrder = 0
  end
  object StockTakeItems: TJvDBGrid
    Left = 8
    Top = 64
    Width = 551
    Height = 449
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataForm2.StockTakeDetailSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = StockTakeItemsTitleBtnClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'StockTakeDetailID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TCStockNo'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LocalQty'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 200
        Visible = True
      end>
  end
  object JvBitBtn1: TJvBitBtn
    Left = 484
    Top = 515
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 5
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object AddStockItem: TJvBitBtn
    Left = 8
    Top = 515
    Width = 153
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Add / Search Stock Item (F3)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = AddStockItemClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object StocktakeDescription: TDBEdit
    Left = 262
    Top = 8
    Width = 297
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'StockTakeDescription'
    DataSource = DataForm2.StockTakeSource
    TabOrder = 1
  end
  object AcceptandCloseStocktake: TJvBitBtn
    Left = 167
    Top = 515
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Accept and Close Stocktake'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = AcceptandCloseStocktakeClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object BarcodeEditBox: TEdit
    Left = 167
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 6
    OnKeyPress = BarcodeEditBoxKeyPress
  end
  object ChoosePrintSetting: TComboBox
    Left = 318
    Top = 517
    Width = 131
    Height = 21
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 7
    Text = 'ChoosePrintSetting'
    Items.Strings = (
      'Print complete list'
      'Print items that mismatch ')
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 392
    object Shortcuts1: TMenuItem
      Caption = 'Shortcut'#39's'
      object AddStockItem1: TMenuItem
        Caption = 'Add Stock Item'
        ShortCut = 114
        OnClick = AddStockItem1Click
      end
      object UseBarcodescannerCounting1: TMenuItem
        Caption = 'Use Barcode scanner Counting'
        ShortCut = 112
        OnClick = UseBarcodescannerCounting1Click
      end
    end
  end
  object ProgressBar: TJvProgressDialog
    ShowCancel = False
    Smooth = True
    ScreenPosition = poDesktopCenter
    Left = 384
    Top = 384
  end
  object Reporttr: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = ReporttrPrint
    Left = 272
    Top = 296
  end
end
