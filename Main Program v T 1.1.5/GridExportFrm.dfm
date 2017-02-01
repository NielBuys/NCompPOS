object GridExportForm: TGridExportForm
  Left = 197
  Top = 127
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Grid Export'
  ClientHeight = 487
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    743
    487)
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 743
    Height = 455
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataForm2.InvoiceExportSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MaxColumnWidth = 100
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object JvBitBtn1: TJvBitBtn
    Left = 668
    Top = 462
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akRight, akBottom]
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 1
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvBitBtn2: TJvBitBtn
    Left = 16
    Top = 462
    Width = 97
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = 'Export Data'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000CFCFCFC0C0C0
      B0B0B08080808080808080800000000000000000000000000000000000000000
      00000000000000FFFFFFBFBFBFDFDFDFFFFFFFCFCFCFC0C0C0C0C0C090909080
      8080808080808080808080808080606060202020000000000000BFBFBFAFAFAF
      FFFFFFFFFFFFCFCFCFC0C0C0B0B0B08080808080808080808080808080808080
      80808080202020000000BFBFBFA0A0A0CFCFCFFFBFBFCF6F6FDF6060DF6060CF
      5050BF4040BF7F409F6060808080808080808080404040000000BFBFBF808080
      B0B0B0DF6060BF0000FF0000FF0000FF0000FF0000FF7F00BF40408080808080
      80808080404040000000BFBFBF808080808080BF4040BF0000FF0000FF0000FF
      0000FF0000FF7F00BF4040808080808080808080404040000000BFBFBFBFBFBF
      BFBFBFDF5F5FBF0000FF0000FF0000FF0000FF0000FF7F00BF40408080808080
      808080809F9F9F2020204040406060604040409F2020DF0000BF0000BF0000BF
      0000BF0000DF0000BF40408080808080809F9F9FDFDFDF202020202020DFDFDF
      2020209F2020FF0000CF5050BF4040CF5050FF3F3FFF0000EF6F6FBFBFBFBFBF
      BFBFBFBF202020FFFFFF7F7F7F9F9F9F808080BF4040FF0000CFCFCF909090FF
      0000DF6060FF00007F0000000000000000000000000000000000BFBFBF808080
      808080BF40405F0000909090DFDFDFCF5050DF5F5F9F0000AF6F6FC0C0C09090
      90808080BFBFBF000000BFBFBF80808080808040404020202080808080808080
      80808080803030306F6F6FDFDFDFB0B0B0808080BFBFBF000000BFBFBF808080
      808080808080404040808080808080808080808080404040A0A0A0DFDFDFCFCF
      CF909090BFBFBF0000007F7F7F9F9F9F80808080808040404080808080808080
      8080808080404040808080B0B0B0EFEFEFC0C0C0BFBFBF000000202020DFDFDF
      9F9F9F404040202020808080808080808080808080202020404040808080B0B0
      B0DFDFDFDFDFDF000000FFFFFF2020207F7F7F7F7F7F5F5F5FBFBFBFBFBFBFBF
      BFBFBFBFBF5F5F5F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBF6F6F6F}
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object SaveGrid: TJvSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV Files|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Export Grid'
    Height = 0
    Width = 0
    Left = 440
    Top = 336
  end
  object JvDBGridCSVExport1: TJvDBGridCSVExport
    Caption = 'Exporting to CSV/Text...'
    Grid = JvDBGrid1
    ExportSeparator = esComma
    Left = 448
    Top = 288
  end
end
