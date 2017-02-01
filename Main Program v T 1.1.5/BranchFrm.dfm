object BranchForm: TBranchForm
  Left = 410
  Top = 147
  BorderIcons = [biSystemMenu]
  Caption = 'Branch Setup'
  ClientHeight = 313
  ClientWidth = 425
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvSpeedButton1: TJvSpeedButton
    Left = 344
    Top = 16
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    NumGlyphs = 2
    OnClick = JvSpeedButton1Click
  end
  object JvSpeedButton2: TJvSpeedButton
    Left = 368
    Top = 16
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    NumGlyphs = 2
    OnClick = JvSpeedButton2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 337
    Height = 49
    Caption = 'Search for Branch'
    TabOrder = 0
    object JvEdit1: TJvEdit
      Left = 8
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 168
      Top = 16
      Width = 81
      Height = 25
      Caption = 'Branch Name'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Branch No'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 56
    Width = 297
    Height = 257
    Caption = 'Branch Detail'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 54
      Width = 68
      Height = 13
      Caption = 'Branch Name:'
    end
    object Label2: TLabel
      Left = 8
      Top = 78
      Width = 40
      Height = 13
      Caption = 'Contact:'
    end
    object Label3: TLabel
      Left = 8
      Top = 102
      Width = 19
      Height = 13
      Caption = 'Adr:'
    end
    object Label4: TLabel
      Left = 8
      Top = 174
      Width = 18
      Height = 13
      Caption = 'Tel:'
    end
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 65
      Height = 13
      Caption = 'Branch No:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 96
      Top = 24
      Width = 65
      Height = 17
      DataField = 'Nr'
      DataSource = DataForm2.BranchSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 198
      Width = 95
      Height = 13
      Caption = 'Branch Inv No start:'
    end
    object JvSpeedButton3: TJvSpeedButton
      Left = 257
      Top = 224
      Width = 25
      Height = 25
      Hint = 'Delete Branch'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFBFBFFF3F3FFF0000FF0000FF0000FF0000FF0000FF0000FF3F3FFFBFBF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF3F3FFF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF3F3FFFFFFFFFFFFFFFFFFFFF3F3FFF
        0000FF0000FF0000FF3F3FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF0000FF0000
        FF0000FF3F3FFFFFFFFFBFBFFF0000FF0000FF0000FF0000FF0000FFBFBFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FFF0000FF0000FFBFBFFF3F3FFF0000FF
        0000FF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000FF0000FF3F3FFF0000FF0000FF7F7FFF3F3FFF0000FF0000FF0000FF00
        00FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF0000FF0000FF0000FF0000FF
        FFFFFFFFFFFF3F3FFF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF3F3FFF0000FF00
        00FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF
        FFFFFFFFFFFFFFFFFFFFFFFF3F3FFF0000FF0000FF0000FF0000FFBFBFFFFFFF
        FFFFFFFF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF3F
        3FFF0000FF0000FF0000FF0000FFBFBFFFBFBFFF0000FF0000FF0000FF0000FF
        3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FFF0000FF0000FF0000FF0000
        FF3F3FFF0000FF0000FF7F7FFF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF3F3FFF0000FF0000FF0000FF0000FF0000FF7F7FFFFFFFFF0000FF
        0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FFF0000FF0000
        FF0000FF0000FFFFFFFFFFFFFFBFBFFF0000FF0000FF0000FF3F3FFFBFBFFFFF
        FFFFFFFFFFBFBFFF3F3FFF0000FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFF
        BFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF0000FF0000FF00
        00FF0000FF0000FF0000FF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton3Click
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 48
      Width = 193
      Height = 21
      DataField = 'Name'
      DataSource = DataForm2.BranchSource
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 72
      Width = 193
      Height = 21
      DataField = 'Contact'
      DataSource = DataForm2.BranchSource
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 96
      Width = 193
      Height = 21
      DataField = 'Adr1'
      DataSource = DataForm2.BranchSource
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 88
      Top = 120
      Width = 193
      Height = 21
      DataField = 'Adr2'
      DataSource = DataForm2.BranchSource
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 88
      Top = 144
      Width = 153
      Height = 21
      DataField = 'Adr3'
      DataSource = DataForm2.BranchSource
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 240
      Top = 144
      Width = 41
      Height = 21
      DataField = 'PCode'
      DataSource = DataForm2.BranchSource
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 88
      Top = 168
      Width = 153
      Height = 21
      DataField = 'Tel'
      DataSource = DataForm2.BranchSource
      TabOrder = 6
    end
    object Button3: TButton
      Left = 16
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 8
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 96
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 9
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 176
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Insert'
      TabOrder = 10
      OnClick = Button5Click
    end
    object DBEdit8: TDBEdit
      Left = 112
      Top = 192
      Width = 105
      Height = 21
      DataField = 'StartInvNo'
      DataSource = DataForm2.BranchSource
      TabOrder = 7
    end
  end
  object Button6: TButton
    Left = 304
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Transfer Branch Stock'
    TabOrder = 2
    OnClick = Button6Click
  end
  object JvBitBtn1: TJvBitBtn
    Left = 304
    Top = 288
    Width = 121
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
    TabOrder = 3
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 200
    object Edit1: TMenuItem
      Caption = 'Edit'
      object DeleteAllinvoicesandlaybuysforthisbranch1: TMenuItem
        Caption = 'Delete All invoices and lay buys for this branch'
        OnClick = DeleteAllinvoicesandlaybuysforthisbranch1Click
      end
    end
    object ExtraRuns1: TMenuItem
      Caption = 'Extra Runs'
      object FixDuplicateBranchStockatHQ1: TMenuItem
        Caption = 'Fix Duplicate Branch Stock at HQ'
        OnClick = FixDuplicateBranchStockatHQ1Click
      end
    end
  end
end
