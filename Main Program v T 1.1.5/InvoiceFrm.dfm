object InvoiceForm: TInvoiceForm
  Left = 190
  Top = 109
  Caption = 'Point of Sale'
  ClientHeight = 528
  ClientWidth = 760
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 29
    Width = 711
    Height = 157
    Caption = 'Invoice Detail (F1 to go ahead to Add Products)'
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 42
      Width = 83
      Height = 13
      Caption = 'Name (Required):'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 95
      Height = 13
      Caption = 'Vat No: (if available)'
    end
    object Label4: TLabel
      Left = 8
      Top = 86
      Width = 53
      Height = 13
      Caption = 'Invoice By:'
    end
    object Label5: TLabel
      Left = 454
      Top = 19
      Width = 41
      Height = 13
      Caption = 'Address:'
    end
    object Label6: TLabel
      Left = 315
      Top = 86
      Width = 32
      Height = 13
      Caption = 'Tel W:'
    end
    object Label7: TLabel
      Left = 508
      Top = 86
      Width = 28
      Height = 13
      Caption = 'Tel C:'
    end
    object Label8: TLabel
      Left = 323
      Top = 42
      Width = 64
      Height = 13
      Caption = 'Invoice Date:'
    end
    object Label14: TLabel
      Left = 8
      Top = 19
      Width = 74
      Height = 13
      Caption = 'Choose Debtor:'
    end
    object Label23: TLabel
      Left = 446
      Top = 110
      Width = 32
      Height = 13
      Caption = 'E Mail:'
    end
    object JvSpeedButton8: TJvSpeedButton
      Left = 294
      Top = 13
      Width = 23
      Height = 25
      Hint = 'Search for Debtor (F10)'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000230B0000230B00000000000000000000DADBF56166D6
        4249CF2C34C9242CC61C24C01D25BC1B23B5333AB2A4A7D29498D87D81D49FA3
        D8DFDFE3FAFAF9FFFFFF363DCB1D25C91D25CC1D25CD1D25CA1D25C61D25C137
        3EBF9CA0DA212AC7161FC92931CB161FC72F37C8BDC0D9FCFCFB2E35CE232BD1
        1D25D21D25D31D25D11D25CC1921C59CA0D83F47D01720CE8F94E9E8E9F6373E
        CD1B24CC2E37C7E0E1E56469DD282FD51C24D51D25D61A22D4212AC83F46C07E
        84D8454DD59095EAFFFFFFFFFFFFE5E6F5353DCD161FC79A9DD3DBDDF82C34D7
        1D25D72A32CB7E80A3B1B1B3C3C3BE6268D5888DE5FDFDFDC6C8EDF0F1F8D3D5
        F2DFE0F11C25C47A7FCEFFFFFFCCCEF5383FDD676A9ED7D7D7E9E9E9EBEBE770
        75D54B52D7767BDF8A8EE9ECEDF52C33D15057D52831CC9295D1FFFFFFFFFFFF
        ECEDFBB8BAEAD8D8D9DDDDDEDFDFDEADAFD9424AD1484FDA9195EBECECF54249
        D3484FD7464ECFD1D2DEFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1F5F5F6F7F7F7E7
        E8E68085D54249D16D72DE9A9EE5464DD0434BCF9FA2D3F9F9F7FFFFFFFFFFFF
        FFFFFFF7F7F7EEEEEEF0F0F0F0F0F0EDEDEDE6E6E4AEB1D96E73D25F65D1777C
        D1BFC1D8F3F3F1FFFFFFFFFFFFFFFFFFFCFCFCE5E5E5E4E4E5E6E6E7E7E7E7E4
        E4E4DFDFE0F1F1F1EEEFEBE9EAE5EFEFECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E8E9E9DDDDDEDBDBDBDDDDDEDDDDDEDBDBDCDADADAB8B9BAF7F7F7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A4A5CBCCCCD2D2D3D5D5D5CECECFAF
        AFB1939496636568CACACBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9394968D8D8FB5B5B6AEAEAF696A6D595A5D51535647494CB5B6B7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABACAC87888987888A7677796B6C6E63
        646656585B4C4D51E5E5E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E8E8E8898A8B80818378797A72737567686A555759A4A6A7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDFDF9B9B9D7D7E7F71727475
        7678B1B1B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton8Click
    end
    object DBText3: TDBText
      Left = 16
      Top = 135
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'ShiftSet'
      DataSource = DataForm2.InvoiceSource
    end
    object DBText4: TDBText
      Left = 136
      Top = 135
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'SyncHQ'
      DataSource = DataForm2.InvoiceSource
    end
    object DBText5: TDBText
      Left = 263
      Top = 135
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'CUSet'
      DataSource = DataForm2.InvoiceSource
    end
    object Label25: TLabel
      Left = 446
      Top = 135
      Width = 37
      Height = 13
      Caption = 'Ref No:'
    end
    object DBEdit1: TDBEdit
      Left = 105
      Top = 38
      Width = 171
      Height = 21
      DataField = 'ClientName'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 2
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit2: TDBEdit
      Left = 105
      Top = 60
      Width = 171
      Height = 21
      DataField = 'ClientVatNo'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 3
      OnKeyPress = DBEdit2KeyPress
    end
    object DBEdit3: TDBEdit
      Left = 105
      Top = 82
      Width = 111
      Height = 21
      DataField = 'InvBy'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 4
      OnKeyPress = DBEdit3KeyPress
    end
    object DBEdit4: TDBEdit
      Left = 508
      Top = 15
      Width = 188
      Height = 21
      DataField = 'ClientAdr1'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 6
      OnKeyPress = DBEdit4KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 508
      Top = 38
      Width = 188
      Height = 21
      DataField = 'ClientAdr2'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 7
      OnKeyPress = DBEdit5KeyPress
    end
    object DBEdit6: TDBEdit
      Left = 508
      Top = 60
      Width = 143
      Height = 21
      DataField = 'ClientAdr3'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 8
      OnKeyPress = DBEdit6KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 651
      Top = 60
      Width = 45
      Height = 21
      DataField = 'ClientPCode'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 9
      OnKeyPress = DBEdit7KeyPress
    end
    object DBEdit8: TDBEdit
      Left = 352
      Top = 82
      Width = 143
      Height = 21
      DataField = 'ClientTelW'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 10
      OnKeyPress = DBEdit8KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 553
      Top = 82
      Width = 143
      Height = 21
      DataField = 'ClientTelC'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 11
      OnKeyPress = DBEdit9KeyPress
    end
    object InvoiceDateEdit: TJvDateTimePicker
      Left = 404
      Top = 38
      Width = 91
      Height = 21
      Date = 38954.547999849540000000
      Format = 'yyyy/MM/dd'
      Time = 38954.547999849540000000
      TabOrder = 5
      OnChange = InvoiceDateEditChange
      OnKeyPress = InvoiceDateEditKeyPress
      DropDownDate = 38954.000000000000000000
      NullText = 'No Date'
    end
    object Button2: TButton
      Left = 608
      Top = 129
      Width = 101
      Height = 25
      Caption = 'Add Products (Exit)'
      TabOrder = 14
      OnClick = Button2Click
    end
    object DBEdit10: TDBEdit
      Left = 323
      Top = 15
      Width = 91
      Height = 21
      TabStop = False
      DataField = 'GLDebNo'
      DataSource = DataForm2.InvoiceSource
      ReadOnly = True
      TabOrder = 1
      OnExit = DBEdit10Exit
      OnKeyPress = DBEdit10KeyPress
    end
    object DBEdit14: TDBEdit
      Left = 486
      Top = 106
      Width = 210
      Height = 21
      DataField = 'ClientEMail'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 12
      OnKeyPress = DBEdit14KeyPress
    end
    object DBEdit15: TDBEdit
      Left = 486
      Top = 131
      Width = 121
      Height = 21
      DataField = 'RefNo'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 13
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 105
      Top = 14
      Width = 181
      Height = 23
      DataField = 'GLDebNo'
      DataSource = DataForm2.InvoiceSource
      LookupField = 'GLDebNo'
      LookupDisplay = 'CompanyName'
      LookupSource = DataForm2.DebtorInvListSource
      TabOrder = 0
      OnChange = JvDBLookupCombo1Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 298
    Top = 29
    Width = 179
    Height = 100
    Caption = 'Password'
    TabOrder = 6
    Visible = False
    object Label16: TLabel
      Left = 8
      Top = 15
      Width = 53
      Height = 13
      Caption = 'UserName:'
    end
    object Label17: TLabel
      Left = 8
      Top = 54
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object JvSpeedButton6: TJvSpeedButton
      Left = 131
      Top = 67
      Width = 24
      Height = 24
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = JvSpeedButton6Click
    end
    object Edit2: TEdit
      Left = 8
      Top = 31
      Width = 115
      Height = 21
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 8
      Top = 67
      Width = 115
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = Edit3KeyPress
    end
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 760
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 24
    BtnHeight = 23
    TabOrder = 0
    InternalVer = 1
    object InsertButton: TJvSpeedButton
      Left = 7
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Insert Invoice'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = InsertButtonClick
    end
    object EditButton: TJvSpeedButton
      Left = 31
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Edit Invoice Details'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = EditButtonClick
    end
    object UndoButton: TJvSpeedButton
      Left = 152
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Undo Invoice Changes'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      Visible = False
      OnClick = UndoButtonClick
    end
    object SaveButton: TJvSpeedButton
      Left = 55
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Save Invoice'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
        055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
        305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
        30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
        3055577777555557F7F555000555555999555577755555577755}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      Visible = False
      OnClick = SaveButtonClick
    end
    object JvSpeedButton1: TJvSpeedButton
      Left = 184
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Previous Invoice (Ctrl P)'
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
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = JvSpeedButton1Click
    end
    object JvSpeedButton2: TJvSpeedButton
      Left = 208
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Next Invoice (Ctrl N)'
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
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = JvSpeedButton2Click
    end
    object PrintButton: TJvSpeedButton
      Left = 84
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Print Invoice'
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
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Visible = False
      OnClick = PrintButtonClick
    end
    object JvSpeedButton4: TJvSpeedButton
      Left = 238
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Invoice Detail (F12)'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF30AFDF60DF3F00
        3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F3F00202000
        0000FFFFFF3F003F606060C0C0C03F003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF003F3F00BFBF005F5F7FBFBF000000FFFFFF606060C0C0C00000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F3F00BFBF00BFBF005F5FBF
        FFFFBFBFBF000000606060C0C0C0909090000000FFFFFFFFFFFFFFFFFFFFFFFF
        003F3F00BFBF00BFBF00BFBF005F5FBFFFFFBFFFFF7FBFBF606060C0C0C0C0C0
        C0909090000000FFFFFFFFFFFF003F3F00BFBF00BFBF00BFBF00BFBF005F5FBF
        FFFFBFFFFF7F7F7F6F6F6FC0C0C0606060909090000000FFFFFF003F3F00BFBF
        00BFBF00BFBF00BFBF00BFBF005F5FBFFFFF7F7F7FFFFFFFBFBFBF9090907F7F
        7FBFBFBF000000FFFFFF005F5F00BFBF00BFBF00BFBF00BFBF007F7F7FDFDF7F
        7F7FFFFFFFFFBFBFFFBFBF3F003F7F7F7FFFFFFFBFBFBF000000005F5F00BFBF
        00BFBF007F7F005F5F7FDFDF7F7F7FFFFFFFFFBFBFFFBFBFFFBFBFFFBFBFFFBF
        BFFFBFBFFFFFFF3F3F3F005F5F00BFBF005F5F009F9F7FDFDF7F7F7FFFFFFFFF
        BFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFFFF005F5F005F5F
        0000003F9F9FBFBFBFBFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFFF
        FF3F3F3FFFFFFFFFFFFF005F5F003F3FFFFFFF0000007FBFBF7FBFBFBFBFBFFF
        BFBFFFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFFFFFFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFF0000003F3F3F000000BFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000BFBFBFFFFFFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000003F3F3FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton4Click
    end
    object JvSpeedButton5: TJvSpeedButton
      Left = 276
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Su Login (F8)'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = JvSpeedButton5Click
    end
    object JvSpeedButton7: TJvSpeedButton
      Left = 301
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Su Disable (F9)'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
        3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
        B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
        33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
        000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
        033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
        BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
        33B33733333773333373B333333B3333333B7333333733333337}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      NumGlyphs = 2
      OnClick = JvSpeedButton7Click
    end
    object Label1: TLabel
      Left = 566
      Top = 7
      Width = 62
      Height = 14
      Caption = 'Invoice No:'
    end
    object DBText1: TDBText
      Left = 690
      Top = 7
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'InvNo'
      DataSource = DataForm2.InvoiceSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvSpeedButton10: TJvSpeedButton
      Left = 343
      Top = 1
      Width = 25
      Height = 24
      Hint = 'Find Invoice (Ctrl F)'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6060
        60505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFBFBFBF606060808080BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF606060808080BFBF
        BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F7F7F7F9F9F9FFF
        FFFFBFBFBF606060808080BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFBF404040606060404040606060404040404040808080BFBFBFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6060605F5F5FBFBFBFFFFFFFBFBFBF5F
        5F5F6060607F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
        404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050506F6F6FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4040407F7F7FBFBFBFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7F606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040
        7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F606060FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF6060605F5F5FBFBFBFBFBFBF7F7F7FFFFFFFFF
        FFFF6F6F6F606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
        808080BFBFBFBFBFBFFFFFFFFFFFFFBFBFBF9090907F7F7FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F9090906F6F6F7F7F7F6F6F6F90
        90906F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7F8080806060608080807F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton10Click
    end
    object DBText6: TDBText
      Left = 630
      Top = 7
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'BranchNo'
      DataSource = DataForm2.InvoiceSource
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 680
      Top = 7
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvSpeedButton11: TJvSpeedButton
      Left = 115
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Print Quote (Ctrl Q)'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000030303040404040404040404040404040404040
        4040404040404040404040404040404040303030000000000000202020000000
        BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF808080808080BFBFBFDFDF
        DF00000000000000000000000000003F00003F9F9F9FDFDFDFDFDFDFA0A0A0A0
        A0A0A0A0A0BFBFBFDFDFDFEFEFEFFFFFFF00000000000000000020202000003F
        00007F00007F808080A0A0A0A0A0A0A0A0A0A0A0A0DFDFDFDFDFDFEFEFEFFFFF
        FF00000000000000000020202000003F00007F0000BF505050A0A0A0A0A0A0A0
        A0A0DFDFDFDFDFDFDFDFDFEFEFEFFFFFFF00000000000000000000000000003F
        00007F0000BF505050A0A0A0A0A0A0DFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFF
        FF00000000000000000020202000003F00007F0000BF5050506F6F6F9F9F9FDF
        DFDF9F9F9F606060606060AFAFAF7F7F7F7F00BF7F00FF00003F20202000003F
        00007F0000BF6F6F6FAFAFAF0000007F7F7FBFBFBFFFFFFFFFFFFFAFAFAFAFAF
        AFAFAFAF7F00BF3F007F00000000003F00007F0000BF6F6F6FDFDFDF6F6F6F3F
        003F3F3F3F606060FFFFFFFFFFFFFFFFFFFFFFFF3F007F3F007F20202000007F
        00007F0000BF6F6F6FDFDFDF6F6F6F9F9F9F7F007F606060FFFFFFFFFFFFFFFF
        FFBFBFBF00003F3F003F0000000000000000BF0000BF0000000000000000003F
        3F3F9F9F9F7F007FBFBFBFFFFFFF3F3F3F000000000000000000000000000000
        0000000000BF0000000000000000000000003F3F3F3F3F3F7F007F0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000007F007F000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000007F00
        7F00000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000003F003F000000000000}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton11Click
    end
    object DBText2: TDBText
      Left = 468
      Top = 7
      Width = 48
      Height = 14
      AutoSize = True
      DataField = 'InvClose'
      DataSource = DataForm2.InvoiceSource
    end
    object Label18: TLabel
      Left = 392
      Top = 7
      Width = 60
      Height = 14
      Caption = 'Inv Status:'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 40
    Width = 760
    Height = 88
    Caption = 'Prices'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object Total: TLabel
      Left = 16
      Top = 15
      Width = 80
      Height = 31
      Caption = 'Total'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -27
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object VAT: TLabel
      Left = 16
      Top = 42
      Width = 21
      Height = 13
      Caption = 'VAT'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Change: TLabel
      Left = 360
      Top = 13
      Width = 96
      Height = 31
      Caption = 'Change'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -27
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DescDisp: TLabel
      Left = 16
      Top = 54
      Width = 128
      Height = 31
      Caption = 'DescDisp'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -27
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 459
    Width = 656
    Height = 50
    Caption = 
      'Press F2 to Pay and Enter to Accept Money. To Split Payment Pres' +
      's '#39'Page Down'#39
    TabOrder = 3
    object Label12: TLabel
      Left = 2
      Top = 27
      Width = 27
      Height = 13
      Caption = 'Cash:'
    end
    object Label15: TLabel
      Left = 249
      Top = 27
      Width = 45
      Height = 13
      Caption = 'Cheques:'
    end
    object CreditCartLabel: TLabel
      Left = 111
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Credit Card:'
    end
    object Label22: TLabel
      Left = 379
      Top = 27
      Width = 29
      Height = 13
      Caption = 'Other:'
    end
    object LayBuyBtn: TJvBitBtn
      Left = 578
      Top = 8
      Width = 75
      Height = 20
      Hint = 'Convert Invoice to Lay Buy'
      Caption = 'Lay Buy (F6)'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = LayBuyBtnClick
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object CashEdit: TJvValidateEdit
      Left = 35
      Top = 23
      Width = 75
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 0
      OnEnter = CashEditEnter
      OnExit = CashEditExit
      OnKeyDown = CashEditKeyDown
      OnKeyPress = CashEditKeyPress
    end
    object CreditCardEdit: TJvValidateEdit
      Left = 169
      Top = 23
      Width = 75
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 1
      OnEnter = CreditCardEditEnter
      OnExit = CreditCardEditExit
      OnKeyDown = CreditCardEditKeyDown
      OnKeyPress = CreditCardEditKeyPress
    end
    object ChequesEdit: TJvValidateEdit
      Left = 299
      Top = 23
      Width = 75
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
      OnEnter = ChequesEditEnter
      OnExit = ChequesEditExit
      OnKeyDown = ChequesEditKeyDown
      OnKeyPress = ChequesEditKeyPress
    end
    object OtherEdit: TJvValidateEdit
      Left = 418
      Top = 23
      Width = 75
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 3
      OnEnter = OtherEditEnter
      OnExit = OtherEditExit
      OnKeyDown = OtherEditKeyDown
      OnKeyPress = OtherEditKeyPress
    end
    object Button1: TJvBitBtn
      Left = 578
      Top = 28
      Width = 75
      Height = 20
      Hint = 'Print Invoice'
      Caption = 'Print Inv'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Button1Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn6: TJvBitBtn
      Left = 503
      Top = 28
      Width = 75
      Height = 20
      Caption = 'Save Inv'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = JvBitBtn6Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvBitBtn7: TJvBitBtn
      Left = 503
      Top = 8
      Width = 75
      Height = 20
      Hint = 'Print Quote (Ctrl Q)'
      Caption = 'Print Quote'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = JvBitBtn7Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object JvGroupBox1: TJvGroupBox
    Left = 0
    Top = 124
    Width = 760
    Height = 296
    Hint = 'Invoice Items'
    TabOrder = 1
    object Label9: TLabel
      Left = 14
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Barcode: (F1)'
    end
    object SearchButton: TJvSpeedButton
      Left = 358
      Top = 10
      Width = 24
      Height = 24
      Hint = 'Search Stock'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFF202020404040404040202020FFFFFFFFFFFFFFFFFFFFFFFF4040404040
        40404040FFFFFFFFFFFFFFFFFFFFFFFF000000505050505050505050909090FF
        FFFFFFFFFFFFFFFF202020505050505050808080404040FFFFFFFFFFFFFFFFFF
        0000006060606F6F6F000000909090FFFFFFFFFFFFFFFFFF000000DFDFDF0000
        00505050404040FFFFFFFFFFFFFFFFFF0000006060606F6F6F00000090909040
        4040404040404040000000DFDFDF000000505050606060FFFFFFFFFFFFFFFFFF
        2020203030303030300000005050505050508080805050500000006F6F6F0000
        00505050A0A0A0606060FFFFFF3030303030300000006F6F6F00000000000000
        00002020206F6F6F000000000000000000303030808080909090003F3F9FDFDF
        6F6F6F000000606060000000000000C0C0C00000006060600000000000000000
        00306F6F5050509090903F7F7F7FFFFF7FFFFF3F3F3F30303000000000000060
        60600000003030300000000000000000007FBFBF5050509090903F7F7F7FFFFF
        7FFFFF7FFFFF3F7F7F3030300000000000003F7F7F3030300000000000007FFF
        FF7FFFFF5050509090903F7F7F7FFFFF7FFFFF7FFFFF7FFFFF3030303030303F
        7F7F7FFFFF3030303030303F7F7F7FFFFF7FFFFF5050509090903F7F7F7FFFFF
        7FFFFF7FFFFF7FFFFF3030303030303F7F7F7FFFFF3030303030303F7F7F7FFF
        FF7FFFFF5050509090903F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F
        FFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF5050509090903F7F7F7FFFFF
        7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFF
        FF7FFFFF4040402020203F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F
        FFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF205F5F202020FFFFFF0000003F3F00
        7F7F007F7F007F7F007F7F007F7F000000000000000000000000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F007F7F007F7F007F7F003F3F00FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = SearchButtonClick
    end
    object Label11: TLabel
      Left = 233
      Top = 16
      Width = 117
      Height = 13
      Caption = 'Press F3 to search stock'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 422
      Top = 16
      Width = 74
      Height = 13
      Caption = 'Press F2 to Pay'
    end
    object CloseInvButton: TJvSpeedButton
      Left = 508
      Top = 10
      Width = 24
      Height = 24
      Hint = 'Close Invoice'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        00000000FFFFFFFFFFFF0000000000000000007F7F7F3F3F3F00000000000000
        00000000000000000000003F3F3F7F7F7F00000000000000000000009F0000BF
        0000203F3F3F00000000007F0000BF0000BF0000BF0000BF00007F0000003F3F
        3F0000200000BF00009F003FBF0000FF0000DF00004000007F0000FF0000FF00
        00FF0000FF0000FF0000FF00007F0000400000DF0000BF0000200000400000FF
        0000FF0000FF0000FF0000FF0000FF3F3FFF3F3FFF0000FF0000FF0000DF0000
        BF000040FFFFFFFFFFFFFFFFFF0000400000406F6FAFEFEFEF0000BF0000BFFF
        FFFFFFFFFFCFCFCF707070202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        000000FFFFFF3F3F7F00009F00009F7F7FBF505070202020FFFFFF2020200000
        00FFFFFFFFFFFFFFFFFF2020205F5F5F0000003F3F3F505050202020FFFFFFFF
        FFFFFFFFFFFFFFFF2020205F9F9F000000FFFFFFFFFFFFFFFFFFBFBFBF7F7F7F
        AFAFAF000000303030000000202020FFFFFFFFFFFF2020205F9F9F000000FFFF
        FFFFFFFFFFFFFFFFFFFFBFBFBF3F3F3FBFBFBF606060EFEFEF3F3F3FFFFFFF7F
        7F7F2020205F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        2020203F3F3FAFAFAF3F3F3FFFFFFFDFDFDF5F9F9F000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000009090903F3F3F3F3F3F3F3F3F0000005F5F5F5F
        9F9F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040DFDFDF
        7F7F7FFFFFFFFFFFFF5F5F5F5F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000003F3F3FDFDFDF5F9F9F000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000002020205F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF407F7F000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = CloseInvButtonClick
    end
    object Label13: TLabel
      Left = 540
      Top = 16
      Width = 118
      Height = 13
      Caption = 'Press F4 for Qty or Desc.'
    end
    object JvSpeedButton3: TJvSpeedButton
      Left = 663
      Top = 10
      Width = 24
      Height = 24
      Hint = 'Press to go change Qty or Description.'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000303030404040
        4040404040404040404040404040404040403030307F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F3F3F3F7F7F7FBFBFBFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A080
        8080404040B0B0B0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C07F7F7F7F7F7FDFDFDF
        C0C0C0FF7F7FFF7F7FEFAFAFC0C0C0808080404040A0A0A0CF9090FF7F7FFF7F
        7FFF7F7FCFCFCF7F7F7F7F7F7FDFDFDFC0C0C0CFCFCFEF6F6FFF7F7FC0C0C080
        8080404040A0A0A0CF9090FF7F7FFF7F7FFF7F7FCFCFCF7F7F7F7F7F7FDFDFDF
        C0C0C0EFAFAFFF3F3FEFAFAFC0C0C0808080404040A0A0A0DF6060FF0000FF00
        00FF0000DFDFDF7F7F7F7F7F7FDFDFDFC0C0C0DF6060DF6060DF9F9FC0C0C080
        8080404040A0A0A0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C07F7F7F7F7F7FEFEFEF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDF909090404040909090A0A0A0A0A0A0A0A0
        A0A0A0A0B0B0B07F7F7F3F3F3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6F
        6F6F2020204040404040404040404040404040404040403030306F6F6F909090
        8080808080808080808080808080808080806F6F6F9090908080808080808080
        808080808080804040407F7F7FDFDFDFC0C0C0DFDFDFDFDFDFC0C0C0CFCFCF80
        80807F7F7FDFDFDFCFCFCFDFDFDFDFDFDFC0C0C0A0A0A04040407F7F7FDFDFDF
        C0C0C0EF3030FF3F3FCFCFCFC0C0C08080807F7F7FDFDFDFDF6060FF3F3FDF60
        60CFCFCFA0A0A04040407F7F7FDFDFDFC0C0C0DF6060FF7F7FC0C0C0C0C0C080
        80807F7F7FDFDFDFC0C0C0EF3030EFAFAFC0C0C0A0A0A04040407F7F7FDFDFDF
        C0C0C0FF3F3FFF7F7FC0C0C0C0C0C08080807F7F7FDFDFDFCF9090DF9F9FFF00
        00DFDFDFA0A0A04040407F7F7FDFDFDFC0C0C0CF9090DF9F9FC0C0C0C0C0C080
        80807F7F7FDFDFDFC0C0C0DF6060DF9F9FC0C0C0A0A0A04040407F7F7FEFEFEF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9090907F7F7FEFEFEFDFDFDFDFDFDFDFDF
        DFDFDFDFBFBFBF4040403F3F3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6F
        6F6F3F3F3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F303030}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton3Click
    end
    object JvSpeedButton9: TJvSpeedButton
      Left = 724
      Top = 10
      Width = 25
      Height = 24
      Hint = 'Print Invoice Item Barcodes'
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
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton9Click
    end
    object JvSpeedButton12: TJvSpeedButton
      Left = 693
      Top = 10
      Width = 24
      Height = 24
      Hint = 'Add Comment line on Invoice (F11)'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F3F3F3F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F3F3F3FFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7FBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FBFBFBFBFBFBF7F7F7F5F5F5FBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F
        BFBFBFBFBFBFFFFFFF3F9F9F3F9F9FFFFFFFFFFFFFFFFFFFBFBFBFFFFFFF7F7F
        7FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FBFBFBFFFFFFFFFFFFF007F7F007F7FFF
        FFFFBFBFBFBFBFBFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
        7F7F7F7F7F7F7F7F7F007F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF007F7F007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF007F7F007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF003F3F003F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F3F003F3FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton12Click
    end
    object Edit1: TEdit
      Left = 95
      Top = 12
      Width = 132
      Height = 21
      Hint = 'Barcode Edit box.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = Edit1Enter
      OnKeyPress = Edit1KeyPress
    end
    object InvoiceItemGrid: TJvDBGrid
      Left = 0
      Top = 36
      Width = 760
      Height = 256
      Hint = 'Invoice Items, Press '#39'F1'#39' to return to add Product'
      DataSource = DataForm2.InvoiceItemSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = InvoiceItemGridDrawColumnCell
      OnEnter = InvoiceItemGridEnter
      OnExit = InvoiceItemGridExit
      OnKeyDown = InvoiceItemGridKeyDown
      OnKeyPress = InvoiceItemGridKeyPress
      AutoAppend = False
      AlternateRowColor = clInfoBk
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
          FieldName = 'ItemOrder'
          ReadOnly = True
          Title.Caption = 'Item Order'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Description'
          Width = 206
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TCStockNo'
          ReadOnly = True
          Title.Caption = 'Stock No'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Price'
          ReadOnly = True
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SellingPrice'
          Title.Caption = 'Full Price'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Comment'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Discount'
          ReadOnly = True
          Title.Caption = 'Discount %'
          Width = 80
          Visible = True
        end>
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 420
    Width = 760
    Height = 38
    Caption = 'POS Additions (F5)'
    TabOrder = 2
    object Label19: TLabel
      Left = 8
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label20: TLabel
      Left = 215
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Tel C:'
    end
    object Label21: TLabel
      Left = 405
      Top = 16
      Width = 32
      Height = 13
      Caption = 'E Mail:'
    end
    object DBEdit11: TDBEdit
      Left = 50
      Top = 12
      Width = 159
      Height = 21
      DataField = 'ClientName'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 0
      OnEnter = DBEdit11Enter
      OnKeyPress = DBEdit11KeyPress
    end
    object DBEdit12: TDBEdit
      Left = 255
      Top = 12
      Width = 143
      Height = 21
      DataField = 'ClientTelC'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 1
      OnKeyPress = DBEdit12KeyPress
    end
    object DBEdit13: TDBEdit
      Left = 445
      Top = 12
      Width = 196
      Height = 21
      DataField = 'ClientEMail'
      DataSource = DataForm2.InvoiceSource
      TabOrder = 2
      OnKeyPress = DBEdit13KeyPress
    end
    object JvBitBtn5: TJvBitBtn
      Left = 647
      Top = 10
      Width = 110
      Height = 25
      Hint = 'Show / Edit all invoice Details'
      Caption = 'Inv Details (F12)'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF30AFDF60DF3F00
        3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F3F00202000
        0000FFFFFF3F003F606060C0C0C03F003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF003F3F00BFBF005F5F7FBFBF000000FFFFFF606060C0C0C00000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F3F00BFBF00BFBF005F5FBF
        FFFFBFBFBF000000606060C0C0C0909090000000FFFFFFFFFFFFFFFFFFFFFFFF
        003F3F00BFBF00BFBF00BFBF005F5FBFFFFFBFFFFF7FBFBF606060C0C0C0C0C0
        C0909090000000FFFFFFFFFFFF003F3F00BFBF00BFBF00BFBF00BFBF005F5FBF
        FFFFBFFFFF7F7F7F6F6F6FC0C0C0606060909090000000FFFFFF003F3F00BFBF
        00BFBF00BFBF00BFBF00BFBF005F5FBFFFFF7F7F7FFFFFFFBFBFBF9090907F7F
        7FBFBFBF000000FFFFFF005F5F00BFBF00BFBF00BFBF00BFBF007F7F7FDFDF7F
        7F7FFFFFFFFFBFBFFFBFBF3F003F7F7F7FFFFFFFBFBFBF000000005F5F00BFBF
        00BFBF007F7F005F5F7FDFDF7F7F7FFFFFFFFFBFBFFFBFBFFFBFBFFFBFBFFFBF
        BFFFBFBFFFFFFF3F3F3F005F5F00BFBF005F5F009F9F7FDFDF7F7F7FFFFFFFFF
        BFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFFFF005F5F005F5F
        0000003F9F9FBFBFBFBFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFFF
        FF3F3F3FFFFFFFFFFFFF005F5F003F3FFFFFFF0000007FBFBF7FBFBFBFBFBFFF
        BFBFFFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFFFFFFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFF0000003F3F3F000000BFBFBFFFBFBFFFBFBFFFFFFF3F3F3FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000BFBFBFFFFFFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000003F3F3FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = JvBitBtn5Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object Button4: TJvBitBtn
    Left = 661
    Top = 460
    Width = 97
    Height = 24
    Hint = 'Create New Invoice'
    Caption = 'New Inv (F7)'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF202020
      6060606060606060606060606060606060606060606060606060606060603030
      30303030FFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      BFBFBF7F7F7F7F7F7FBFBFBFFFFFFFBFBFBF3F5F5F003F3F3F5F5FBFBFBFDFDF
      DF606060000000FFFFFFFFFFFFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFFFFFFF3F
      9F9F00DFDF009F9F009F9F3F3F3FDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F009F9F009F9F20404000BFBF002020DFDF
      DF606060000000FFFFFFFFFFFFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F3F
      7F7F009F9F00BFBF007F7F7F7F7FDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F3F5F5F0040403F5F5FBFBFBFDFDF
      DF606060000000FFFFFFFFFFFFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7F7FBFBFBFDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDF
      DF606060000000FFFFFFFFFFFFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDF
      DF606060000000FFFFFFFFFFFFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      BFBFBF7F7F7F7F7F7FBFBFBFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7FBFBFBFDFDF
      DF606060000000FFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF606060000000FFFFFFFFFFFFBFBFBF
      7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFF7F7F7FBFBF
      BF606060000000FFFFFFFFFFFF2020205F5F5F5F5F5F4040405F5F5F5F5F5F40
      40405F5F5F5F5F5F4040405F5F5F5F5F5F202020FFFFFFFFFFFF}
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Button4Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn2: TJvBitBtn
    Left = 661
    Top = 485
    Width = 97
    Height = 24
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
    TabOrder = 8
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 509
    Width = 760
    Height = 19
    Panels = <
      item
        Text = 'SuperUser'
        Width = 50
      end>
  end
  object GroupBox6: TGroupBox
    Left = 479
    Top = 29
    Width = 186
    Height = 100
    Caption = 'Search for Invoice'
    TabOrder = 9
    Visible = False
    object Label26: TLabel
      Left = 8
      Top = 22
      Width = 35
      Height = 13
      Caption = 'Inv No.'
    end
    object Label27: TLabel
      Left = 8
      Top = 46
      Width = 54
      Height = 13
      Caption = 'Branch No:'
    end
    object FindInvEdit: TJvEdit
      Left = 56
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object JvBitBtn3: TJvBitBtn
      Left = 5
      Top = 67
      Width = 89
      Height = 25
      Caption = 'Find Invoice'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6060
        60505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFBFBFBF606060808080BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF606060808080BFBF
        BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F7F7F7F9F9F9FFF
        FFFFBFBFBF606060808080BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFBF404040606060404040606060404040404040808080BFBFBFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6060605F5F5FBFBFBFFFFFFFBFBFBF5F
        5F5F6060607F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
        404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050506F6F6FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4040407F7F7FBFBFBFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7F606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040
        7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F606060FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF6060605F5F5FBFBFBFBFBFBF7F7F7FFFFFFFFF
        FFFF6F6F6F606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
        808080BFBFBFBFBFBFFFFFFFFFFFFFBFBFBF9090907F7F7FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F9090906F6F6F7F7F7F6F6F6F90
        90906F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7F8080806060608080807F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = JvBitBtn3Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvSpinEdit1: TJvSpinEdit
      Left = 80
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 688
    Top = 328
    object File1: TMenuItem
      Caption = 'Edit'
      object NewCleanInvoice1: TMenuItem
        Caption = 'New Invoice'
        Hint = 'Create a new cash inv'
        OnClick = NewCleanInvoice1Click
      end
      object EditInvoice1: TMenuItem
        Caption = 'Edit Invoice'
        Hint = 'Set the Invoice detail blocks in edit mode'
        OnClick = EditInvoice1Click
      end
      object SaveInvoice1: TMenuItem
        Caption = 'Save Invoice'
        OnClick = SaveInvoice1Click
      end
      object PrintInvoice1: TMenuItem
        Caption = 'Close Invoice'
        Hint = 'Close Invoice / Reprint receipt'
        OnClick = PrintInvoice1Click
      end
      object UndoInvoiceChanges1: TMenuItem
        Caption = 'Undo Invoice Changes'
        Hint = 'Undo Invoice Detail changes'
        OnClick = UndoInvoiceChanges1Click
      end
      object DeleteInvoice1: TMenuItem
        Break = mbBarBreak
        Caption = 'Delete Invoice'
        Hint = 'Delete current Invoice'
        OnClick = DeleteInvoice1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Clearallinvoices1: TMenuItem
        Caption = 'Clear all invoices'
        Hint = 'This will empty all invoices'
        OnClick = Clearallinvoices1Click
      end
      object MarkCurrentInvoicenotendofShifted1: TMenuItem
        Caption = 'Mark Current Invoice as not end of Shifted'
        OnClick = MarkCurrentInvoicenotendofShifted1Click
      end
      object MarkCurrentInvoiceasnotsendtohq1: TMenuItem
        Caption = 'Mark Current Invoice as not send to hq'
        OnClick = MarkCurrentInvoiceasnotsendtohq1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object EnableSecondPrice1: TMenuItem
        AutoCheck = True
        Caption = 'Enable Second Price'
        ShortCut = 49235
        Visible = False
      end
      object ShowmoreInvoicesthan30days1: TMenuItem
        AutoCheck = True
        Caption = 'Show all Invoices'
        ShortCut = 49217
        OnClick = ShowmoreInvoicesthan30days1Click
      end
    end
    object Shortcuts1: TMenuItem
      Caption = 'Shortcut'#39's'
      object AddProducts1: TMenuItem
        Caption = 'Add Products'
        ShortCut = 112
        OnClick = AddProducts1Click
      end
      object CloseInvoice1: TMenuItem
        Caption = 'Close Invoice'
        ShortCut = 113
        OnClick = CloseInvoice1Click
      end
      object SearchStock1: TMenuItem
        Caption = 'Search Stock'
        ShortCut = 114
        OnClick = SearchStock1Click
      end
      object GoToInvItems1: TMenuItem
        Caption = 'Go To Inv Items'
        ShortCut = 115
        OnClick = GoToInvItems1Click
      end
      object POSAdditions1: TMenuItem
        Caption = 'POS Additions'
        ShortCut = 116
        OnClick = POSAdditions1Click
      end
      object LayBuy1: TMenuItem
        Caption = 'Lay Buy'
        ShortCut = 117
        OnClick = LayBuy1Click
      end
      object NewInvoice1: TMenuItem
        Caption = 'New Invoice'
        ShortCut = 118
        OnClick = NewInvoice1Click
      end
      object SuLogin1: TMenuItem
        Caption = 'Su Login'
        ShortCut = 119
        OnClick = SuLogin1Click
      end
      object SuDisable1: TMenuItem
        Caption = 'Su Disable'
        ShortCut = 120
        OnClick = SuDisable1Click
      end
      object Searchfordebtor1: TMenuItem
        Caption = 'Search for debtor'
        ShortCut = 121
        OnClick = Searchfordebtor1Click
      end
      object AddComment1: TMenuItem
        Caption = 'Add Comment'
        ShortCut = 122
        OnClick = AddComment1Click
      end
      object OpenInvoiceDetail1: TMenuItem
        Caption = 'Open Invoice Detail'
        ShortCut = 123
        OnClick = OpenInvoiceDetail1Click
      end
      object Open1: TMenuItem
        Caption = 'Search for Invoice'
        ShortCut = 16454
        OnClick = Open1Click
      end
      object NextInvoice1: TMenuItem
        Caption = 'Next Invoice'
        ShortCut = 16462
        OnClick = NextInvoice1Click
      end
      object PreviousInvoice1: TMenuItem
        Caption = 'Previous Invoice'
        ShortCut = 16464
        OnClick = PreviousInvoice1Click
      end
      object PrintQuote1: TMenuItem
        Caption = 'Print Quote'
        ShortCut = 16465
        OnClick = PrintQuote1Click
      end
    end
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 656
    Top = 328
  end
  object ReceiptPrinting: TRvSystem
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
    OnPrint = ReceiptPrintingPrint
    OnBeforePrint = ReceiptPrintingBeforePrint
    Left = 584
    Top = 280
  end
  object FormResizer1: TFormResizer
    ResizeFonts = True
    MinFontSize = 8
    MaxFontSize = 48
    Left = 584
    Top = 328
  end
end
