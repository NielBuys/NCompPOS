object StockTransferForm: TStockTransferForm
  Left = 197
  Top = 110
  Caption = 'Stock Transfer'
  ClientHeight = 522
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvSpeedButton1: TJvSpeedButton
    Left = 536
    Top = 496
    Width = 25
    Height = 25
    Hint = 'Undo Transfered stock changes'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60
      6060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF606060808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606060606040
      4040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF606060606060000000404040808080808080909090808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606060606000000000000040
      4040808080808080909090808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      6060606060600000000000000000000000000000000000004040406060602020
      20FFFFFFFFFFFFFFFFFFFFFFFF20202060606000000000000000000000000000
      0000000000000000404040606060909090303030FFFFFFFFFFFFFFFFFF000000
      0000000000000000000000000000000000000000000000004040406060609090
      90909090FFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      0000000000000000404040606060909090C0C0C0303030FFFFFFFFFFFFFFFFFF
      0000000000000000000000000000000000000000000000004040406060609090
      90C0C0C0303030FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000404040606060909090C0C0C0303030FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000002020202020209090
      90C0C0C0303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF303030C0C0C0303030FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF909090303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030303030FFFFFF}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    OnClick = JvSpeedButton1Click
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 201
    Height = 121
    DataSource = DataForm2.StockTrnsferSource
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDblClick = JvDBGrid1DblClick
    OnKeyDown = JvDBGrid1KeyDown
    OnKeyUp = JvDBGrid1KeyUp
    OnMouseDown = JvDBGrid1MouseDown
    OnMouseUp = JvDBGrid1MouseUp
    OnMouseWheelDown = JvDBGrid1MouseWheelDown
    OnMouseWheelUp = JvDBGrid1MouseWheelUp
    AutoAppend = False
    AutoSizeColumns = True
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
        FieldName = 'Date'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sync'
        ReadOnly = True
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Closed'
        ReadOnly = True
        Width = 40
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 127
    Width = 369
    Height = 394
    Caption = 'Unassigned Stock'
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 342
      Width = 66
      Height = 13
      Caption = 'Desc. search:'
    end
    object Label2: TLabel
      Left = 12
      Top = 366
      Width = 63
      Height = 13
      Caption = 'Barc. search:'
    end
    object FromGrid: TJvDBGrid
      Left = 8
      Top = 16
      Width = 353
      Height = 314
      DataSource = DataForm2.StockSource
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = FromGridDrawColumnCell
      OnDblClick = FromGridDblClick
      OnKeyPress = FromGridKeyPress
      AutoAppend = False
      TitleButtons = True
      OnTitleBtnClick = FromGridTitleBtnClick
      MaxColumnWidth = 150
      AutoSizeColumns = True
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
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Description'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Barcode'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty'
          Width = 47
          Visible = True
        end>
    end
    object DescriptionSearch: TJvEdit
      Left = 83
      Top = 338
      Width = 129
      Height = 21
      TabOrder = 1
    end
    object Button5: TButton
      Left = 212
      Top = 336
      Width = 75
      Height = 25
      Caption = 'First Desc'
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button7: TButton
      Left = 286
      Top = 336
      Width = 75
      Height = 25
      Caption = 'Next Desc'
      TabOrder = 3
      OnClick = Button7Click
    end
    object Barcodesearch: TJvEdit
      Left = 83
      Top = 362
      Width = 129
      Height = 21
      TabOrder = 4
    end
    object Button6: TButton
      Left = 212
      Top = 360
      Width = 75
      Height = 25
      Caption = 'First Barc'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button8: TButton
      Left = 286
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Next Barc'
      TabOrder = 6
      OnClick = Button8Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 456
    Top = 127
    Width = 313
    Height = 362
    Caption = 'Transferred Stock'
    TabOrder = 2
    object JvDBGrid3: TJvDBGrid
      Left = 8
      Top = 16
      Width = 297
      Height = 337
      DataSource = DataForm2.StocktrnsferItemSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = JvDBGrid3DrawColumnCell
      OnEnter = JvDBGrid3Enter
      OnExit = JvDBGrid3Exit
      OnKeyDown = JvDBGrid3KeyDown
      AutoAppend = False
      AutoSizeColumns = True
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
          ReadOnly = True
          Title.Caption = 'Stock No'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Description'
          ReadOnly = True
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Transfered'
          ReadOnly = True
          Width = 53
          Visible = True
        end>
    end
  end
  object JvBitBtn5: TJvBitBtn
    Left = 372
    Top = 240
    Width = 81
    Height = 25
    Caption = 'Transfer'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    Layout = blGlyphRight
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = JvBitBtn5Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn6: TJvBitBtn
    Left = 372
    Top = 272
    Width = 81
    Height = 25
    Caption = 'Remove'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = JvBitBtn6Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object GroupBox3: TGroupBox
    Left = 208
    Top = 0
    Width = 377
    Height = 121
    Caption = 'Create a Transfer'
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 117
      Height = 13
      Caption = 'Date Transfer is created:'
    end
    object DBText1: TDBText
      Left = 136
      Top = 24
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'Date'
      DataSource = DataForm2.StockTrnsferSource
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 103
      Height = 13
      Caption = 'Date Send to Branch:'
    end
    object DBText2: TDBText
      Left = 136
      Top = 48
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'Sync'
      DataSource = DataForm2.StockTrnsferSource
    end
    object CreateTransferBtn: TJvBitBtn
      Left = 4
      Top = 88
      Width = 89
      Height = 25
      Caption = 'Create Transfer'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = CreateTransferBtnClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object DeleteOpenTransferBtn: TJvBitBtn
      Left = 92
      Top = 88
      Width = 113
      Height = 25
      Caption = 'Delete Open Transfer'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = DeleteOpenTransferBtnClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object SaveTransferBtn: TJvBitBtn
      Left = 299
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Save'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = SaveTransferBtnClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object CloseTransferBtn: TButton
      Left = 204
      Top = 88
      Width = 89
      Height = 25
      Caption = 'Close Transfer'
      TabOrder = 2
      OnClick = CloseTransferBtnClick
    end
  end
  object JvBitBtn7: TJvBitBtn
    Left = 694
    Top = 496
    Width = 75
    Height = 25
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
    TabOrder = 5
    OnClick = JvBitBtn7Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn11: TJvBitBtn
    Left = 591
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Branch Transfer Report'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = JvBitBtn11Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn12: TJvBitBtn
    Left = 591
    Top = 88
    Width = 129
    Height = 25
    Caption = 'Print Barcodes'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF808080
      8080808080808080808080808080808080808080808080808080808080808080
      80808080808080808080003F00007F00007F00007F00007F00007F00007F0000
      7F00007F00007F00007F00007F00007F00007F00003F00808080007F0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF00007F00808080007F0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF00007F00808080007F0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF00007F00808080007F00205F2040404040404060606000BF0040404040
      404040404040BF40205F20404040404040606060007F00808080007F00000000
      000000000000205F20007F0000000000000000000020DF200000000000000000
      00205F20007F00808080007F0020DF2040BF4040BF4040BF4000FF0040BF4040
      BF4040BF4020DF2020DF2040BF4040BF4040BF40007F00808080007F00000000
      000000000000404040007F0000000000000000000040BF400000000000000000
      00404040007F00808080007F00007F00007F00007F0000BF0000BF00007F0000
      7F00007F0000FF00007F00007F00007F0000BF00007F00808080007F00205F20
      40404040404060606000BF0040404040404040404040BF40205F204040404040
      40606060007F00808080007F00000000000000000000205F20007F0000000000
      000000000020DF20000000000000000000205F20007F00808080007F0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF00007F00808080007F0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF00007F00808080007F0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF00007F00808080003F00007F00007F00007F00007F00007F00007F0000
      7F00007F00007F00007F00007F00007F00007F00003F00FFFFFF}
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = JvBitBtn12Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn13: TJvBitBtn
    Left = 372
    Top = 208
    Width = 81
    Height = 25
    Caption = 'All'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    Layout = blGlyphRight
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = JvBitBtn13Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn14: TJvBitBtn
    Left = 372
    Top = 304
    Width = 81
    Height = 25
    Caption = 'All'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 10
    OnClick = JvBitBtn14Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 376
    Top = 496
    Width = 154
    Height = 17
    Caption = 'Hide Zero Qty Stock Items'
    TabOrder = 11
    OnClick = CheckBox1Click
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
    Left = 616
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 528
    Top = 40
    object Edit1: TMenuItem
      Caption = 'Options'
      object Viewonlyopentransfers1: TMenuItem
        AutoCheck = True
        Caption = 'View only not Sync Transfers'
        Checked = True
        OnClick = Viewonlyopentransfers1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Markcurrenttransferasalreadysendtobranch1: TMenuItem
        Caption = 'Mark current transfer as already send to branch'
        OnClick = Markcurrenttransferasalreadysendtobranch1Click
      end
    end
  end
  object FormResizer1: TFormResizer
    ResizeFonts = True
    MinFontSize = 8
    MaxFontSize = 48
    Left = 576
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 144
    object ReturnStockItem1: TMenuItem
      Caption = 'Return Stock Item'
      OnClick = ReturnStockItem1Click
    end
  end
end
