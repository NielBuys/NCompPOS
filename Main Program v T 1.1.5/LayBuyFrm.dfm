object LayBuyForm: TLayBuyForm
  Left = 230
  Top = 118
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Lay Buy'
  ClientHeight = 469
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 721
    Height = 441
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lay Buy details'
      object JvDBGrid2: TJvDBGrid
        Left = 0
        Top = 42
        Width = 710
        Height = 161
        DataSource = DataForm2.InvoiceSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = JvDBGrid2CellClick
        OnDrawColumnCell = JvDBGrid2DrawColumnCell
        OnDblClick = JvDBGrid2DblClick
        OnKeyDown = JvDBGrid2KeyDown
        OnKeyUp = JvDBGrid2KeyUp
        OnMouseDown = JvDBGrid2MouseDown
        OnMouseUp = JvDBGrid2MouseUp
        OnMouseWheelDown = JvDBGrid2MouseWheelDown
        OnMouseWheelUp = JvDBGrid2MouseWheelUp
        AutoAppend = False
        TitleButtons = True
        OnTitleBtnClick = JvDBGrid2TitleBtnClick
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
            FieldName = 'InvNo'
            Title.Caption = 'LB No'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BranchNo'
            Title.Caption = 'Branch No'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientName'
            Title.Caption = 'Name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientVatNo'
            Title.Caption = 'Ref'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvDate'
            Title.Caption = 'Inv Date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvBy'
            Title.Caption = 'Inv By'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvTotal'
            Title.Caption = 'Inv Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvClose'
            Title.Caption = 'Inv Close'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShiftSet'
            Title.Caption = 'End of Shifted'
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 208
        Width = 697
        Height = 177
        Caption = 'Lay Buy Detail'
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 70
          Height = 13
          Caption = 'Lay Buy No:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 136
          Top = 16
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
          Top = 38
          Width = 83
          Height = 13
          Caption = 'Name (Required):'
        end
        object Label5: TLabel
          Left = 392
          Top = 38
          Width = 41
          Height = 13
          Caption = 'Address:'
        end
        object Label6: TLabel
          Left = 408
          Top = 110
          Width = 32
          Height = 13
          Caption = 'Tel W:'
        end
        object Label7: TLabel
          Left = 408
          Top = 134
          Width = 28
          Height = 13
          Caption = 'Tel C:'
        end
        object Label8: TLabel
          Left = 16
          Top = 118
          Width = 64
          Height = 13
          Caption = 'Invoice Date:'
        end
        object Label4: TLabel
          Left = 16
          Top = 94
          Width = 53
          Height = 13
          Caption = 'Invoice By:'
        end
        object Label3: TLabel
          Left = 16
          Top = 62
          Width = 20
          Height = 13
          Caption = 'Ref:'
        end
        object Label9: TLabel
          Left = 408
          Top = 158
          Width = 32
          Height = 13
          Caption = 'E Mail:'
        end
        object Label39: TLabel
          Left = 16
          Top = 146
          Width = 12
          Height = 13
          Caption = 'Id:'
        end
        object Label40: TLabel
          Left = 203
          Top = 16
          Width = 5
          Height = 13
          Caption = '/'
        end
        object DBText3: TDBText
          Left = 216
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
        object DBEdit1: TDBEdit
          Left = 120
          Top = 32
          Width = 177
          Height = 21
          DataField = 'ClientName'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 472
          Top = 32
          Width = 193
          Height = 21
          DataField = 'ClientAdr1'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 472
          Top = 56
          Width = 193
          Height = 21
          DataField = 'ClientAdr2'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 472
          Top = 80
          Width = 145
          Height = 21
          DataField = 'ClientAdr3'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 472
          Top = 104
          Width = 145
          Height = 21
          DataField = 'ClientTelW'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 472
          Top = 128
          Width = 145
          Height = 21
          DataField = 'ClientTelC'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 7
        end
        object InvoiceDateEdit: TJvDateTimePicker
          Left = 120
          Top = 112
          Width = 97
          Height = 21
          Date = 38954.547999849540000000
          Format = 'yyyy/MM/dd'
          Time = 38954.547999849540000000
          TabOrder = 9
          OnChange = InvoiceDateEditChange
          DropDownDate = 38954.000000000000000000
          NullText = 'No Date'
        end
        object DBEdit3: TDBEdit
          Left = 120
          Top = 88
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
          Top = 56
          Width = 177
          Height = 21
          DataField = 'ClientVatNo'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 616
          Top = 80
          Width = 49
          Height = 21
          DataField = 'ClientPCode'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 472
          Top = 152
          Width = 193
          Height = 21
          DataField = 'ClientEMail'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit13: TDBEdit
          Left = 120
          Top = 140
          Width = 121
          Height = 21
          DataField = 'RefNo'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 10
        end
      end
      object JvBitBtn3: TJvBitBtn
        Left = 56
        Top = 388
        Width = 129
        Height = 25
        Caption = 'Edit Lay Buy Inv.'
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
        TabOrder = 2
        OnClick = JvBitBtn3Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn4: TJvBitBtn
        Left = 184
        Top = 388
        Width = 169
        Height = 25
        Caption = 'Save Lay Buy Inv Changes'
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
        TabOrder = 3
        OnClick = JvBitBtn4Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvBitBtn6: TJvBitBtn
        Left = 622
        Top = 388
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
        TabOrder = 4
        OnClick = JvBitBtn6Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object GroupBox6: TGroupBox
        Left = 20
        Top = 0
        Width = 561
        Height = 41
        Caption = 'Search Lay Buy Accounts'
        TabOrder = 5
        object Edit3: TEdit
          Left = 32
          Top = 15
          Width = 177
          Height = 21
          TabOrder = 0
        end
        object JvBitBtn9: TJvBitBtn
          Left = 224
          Top = 10
          Width = 97
          Height = 25
          Caption = 'Search Inv No'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = JvBitBtn9Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvBitBtn10: TJvBitBtn
          Left = 328
          Top = 10
          Width = 97
          Height = 25
          Caption = 'Search Name'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = JvBitBtn10Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvBitBtn11: TJvBitBtn
          Left = 432
          Top = 10
          Width = 97
          Height = 25
          Caption = 'Search Ref'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = JvBitBtn11Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object CheckBox1: TCheckBox
        Left = 590
        Top = 19
        Width = 120
        Height = 17
        Caption = 'Hide Closed Lay Buys'
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Items / Age'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 3
        Width = 713
        Height = 255
        DataSource = DataForm2.InvoiceItemSource
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
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
            FieldName = 'DBGLineno'
            Title.Caption = 'Line No'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 264
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TCStockNo'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qty'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Price'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SellingPrice'
            Title.Caption = 'Full Price'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Discount'
            Title.Caption = 'Discount %'
            Width = 73
            Visible = True
          end>
      end
      object JvBitBtn8: TJvBitBtn
        Left = 542
        Top = 380
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
      object JvBitBtn2: TJvBitBtn
        Left = 622
        Top = 380
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
        TabOrder = 2
        OnClick = JvBitBtn6Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 264
        Width = 665
        Height = 105
        Caption = 'Aging / Premium'
        TabOrder = 3
        object Label17: TLabel
          Left = 16
          Top = 62
          Width = 42
          Height = 13
          Caption = '30 Days:'
        end
        object Label27: TLabel
          Left = 168
          Top = 62
          Width = 42
          Height = 13
          Caption = '60 Days:'
        end
        object Label28: TLabel
          Left = 320
          Top = 62
          Width = 42
          Height = 13
          Caption = '90 Days:'
        end
        object Label29: TLabel
          Left = 472
          Top = 62
          Width = 48
          Height = 13
          Caption = '120 Days:'
        end
        object Label32: TLabel
          Left = 16
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Premium:'
        end
        object DBEdit23: TDBEdit
          Left = 64
          Top = 56
          Width = 97
          Height = 21
          DataField = 'Days30'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit24: TDBEdit
          Left = 216
          Top = 56
          Width = 97
          Height = 21
          DataField = 'Days60'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit25: TDBEdit
          Left = 368
          Top = 56
          Width = 97
          Height = 21
          DataField = 'Days90'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit26: TDBEdit
          Left = 528
          Top = 56
          Width = 97
          Height = 21
          DataField = 'Days120'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit27: TDBEdit
          Left = 80
          Top = 16
          Width = 97
          Height = 21
          DataField = 'Premium'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Transactions / Payments'
      ImageIndex = 2
      OnEnter = TabSheet3Enter
      OnShow = TabSheet3Show
      object Label14: TLabel
        Left = 32
        Top = 232
        Width = 83
        Height = 13
        Caption = 'Lay Buy Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LayBuyTotalDBText: TDBText
        Left = 136
        Top = 232
        Width = 113
        Height = 13
        AutoSize = True
        DataField = 'InvTotal'
        DataSource = DataForm2.InvoiceSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 32
        Top = 256
        Width = 53
        Height = 13
        Caption = 'Payed: R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PaydValueLbl: TLabel
        Left = 136
        Top = 256
        Width = 26
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 32
        Top = 280
        Width = 53
        Height = 13
        Caption = 'Owing: R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object OwingValueLbl: TLabel
        Left = 136
        Top = 280
        Width = 26
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvDBGrid3: TJvDBGrid
        Left = 263
        Top = 3
        Width = 450
        Height = 371
        DataSource = DataForm2.TransQuerySource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        AutoAppend = False
        MaxColumnWidth = 100
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
            FieldName = 'Nr'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ammount'
            Title.Caption = 'Amount'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PaymentType'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PaymentBy'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShiftSet'
            Title.Caption = 'End of shifted'
            Visible = True
          end>
      end
      object GroupBox5: TGroupBox
        Left = 16
        Top = 16
        Width = 241
        Height = 161
        Caption = 'Payments'
        TabOrder = 1
        object Label30: TLabel
          Left = 16
          Top = 30
          Width = 70
          Height = 13
          Caption = 'Payment Date:'
        end
        object Label31: TLabel
          Left = 16
          Top = 62
          Width = 43
          Height = 13
          Caption = 'Premium:'
        end
        object Label33: TLabel
          Left = 16
          Top = 91
          Width = 67
          Height = 13
          Caption = 'Payment type:'
        end
        object DoPaymentBtn: TJvBitBtn
          Left = 145
          Top = 120
          Width = 75
          Height = 25
          Caption = 'Do Payment'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = DoPaymentBtnClick
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object PaymentDateEdit: TJvDateTimePicker
          Left = 112
          Top = 24
          Width = 97
          Height = 21
          Date = 39086.828614537040000000
          Time = 39086.828614537040000000
          TabOrder = 1
          DropDownDate = 39086.000000000000000000
        end
        object PremiumEdt: TEdit
          Left = 112
          Top = 56
          Width = 97
          Height = 21
          TabOrder = 2
          Text = 'PremiumEdt'
        end
        object JvBitBtn13: TJvBitBtn
          Left = 48
          Top = 120
          Width = 91
          Height = 25
          Caption = 'Print Statement'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = JvBitBtn13Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvComboBox1: TJvComboBox
          Left = 112
          Top = 88
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          OnExit = JvComboBox1Exit
          Items.Strings = (
            'Cash'
            'CreditCard'
            'Cheque'
            'Other')
        end
      end
      object JvBitBtn14: TJvBitBtn
        Left = 542
        Top = 380
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
        TabOrder = 2
        OnClick = JvBitBtn14Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Initial Lay Buy Setup'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 192
        Top = 8
        Width = 289
        Height = 201
        Caption = 'Lay Buy Setup'
        TabOrder = 0
        object Label10: TLabel
          Left = 16
          Top = 24
          Width = 118
          Height = 13
          Caption = 'Lay Buy Inv Total: R'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 62
          Width = 71
          Height = 13
          Caption = 'Term (Months):'
        end
        object Label12: TLabel
          Left = 16
          Top = 86
          Width = 39
          Height = 13
          Caption = 'Deposit:'
        end
        object Label13: TLabel
          Left = 144
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Label13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 16
          Top = 144
          Width = 43
          Height = 13
          Caption = 'Premium:'
        end
        object Label16: TLabel
          Left = 96
          Top = 144
          Width = 38
          Height = 13
          Caption = 'Label16'
        end
        object Label37: TLabel
          Left = 16
          Top = 112
          Width = 67
          Height = 13
          Caption = 'Payment type:'
        end
        object Edit1: TEdit
          Left = 96
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Edit1'
        end
        object JvBitBtn5: TJvBitBtn
          Left = 206
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Accept'
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333300333
            33333333333773FF333333333330F0033333333333373773FF333333330FFFF0
            03333333337F333773FF3333330FFFFFF003333333733FF33773333330FF00FF
            FF80333337F3773F3337333330FFFF0FFFF03FFFF7FFF3733F3700000000FFFF
            0FF0777777773FF373370000000000FFFFF07FFFFFF377FFF3370CCCCC000000
            FF037777773337773F7300CCC000003300307F77733337F37737000C00000033
            33307F373333F7F333370000007B703333307FFFF337F7F33337099900BBB033
            33307777F37777FF33370999007B700333037777F3373773FF73099900000030
            00337777FFFFF7F7773300000000003333337777777777333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = JvBitBtn5Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object Edit2: TEdit
          Left = 96
          Top = 56
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'Edit2'
        end
        object JvBitBtn7: TJvBitBtn
          Left = 16
          Top = 168
          Width = 107
          Height = 25
          Caption = 'Calculate Premium'
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
        object JvComboBox2: TJvComboBox
          Left = 96
          Top = 112
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          OnExit = JvComboBox1Exit
          Items.Strings = (
            'Cash'
            'CreditCard'
            'Cheque'
            'Other')
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 208
        Width = 697
        Height = 185
        Caption = 'Lay Buy Detail'
        TabOrder = 1
        object Label18: TLabel
          Left = 16
          Top = 30
          Width = 83
          Height = 13
          Caption = 'Name (Required):'
        end
        object Label20: TLabel
          Left = 392
          Top = 30
          Width = 41
          Height = 13
          Caption = 'Address:'
        end
        object Label21: TLabel
          Left = 408
          Top = 110
          Width = 32
          Height = 13
          Caption = 'Tel W:'
        end
        object Label22: TLabel
          Left = 408
          Top = 134
          Width = 28
          Height = 13
          Caption = 'Tel C:'
        end
        object Label23: TLabel
          Left = 16
          Top = 126
          Width = 64
          Height = 13
          Caption = 'Invoice Date:'
        end
        object Label24: TLabel
          Left = 16
          Top = 94
          Width = 53
          Height = 13
          Caption = 'Invoice By:'
        end
        object Label25: TLabel
          Left = 16
          Top = 62
          Width = 20
          Height = 13
          Caption = 'Ref:'
        end
        object Label26: TLabel
          Left = 408
          Top = 158
          Width = 32
          Height = 13
          Caption = 'E Mail:'
        end
        object Label38: TLabel
          Left = 16
          Top = 154
          Width = 12
          Height = 13
          Caption = 'Id:'
        end
        object DBEdit12: TDBEdit
          Left = 120
          Top = 24
          Width = 177
          Height = 21
          DataField = 'ClientName'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 0
        end
        object DBEdit14: TDBEdit
          Left = 472
          Top = 24
          Width = 193
          Height = 21
          DataField = 'ClientAdr1'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 472
          Top = 48
          Width = 193
          Height = 21
          DataField = 'ClientAdr2'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 3
        end
        object DBEdit16: TDBEdit
          Left = 472
          Top = 72
          Width = 145
          Height = 21
          DataField = 'ClientAdr3'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 4
        end
        object DBEdit17: TDBEdit
          Left = 472
          Top = 104
          Width = 145
          Height = 21
          DataField = 'ClientTelW'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 6
        end
        object DBEdit18: TDBEdit
          Left = 472
          Top = 128
          Width = 145
          Height = 21
          DataField = 'ClientTelC'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 7
        end
        object JvDateTimePicker1: TJvDateTimePicker
          Left = 120
          Top = 120
          Width = 97
          Height = 21
          Date = 38954.547999849540000000
          Format = 'yyyy/MM/dd'
          Time = 38954.547999849540000000
          Enabled = False
          TabOrder = 9
          OnChange = JvDateTimePicker1Change
          DropDownDate = 38954.000000000000000000
          NullText = 'No Date'
        end
        object DBEdit19: TDBEdit
          Left = 120
          Top = 88
          Width = 177
          Height = 21
          TabStop = False
          DataField = 'InvBy'
          DataSource = DataForm2.InvoiceSource
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit20: TDBEdit
          Left = 120
          Top = 56
          Width = 177
          Height = 21
          DataField = 'ClientVatNo'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 1
        end
        object DBEdit21: TDBEdit
          Left = 616
          Top = 72
          Width = 49
          Height = 21
          DataField = 'ClientPCode'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 5
        end
        object DBEdit22: TDBEdit
          Left = 472
          Top = 152
          Width = 193
          Height = 21
          DataField = 'ClientEMail'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 8
        end
        object DBEdit10: TDBEdit
          Left = 120
          Top = 148
          Width = 121
          Height = 21
          DataField = 'RefNo'
          DataSource = DataForm2.InvoiceSource
          TabOrder = 11
        end
      end
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 646
    Top = 443
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
  object FormResizer1: TFormResizer
    MinFontSize = 8
    MaxFontSize = 48
    Left = 560
    Top = 440
  end
end
