object BarcodePrintingForm: TBarcodePrintingForm
  Left = 421
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Barcode Printing'
  ClientHeight = 129
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 78
    Width = 178
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Limit Qty Barcodes (0 for all barcodes)'
  end
  object JvBitBtn1: TJvBitBtn
    Left = 358
    Top = 104
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
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
    Left = 0
    Top = 104
    Width = 105
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Print Barcodes'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = JvBitBtn2Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object JvSpinEdit1: TJvSpinEdit
    Left = 208
    Top = 72
    Width = 73
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Decimal = 0
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 433
    Height = 65
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Type Range and then check box to enable the Range'
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 26
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 184
      Top = 32
      Width = 16
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'To:'
    end
    object Edit1: TEdit
      Left = 56
      Top = 24
      Width = 113
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 216
      Top = 24
      Width = 113
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 1
      OnExit = Edit2Exit
    end
    object CheckBox1: TCheckBox
      Left = 336
      Top = 32
      Width = 89
      Height = 17
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Enable Range'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object BarcodeList: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = BarcodeListPrint
    OnBeforePrint = BarcodeListBeforePrint
    Left = 216
    Top = 104
  end
  object RvProject1: TRvProject
    Engine = BarcodeList
    ProjectFile = 'Barcode.rav'
    Left = 184
    Top = 104
  end
end
