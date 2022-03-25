object PurchaseForm: TPurchaseForm
  Left = 205
  Top = 114
  Caption = 'Purchase Invoice'
  ClientHeight = 533
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 769
    Height = 457
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Purchase Inv Details'
      ImageIndex = 1
      OnExit = TabSheet2Exit
      OnHide = TabSheet2Hide
      object GroupBox1: TGroupBox
        Left = 3
        Top = 200
        Width = 755
        Height = 194
        Caption = 'Purchase Invoice Detail'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 103
          Height = 13
          Caption = 'Purchase Invoice No:'
        end
        object DBText1: TDBText
          Left = 204
          Top = 17
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
        object Label2: TLabel
          Left = 16
          Top = 46
          Width = 83
          Height = 13
          Caption = 'Name (Required):'
        end
        object Label14: TLabel
          Left = 16
          Top = 174
          Width = 54
          Height = 13
          Caption = 'Creditor no:'
        end
        object Label5: TLabel
          Left = 392
          Top = 22
          Width = 41
          Height = 13
          Caption = 'Address:'
        end
        object Label6: TLabel
          Left = 408
          Top = 102
          Width = 32
          Height = 13
          Caption = 'Tel W:'
        end
        object Label7: TLabel
          Left = 408
          Top = 126
          Width = 28
          Height = 13
          Caption = 'Tel C:'
        end
        object Label8: TLabel
          Left = 16
          Top = 142
          Width = 64
          Height = 13
          Caption = 'Invoice Date:'
        end
        object Label4: TLabel
          Left = 16
          Top = 110
          Width = 53
          Height = 13
          Caption = 'Invoice By:'
        end
        object Label3: TLabel
          Left = 16
          Top = 78
          Width = 95
          Height = 13
          Caption = 'Vat No: (if available)'
        end
        object Label9: TLabel
          Left = 408
          Top = 150
          Width = 32
          Height = 13
          Caption = 'E Mail:'
        end
        object Label12: TLabel
          Left = 408
          Top = 174
          Width = 37
          Height = 13
          Caption = 'Ref No:'
        end
        object Label18: TLabel
          Left = 187
          Top = 16
          Width = 11
          Height = 13
          Caption = '/  '
        end
        object DBText2: TDBText
          Left = 128
          Top = 16
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'BranchNo'
          DataSource = DataForm2.InvoiceSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object JvSpeedButton2: TJvSpeedButton
          Left = 223
          Top = 167
          Width = 25
          Height = 25
          Hint = 'Search for Creditor'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000230B0000230B00000000000000000000DADBF56166D6
            4249CF2C34C9242CC61C24C01D25BC1B23B5333AB2A4A7D29498D87D81D49FA3
            D8DFDFE3FAFAF9FFFFFF363DCB1D25C91D25CC1D25CD1D25CA1D25C61D25C137
            3EBF9CA0DA202AC72C35CD4C53D31720C62F37C8BDC0D9FCFCFB2E35CE232BD1
            1D25D21D25D31D25D11D25CC1921C59CA0D83F47D01B24CE757BE5F1F1F61D26
            CB1B24CC2E37C7E0E1E56469DD282FD51C24D51D25D61A22D4212AC83F46C07E
            84D8474ED6373ED67176E6EEEEF61F27D02C34D1161FC79A9DD3DBDDF82C34D7
            1D25D72A32CB7E80A3B1B1B3C3C3BE6268D58589E4F2F3F9A2A6E6EDEDF7A8AC
            E9DFE0F11C25C47A7FCEFFFFFFCCCEF5383FDD676A9ED7D7D7E9E9E9EBEBE770
            75D54B51D7C6C8F4FFFFFFFFFFFFF8F8FB5F65D42831CC9295D1FFFFFFFFFFFF
            ECEDFBB8BAEAD8D8D9DDDDDEDFDFDEADAFD9424AD1494FD9C9CBF5F9F9FC7479
            D8474ED7464ECFD1D2DEFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1F5F5F6F7F7F7E7
            E8E68085D5424AD14D54D76E73D9464DD5434BCF9FA2D3F9F9F7FFFFFFFFFFFF
            FFFFFFF7F7F7EEEEEEF0F0F0F0F0F0EDEDEDE6E6E4AEB1D96E74D26166D1777C
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
          OnClick = JvSpeedButton2Click
        end
        object DBEdit1: TDBEdit
          Left = 120
          Top = 40
          Width = 177
          Height = 21
          DataField = 'ClientName'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit10: TDBEdit
          Left = 120
          Top = 168
          Width = 97
          Height = 21
          TabStop = False
          DataField = 'GLDebNo'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit4: TDBEdit
          Left = 472
          Top = 16
          Width = 193
          Height = 21
          DataField = 'ClientAdr1'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 472
          Top = 40
          Width = 193
          Height = 21
          DataField = 'ClientAdr2'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 472
          Top = 64
          Width = 145
          Height = 21
          DataField = 'ClientAdr3'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 472
          Top = 96
          Width = 145
          Height = 21
          DataField = 'ClientTelW'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 472
          Top = 120
          Width = 145
          Height = 21
          DataField = 'ClientTelC'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 7
        end
        object InvoiceDateEdit: TJvDateTimePicker
          Left = 120
          Top = 136
          Width = 97
          Height = 21
          Date = 38954.547999849540000000
          Format = 'yyyy/MM/dd'
          Time = 38954.547999849540000000
          Enabled = False
          TabOrder = 9
          OnChange = InvoiceDateEditChange
          DropDownDate = 38954.000000000000000000
          NullText = 'No Date'
        end
        object DBEdit3: TDBEdit
          Left = 120
          Top = 104
          Width = 177
          Height = 21
          TabStop = False
          DataField = 'InvBy'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit2: TDBEdit
          Left = 120
          Top = 72
          Width = 177
          Height = 21
          DataField = 'ClientVatNo'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 616
          Top = 64
          Width = 49
          Height = 21
          DataField = 'ClientPCode'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 472
          Top = 144
          Width = 193
          Height = 21
          DataField = 'ClientEMail'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 472
          Top = 168
          Width = 121
          Height = 21
          DataField = 'RefNo'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 12
        end
      end
      object JvBitBtn6: TJvBitBtn
        Left = 672
        Top = 400
        Width = 75
        Height = 25
        Caption = 'Next'
        DoubleBuffered = True
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
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = JvBitBtn6Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object PurchaseInvGrid: TJvDBGrid
        Left = 1
        Top = 3
        Width = 757
        Height = 197
        DataSource = DataForm2.InvoiceSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = PurchaseInvGridCellClick
        OnDblClick = PurchaseInvGridDblClick
        OnMouseDown = PurchaseInvGridMouseUp
        OnMouseUp = PurchaseInvGridMouseUp
        OnMouseWheelDown = PurchaseInvGridMouseWheelDown
        OnMouseWheelUp = PurchaseInvGridMouseWheelDown
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
            FieldName = 'BranchNo'
            Title.Caption = 'Branch No'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvNo'
            Title.Caption = 'Inv No'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientName'
            Title.Caption = 'Name'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvDate'
            Title.Caption = 'Inv Date'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvBy'
            Title.Caption = 'Inv By'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvTotal'
            Title.Caption = 'Inv Total'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvClose'
            Title.Caption = 'Inv Close'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShiftSet'
            Title.Caption = 'Send to TC'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SyncHQ'
            Width = 68
            Visible = True
          end>
      end
      object JvBitBtn2: TJvBitBtn
        Left = 16
        Top = 400
        Width = 137
        Height = 25
        Caption = 'Create Purchase Inv.'
        DoubleBuffered = True
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
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = JvBitBtn2Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn3: TJvBitBtn
        Left = 153
        Top = 400
        Width = 129
        Height = 25
        Caption = 'Edit Purchase Inv.'
        DoubleBuffered = True
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
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = JvBitBtn3Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn4: TJvBitBtn
        Left = 282
        Top = 400
        Width = 169
        Height = 25
        Caption = 'Save Purchase Inv Changes'
        DoubleBuffered = True
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
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = JvBitBtn4Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn17: TJvBitBtn
        Left = 487
        Top = 400
        Width = 122
        Height = 25
        Caption = 'Print Purchase Inv'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = JvBitBtn17Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Items'
      ImageIndex = 2
      OnExit = TabSheet3Exit
      OnShow = TabSheet3Show
      object JvSpeedButton1: TJvSpeedButton
        Left = 376
        Top = 400
        Width = 25
        Height = 25
        Hint = 'Undo Purchase Stock Item Changes'
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
      object JvSpeedButton9: TJvSpeedButton
        Left = 257
        Top = 399
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
      object JvDBGrid1: TJvDBGrid
        Left = 1
        Top = 1
        Width = 759
        Height = 396
        DataSource = DataForm2.PurchaseItemSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = JvDBGrid1CellClick
        OnExit = JvDBGrid1Exit
        OnKeyDown = JvDBGrid1KeyDown
        AutoAppend = False
        AlternateRowColor = clInfoBk
        TitleArrow = True
        MaxColumnWidth = 400
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
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CostPrice'
            Title.Caption = 'Cost Excl'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CostIncl'
            ReadOnly = True
            Title.Caption = 'Cost Incl'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalCost'
            ReadOnly = True
            Title.Caption = 'Total Cost Incl.'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qty'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Price'
            Title.Caption = 'Price 1 Incl'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Price2'
            Title.Caption = 'Price 2 Incl'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ExtraDescr'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ModelNo'
            Title.Caption = 'Model No'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TCStockNo'
            Title.Caption = 'Stock No'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Barcode'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Discount'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'StockNo'
            ReadOnly = True
            Title.Caption = 'No'
            Visible = True
          end>
      end
      object JvBitBtn8: TJvBitBtn
        Left = 680
        Top = 400
        Width = 75
        Height = 25
        Caption = 'Previous'
        DoubleBuffered = True
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
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = JvBitBtn8Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn9: TJvBitBtn
        Left = 16
        Top = 400
        Width = 121
        Height = 25
        Caption = 'Insert New Stock Item'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = JvBitBtn9Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn7: TJvBitBtn
        Left = 137
        Top = 400
        Width = 97
        Height = 25
        Caption = 'Insert From Stock'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = JvBitBtn7Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Import Stock Items'
      ImageIndex = 2
      object Label10: TLabel
        Left = 24
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Excel File to Import:'
      end
      object Label11: TLabel
        Left = 40
        Top = 408
        Width = 122
        Height = 13
        Caption = 'Green = New Stock Items'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ExcelFileEdit: TEdit
        Left = 144
        Top = 8
        Width = 417
        Height = 21
        TabOrder = 0
        Text = 'ExcelFileEdit'
      end
      object Button1: TButton
        Left = 576
        Top = 8
        Width = 57
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = Button1Click
      end
      object ComboBox1: TComboBox
        Left = 152
        Top = 40
        Width = 249
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        Text = 'Select Sheet'
      end
      object Button3: TButton
        Left = 408
        Top = 40
        Width = 153
        Height = 25
        Caption = 'Connect to Selected Sheet'
        Enabled = False
        TabOrder = 3
        OnClick = Button3Click
      end
      object JvDBGrid3: TJvDBGrid
        Left = 0
        Top = 71
        Width = 758
        Height = 322
        DataSource = ImportData.ExcelSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid3DrawColumnCell
        AutoAppend = False
        MaxColumnWidth = 300
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
      object JvBitBtn12: TJvBitBtn
        Left = 568
        Top = 400
        Width = 89
        Height = 25
        Caption = 'Import Items'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = JvBitBtn12Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 695
    Top = 508
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
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn11: TJvBitBtn
    Left = 0
    Top = 457
    Width = 113
    Height = 25
    Caption = 'Close Purchase Inv'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = JvBitBtn11Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object GroupBox2: TGroupBox
    Left = 368
    Top = 464
    Width = 321
    Height = 49
    Caption = 'Purchase Inv to Branch Stock Transfer'
    TabOrder = 3
    object JvBitBtn13: TJvBitBtn
      Left = 167
      Top = 16
      Width = 145
      Height = 25
      Caption = 'Create Stock Open Transfer'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = JvBitBtn13Click
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 8
      Top = 16
      Width = 153
      Height = 23
      LookupField = 'Name'
      LookupSource = DataForm2.BranchSource
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 256
    Top = 464
    Width = 108
    Height = 49
    Caption = 'Purchase Inv.Total'
    TabOrder = 4
    object Label13: TLabel
      Left = 56
      Top = 12
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label13'
    end
    object Label15: TLabel
      Left = 56
      Top = 28
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label15'
    end
    object Label16: TLabel
      Left = 5
      Top = 12
      Width = 23
      Height = 13
      Caption = 'Excl.'
    end
    object Label17: TLabel
      Left = 5
      Top = 28
      Width = 20
      Height = 13
      Caption = 'Incl.'
    end
  end
  object OpenExcel: TJvOpenDialog
    Filter = 
      'Excel and csv Files|*.xls;*.csv|Csv Files|*.csv|Excel Files|*.xl' +
      's'
    Height = 419
    Width = 563
    Left = 656
    Top = 168
  end
  object MainMenu1: TMainMenu
    Left = 684
    Top = 168
    object File1: TMenuItem
      Caption = 'Edit'
      object MarkcurrentPurchaseInvoiceasnotEndofShifted1: TMenuItem
        Caption = 'Mark current Purchase Invoice as not End of Shifted'
        OnClick = MarkcurrentPurchaseInvoiceasnotEndofShifted1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object DeleteselectedPurchaseInv1: TMenuItem
        Caption = 'Delete selected Purchase Inv'
        OnClick = DeleteselectedPurchaseInv1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DeleteSelectedUnpostedTurbocashPurchaseinvoice1: TMenuItem
        Caption = 'Delete Selected Unposted Turbocash Purchase invoice'
        OnClick = DeleteSelectedUnpostedTurbocashPurchaseinvoice1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object ShowallRecords1: TMenuItem
        AutoCheck = True
        Caption = 'Show all Records'
        OnClick = ShowallRecords1Click
      end
    end
    object Import1: TMenuItem
      Caption = 'Import'
      object Purchaseinvoicesfromturbocah1: TMenuItem
        Caption = 'Purchase invoices from Turbocash'
        OnClick = Purchaseinvoicesfromturbocah1Click
      end
      object FixCreditorLinkonstockTable1: TMenuItem
        Caption = 'Fix Creditor Link on stock Table'
        OnClick = FixCreditorLinkonstockTable1Click
      end
    end
  end
  object FormResizer1: TFormResizer
    ResizeFonts = True
    MinFontSize = 8
    MaxFontSize = 38
    Left = 672
    Top = 320
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
    Left = 640
    Top = 320
  end
end
