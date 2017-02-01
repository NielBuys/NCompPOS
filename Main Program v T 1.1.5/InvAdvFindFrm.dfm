object InvAdvFindForm: TInvAdvFindForm
  Left = 0
  Top = 0
  Caption = 'Invoice Advanced Find'
  ClientHeight = 465
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    792
    465)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 13
    Width = 54
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'From Date:'
  end
  object Label4: TLabel
    Left = 184
    Top = 13
    Width = 42
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'To Date:'
  end
  object JvSpeedButton1: TJvSpeedButton
    Left = 687
    Top = 439
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
    ExplicitTop = 415
  end
  object JvBitBtn2: TJvBitBtn
    Left = 717
    Top = 439
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akRight, akBottom]
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
    TabOrder = 0
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object SearchData: TEdit
    Left = 8
    Top = 34
    Width = 177
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 1
  end
  object JvBitBtn3: TJvBitBtn
    Left = 191
    Top = 32
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Find Inv No'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = JvBitBtn3Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvBitBtn4: TJvBitBtn
    Left = 272
    Top = 32
    Width = 97
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Find Client Name'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = JvBitBtn4Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvBitBtn5: TJvBitBtn
    Left = 375
    Top = 32
    Width = 99
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Find Client Tel C'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = JvBitBtn5Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvBitBtn6: TJvBitBtn
    Left = 480
    Top = 32
    Width = 97
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Find Client E Mail'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = JvBitBtn6Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object Fromdate: TJvDateTimePicker
    Left = 80
    Top = 7
    Width = 97
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Date = 38828.027060902780000000
    Format = 'yyyy/MM/dd'
    Time = 38828.027060902780000000
    TabOrder = 6
    DropDownDate = 38828.000000000000000000
  end
  object ToDate: TJvDateTimePicker
    Left = 240
    Top = 7
    Width = 97
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Date = 38828.027269780090000000
    Format = 'yyyy/MM/dd'
    Time = 38828.027269780090000000
    TabOrder = 7
    DropDownDate = 38828.000000000000000000
  end
  object JvBitBtn1: TJvBitBtn
    Left = 341
    Top = 3
    Width = 169
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Show All invoices in date Range'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 60
    Width = 792
    Height = 374
    ActivePage = InvoiceSearchPage
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    object InvoiceSearchPage: TTabSheet
      Caption = 'Invoice Search'
      DesignSize = (
        784
        346)
      object InvoiceListGrid: TJvDBGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 350
        Hint = 'Double Click record to open invoice'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataForm2.InvAdvFindSource
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = InvoiceListGridDblClick
        TitleButtons = True
        TitleButtonAllowMove = True
        OnTitleBtnClick = InvoiceListGridTitleBtnClick
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'InvNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BranchNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvDate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvClose'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvBy'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvTotal'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AmmTendered'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Premium'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientTelC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientEMail'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientTelW'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientAdr1'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientAdr2'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientAdr3'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientPCode'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientVatNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RefNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvoiceType'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GLDebNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSet'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShiftSet'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SyncHQ'
            Visible = True
          end>
      end
    end
    object InvoiceItemSearchPage: TTabSheet
      Caption = 'Invoice Item Search'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        784
        346)
      object InvoiceItemListGrid: TJvDBGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 343
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataForm2.InvItemAdvFindSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = InvoiceItemListGridDblClick
        TitleButtons = True
        TitleButtonAllowMove = True
        OnTitleBtnClick = InvoiceItemListGridTitleBtnClick
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'InvNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BranchNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InvDate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClientName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TCStockNo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SellingPrice'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Discount'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QtySold'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CostPrice'
            Visible = True
          end>
      end
    end
  end
  object HideOpenInvoicesTick: TJvCheckBox
    Left = 515
    Top = 7
    Width = 114
    Height = 17
    Caption = 'Hide Open Invoices'
    Checked = True
    State = cbChecked
    TabOrder = 10
    LinkedControls = <>
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object CSVExport: TJvDBGridCSVExport
    Caption = 'Exporting to CSV/Text...'
    ExportSeparator = esComma
    Left = 568
    Top = 288
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'csv files|*.csv|All Files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 496
    Top = 288
  end
end
