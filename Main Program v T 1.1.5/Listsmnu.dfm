object ListsMenu: TListsMenu
  Left = 359
  Top = 159
  BorderIcons = [biSystemMenu]
  Caption = 'To do Menu'
  ClientHeight = 184
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 168
    Top = 159
    Width = 161
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
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object SyncStockwithHQ: TJvBitBtn
    Left = 167
    Top = 1
    Width = 161
    Height = 25
    Caption = 'Stock from HQ'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = SyncStockwithHQClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn2: TJvBitBtn
    Left = 0
    Top = 0
    Width = 161
    Height = 25
    Caption = 'Stock Reports'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn4: TJvBitBtn
    Left = 0
    Top = 32
    Width = 161
    Height = 25
    Caption = 'Invoice Lists'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = JvBitBtn4Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn5: TJvBitBtn
    Left = 0
    Top = 64
    Width = 161
    Height = 25
    Caption = 'Cash Up / End of Shift'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF3F3F00202020000000FFFFFFFFFFFFFFFFFF000000000000FFFF
      FF000000000000FFFFFFFFFFFFFFFFFFFFFFFF3F3F005F5F00BFBFBFB0B0B000
      0000FFFFFF0000003FBFBF60DFDF303030CFCFCFC0C0C0303030FFFFFFFFFFFF
      3F3F009F9F00505030B0B0B0BFBFBF4040402020200000006FEFEF6FEFEF6060
      60DFDFDFCFCFCF606060FFFFFF3F3F009F9F0080BF6060DF60205F004040007F
      7F00606060202020003F3F306F6F303030CFCFCFCFCFCF3030300000009F9F00
      70AF3060DF6060DF6050CF3050CF3050CF309F9F00606060202020FFFFFFFFFF
      FF000000000000FFFFFFFFFFFF0000009F9F0040BF0050CF3060DF6080BF6070
      AF3040BF009F9F00606060202020FFFFFF000000000000FFFFFF0000009F9F00
      7070309F9F0040BF0050CF3040BF0040BF0080800050CF309F9F006060602020
      20606060CFCFCF000000FFFFFF3F3F007FBF00508F309F9F0040BF0080800060
      9F0040BF0060DF6050CF309F9F00606060505050606060000000FFFFFFFFFFFF
      3F3F007FBF00407F009F9F0040BF00609F0080BF6080BF6060DF6070AF307FBF
      00606060202020FFFFFFFFFFFFFFFFFFFFFFFF3F3F007FBF00609F609F9F0040
      BF0050CF3060DF6080BF6050CF309F9F005F5F20202020FFFFFFFFFFFFFFFFFF
      0000000000003F3F007FBF00609F609F9F0040BF0060DF6080BF609F9F003F3F
      00606060FFFFFFFFFFFFFFFFFF003F3F6FEFEF3FBFBF0000003F3F007FBF0050
      8F309F9F0040BF009F9F005F5F009F9F005F5F20404040FFFFFFFFFFFF306F6F
      6FEFEF6FEFEF000000FFFFFF3F3F007FBF00407F009F9F005F5F008080009F9F
      00404040FFFFFFFFFFFFFFFFFF000000306F6F003F3F000000000000FFFFFF3F
      3F007FBF008080608080009F9F00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF606060CFCFCF000000FFFFFF3F3F007FBF009F9F00404040FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030606060000000FF
      FFFFFFFFFF3F3F00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = JvBitBtn5Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn6: TJvBitBtn
    Left = 0
    Top = 96
    Width = 161
    Height = 25
    Caption = 'Cashup Lists'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = JvBitBtn6Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object SyncTransactionswithHQButton: TJvBitBtn
    Left = 167
    Top = 32
    Width = 161
    Height = 25
    Caption = 'Sync Transactions with HQ'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = SyncTransactionswithHQButtonClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn3: TJvBitBtn
    Left = 0
    Top = 128
    Width = 161
    Height = 25
    Caption = 'Lay Buy Aging Run'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = JvBitBtn3Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn9: TJvBitBtn
    Left = 0
    Top = 159
    Width = 161
    Height = 25
    Caption = 'View System notes'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = JvBitBtn9Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn10: TJvBitBtn
    Left = 167
    Top = 64
    Width = 161
    Height = 25
    Caption = 'Debtor Aging Run'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = JvBitBtn10Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object StockTakeBtn: TJvBitBtn
    Left = 167
    Top = 96
    Width = 161
    Height = 25
    Caption = 'Stocktake'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = StockTakeBtnClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvProgressDialog1: TJvProgressDialog
    ShowCancel = False
    Smooth = True
    ScreenPosition = poDesktopCenter
    Left = 96
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 56
    object ExtraRuns1: TMenuItem
      Caption = 'Extra Runs'
      object RemoveallopenInvoices: TMenuItem
        Caption = 'Remove all open Invoices'
        OnClick = RemoveallopenInvoicesClick
      end
      object RemoveallopenPurchaseInvoices1: TMenuItem
        Caption = 'Remove all open Purchase Invoices'
        OnClick = RemoveallopenPurchaseInvoices1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MarkallBranchtransfersasnottransfered1: TMenuItem
        Caption = 'Mark all Branch transfers as not transfered and open them'
        OnClick = MarkallBranchtransfersasnottransfered1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object OpenallpurchaseInvoices1: TMenuItem
        Caption = 'Open all purchase Invoices'
        OnClick = OpenallpurchaseInvoices1Click
      end
    end
    object OneTimeFixes1: TMenuItem
      Caption = 'One Time Fixes'
      object FixBranchStockQtys: TMenuItem
        Caption = 'Fix Branch Stock Qty'#39's'
        OnClick = FixBranchStockQtysClick
      end
      object estWhichInvoicesdidntgotoHQ1: TMenuItem
        Caption = 'Compare Invoice'#39's to HQ'
        Visible = False
        OnClick = estWhichInvoicesdidntgotoHQ1Click
      end
      object SpecialLayBuyFix1: TMenuItem
        Caption = 'Special Lay Buy Fix'
        Visible = False
        OnClick = SpecialLayBuyFix1Click
      end
      object SpecialRequisitionFix1: TMenuItem
        Caption = 'Special Requisition Fix'
        Visible = False
        OnClick = SpecialRequisitionFix1Click
      end
      object LaybVFix1: TMenuItem
        Caption = 'LaybV Fix'
        Visible = False
        OnClick = LaybVFix1Click
      end
      object MakeHQBranchstockthesameasLocalstock1: TMenuItem
        Caption = 'Make HQ Branch stock the same as Local Branch stock'
        Visible = False
        OnClick = MakeHQBranchstockthesameasLocalstock1Click
      end
      object SpecialcreateHQpurcinvwithlocalstockqty1: TMenuItem
        Caption = 
          'Special create HQ Stock , Purc inv and Closed Stock Transfer wit' +
          'h local stock qty'
        Visible = False
        OnClick = SpecialcreateHQpurcinvwithlocalstockqty1Click
      end
      object SpecialcreateHQStockPurchinvandStockTransferwithStocktake1: TMenuItem
        Caption = 
          'Special create HQ Stock, Purch inv and Open Stock Transfer with ' +
          'Stock take'
        Visible = False
        OnClick = SpecialcreateHQStockPurchinvandStockTransferwithStocktake1Click
      end
      object DeleteOldBranch21: TMenuItem
        Caption = 'Delete Old Branch 2'
        Visible = False
        OnClick = DeleteOldBranch21Click
      end
    end
  end
end
