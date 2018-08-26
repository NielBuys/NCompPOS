object StockEditForm: TStockEditForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Edit Stock Item'
  ClientHeight = 243
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvPageControl1: TJvPageControl
    Left = 0
    Top = 0
    Width = 666
    Height = 213
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Stock Detail'
      object DBText1: TDBText
        Left = 60
        Top = 151
        Width = 65
        Height = 17
        DataField = 'Nr'
        DataSource = DataForm2.StockSource
      end
      object Label1: TLabel
        Left = 10
        Top = 36
        Width = 57
        Height = 13
        Caption = 'Description:'
      end
      object Label2: TLabel
        Left = 6
        Top = 63
        Width = 101
        Height = 13
        Caption = 'Cost Price (Incl Tax):'
      end
      object Label3: TLabel
        Left = 212
        Top = 63
        Width = 109
        Height = 13
        Caption = 'Selling Price (Incl Tax):'
      end
      object Label4: TLabel
        Left = 9
        Top = 105
        Width = 49
        Height = 13
        Caption = 'Local Qty:'
      end
      object Label5: TLabel
        Left = 9
        Top = 130
        Width = 48
        Height = 13
        Caption = 'Bar Code:'
      end
      object Label6: TLabel
        Left = 169
        Top = 105
        Width = 48
        Height = 13
        Caption = 'Alert Qty:'
      end
      object Label7: TLabel
        Left = 345
        Top = 105
        Width = 63
        Height = 13
        Caption = 'Starting Qty:'
      end
      object Label8: TLabel
        Left = 16
        Top = 6
        Width = 56
        Height = 13
        Caption = 'Stock no:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 88
        Top = 6
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'TCStockNo'
        DataSource = DataForm2.StockSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvSpeedButton2: TJvSpeedButton
        Left = 208
        Top = 124
        Width = 26
        Height = 21
        Hint = 'Print this stock items barcode'
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
      object DBText3: TDBText
        Left = 392
        Top = 0
        Width = 65
        Height = 17
        DataField = 'DateCreated'
        DataSource = DataForm2.StockSource
      end
      object DBText4: TDBText
        Left = 552
        Top = 0
        Width = 65
        Height = 17
        DataField = 'DateChanged'
        DataSource = DataForm2.StockSource
      end
      object Label9: TLabel
        Left = 312
        Top = 0
        Width = 69
        Height = 13
        Caption = 'Date Created:'
      end
      object Label10: TLabel
        Left = 472
        Top = 0
        Width = 73
        Height = 13
        Caption = 'Date Changed:'
      end
      object Label11: TLabel
        Left = 10
        Top = 151
        Width = 44
        Height = 13
        Caption = 'Stock ID:'
      end
      object Label12: TLabel
        Left = 290
        Top = 36
        Width = 60
        Height = 13
        Caption = 'Extra Descr:'
      end
      object Label13: TLabel
        Left = 428
        Top = 63
        Width = 118
        Height = 13
        Caption = 'Selling Price 2 (Incl Tax):'
      end
      object Label14: TLabel
        Left = 347
        Top = 130
        Width = 48
        Height = 13
        Caption = 'Model No:'
      end
      object Label15: TLabel
        Left = 532
        Top = 169
        Width = 55
        Height = 13
        Caption = '= Qty Left:'
      end
      object Label16: TLabel
        Left = 587
        Top = 169
        Width = 46
        Height = 13
        Caption = 'Label16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 529
        Top = 128
        Width = 68
        Height = 13
        Caption = 'Commision %:'
      end
      object Label18: TLabel
        Left = 376
        Top = 169
        Width = 46
        Height = 13
        Caption = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 311
        Top = 169
        Width = 58
        Height = 13
        Caption = '- At Branch:'
      end
      object Label20: TLabel
        Left = 265
        Top = 169
        Width = 46
        Height = 13
        Caption = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 184
        Top = 169
        Width = 78
        Height = 13
        Caption = '- Open Lay Buy:'
      end
      object Label22: TLabel
        Left = 139
        Top = 169
        Width = 46
        Height = 13
        Caption = 'Label22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 105
        Top = 169
        Width = 31
        Height = 13
        Caption = '- Sold:'
      end
      object Label24: TLabel
        Left = 60
        Top = 169
        Width = 46
        Height = 13
        Caption = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 0
        Top = 169
        Width = 54
        Height = 13
        Caption = 'Purchased:'
      end
      object Label26: TLabel
        Left = 40
        Top = 79
        Width = 56
        Height = 13
        Caption = 'Avg Cost:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 110
        Top = 79
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'AvgCost'
        DataSource = DataForm2.StockSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 312
        Top = 12
        Width = 58
        Height = 13
        Caption = 'Created By:'
      end
      object Label28: TLabel
        Left = 472
        Top = 12
        Width = 62
        Height = 13
        Caption = 'Changed By:'
      end
      object DBText6: TDBText
        Left = 392
        Top = 12
        Width = 74
        Height = 17
        DataField = 'st_created_by'
        DataSource = DataForm2.StockSource
      end
      object DBText7: TDBText
        Left = 552
        Top = 12
        Width = 81
        Height = 17
        DataField = 'st_changed_by'
        DataSource = DataForm2.StockSource
      end
      object Label29: TLabel
        Left = 428
        Top = 169
        Width = 31
        Height = 13
        Caption = '+ Adj:'
      end
      object Label30: TLabel
        Left = 465
        Top = 169
        Width = 44
        Height = 13
        Caption = 'Label30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 167
        Top = 6
        Width = 33
        Height = 17
        Alignment = taRightJustify
        DataField = 'BranchNo'
        DataSource = DataForm2.StockSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 160
        Top = 6
        Width = 6
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 82
        Top = 30
        Width = 201
        Height = 21
        DataField = 'Description'
        DataSource = DataForm2.StockSource
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 110
        Top = 57
        Width = 97
        Height = 21
        DataField = 'CostPrice'
        DataSource = DataForm2.StockSource
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 326
        Top = 57
        Width = 97
        Height = 21
        DataField = 'SalesPrice'
        DataSource = DataForm2.StockSource
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 80
        Top = 124
        Width = 129
        Height = 21
        DataField = 'Barcode'
        DataSource = DataForm2.StockSource
        TabOrder = 8
      end
      object DBEdit6: TDBEdit
        Left = 225
        Top = 99
        Width = 105
        Height = 21
        DataField = 'AlertQty'
        DataSource = DataForm2.StockSource
        TabOrder = 6
      end
      object DBCheckBox1: TDBCheckBox
        Left = 530
        Top = 101
        Width = 103
        Height = 17
        Hint = 'Indication if this Stock item is a non stock item or not.'
        TabStop = False
        Caption = 'Non Stock Item'
        DataField = 'NonStockItem'
        DataSource = DataForm2.StockSource
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox1Click
      end
      object DBEdit7: TDBEdit
        Left = 409
        Top = 99
        Width = 105
        Height = 21
        DataField = 'StartingQty'
        DataSource = DataForm2.StockSource
        TabOrder = 7
      end
      object CheckBox1: TCheckBox
        Left = 240
        Top = 128
        Width = 101
        Height = 17
        Hint = 
          'If this is selected the barcode will print the qty of the stock ' +
          'item.'
        Caption = 'Barcode Item Qty'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object DBEdit8: TDBEdit
        Left = 354
        Top = 30
        Width = 297
        Height = 21
        DataField = 'ExtraDescr'
        DataSource = DataForm2.StockSource
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 552
        Top = 57
        Width = 97
        Height = 21
        DataField = 'SalesPrice2'
        DataSource = DataForm2.StockSource
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Left = 403
        Top = 124
        Width = 121
        Height = 21
        DataField = 'ModelNo'
        DataSource = DataForm2.StockSource
        TabOrder = 10
      end
      object DBEdit11: TDBEdit
        Left = 599
        Top = 124
        Width = 56
        Height = 21
        DataField = 'Commision'
        DataSource = DataForm2.StockSource
        TabOrder = 12
      end
      object DBCheckBox2: TDBCheckBox
        Left = 520
        Top = 78
        Width = 113
        Height = 17
        Hint = 'Check this if this is a Item that is stock free.'
        Caption = 'Non Tax Stock Item'
        DataField = 'st_nontaxitem'
        DataSource = DataForm2.StockSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object JvEdit1: TJvEdit
        Left = 63
        Top = 99
        Width = 90
        Height = 21
        TabOrder = 13
        Text = 'JvEdit1'
        OnChange = JvEdit1Change
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Item History'
      ImageIndex = 1
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 182
        DataSource = DataForm2.StockHistorySource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'BranchNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemDate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemValue'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemRef'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemType'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SyncHQ'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object CloseAndCancelButton: TJvBitBtn
    Left = 413
    Top = 219
    Width = 123
    Height = 25
    Caption = 'Close and Cancel'
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
    TabOrder = 2
    OnClick = CloseAndCancelButtonClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object CloseAndSaveButton: TJvBitBtn
    Left = 542
    Top = 219
    Width = 124
    Height = 25
    Caption = 'Close and Save'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      909090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0909090FFFFFF3F00007F000030303060606060606060606060
      60606060606060606060606F30306F30307F00006F3030C0C0C03F0000FF0000
      FF0000FF7F7FC0C0C0FF0000FF0000DFDFDFC0C0C0C0C0C0C0C0C0DF60607F00
      00DF00007F0000C0C0C07F0000FF0000FF0000FF7F7FC0C0C0FF0000FF0000DF
      DFDFC0C0C0C0C0C0C0C0C0DF60607F0000BF00007F0000C0C0C07F0000FF0000
      FF0000FF7F7FC0C0C0FF0000FF0000DFDFDFC0C0C0C0C0C0C0C0C0DF60607F00
      00FF00007F0000C0C0C07F0000FF0000FF0000FF3F3FCFCFCFDFDFDFDFDFDFC0
      C0C0C0C0C0C0C0C0C0C0C06F30307F0000FF00007F00009090907F0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000DF0000BF0000BF0000BF00
      00AF6F6F3030306060607F0000FF0000FF0000FF0000FF0000FF0000FF0000DF
      00007F0000B09090C0C0C0CFCFCFCFCFCFCFCFCF6060606060607F0000FF0000
      BF00007F00007F00007F00007F0000BF9F00BFBF006F6F6FBFBFBFBFBFBFBFBF
      BFBFBFBF5050503030307F0000FF00007F7F7FFFFFFFFFFFFFDFBFBF5F3F00BF
      BF009F9F00909090CFCFCFCFCFCFCFCFCFCFCFCF606060FFFFFF7F0000FF0000
      7F7F7FFFFFFFFFFFFF5F3F3FA0A0A07F7F7F9F9F9FC0C0C0CFCFCFCFCFCFCFCF
      CFCFCFCF707070FFFFFF7F0000FF00007F7F7FFFFFFFDFBFBF505050AFAFAFBF
      BFBF8F8F8F0000000000004060608F8F8FCFCFCF000000FFFFFF7F0000FF0000
      7F7F7FFFFFFF7F7F7FBFBFBFAFAFAFBFBFBFAFAFAF606060205F5F3F9FDF2060
      9F4060602020202020207F0000FF00007F7F7FFFFFFF905050BFBFBFBFBFBFBF
      BFBFAFAFAFAFAFAFA0A0A07070705F9F9F3F5F9F3F00BF7070AF7F0000BF0000
      7F7F7FFFFFFF6F6F6FAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFAFAFAF8080803030
      300000007F7FBF9F20DF3F00007F00005F5F5FBFBFBF40000050505040404040
      4040404040505050000000000000FFFFFFFFFFFF202020202020}
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = CloseAndSaveButtonClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
end
