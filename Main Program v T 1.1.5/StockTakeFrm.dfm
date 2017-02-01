object StockTakeForm: TStockTakeForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Stocktake'
  ClientHeight = 297
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StockTakeGrid: TJvDBGrid
    Left = 0
    Top = 0
    Width = 409
    Height = 265
    DataSource = DataForm2.StockTakeSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = StockTakeGridDblClick
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = StockTakeGridTitleBtnClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'StockTakeDate'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StockTakeDescription'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StockTakeStatus'
        Width = 84
        Visible = True
      end>
  end
  object JvBitBtn1: TJvBitBtn
    Left = 334
    Top = 271
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 1
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object NewStockTakeBtn: TJvBitBtn
    Left = 0
    Top = 271
    Width = 123
    Height = 25
    Caption = 'Create New Stocktake'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = NewStockTakeBtnClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
end
