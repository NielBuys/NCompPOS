object ReportFilterForm: TReportFilterForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Report Filter'
  ClientHeight = 310
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 393
    Height = 257
    ActivePage = TabSheetFilter1
    TabOrder = 0
    object TabSheetFilter1: TTabSheet
      Caption = 'Filter1'
      object FilterList1: TJvCheckListBox
        Left = 0
        Top = 0
        Width = 385
        Height = 201
        ItemHeight = 13
        Items.Strings = (
          'Toets 1'
          'Toets 2')
        ScrollWidth = 54
        TabOrder = 0
      end
      object SelectAllCheckList1: TCheckBox
        Left = 3
        Top = 209
        Width = 97
        Height = 17
        Caption = 'Select All'
        TabOrder = 1
        OnClick = SelectAllCheckList1Click
      end
    end
    object TabSheetFilter2: TTabSheet
      Caption = 'Filter2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object FilterList2: TJvCheckListBox
        Left = 0
        Top = 0
        Width = 385
        Height = 201
        ItemHeight = 13
        Items.Strings = (
          'Toets 1'
          'Toets 2')
        ScrollWidth = 54
        TabOrder = 0
      end
      object SelectAllCheckList2: TCheckBox
        Left = 3
        Top = 209
        Width = 97
        Height = 17
        Caption = 'Select All'
        TabOrder = 1
        OnClick = SelectAllCheckList2Click
      end
    end
    object TabSheetFilter3: TTabSheet
      Caption = 'Filter3'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object FilterList3: TJvCheckListBox
        Left = 0
        Top = 0
        Width = 385
        Height = 201
        ItemHeight = 13
        Items.Strings = (
          'Toets 1'
          'Toets 2')
        ScrollWidth = 54
        TabOrder = 0
      end
      object SelectAllCheckList3: TCheckBox
        Left = 3
        Top = 209
        Width = 97
        Height = 17
        Caption = 'Select All'
        TabOrder = 1
        OnClick = SelectAllCheckList3Click
      end
    end
  end
  object JvBitBtn1: TJvBitBtn
    Left = 318
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Select'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object DateRangebox: TGroupBox
    Left = 0
    Top = 256
    Width = 201
    Height = 50
    Caption = 'Date Range'
    TabOrder = 2
    Visible = False
    object FromDate: TJvDateTimePicker
      Left = 18
      Top = 20
      Width = 86
      Height = 20
      Date = 40735.774068356480000000
      Format = 'yyyy/MM/dd'
      Time = 40735.774068356480000000
      TabOrder = 0
      DropDownDate = 40735.000000000000000000
    end
    object ToDate: TJvDateTimePicker
      Left = 105
      Top = 20
      Width = 86
      Height = 20
      Date = 40735.775030219910000000
      Format = 'yyyy/MM/dd'
      Time = 40735.775030219910000000
      TabOrder = 1
      DropDownDate = 40735.000000000000000000
    end
  end
end
