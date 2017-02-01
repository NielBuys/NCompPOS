object StockSearchForm: TStockSearchForm
  Left = 230
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Stock Search (F4 for List focus,Enter to Select)(F12 Exit Form)'
  ClientHeight = 305
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 238
    Width = 87
    Height = 13
    Caption = 'Desc. search (F1):'
  end
  object Label2: TLabel
    Left = 0
    Top = 262
    Width = 84
    Height = 13
    Caption = 'Barc. search (F5):'
  end
  object Label3: TLabel
    Left = 0
    Top = 286
    Width = 91
    Height = 13
    Caption = 'Extra D search (F9)'
  end
  object Label4: TLabel
    Left = 392
    Top = 235
    Width = 171
    Height = 13
    Caption = 'This colour has Lay Buy Items'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 392
    Top = 250
    Width = 151
    Height = 13
    Caption = 'This colour is out of Stock'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 569
    Height = 232
    Hint = 'Stock List (F4)'
    DataSource = DataForm2.StockSearchQuerySource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    OnKeyPress = JvDBGrid1KeyPress
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = JvDBGrid1TitleBtnClick
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
        FieldName = 'Description'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barcode'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TCStockNo'
        Title.Caption = 'Stock No'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ExtraDescr'
        Width = 400
        Visible = True
      end>
  end
  object DescriptionSearch: TJvEdit
    Left = 96
    Top = 234
    Width = 128
    Height = 21
    TabOrder = 1
    OnKeyPress = DescriptionSearchKeyPress
  end
  object Barcodesearch: TJvEdit
    Left = 96
    Top = 258
    Width = 128
    Height = 21
    TabOrder = 4
    OnKeyPress = BarcodesearchKeyPress
  end
  object Button5: TButton
    Left = 224
    Top = 232
    Width = 83
    Height = 25
    Hint = 
      'This button wil give you the first instance of your Description ' +
      'search string'
    Caption = 'First Desc (F2)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 224
    Top = 256
    Width = 83
    Height = 25
    Caption = 'First Barc(F6)'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 306
    Top = 232
    Width = 84
    Height = 25
    Hint = 
      'This Button will give you the next item of your Description sear' +
      'ch string'
    Caption = 'Next Desc (F3)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 306
    Top = 256
    Width = 84
    Height = 25
    Caption = 'Next Barc (F7)'
    TabOrder = 6
    OnClick = Button8Click
  end
  object ExtDSearch: TJvEdit
    Left = 96
    Top = 282
    Width = 128
    Height = 21
    TabOrder = 7
    OnKeyPress = ExtDSearchKeyPress
  end
  object JvBitBtn1: TJvBitBtn
    Left = 224
    Top = 280
    Width = 83
    Height = 25
    Caption = 'First Ext D (F10)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn2: TJvBitBtn
    Left = 306
    Top = 280
    Width = 84
    Height = 25
    Caption = 'Next Ext D (F11)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn3: TJvBitBtn
    Left = 494
    Top = 283
    Width = 75
    Height = 23
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
    TabOrder = 10
    OnClick = JvBitBtn3Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object FilterOutOfStockCheck: TCheckBox
    Left = 393
    Top = 265
    Width = 136
    Height = 17
    Hint = 'Hide all items with no stock at any branch.'
    Caption = 'Filter out of Stock Items'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = FilterOutOfStockCheckClick
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 176
    object Shortcuts1: TMenuItem
      Caption = 'Shortcut'#39's'
      object DescSearch1: TMenuItem
        Caption = 'Desc Search'
        ShortCut = 112
        OnClick = DescSearch1Click
      end
      object FirstDesc1: TMenuItem
        Caption = 'First Desc'
        ShortCut = 113
        OnClick = FirstDesc1Click
      end
      object Nextdesc1: TMenuItem
        Caption = 'Next desc'
        ShortCut = 114
        OnClick = Nextdesc1Click
      end
      object BarcSearch1: TMenuItem
        Caption = 'List Focus'
        ShortCut = 115
        OnClick = BarcSearch1Click
      end
      object BarcSearch2: TMenuItem
        Caption = 'Barc Search'
        ShortCut = 116
        OnClick = BarcSearch2Click
      end
      object FirstBarc1: TMenuItem
        Caption = 'First Barc'
        ShortCut = 117
        OnClick = FirstBarc1Click
      end
      object NextBarc1: TMenuItem
        Caption = 'Next Barc'
        ShortCut = 118
        OnClick = NextBarc1Click
      end
      object ExtraDSearch1: TMenuItem
        Caption = 'Extra D Search'
        ShortCut = 120
        OnClick = ExtraDSearch1Click
      end
      object FirstExtD1: TMenuItem
        Caption = 'First Ext D'
        ShortCut = 121
        OnClick = FirstExtD1Click
      end
      object NextExtD1: TMenuItem
        Caption = 'Next Ext D'
        ShortCut = 122
        OnClick = NextExtD1Click
      end
      object CloseForm1: TMenuItem
        Caption = 'Close Form'
        ShortCut = 123
        OnClick = CloseForm1Click
      end
    end
  end
end
