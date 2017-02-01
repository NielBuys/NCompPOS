object ExtractForm: TExtractForm
  Left = 426
  Top = 223
  Caption = 'Extraction Form'
  ClientHeight = 290
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TJvMemo
    Left = 16
    Top = 16
    Width = 425
    Height = 257
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 0
    WordWrap = False
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'Csv Files|*.csv|All Files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Csv Extraction'
    Left = 400
    Top = 32
  end
end
