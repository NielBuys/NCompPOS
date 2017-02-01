object AccountSearchForm: TAccountSearchForm
  Left = 453
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Account Search'
  ClientHeight = 382
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object JvDBGrid1: TJvDBGrid
    Left = 20
    Top = 20
    Width = 395
    Height = 306
    DataSource = TCData.dsAccount
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnKeyPress = JvDBGrid1KeyPress
    TitleButtons = True
    OnTitleBtnClick = JvDBGrid1TitleBtnClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 20
    TitleRowHeight = 20
    Columns = <
      item
        Expanded = False
        FieldName = 'SAccountCode'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SDescription'
        Width = 64
        Visible = True
      end>
  end
  object JvBitBtn1: TJvBitBtn
    Left = 315
    Top = 335
    Width = 92
    Height = 31
    Caption = 'Close'
    TabOrder = 1
    Kind = bkClose
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -14
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
end
