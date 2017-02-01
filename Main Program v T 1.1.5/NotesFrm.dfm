object NotesForm: TNotesForm
  Left = 190
  Top = 112
  BorderIcons = [biSystemMenu]
  Caption = 'Notes'
  ClientHeight = 513
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 753
    Height = 481
    DataSource = DataForm2.NoteSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
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
        FieldName = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 550
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NoteBy'
        Title.Caption = 'Note By'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LinkID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FromWhere'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 680
    Top = 488
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
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 80
    Width = 753
    Height = 89
    Caption = 'Add a note'
    TabOrder = 0
    Visible = False
    object UserDisplay: TLabel
      Left = 128
      Top = 22
      Width = 56
      Height = 13
      Caption = 'UserDisplay'
    end
    object FromWhere: TLabel
      Left = 264
      Top = 22
      Width = 55
      Height = 13
      Caption = 'FromWhere'
    end
    object Button1: TButton
      Left = 616
      Top = 54
      Width = 65
      Height = 25
      Caption = 'Add Note'
      TabOrder = 0
      OnClick = Button1Click
    end
    object NoteDate: TJvDateTimePicker
      Left = 8
      Top = 16
      Width = 105
      Height = 21
      Date = 38947.359968888880000000
      Format = 'yyyy/MM/dd'
      Time = 38947.359968888880000000
      TabOrder = 1
      DropDownDate = 38947.000000000000000000
    end
    object Reminder: TCheckBox
      Left = 344
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Set Reminder'
      TabOrder = 2
      OnClick = ReminderClick
    end
    object ReminderDate: TJvDateTimePicker
      Left = 440
      Top = 16
      Width = 97
      Height = 21
      Date = 38947.366718564810000000
      Format = 'yyyy/MM/dd'
      Time = 38947.366718564810000000
      TabOrder = 3
      DropDownDate = 38947.000000000000000000
    end
    object ReminderTime: TJvDateTimePicker
      Left = 544
      Top = 16
      Width = 81
      Height = 21
      Date = 38947.368411458330000000
      Format = 'HH:mm:ss'
      Time = 38947.368411458330000000
      Kind = dtkTime
      TabOrder = 4
      DropDownDate = 38947.000000000000000000
    end
    object Cancel: TCheckBox
      Left = 640
      Top = 22
      Width = 105
      Height = 17
      Caption = 'Cancel Reminder'
      TabOrder = 5
    end
    object Description: TJvEdit
      Left = 8
      Top = 56
      Width = 601
      Height = 21
      Hint = 'Note Description'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnKeyPress = DescriptionKeyPress
    end
    object Button2: TButton
      Left = 680
      Top = 54
      Width = 65
      Height = 25
      Caption = 'New Note'
      TabOrder = 7
      OnClick = Button2Click
    end
  end
end
