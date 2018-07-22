object UserForm: TUserForm
  Left = 302
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Setup'
  ClientHeight = 364
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 590
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Close'
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
    OnClick = BitBtn1Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 665
    Height = 337
    ActivePage = TabSheet2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'User Setup'
      object Label1: TLabel
        Left = 36
        Top = 217
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object Label2: TLabel
        Left = 0
        Top = 240
        Width = 83
        Height = 13
        Caption = 'Retype Password'
      end
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 1
        Width = 323
        Height = 161
        DataSource = DataForm2.UserSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = JvDBGrid1CellClick
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
            FieldName = 'UserName'
            Title.Caption = 'Login'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Rights'
            Visible = True
          end>
      end
      object Memo1: TMemo
        Left = 328
        Top = 0
        Width = 150
        Height = 83
        Lines.Strings = (
          'Rights'
          ''
          '3 - POS'
          '4 - POS Manager'
          '5 - Everything')
        TabOrder = 1
      end
      object JvBitBtn3: TJvBitBtn
        Left = 329
        Top = 89
        Width = 137
        Height = 25
        Caption = 'Import Users from Hq'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
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
      object Button2: TButton
        Left = 0
        Top = 168
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 74
        Top = 168
        Width = 75
        Height = 25
        Caption = 'Insert'
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 148
        Top = 168
        Width = 75
        Height = 25
        Caption = 'Delete User'
        TabOrder = 5
        OnClick = Button5Click
      end
      object Button1: TButton
        Left = 224
        Top = 168
        Width = 81
        Height = 25
        Caption = 'Set Password:'
        TabOrder = 6
        OnClick = Button1Click
      end
      object Password1: TEdit
        Left = 88
        Top = 209
        Width = 97
        Height = 21
        PasswordChar = '*'
        TabOrder = 7
        Text = 'Password1'
      end
      object Password2: TEdit
        Left = 88
        Top = 233
        Width = 97
        Height = 21
        PasswordChar = '*'
        TabOrder = 8
        Text = 'Password2'
      end
      object CheckBox9: TCheckBox
        Left = 329
        Top = 120
        Width = 201
        Height = 17
        Caption = 'User 3 Allow Inv Item Amount Change'
        TabOrder = 9
        OnClick = CheckBox9Click
      end
      object CheckBox11: TCheckBox
        Left = 329
        Top = 143
        Width = 153
        Height = 17
        Caption = 'User 3 Allow Visible Cashup'
        TabOrder = 10
        OnClick = CheckBox11Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Printing Setup'
      ImageIndex = 1
      object Label3: TLabel
        Left = 264
        Top = 16
        Width = 99
        Height = 13
        Caption = 'Printer receipt select:'
      end
      object Label4: TLabel
        Left = 264
        Top = 40
        Width = 101
        Height = 13
        Caption = 'Printer drawer Select:'
      end
      object Label12: TLabel
        Left = 264
        Top = 64
        Width = 90
        Height = 13
        Caption = 'Serial Drawer Com:'
      end
      object Label8: TLabel
        Left = 300
        Top = 112
        Width = 66
        Height = 13
        Caption = 'Invoice Items:'
      end
      object Label32: TLabel
        Left = 312
        Top = 143
        Width = 93
        Height = 13
        Caption = 'A4 Inv Bottom start:'
      end
      object Label31: TLabel
        Left = 312
        Top = 167
        Width = 88
        Height = 13
        Caption = 'A4 Inv Line Count:'
      end
      object Label30: TLabel
        Left = 312
        Top = 191
        Width = 80
        Height = 13
        Caption = 'Footer Font Size:'
      end
      object Label9: TLabel
        Left = 16
        Top = 213
        Width = 58
        Height = 13
        Caption = 'Report Title:'
      end
      object PrintLogoImg: TJvImage
        Left = 506
        Top = 15
        Width = 122
        Height = 122
        Stretch = True
      end
      object Memo2: TMemo
        Left = 8
        Top = 15
        Width = 249
        Height = 73
        Hint = 'Receipt Heading Space'
        Lines.Strings = (
          'Memo2')
        TabOrder = 0
        WordWrap = False
      end
      object ComportSelect: TComboBox
        Left = 368
        Top = 8
        Width = 105
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnClick = ComportSelectClick
        Items.Strings = (
          'Driver Receipt'
          'Driver A4'
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9'
          'COM10'
          'COM11'
          'COM12'
          'COM13'
          'COM14'
          'COM15'
          'COM16'
          'COM17'
          'COM18'
          'COM19'
          'COM20'
          'LPT1'
          'LPT2')
      end
      object PrinterSelect: TComboBox
        Left = 368
        Top = 32
        Width = 105
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnClick = PrinterSelectClick
        Items.Strings = (
          'EPSON'
          'Serial Drawer')
      end
      object ComboBox1: TComboBox
        Left = 368
        Top = 56
        Width = 81
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        OnClick = ComboBox1Click
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9'
          'COM10'
          'COM11'
          'COM12'
          'COM13'
          'COM14'
          'COM15'
          'COM16'
          'COM17'
          'COM18'
          'COM19'
          'COM20')
      end
      object Button8: TButton
        Left = 368
        Top = 77
        Width = 97
        Height = 25
        Caption = 'Test Kick Drawer'
        TabOrder = 4
        OnClick = Button8Click
      end
      object SaveFooterBtn: TJvBitBtn
        Left = 160
        Top = 98
        Width = 91
        Height = 25
        Caption = 'Save Footer'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = SaveFooterBtnClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object SaveHeaderBtn: TJvBitBtn
        Left = 16
        Top = 88
        Width = 105
        Height = 25
        Caption = 'Save Heading'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = SaveHeaderBtnClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object Memo3: TMemo
        Left = 8
        Top = 123
        Width = 289
        Height = 81
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssBoth
        TabOrder = 7
        WordWrap = False
      end
      object ComboBox2: TComboBox
        Left = 368
        Top = 108
        Width = 109
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        OnClick = ComboBox2Click
        Items.Strings = (
          'Standard'
          'Comment Cat')
      end
      object JvSpinEdit3: TJvSpinEdit
        Left = 408
        Top = 137
        Width = 57
        Height = 21
        Decimal = 1
        ValueType = vtFloat
        Value = 8.500000000000000000
        TabOrder = 9
        OnChange = JvSpinEdit3Change
      end
      object JvSpinEdit2: TJvSpinEdit
        Left = 408
        Top = 161
        Width = 57
        Height = 21
        Decimal = 0
        Value = 27.000000000000000000
        TabOrder = 10
        OnChange = JvSpinEdit2Change
      end
      object JvSpinEdit1: TJvSpinEdit
        Left = 408
        Top = 185
        Width = 57
        Height = 21
        Decimal = 0
        Value = 10.000000000000000000
        TabOrder = 11
        OnChange = JvSpinEdit1Change
      end
      object DBEdit4: TDBEdit
        Left = 80
        Top = 209
        Width = 273
        Height = 21
        DataField = 'ReportTitle'
        DataSource = DataForm2.GlobalSource
        TabOrder = 12
      end
      object CheckBox5: TCheckBox
        Left = 16
        Top = 236
        Width = 145
        Height = 17
        Caption = 'Don'#39't show Barcode Price'
        TabOrder = 13
        OnClick = CheckBox5Click
      end
      object CheckBox4: TCheckBox
        Left = 215
        Top = 236
        Width = 185
        Height = 17
        Caption = 'Activate 2 column Barcode Printing'
        TabOrder = 14
        OnClick = CheckBox4Click
      end
      object LoadLogoBtn: TJvBitBtn
        Left = 506
        Top = 143
        Width = 122
        Height = 25
        Caption = 'Load Logo'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 15
        OnClick = LoadLogoBtnClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Software Settings'
      ImageIndex = 2
      object GroupBox4: TGroupBox
        Left = 3
        Top = 3
        Width = 285
        Height = 242
        Caption = 'Standard Options'
        TabOrder = 0
        object Label15: TLabel
          Left = 8
          Top = 154
          Width = 58
          Height = 13
          Caption = 'Last Inv No:'
        end
        object Label16: TLabel
          Left = 8
          Top = 112
          Width = 104
          Height = 13
          Caption = 'Other Payment Descr:'
        end
        object Label21: TLabel
          Left = 8
          Top = 133
          Width = 106
          Height = 13
          Caption = 'Last Purchase Inv No:'
        end
        object Label28: TLabel
          Left = 8
          Top = 89
          Width = 168
          Height = 13
          Caption = 'Minimum Markup % (1 - 199, 0=Off):'
        end
        object Label33: TLabel
          Left = 8
          Top = 66
          Width = 78
          Height = 13
          Caption = 'Comment Descr:'
        end
        object Label7: TLabel
          Left = 167
          Top = 155
          Width = 29
          Height = 13
          Caption = 'Tax %'
        end
        object Label10: TLabel
          Left = 137
          Top = 179
          Width = 92
          Height = 13
          Caption = 'Cash Deb. Acc No:'
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 13
          Width = 121
          Height = 17
          Hint = 
            'Select to Show the Name, Cell and EMail fields on main pos Scree' +
            'n.'
          Caption = 'Show POS Additions'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = CheckBox3Click
        end
        object CheckBox6: TCheckBox
          Left = 135
          Top = 13
          Width = 128
          Height = 17
          Hint = 
            'Select this if you don'#39't want your stock Qty to go past zero int' +
            'o negative'
          Caption = 'Disallow Negative Qty'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = CheckBox6Click
        end
        object CheckBox7: TCheckBox
          Left = 8
          Top = 36
          Width = 97
          Height = 17
          Hint = 
            'Select if a User 3 user should only see his invoices on the pos ' +
            'screen.'
          Caption = 'Show only User'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = CheckBox7Click
        end
        object DBEdit1: TDBEdit
          Left = 120
          Top = 128
          Width = 89
          Height = 21
          DataField = 'PurchaseInvNo'
          DataSource = DataForm2.GlobalSource
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 150
          Width = 89
          Height = 21
          DataField = 'InvNo'
          DataSource = DataForm2.GlobalSource
          TabOrder = 4
        end
        object JvSpinEdit4: TJvSpinEdit
          Left = 200
          Top = 150
          Width = 56
          Height = 21
          Hint = 'Make Tax zero for no tax'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnChange = JvSpinEdit4Change
        end
        object CheckBox1: TCheckBox
          Left = 135
          Top = 36
          Width = 106
          Height = 17
          Caption = 'Stock No Format 2'
          TabOrder = 6
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 213
          Top = 110
          Width = 68
          Height = 17
          Caption = 'A4 , Com'
          TabOrder = 7
          OnClick = CheckBox2Click
        end
        object DBEdit7: TDBEdit
          Left = 118
          Top = 106
          Width = 89
          Height = 21
          Hint = 
            'If you want to give a description for the other payment type on ' +
            'pos screen'
          DataField = 'OtherDescr'
          DataSource = DataForm2.GlobalSource
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object DBEdit8: TDBEdit
          Left = 92
          Top = 62
          Width = 77
          Height = 21
          DataField = 'CommentDescr'
          DataSource = DataForm2.GlobalSource
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 182
          Top = 83
          Width = 51
          Height = 21
          Hint = 
            'If you set this the pos user will not be able to give discount p' +
            'ast this markup %'
          DataField = 'MinimumMarkup'
          DataSource = DataForm2.GlobalSource
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object CheckBox8: TCheckBox
          Left = 8
          Top = 185
          Width = 123
          Height = 17
          Hint = 'Select to search for Stock no instead of Barcode'
          Caption = 'Stock No for Barcode'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = CheckBox8Click
        end
        object DBEdit10: TDBEdit
          Left = 233
          Top = 175
          Width = 49
          Height = 21
          DataField = 'TCCashDebNo'
          DataSource = DataForm2.GlobalSource
          TabOrder = 12
        end
        object CheckBox10: TCheckBox
          Left = 8
          Top = 208
          Width = 177
          Height = 17
          Caption = 'Default Inv Print Question to Yes'
          TabOrder = 13
          OnClick = CheckBox10Click
        end
      end
      object GroupBox5: TGroupBox
        Left = 294
        Top = 3
        Width = 266
        Height = 135
        Caption = 'Branch Settings'
        TabOrder = 1
        object Label13: TLabel
          Left = 7
          Top = 18
          Width = 60
          Height = 13
          Caption = 'HQ Address:'
        end
        object Label14: TLabel
          Left = 6
          Top = 112
          Width = 119
          Height = 13
          Caption = 'HQ Assigned Branch No:'
        end
        object JvSpeedButton13: TJvSpeedButton
          Left = 230
          Top = 43
          Width = 25
          Height = 25
          Hint = 'Test Connection'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFF000000
            404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00404040FFFFFFFFFFFFFFFFFF000000404040FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000606060FFFFFFFFFFFFFFFFFF000000
            404040FFFFFF202020404040404040202020FFFFFFFFFFFFFFFFFF4040403030
            30404040404040202020FFFFFF00000040404020202020202000000000000060
            6060202020FFFFFF303030404040404040404040404040606060FFFFFF000000
            404040000000404040FFFFFFFFFFFF000000404040FFFFFF7F7F7FC0C0C0C0C0
            C0C0C0C0A0A0A0404040FFFFFF000000404040000000404040FFFFFFFFFFFF00
            00006060602020207F7F7FC0C0C0C0C0C0C0C0C0A0A0A0404040FFFFFF000000
            404040000000404040FFFFFF000000BFBFBF4040404040407F7F7FC0C0C0C0C0
            C0C0C0C0A0A0A0404040FFFFFF000000606060000000606060FFFFFF000000DF
            DFDF4040404040407F7F7FDFDFDFDFDFDFDFDFDFBFBFBF202020000000303030
            202020303030202020606060000000DFDFDF4040404040400000003030302020
            20303030202020FFFFFF6F6F6FA0A0A0A0A0A0A0A0A0909090404040000000DF
            DFDF404040404040FFFFFF000000202020000000202020FFFFFF7F7F7FC0C0C0
            C0C0C0C0C0C0A0A0A0404040000000EFEFEF5F5F5F202020FFFFFF0000004040
            40000000404040FFFFFF7F7F7FC0C0C0C0C0C0C0C0C0A0A0A0404040FFFFFF00
            0000202020FFFFFFFFFFFF000000404040000000404040FFFFFF7F7F7FC0C0C0
            C0C0C0C0C0C0A0A0A0404040FFFFFF000000606060FFFFFFFFFFFF0000004040
            40000000404040FFFFFF3F3F3F7F7F7F7F7F7F7F7F7F6F6F6F000000FFFFFFFF
            FFFF202020404040404040404040FFFFFF000000404040FFFFFFFFFFFFFFFFFF
            303030202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000404040FFFFFFFFFFFFFFFFFF000000404040FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000202020FFFFFF}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          OnClick = JvSpeedButton13Click
        end
        object Label11: TLabel
          Left = 7
          Top = 43
          Width = 70
          Height = 13
          Caption = 'HQ Username:'
        end
        object Label17: TLabel
          Left = 7
          Top = 65
          Width = 68
          Height = 13
          Caption = 'HQ Password:'
        end
        object Label18: TLabel
          Left = 7
          Top = 88
          Width = 61
          Height = 13
          Caption = 'HQ Schema:'
        end
        object JvEdit1: TJvEdit
          Left = 73
          Top = 16
          Width = 128
          Height = 21
          TabOrder = 0
          Text = 'JvEdit1'
          OnChange = JvEdit1Change
        end
        object DBEdit3: TDBEdit
          Left = 131
          Top = 109
          Width = 52
          Height = 21
          DataField = 'BranchNo'
          DataSource = DataForm2.GlobalSource
          TabOrder = 5
        end
        object Edit1: TEdit
          Left = 83
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'Edit1'
          OnChange = Edit1Change
        end
        object Edit2: TEdit
          Left = 83
          Top = 62
          Width = 121
          Height = 21
          PasswordChar = '*'
          TabOrder = 3
          Text = 'Edit2'
          OnChange = Edit2Change
        end
        object Edit3: TEdit
          Left = 210
          Top = 16
          Width = 50
          Height = 21
          TabOrder = 1
          Text = 'Edit3'
          OnChange = Edit3Change
        end
        object Edit4: TEdit
          Left = 83
          Top = 85
          Width = 121
          Height = 21
          TabOrder = 4
          Text = 'Edit4'
          OnChange = Edit4Change
        end
      end
      object GroupBox6: TGroupBox
        Left = 294
        Top = 144
        Width = 266
        Height = 62
        Caption = 'Lay Buy Settings'
        TabOrder = 2
        object Label22: TLabel
          Left = 120
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Deposit %:'
        end
        object Label23: TLabel
          Left = 8
          Top = 41
          Width = 112
          Height = 13
          Caption = 'Lay Buy Term (Months):'
        end
        object JvCheckBox1: TJvCheckBox
          Left = 8
          Top = 15
          Width = 95
          Height = 17
          Caption = 'Enable Lay Buy'
          TabOrder = 0
          OnClick = JvCheckBox1Click
          LinkedControls = <>
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object DBEdit5: TDBEdit
          Left = 126
          Top = 36
          Width = 83
          Height = 21
          Hint = 'Select how many months the Lay buy must be'
          DataField = 'LayBuyTerm'
          DataSource = DataForm2.GlobalSource
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 184
          Top = 14
          Width = 65
          Height = 21
          Hint = 'This is the % the deposit for a lay buy must be'
          DataField = 'LayBuyDeposit'
          DataSource = DataForm2.GlobalSource
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 250
        Width = 478
        Height = 58
        Caption = 'E Mail setup'
        TabOrder = 3
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Smtp server:'
        end
        object Label6: TLabel
          Left = 40
          Top = 37
          Width = 26
          Height = 13
          Caption = 'From:'
        end
        object SmtpEdit: TEdit
          Left = 80
          Top = 8
          Width = 161
          Height = 21
          TabOrder = 0
          Text = 'SmtpEdit'
          OnChange = SmtpEditChange
        end
        object FromEdit: TEdit
          Left = 80
          Top = 32
          Width = 161
          Height = 21
          TabOrder = 1
          Text = 'FromEdit'
          OnChange = FromEditChange
        end
        object StatusMemo: TMemo
          Left = 243
          Top = 8
          Width = 233
          Height = 45
          ScrollBars = ssVertical
          TabOrder = 2
          WordWrap = False
        end
      end
    end
  end
  object MailMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 536
    Top = 296
  end
  object SMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 464
    Top = 296
  end
  object SelectPath: TJvSelectDirectory
    InitialDir = 'c:\TCash3'
    Left = 500
    Top = 296
  end
  object ICMP: TIdIcmpClient
    Port = 3306
    Protocol = 1
    ProtocolIPv6 = 58
    IPVersion = Id_IPv4
    PacketSize = 1024
    OnReply = ICMPReply
    Left = 408
    Top = 296
  end
  object LogoSelectDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 552
    Top = 208
  end
end
