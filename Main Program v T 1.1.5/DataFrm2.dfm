object DataForm2: TDataForm2
  OldCreateOrder = False
  Height = 569
  Width = 798
  object UserSource: TDataSource
    DataSet = User_db
    OnStateChange = UserSourceStateChange
    Left = 48
    Top = 8
  end
  object Query1Source: TDataSource
    DataSet = Query1
    Enabled = False
    Left = 648
    Top = 56
  end
  object NoteSource: TDataSource
    DataSet = NotesQuery
    Left = 232
    Top = 8
  end
  object StockSource: TDataSource
    DataSet = StockTable
    OnStateChange = StockSourceStateChange
    Left = 48
    Top = 56
  end
  object StockQuerySource: TDataSource
    DataSet = StockQuery
    Left = 232
    Top = 56
  end
  object InvoiceSource: TDataSource
    DataSet = InvoiceTable
    OnStateChange = InvoiceSourceStateChange
    Left = 408
    Top = 56
  end
  object InvoiceItemSource: TDataSource
    DataSet = InvoiceItemTable
    OnStateChange = InvoiceItemSourceStateChange
    Left = 408
    Top = 104
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 668
    Top = 416
  end
  object CashUpSource: TDataSource
    DataSet = CashUpTable
    OnStateChange = CashUpSourceStateChange
    Left = 48
    Top = 104
  end
  object BranchSource: TDataSource
    DataSet = BranchTable
    OnStateChange = BranchSourceStateChange
    Left = 408
    Top = 8
  end
  object StockTrnsferSource: TDataSource
    DataSet = StockTrnsferTable
    OnStateChange = StockTrnsferSourceStateChange
    Left = 48
    Top = 152
  end
  object StocktrnsferItemSource: TDataSource
    DataSet = StocktrnsferItemTable
    OnStateChange = StocktrnsferItemSourceStateChange
    Left = 48
    Top = 200
  end
  object PurchaseItemSource: TDataSource
    DataSet = PurchaseItemTable
    OnStateChange = PurchaseItemSourceStateChange
    Left = 408
    Top = 152
  end
  object TransQuerySource: TDataSource
    DataSet = TransQuery
    Left = 232
    Top = 104
  end
  object InvoiceExportSource: TDataSource
    DataSet = InvoiceExportQuery
    Left = 232
    Top = 152
  end
  object GlobalSource: TDataSource
    DataSet = GlobalTable
    OnStateChange = GlobalSourceStateChange
    Left = 48
    Top = 280
  end
  object GRNSource: TDataSource
    DataSet = GRNTable
    OnStateChange = GRNSourceStateChange
    Left = 408
    Top = 224
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    TextEncoding = ASCIIEncoding
    Left = 592
    Top = 416
  end
  object ADConnection: TADConnection
    Params.Strings = (
      'Database=ncomp'
      'User_Name=root'
      'Password=djb115'
      'Host=192.168.9.71'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    LoginPrompt = False
    Left = 240
    Top = 295
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 240
    Top = 391
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    ScreenCursor = gcrDefault
    Left = 240
    Top = 343
  end
  object Query3: TADQuery
    Connection = ADConnection
    Left = 584
    Top = 168
  end
  object Query2: TADQuery
    Connection = ADConnection
    Left = 584
    Top = 112
  end
  object Query4: TADQuery
    Connection = ADConnection
    Left = 640
    Top = 168
  end
  object Query1: TADQuery
    Connection = ADConnection
    Left = 584
    Top = 56
  end
  object InvoiceTable: TADQuery
    OnNewRecord = InvoiceTableNewRecord
    Connection = ADConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    SQL.Strings = (
      'select * from invoice_db')
    Left = 496
    Top = 56
    object InvoiceTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object InvoiceTableInvNo: TLongWordField
      FieldName = 'InvNo'
      Origin = 'InvNo'
      Required = True
    end
    object InvoiceTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object InvoiceTableClientName: TStringField
      FieldName = 'ClientName'
      Origin = 'ClientName'
      Size = 30
    end
    object InvoiceTableClientTelW: TStringField
      FieldName = 'ClientTelW'
      Origin = 'ClientTelW'
    end
    object InvoiceTableClientTelC: TStringField
      FieldName = 'ClientTelC'
      Origin = 'ClientTelC'
    end
    object InvoiceTableClientAdr1: TStringField
      FieldName = 'ClientAdr1'
      Origin = 'ClientAdr1'
      Size = 30
    end
    object InvoiceTableClientAdr2: TStringField
      FieldName = 'ClientAdr2'
      Origin = 'ClientAdr2'
      Size = 30
    end
    object InvoiceTableClientAdr3: TStringField
      FieldName = 'ClientAdr3'
      Origin = 'ClientAdr3'
      Size = 30
    end
    object InvoiceTableClientPCode: TStringField
      FieldName = 'ClientPCode'
      Origin = 'ClientPCode'
      Size = 4
    end
    object InvoiceTableClientVatNo: TStringField
      FieldName = 'ClientVatNo'
      Origin = 'ClientVatNo'
      Size = 30
    end
    object InvoiceTableInvDate: TLongWordField
      FieldName = 'InvDate'
      Origin = 'InvDate'
      DisplayFormat = '0000/00/00'
    end
    object InvoiceTableInvBy: TStringField
      FieldName = 'InvBy'
      Origin = 'InvBy'
      Size = 45
    end
    object InvoiceTableMemLink: TLongWordField
      FieldName = 'MemLink'
      Origin = 'MemLink'
    end
    object InvoiceTableInvClose: TStringField
      FieldName = 'InvClose'
      Origin = 'InvClose'
      Size = 5
    end
    object InvoiceTableAmmTendered: TBCDField
      FieldName = 'AmmTendered'
      Origin = 'AmmTendered'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceTableInvoiceType: TStringField
      FieldName = 'InvoiceType'
      Origin = 'InvoiceType'
      Size = 15
    end
    object InvoiceTableGLDebNo: TStringField
      FieldName = 'GLDebNo'
      Origin = 'GLDebNo'
    end
    object InvoiceTableInvTotal: TBCDField
      FieldName = 'InvTotal'
      Origin = 'InvTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceTableShiftSet: TStringField
      FieldName = 'ShiftSet'
      Origin = 'ShiftSet'
    end
    object InvoiceTableClientEMail: TStringField
      DisplayWidth = 100
      FieldName = 'ClientEMail'
      Origin = 'ClientEMail'
      Size = 100
    end
    object InvoiceTableDays30: TBCDField
      FieldName = 'Days30'
      Origin = 'Days30'
      Precision = 10
      Size = 2
    end
    object InvoiceTableDays60: TBCDField
      FieldName = 'Days60'
      Origin = 'Days60'
      Precision = 10
      Size = 2
    end
    object InvoiceTableDays90: TBCDField
      FieldName = 'Days90'
      Origin = 'Days90'
      Precision = 10
      Size = 2
    end
    object InvoiceTableDays120: TBCDField
      FieldName = 'Days120'
      Origin = 'Days120'
      Precision = 10
      Size = 2
    end
    object InvoiceTablePremium: TBCDField
      FieldName = 'Premium'
      Origin = 'Premium'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceTableRefNo: TStringField
      FieldName = 'RefNo'
      Origin = 'RefNo'
      Size = 15
    end
    object InvoiceTableTestField: TStringField
      FieldName = 'TestField'
      Origin = 'TestField'
    end
    object InvoiceTableTermMonths: TLongWordField
      FieldName = 'TermMonths'
      Origin = 'TermMonths'
    end
    object InvoiceTableCUSet: TIntegerField
      FieldName = 'CUSet'
      Origin = 'CUSet'
    end
    object InvoiceTableSyncHQ: TIntegerField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
  end
  object GlobalTable: TADTable
    Connection = ADConnection
    UpdateOptions.UpdateTableName = 'global_db'
    TableName = 'global_db'
    Left = 128
    Top = 280
    object GlobalTableNr: TLongWordField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object GlobalTableInvNo: TLongWordField
      FieldName = 'InvNo'
      Origin = 'InvNo'
      Required = True
    end
    object GlobalTablePurchaseInvNo: TLongWordField
      FieldName = 'PurchaseInvNo'
      Origin = 'PurchaseInvNo'
      Required = True
    end
    object GlobalTableDAccNo: TLongWordField
      FieldName = 'DAccNo'
      Origin = 'DAccNo'
    end
    object GlobalTableCAccNo: TLongWordField
      FieldName = 'CAccNo'
      Origin = 'CAccNo'
    end
    object GlobalTableDActiveMonth: TLongWordField
      FieldName = 'DActiveMonth'
      Origin = 'DActiveMonth'
    end
    object GlobalTableCActiveMonth: TLongWordField
      FieldName = 'CActiveMonth'
      Origin = 'CActiveMonth'
    end
    object GlobalTableBranchNo: TLongWordField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object GlobalTableVat: TFloatField
      FieldName = 'Vat'
      Origin = 'Vat'
      Required = True
    end
    object GlobalTableReportTitle: TStringField
      FieldName = 'ReportTitle'
      Origin = 'ReportTitle'
      Size = 250
    end
    object GlobalTableLayBuyEnable: TStringField
      FieldName = 'LayBuyEnable'
      Origin = 'LayBuyEnable'
      Size = 2
    end
    object GlobalTableLayBuyTerm: TLongWordField
      FieldName = 'LayBuyTerm'
      Origin = 'LayBuyTerm'
    end
    object GlobalTableLayBuyDeposit: TBCDField
      FieldName = 'LayBuyDeposit'
      Origin = 'LayBuyDeposit'
      Precision = 10
      Size = 2
    end
    object GlobalTableOtherDescr: TStringField
      FieldName = 'OtherDescr'
      Origin = 'OtherDescr'
    end
    object GlobalTableNegQty: TStringField
      FieldName = 'NegQty'
      Origin = 'NegQty'
      Size = 2
    end
    object GlobalTableCommentDescr: TStringField
      FieldName = 'CommentDescr'
      Origin = 'CommentDescr'
    end
    object GlobalTableMinimumMarkup: TFloatField
      FieldName = 'MinimumMarkup'
      Origin = 'MinimumMarkup'
    end
    object GlobalTableShowAdditions: TStringField
      FieldName = 'ShowAdditions'
      Origin = 'ShowAdditions'
      Size = 2
    end
    object GlobalTableCurrentUser: TStringField
      FieldName = 'CurrentUser'
      Origin = 'CurrentUser'
      Size = 2
    end
    object GlobalTableTCCashDebNo: TStringField
      FieldName = 'TCCashDebNo'
      Origin = 'TCCashDebNo'
      Size = 30
    end
    object GlobalTableTCStockNoBarcode: TStringField
      FieldName = 'TCStockNoBarcode'
      Origin = 'TCStockNoBarcode'
      Size = 2
    end
    object GlobalTableDefaultRecPrintChoice: TStringField
      FieldName = 'DefaultRecPrintChoice'
      Origin = 'DefaultRecPrintChoice'
      Size = 2
    end
    object GlobalTableUsr3AllowItemAmmChange: TStringField
      FieldName = 'Usr3AllowItemAmmChange'
      Origin = 'Usr3AllowItemAmmChange'
      Size = 2
    end
    object GlobalTableUsr3AllowVisibleCashup: TStringField
      FieldName = 'Usr3AllowVisibleCashup'
      Origin = 'Usr3AllowVisibleCashup'
      Size = 2
    end
    object GlobalTableSQLScriptsNo: TLongWordField
      FieldName = 'SQLScriptsNo'
      Origin = 'SQLScriptsNo'
    end
    object GlobalTableUsedCount: TLongWordField
      FieldName = 'UsedCount'
      Origin = 'UsedCount'
    end
    object GlobalTableReportedUsedCount: TLongWordField
      FieldName = 'ReportedUsedCount'
      Origin = 'ReportedUsedCount'
    end
    object GlobalTableSQLCount: TLongWordField
      FieldName = 'SQLCount'
      Origin = 'SQLCount'
    end
    object GlobalTableLogo: TBlobField
      FieldName = 'Logo'
      Origin = 'Logo'
    end
    object GlobalTableHeader: TMemoField
      FieldName = 'Header'
      Origin = 'Header'
      BlobType = ftMemo
    end
    object GlobalTableFooter: TMemoField
      FieldName = 'Footer'
      Origin = 'Footer'
      BlobType = ftMemo
    end
  end
  object StockQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from stock_db')
    Left = 320
    Top = 56
    object StockQueryNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object StockQueryBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
    end
    object StockQueryDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object StockQueryCostPrice: TBCDField
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockQueryAvgCost: TBCDField
      DisplayLabel = 'Avg Cost'
      FieldName = 'AvgCost'
      Origin = 'AvgCost'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockQuerySalesPrice: TBCDField
      FieldName = 'SalesPrice'
      Origin = 'SalesPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockQuerySalesPrice2: TBCDField
      FieldName = 'SalesPrice2'
      Origin = 'SalesPrice2'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockQueryQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object StockQueryModelNo: TStringField
      FieldName = 'ModelNo'
      Origin = 'ModelNo'
    end
    object StockQueryTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object StockQueryExtraDescr: TStringField
      FieldName = 'ExtraDescr'
      Origin = 'ExtraDescr'
      Size = 255
    end
    object StockQueryBarcode: TStringField
      FieldName = 'Barcode'
      Origin = 'Barcode'
      Size = 30
    end
    object StockQueryAlertQty: TBCDField
      FieldName = 'AlertQty'
      Origin = 'AlertQty'
      Precision = 8
      Size = 2
    end
    object StockQueryStartingQty: TBCDField
      FieldName = 'StartingQty'
      Origin = 'StartingQty'
      Precision = 8
      Size = 2
    end
    object StockQueryNonStockItem: TStringField
      FieldName = 'NonStockItem'
      Origin = 'NonStockItem'
      Size = 5
    end
    object StockQueryCreditorLink: TStringField
      FieldName = 'CreditorLink'
      Origin = 'CreditorLink'
    end
    object StockQueryChanged: TStringField
      FieldName = 'Changed'
      Origin = 'Changed'
      FixedChar = True
      Size = 1
    end
    object StockQueryGroup: TStringField
      FieldName = 'Group'
      Origin = 'Group'
    end
    object StockQueryCommision: TBCDField
      FieldName = 'Commision'
      Origin = 'Commision'
      Precision = 8
      Size = 2
    end
    object StockQueryst_created_by: TStringField
      FieldName = 'st_created_by'
      Origin = 'st_created_by'
      Required = True
      Size = 45
    end
    object StockQueryst_changed_by: TStringField
      FieldName = 'st_changed_by'
      Origin = 'st_changed_by'
      Required = True
      Size = 45
    end
    object StockQueryst_nontaxitem: TStringField
      FieldName = 'st_nontaxitem'
      Origin = 'st_nontaxitem'
      Required = True
      Size = 5
    end
    object StockQueryDateCreated: TLongWordField
      FieldName = 'DateCreated'
      Origin = 'DateCreated'
      DisplayFormat = '0000/00/00'
    end
    object StockQueryDateChanged: TLongWordField
      FieldName = 'DateChanged'
      Origin = 'DateChanged'
      DisplayFormat = '0000/00/00'
    end
    object StockQueryBranchMainStockNo: TLongWordField
      FieldName = 'BranchMainStockNo'
      Origin = 'BranchMainStockNo'
    end
    object StockQuerySyncHQ: TIntegerField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
  end
  object StockTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from stock_db')
    Left = 128
    Top = 56
    object StockTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object StockTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
    end
    object StockTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object StockTableCostPrice: TBCDField
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockTableAvgCost: TBCDField
      DisplayLabel = 'Avg Cost'
      FieldName = 'AvgCost'
      Origin = 'AvgCost'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockTableSalesPrice: TBCDField
      FieldName = 'SalesPrice'
      Origin = 'SalesPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockTableSalesPrice2: TBCDField
      FieldName = 'SalesPrice2'
      Origin = 'SalesPrice2'
      currency = True
      Precision = 10
      Size = 2
    end
    object StockTableQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object StockTableModelNo: TStringField
      FieldName = 'ModelNo'
      Origin = 'ModelNo'
    end
    object StockTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object StockTableExtraDescr: TStringField
      FieldName = 'ExtraDescr'
      Origin = 'ExtraDescr'
      Size = 255
    end
    object StockTableBarcode: TStringField
      FieldName = 'Barcode'
      Origin = 'Barcode'
      Size = 30
    end
    object StockTableAlertQty: TBCDField
      FieldName = 'AlertQty'
      Origin = 'AlertQty'
      Precision = 8
      Size = 2
    end
    object StockTableStartingQty: TBCDField
      FieldName = 'StartingQty'
      Origin = 'StartingQty'
      Precision = 8
      Size = 2
    end
    object StockTableNonStockItem: TStringField
      FieldName = 'NonStockItem'
      Origin = 'NonStockItem'
      Size = 5
    end
    object StockTableCreditorLink: TStringField
      FieldName = 'CreditorLink'
      Origin = 'CreditorLink'
    end
    object StockTableChanged: TStringField
      FieldName = 'Changed'
      Origin = 'Changed'
      FixedChar = True
      Size = 1
    end
    object StockTableGroup: TStringField
      FieldName = 'Group'
      Origin = 'Group'
    end
    object StockTableCommision: TBCDField
      FieldName = 'Commision'
      Origin = 'Commision'
      Precision = 8
      Size = 2
    end
    object StockTablest_created_by: TStringField
      DisplayLabel = 'Created By'
      FieldName = 'st_created_by'
      Origin = 'st_created_by'
      Required = True
      Size = 45
    end
    object StockTablest_changed_by: TStringField
      DisplayLabel = 'Changed By'
      FieldName = 'st_changed_by'
      Origin = 'st_changed_by'
      Required = True
      Size = 45
    end
    object StockTablest_nontaxitem: TStringField
      DisplayLabel = 'Non Tax Item'
      FieldName = 'st_nontaxitem'
      Origin = 'st_nontaxitem'
      Required = True
      Size = 5
    end
    object StockTableDateCreated: TLongWordField
      FieldName = 'DateCreated'
      Origin = 'DateCreated'
      DisplayFormat = '0000/00/00'
    end
    object StockTableDateChanged: TLongWordField
      FieldName = 'DateChanged'
      Origin = 'DateChanged'
      DisplayFormat = '0000/00/00'
    end
    object StockTableSyncHQ: TIntegerField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
    object StockTableBranchMainStockNo: TLongWordField
      FieldName = 'BranchMainStockNo'
      Origin = 'BranchMainStockNo'
    end
  end
  object User_db: TADTable
    Connection = ADConnection
    UpdateOptions.UpdateTableName = 'user_db'
    TableName = 'user_db'
    Left = 128
    Top = 8
    object User_dbNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object User_dbUserName: TStringField
      FieldName = 'UserName'
      Origin = 'UserName'
      Required = True
      Size = 45
    end
    object User_dbPassword: TStringField
      FieldName = 'Password'
      Origin = 'Password'
      Size = 45
    end
    object User_dbRights: TLongWordField
      FieldName = 'Rights'
      Origin = 'Rights'
    end
  end
  object CashUpTable: TADTable
    OnCalcFields = CashUpTableCalcFields
    Connection = ADConnection
    UpdateOptions.UpdateTableName = 'cashup_db'
    TableName = 'cashup_db'
    Left = 128
    Top = 104
    object CashUpTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object CashUpTableDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
      DisplayFormat = '0000/00/00'
    end
    object CashUpTableUser: TStringField
      FieldName = 'User'
      Origin = 'User'
      Size = 30
    end
    object CashUpTableRealCashTotal: TBCDField
      FieldName = 'RealCashTotal'
      Origin = 'RealCashTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableRealChequesTotal: TBCDField
      FieldName = 'RealChequesTotal'
      Origin = 'RealChequesTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableRealCreditCardTotal: TBCDField
      FieldName = 'RealCreditCardTotal'
      Origin = 'RealCreditCardTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableRealOtherTotal: TBCDField
      FieldName = 'RealOtherTotal'
      Origin = 'RealOtherTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCountCashTotal: TBCDField
      FieldName = 'CountCashTotal'
      Origin = 'CountCashTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCountChequesTotal: TBCDField
      FieldName = 'CountChequesTotal'
      Origin = 'CountChequesTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCountCreditCardTotal: TBCDField
      FieldName = 'CountCreditCardTotal'
      Origin = 'CountCreditCardTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCountOtherTotal: TBCDField
      FieldName = 'CountOtherTotal'
      Origin = 'CountOtherTotal'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCUClosed: TStringField
      FieldName = 'CUClosed'
      Origin = 'CUClosed'
      Size = 5
    end
    object CashUpTableRealLayBuys: TBCDField
      FieldName = 'RealLayBuys'
      Origin = 'RealLayBuys'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableCountLayBuys: TBCDField
      FieldName = 'CountLayBuys'
      Origin = 'CountLayBuys'
      currency = True
      Precision = 10
      Size = 2
    end
    object CashUpTableTimeStamp: TStringField
      FieldName = 'TimeStamp'
      Origin = 'TimeStamp'
    end
    object CashUpTableCashDiff: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CashDiff'
      Calculated = True
    end
    object CashUpTableChequesDiff: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ChequesDiff'
      Calculated = True
    end
    object CashUpTableCreditCardDiff: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CreditCardDiff'
      Calculated = True
    end
    object CashUpTableOtherDiff: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'OtherDiff'
      Calculated = True
    end
    object CashUpTableTotalInvoices: TLongWordField
      FieldName = 'TotalInvoices'
      Origin = 'TotalInvoices'
    end
    object CashUpTableSyncHQ: TLongWordField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
    object CashUpTableTotalLayBuys: TLongWordField
      FieldName = 'TotalLayBuys'
      Origin = 'TotalLayBuys'
    end
  end
  object StockTrnsferTable: TADQuery
    BeforePost = StockTrnsferTableBeforePost
    Connection = ADConnection
    SQL.Strings = (
      'select * from stocktrnsfer_db')
    Left = 128
    Top = 168
    object StockTrnsferTableNr: TLongWordField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StockTrnsferTableToBranch: TLongWordField
      FieldName = 'ToBranch'
      Origin = 'ToBranch'
      Required = True
    end
    object StockTrnsferTableDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
      DisplayFormat = '0000/00/00'
    end
    object StockTrnsferTableClosed: TStringField
      DefaultExpression = 'False'
      FieldName = 'Closed'
      Origin = 'Closed'
      Required = True
      Size = 5
    end
    object StockTrnsferTableSync: TLongWordField
      FieldName = 'Sync'
      Origin = 'Sync'
      DisplayFormat = '0000/00/00'
    end
    object StockTrnsferTableFromBranch: TLongWordField
      FieldName = 'FromBranch'
      Origin = 'FromBranch'
      Required = True
    end
  end
  object TransQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from trans_db')
    Left = 320
    Top = 104
    object TransQueryNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object TransQueryBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object TransQueryDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
      DisplayFormat = '0000/00/00'
    end
    object TransQueryDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 30
    end
    object TransQueryAmmount: TBCDField
      FieldName = 'Ammount'
      Origin = 'Ammount'
      currency = True
      Precision = 10
      Size = 2
    end
    object TransQueryPaymentType: TStringField
      FieldName = 'PaymentType'
      Origin = 'PaymentType'
      Size = 15
    end
    object TransQueryPaymentBy: TStringField
      FieldName = 'PaymentBy'
      Origin = 'PaymentBy'
      Size = 45
    end
    object TransQueryTransType: TStringField
      FieldName = 'TransType'
      Origin = 'TransType'
      FixedChar = True
      Size = 1
    end
    object TransQueryRefNo: TStringField
      FieldName = 'RefNo'
      Origin = 'RefNo'
    end
    object TransQueryTransOrder: TStringField
      FieldName = 'TransOrder'
      Origin = 'TransOrder'
      Size = 2
    end
    object TransQueryLinkID: TLongWordField
      FieldName = 'LinkID'
      Origin = 'LinkID'
      Required = True
    end
    object TransQueryShiftSet: TLongWordField
      FieldName = 'ShiftSet'
      Origin = 'ShiftSet'
    end
    object TransQuerySyncHQ: TLongWordField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
    object TransQueryCUSet: TLongWordField
      FieldName = 'CUSet'
      Origin = 'CUSet'
    end
    object TransQueryTYear: TLongWordField
      FieldName = 'TYear'
      Origin = 'TYear'
    end
    object TransQueryTMonth: TLongWordField
      FieldName = 'TMonth'
      Origin = 'TMonth'
    end
    object TransQuerySyncBranch: TLongWordField
      FieldName = 'SyncBranch'
      Origin = 'SyncBranch'
    end
    object TransQueryIInvNo: TLongWordField
      FieldName = 'IInvNo'
      Origin = 'IInvNo'
    end
    object TransQueryIBranchNo: TLongWordField
      FieldName = 'IBranchNo'
      Origin = 'IBranchNo'
    end
  end
  object InvoiceExportQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'SELECT InvNo,BranchNo, CUSet, InvDate, InvClose, InvTotal, Invoi' +
        'ceType, InvBy, ShiftSet FROM invoice_db')
    Left = 320
    Top = 168
    object InvoiceExportQueryInvNo: TLongWordField
      FieldName = 'InvNo'
      Origin = 'InvNo'
      Required = True
    end
    object InvoiceExportQueryBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object InvoiceExportQueryInvDate: TLongWordField
      FieldName = 'InvDate'
      Origin = 'InvDate'
    end
    object InvoiceExportQueryInvTotal: TBCDField
      DisplayLabel = 'Inv Total'
      FieldName = 'InvTotal'
      Origin = 'InvTotal'
      Precision = 10
      Size = 2
    end
    object InvoiceExportQueryInvClose: TStringField
      DisplayLabel = 'Inv Close'
      FieldName = 'InvClose'
      Origin = 'InvClose'
      Size = 5
    end
    object InvoiceExportQueryInvoiceType: TStringField
      FieldName = 'InvoiceType'
      Origin = 'InvoiceType'
      Size = 15
    end
    object InvoiceExportQueryInvBy: TStringField
      FieldName = 'InvBy'
      Origin = 'InvBy'
      Size = 45
    end
    object InvoiceExportQueryShiftSet: TStringField
      FieldName = 'ShiftSet'
      Origin = 'ShiftSet'
    end
    object InvoiceExportQueryCUSet: TIntegerField
      FieldName = 'CUSet'
      Origin = 'CUSet'
    end
  end
  object BranchTable: TADTable
    Connection = ADConnection
    UpdateOptions.UpdateTableName = 'branch_db'
    TableName = 'branch_db'
    Left = 496
    Top = 8
    object BranchTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object BranchTableName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 30
    end
    object BranchTableTel: TStringField
      FieldName = 'Tel'
      Origin = 'Tel'
    end
    object BranchTableAdr1: TStringField
      FieldName = 'Adr1'
      Origin = 'Adr1'
      Size = 30
    end
    object BranchTableAdr2: TStringField
      FieldName = 'Adr2'
      Origin = 'Adr2'
      Size = 30
    end
    object BranchTableAdr3: TStringField
      FieldName = 'Adr3'
      Origin = 'Adr3'
      Size = 30
    end
    object BranchTablePCode: TStringField
      FieldName = 'PCode'
      Origin = 'PCode'
      Size = 5
    end
    object BranchTableContact: TStringField
      FieldName = 'Contact'
      Origin = 'Contact'
      Size = 30
    end
    object BranchTableLastSync: TLongWordField
      FieldName = 'LastSync'
      Origin = 'LastSync'
    end
    object BranchTableCreated: TLongWordField
      FieldName = 'Created'
      Origin = 'Created'
    end
    object BranchTableStartInvNo: TLongWordField
      FieldName = 'StartInvNo'
      Origin = 'StartInvNo'
    end
  end
  object NotesQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from notes_db')
    Left = 320
    Top = 8
    object NotesQueryNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object NotesQueryDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
    end
    object NotesQueryFromWhere: TStringField
      FieldName = 'FromWhere'
      Origin = 'FromWhere'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NotesQueryDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 150
    end
    object NotesQueryNoteBy: TStringField
      FieldName = 'NoteBy'
      Origin = 'NoteBy'
      Size = 45
    end
    object NotesQueryCompleted: TStringField
      FieldName = 'Completed'
      Origin = 'Completed'
      Required = True
      Size = 5
    end
    object NotesQueryAttentionTime: TStringField
      FieldName = 'AttentionTime'
      Origin = 'AttentionTime'
      Size = 10
    end
    object NotesQueryLinkID: TLongWordField
      FieldName = 'LinkID'
      Origin = 'LinkID'
      Required = True
    end
    object NotesQueryAttentionDate: TLongWordField
      FieldName = 'AttentionDate'
      Origin = 'AttentionDate'
    end
  end
  object GRNTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'select Nr, TCStockNo, Description, Qty, Price2, CostPrice from i' +
        'nvoiceitem_db')
    Left = 496
    Top = 224
    object GRNTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object GRNTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object GRNTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object GRNTableQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object GRNTablePrice2: TBCDField
      FieldName = 'Price2'
      Origin = 'Price2'
      currency = True
      Precision = 10
      Size = 2
    end
    object GRNTableCostPrice: TBCDField
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object InvoiceItemTable: TADQuery
    BeforePost = InvoiceItemTableBeforePost
    OnCalcFields = InvoiceItemTableCalcFields
    Connection = ADConnection
    SQL.Strings = (
      'select * from invoiceitem_db')
    Left = 496
    Top = 104
    object InvoiceItemTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object InvoiceItemTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object InvoiceItemTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object InvoiceItemTablePrice: TBCDField
      FieldName = 'Price'
      Origin = 'Price'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceItemTableQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object InvoiceItemTableDiscount: TBCDField
      FieldName = 'Discount'
      Origin = 'Discount'
      Precision = 10
      Size = 2
    end
    object InvoiceItemTableCostPrice: TBCDField
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceItemTablePrice2: TBCDField
      FieldName = 'Price2'
      Origin = 'Price2'
      currency = True
      Precision = 10
      Size = 2
    end
    object InvoiceItemTableBarcode: TStringField
      FieldName = 'Barcode'
      Origin = 'Barcode'
      Size = 30
    end
    object InvoiceItemTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object InvoiceItemTableExtraDescr: TStringField
      FieldName = 'ExtraDescr'
      Origin = 'ExtraDescr'
      Size = 255
    end
    object InvoiceItemTableModelNo: TStringField
      FieldName = 'ModelNo'
      Origin = 'ModelNo'
    end
    object InvoiceItemTableComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 10
    end
    object InvoiceItemTableSellingPrice: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SellingPrice'
      Calculated = True
    end
    object InvoiceItemTableRentalSwi: TStringField
      FieldName = 'RentalSwi'
      Origin = 'RentalSwi'
      Size = 5
    end
    object InvoiceItemTableCommentSwi: TStringField
      FieldName = 'CommentSwi'
      Origin = 'CommentSwi'
      Size = 5
    end
    object InvoiceItemTableStockNo: TLongWordField
      FieldName = 'StockNo'
      Origin = 'StockNo'
    end
    object InvoiceItemTableLinkId: TLongWordField
      FieldName = 'LinkId'
      Origin = 'LinkId'
      Required = True
    end
    object InvoiceItemTableItemOrder: TLongWordField
      FieldName = 'ItemOrder'
      Origin = 'ItemOrder'
    end
    object InvoiceItemTableDBGLineno: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DBGLineno'
      Calculated = True
    end
  end
  object PurchaseItemTable: TADQuery
    BeforePost = PurchaseItemTableBeforePost
    OnCalcFields = PurchaseItemTableCalcFields
    Connection = ADConnection
    SQL.Strings = (
      'select * from invoiceitem_db')
    Left = 496
    Top = 160
    object PurchaseItemTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object PurchaseItemTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object PurchaseItemTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object PurchaseItemTablePrice: TBCDField
      FieldName = 'Price'
      Origin = 'Price'
      currency = True
      Precision = 10
      Size = 2
    end
    object PurchaseItemTableQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object PurchaseItemTableDiscount: TBCDField
      FieldName = 'Discount'
      Origin = 'Discount'
      Precision = 10
      Size = 2
    end
    object PurchaseItemTableCostPrice: TBCDField
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      currency = True
      Precision = 10
      Size = 2
    end
    object PurchaseItemTablePrice2: TBCDField
      FieldName = 'Price2'
      Origin = 'Price2'
      currency = True
      Precision = 10
      Size = 2
    end
    object PurchaseItemTableBarcode: TStringField
      FieldName = 'Barcode'
      Origin = 'Barcode'
      Size = 30
    end
    object PurchaseItemTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object PurchaseItemTableExtraDescr: TStringField
      FieldName = 'ExtraDescr'
      Origin = 'ExtraDescr'
      Size = 255
    end
    object PurchaseItemTableModelNo: TStringField
      FieldName = 'ModelNo'
      Origin = 'ModelNo'
    end
    object PurchaseItemTableComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 10
    end
    object PurchaseItemTableCostIncl: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CostIncl'
      Calculated = True
    end
    object PurchaseItemTableTotalCost: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalCost'
      Calculated = True
    end
    object PurchaseItemTableStockNo: TLongWordField
      FieldName = 'StockNo'
      Origin = 'StockNo'
    end
    object PurchaseItemTableLinkId: TLongWordField
      FieldName = 'LinkId'
      Origin = 'LinkId'
      Required = True
    end
    object PurchaseItemTableRentalSwi: TStringField
      FieldName = 'RentalSwi'
      Origin = 'RentalSwi'
      Size = 5
    end
    object PurchaseItemTableCommentSwi: TStringField
      FieldName = 'CommentSwi'
      Origin = 'CommentSwi'
      Size = 5
    end
    object PurchaseItemTableItemOrder: TLongWordField
      FieldName = 'ItemOrder'
      Origin = 'ItemOrder'
    end
  end
  object StocktrnsferItemTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from stocktrnsferitem_db')
    Left = 128
    Top = 216
    object StocktrnsferItemTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object StocktrnsferItemTableStockNo: TLongWordField
      FieldName = 'StockNo'
      Origin = 'StockNo'
    end
    object StocktrnsferItemTableQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 10
      Size = 2
    end
    object StocktrnsferItemTableBeforeQty: TBCDField
      FieldName = 'BeforeQty'
      Origin = 'BeforeQty'
      Precision = 10
      Size = 2
    end
    object StocktrnsferItemTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 30
    end
    object StocktrnsferItemTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object StocktrnsferItemTableLinkID: TLongWordField
      FieldName = 'LinkID'
      Origin = 'LinkID'
    end
    object StocktrnsferItemTableTransfered: TLongWordField
      FieldName = 'Transfered'
      Origin = 'Transfered'
      DisplayFormat = '0000/00/00'
    end
  end
  object AccountsTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from accounts_db')
    Left = 104
    Top = 352
    object AccountsTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object AccountsTableBranchNo: TLongWordField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object AccountsTableAccNo: TLongWordField
      FieldName = 'AccNo'
      Origin = 'AccNo'
      Required = True
    end
    object AccountsTableName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 45
    end
    object AccountsTableSurname: TStringField
      FieldName = 'Surname'
      Origin = 'Surname'
      Size = 45
    end
    object AccountsTableCompanyName: TStringField
      FieldName = 'CompanyName'
      Origin = 'CompanyName'
      Size = 45
    end
    object AccountsTableTel: TStringField
      FieldName = 'Tel'
      Origin = 'Tel'
    end
    object AccountsTableTelF: TStringField
      FieldName = 'TelF'
      Origin = 'TelF'
    end
    object AccountsTableTelC: TStringField
      FieldName = 'TelC'
      Origin = 'TelC'
    end
    object AccountsTableHAdr1: TStringField
      FieldName = 'HAdr1'
      Origin = 'HAdr1'
      Size = 30
    end
    object AccountsTableHAdr2: TStringField
      FieldName = 'HAdr2'
      Origin = 'HAdr2'
      Size = 30
    end
    object AccountsTableHAdr3: TStringField
      FieldName = 'HAdr3'
      Origin = 'HAdr3'
      Size = 30
    end
    object AccountsTablePAdr1: TStringField
      FieldName = 'PAdr1'
      Origin = 'PAdr1'
      Size = 30
    end
    object AccountsTablePAdr2: TStringField
      FieldName = 'PAdr2'
      Origin = 'PAdr2'
      Size = 30
    end
    object AccountsTablePAdr3: TStringField
      FieldName = 'PAdr3'
      Origin = 'PAdr3'
      Size = 30
    end
    object AccountsTablePCode: TStringField
      FieldName = 'PCode'
      Origin = 'PCode'
      Size = 5
    end
    object AccountsTableEMail: TStringField
      DisplayWidth = 100
      FieldName = 'EMail'
      Origin = 'EMail'
      Size = 100
    end
    object AccountsTableByUser: TStringField
      FieldName = 'ByUser'
      Origin = 'ByUser'
    end
    object AccountsTableTotal: TBCDField
      FieldName = 'Total'
      Origin = 'Total'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableBeginTotal: TBCDField
      FieldName = 'BeginTotal'
      Origin = 'BeginTotal'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object AccountsTableCurrent: TBCDField
      FieldName = 'Current'
      Origin = 'Current'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableDays30: TBCDField
      FieldName = 'Days30'
      Origin = 'Days30'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableDays60: TBCDField
      FieldName = 'Days60'
      Origin = 'Days60'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableDays90: TBCDField
      FieldName = 'Days90'
      Origin = 'Days90'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableDays120: TBCDField
      FieldName = 'Days120'
      Origin = 'Days120'
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountsTableRefNo: TStringField
      FieldName = 'RefNo'
      Origin = 'RefNo'
      Size = 30
    end
    object AccountsTableTCNo: TStringField
      FieldName = 'TCNo'
      Origin = 'TCNo'
    end
    object AccountsTableDiscount: TBCDField
      DefaultExpression = '0'
      FieldName = 'Discount'
      Origin = 'Discount'
      Precision = 10
      Size = 2
    end
    object AccountsTableAllowCredit: TStringField
      DefaultExpression = 'False'
      FieldName = 'AllowCredit'
      Origin = 'AllowCredit'
      Size = 5
    end
    object AccountsTableAccType: TLongWordField
      FieldName = 'AccType'
      Origin = 'AccType'
      Required = True
    end
    object AccountsTableChangeDate: TLongWordField
      FieldName = 'ChangeDate'
      Origin = 'ChangeDate'
      DisplayFormat = '0000/00/00'
    end
    object AccountsTableCreateDate: TLongWordField
      FieldName = 'CreateDate'
      Origin = 'CreateDate'
      DisplayFormat = '0000/00/00'
    end
    object AccountsTableBeginDate: TLongWordField
      FieldName = 'BeginDate'
      Origin = 'BeginDate'
      DisplayFormat = '0000/00/00'
    end
    object AccountsTableEndDate: TLongWordField
      FieldName = 'EndDate'
      Origin = 'EndDate'
      DisplayFormat = '0000/00/00'
    end
    object AccountsTableDueDays: TLongWordField
      FieldName = 'DueDays'
      Origin = 'DueDays'
    end
    object AccountsTableSyncHQ: TLongWordField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
    object AccountsTableSyncBranch: TLongWordField
      FieldName = 'SyncBranch'
      Origin = 'SyncBranch'
    end
  end
  object AccountsSource: TDataSource
    DataSet = AccountsTable
    OnStateChange = AccountsSourceStateChange
    Left = 48
    Top = 368
  end
  object AccountSearch: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'select Nr,AccNo,BranchNo,Surname,Name,CompanyName,ID,Total,Begin' +
        'Date,EndDate,RefNo,Tel,AllowCredit,EMail from accounts_db')
    Left = 104
    Top = 400
    object AccountSearchNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object AccountSearchAccNo: TLongWordField
      FieldName = 'AccNo'
      Origin = 'AccNo'
      Required = True
    end
    object AccountSearchBranchNo: TLongWordField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object AccountSearchSurname: TStringField
      FieldName = 'Surname'
      Origin = 'Surname'
      Size = 45
    end
    object AccountSearchName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 45
    end
    object AccountSearchCompanyName: TStringField
      FieldName = 'CompanyName'
      Origin = 'CompanyName'
      Size = 45
    end
    object AccountSearchID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object AccountSearchTotal: TBCDField
      FieldName = 'Total'
      Origin = 'Total'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object AccountSearchRefNo: TStringField
      DisplayLabel = 'Ref No'
      FieldName = 'RefNo'
      Origin = 'RefNo'
      Size = 30
    end
    object AccountSearchTel: TStringField
      FieldName = 'Tel'
      Origin = 'Tel'
    end
    object AccountSearchAllowCredit: TStringField
      DisplayLabel = 'Allow Credit'
      FieldName = 'AllowCredit'
      Origin = 'AllowCredit'
      Size = 5
    end
    object AccountSearchEMail: TStringField
      FieldName = 'EMail'
      Origin = 'EMail'
      Size = 100
    end
    object AccountSearchBeginDate: TLongWordField
      FieldName = 'BeginDate'
      Origin = 'BeginDate'
      DisplayFormat = '0000/00/00'
    end
    object AccountSearchEndDate: TLongWordField
      FieldName = 'EndDate'
      Origin = 'EndDate'
      DisplayFormat = '0000/00/00'
    end
  end
  object AccountSearchSource: TDataSource
    DataSet = AccountSearch
    Left = 48
    Top = 416
  end
  object DebtorInvList: TADQuery
    OnCalcFields = DebtorInvListCalcFields
    Connection = ADConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Nr,AccNo,BranchNo,CompanyName from accounts_db'
      'where AccType = 1'
      'Order by CompanyName')
    Left = 376
    Top = 304
    object DebtorInvListNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object DebtorInvListAccNo: TLongWordField
      FieldName = 'AccNo'
      Origin = 'AccNo'
      Required = True
    end
    object DebtorInvListBranchNo: TLongWordField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object DebtorInvListCompanyName: TStringField
      FieldName = 'CompanyName'
      Origin = 'CompanyName'
      Size = 45
    end
    object DebtorInvListGLDebNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'GLDebNo'
      Calculated = True
    end
  end
  object DebtorInvListSource: TDataSource
    DataSet = DebtorInvList
    Left = 432
    Top = 320
  end
  object Query2Source: TDataSource
    DataSet = Query2
    Enabled = False
    Left = 648
    Top = 112
  end
  object InvAdvFindQuery: TADQuery
    Connection = ADConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from invoice_db')
    Left = 432
    Top = 416
    object InvAdvFindQueryNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object InvAdvFindQueryInvNo: TLongWordField
      FieldName = 'InvNo'
      Origin = 'InvNo'
      Required = True
    end
    object InvAdvFindQueryBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object InvAdvFindQueryClientName: TStringField
      DisplayLabel = 'Client Name'
      FieldName = 'ClientName'
      Origin = 'ClientName'
      Size = 30
    end
    object InvAdvFindQueryClientTelW: TStringField
      DisplayLabel = 'Client Tel W'
      FieldName = 'ClientTelW'
      Origin = 'ClientTelW'
    end
    object InvAdvFindQueryClientTelC: TStringField
      DisplayLabel = 'Client Tel C'
      FieldName = 'ClientTelC'
      Origin = 'ClientTelC'
    end
    object InvAdvFindQueryClientAdr1: TStringField
      DisplayLabel = 'Client Adr 1'
      FieldName = 'ClientAdr1'
      Origin = 'ClientAdr1'
      Size = 30
    end
    object InvAdvFindQueryClientAdr2: TStringField
      DisplayLabel = 'Client Adr 2'
      FieldName = 'ClientAdr2'
      Origin = 'ClientAdr2'
      Size = 30
    end
    object InvAdvFindQueryClientAdr3: TStringField
      DisplayLabel = 'Client Adr 3'
      FieldName = 'ClientAdr3'
      Origin = 'ClientAdr3'
      Size = 30
    end
    object InvAdvFindQueryClientPCode: TStringField
      DisplayLabel = 'Client P Code'
      FieldName = 'ClientPCode'
      Origin = 'ClientPCode'
      Size = 4
    end
    object InvAdvFindQueryClientVatNo: TStringField
      DisplayLabel = 'Client Vat No'
      FieldName = 'ClientVatNo'
      Origin = 'ClientVatNo'
      Size = 30
    end
    object InvAdvFindQueryClientEMail: TStringField
      DisplayLabel = 'Client E Mail'
      FieldName = 'ClientEMail'
      Origin = 'ClientEMail'
      Size = 100
    end
    object InvAdvFindQueryRefNo: TStringField
      DisplayLabel = 'Ref No'
      FieldName = 'RefNo'
      Origin = 'RefNo'
      Size = 15
    end
    object InvAdvFindQueryInvBy: TStringField
      DisplayLabel = 'Inv By'
      FieldName = 'InvBy'
      Origin = 'InvBy'
      Size = 45
    end
    object InvAdvFindQueryInvClose: TStringField
      DisplayLabel = 'Inv Close'
      FieldName = 'InvClose'
      Origin = 'InvClose'
      Size = 5
    end
    object InvAdvFindQueryInvTotal: TBCDField
      DisplayLabel = 'Inv Total'
      FieldName = 'InvTotal'
      Origin = 'InvTotal'
      Precision = 10
      Size = 2
    end
    object InvAdvFindQueryAmmTendered: TBCDField
      DisplayLabel = 'Amm Tendered 1'
      FieldName = 'AmmTendered'
      Origin = 'AmmTendered'
      Precision = 10
      Size = 2
    end
    object InvAdvFindQueryPremium: TBCDField
      DisplayLabel = 'Amm Tendered 2'
      FieldName = 'Premium'
      Origin = 'Premium'
      Precision = 10
      Size = 2
    end
    object InvAdvFindQueryInvoiceType: TStringField
      DisplayLabel = 'Invoice Type'
      FieldName = 'InvoiceType'
      Origin = 'InvoiceType'
      Size = 15
    end
    object InvAdvFindQueryGLDebNo: TStringField
      DisplayLabel = 'GL Deb No'
      FieldName = 'GLDebNo'
      Origin = 'GLDebNo'
    end
    object InvAdvFindQueryShiftSet: TStringField
      FieldName = 'ShiftSet'
      Origin = 'ShiftSet'
    end
    object InvAdvFindQueryInvDate: TLongWordField
      FieldName = 'InvDate'
      Origin = 'InvDate'
      DisplayFormat = '0000/00/00'
      EditFormat = '0000/00/00'
    end
    object InvAdvFindQueryCUSet: TIntegerField
      FieldName = 'CUSet'
      Origin = 'CUSet'
    end
    object InvAdvFindQuerySyncHQ: TIntegerField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
  end
  object InvAdvFindSource: TDataSource
    DataSet = InvAdvFindQuery
    Left = 368
    Top = 432
  end
  object StockSearchQuery: TADQuery
    Connection = ADConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select stock_db.Description,stock_db.Barcode,stock_db.TCStockNo,' +
        'stock_db.ExtraDescr,stock_db.Qty,stock_db.NonStockItem from stoc' +
        'k_db')
    Left = 584
    Top = 8
    object StockSearchQueryDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object StockSearchQueryBarcode: TStringField
      FieldName = 'Barcode'
      Origin = 'Barcode'
      Size = 30
    end
    object StockSearchQueryTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object StockSearchQueryExtraDescr: TStringField
      FieldName = 'ExtraDescr'
      Origin = 'ExtraDescr'
      Size = 100
    end
    object StockSearchQueryQty: TBCDField
      FieldName = 'Qty'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object StockSearchQueryNonStockItem: TStringField
      FieldName = 'NonStockItem'
      Origin = 'NonStockItem'
      Size = 5
    end
  end
  object StockSearchQuerySource: TDataSource
    DataSet = StockSearchQuery
    Left = 656
    Top = 16
  end
  object StockAdjustTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from stockadjust_db')
    Left = 584
    Top = 224
    object StockAdjustTablest_adj_id: TADAutoIncField
      FieldName = 'st_adj_id'
      Origin = 'st_adj_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object StockAdjustTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
    end
    object StockAdjustTableTCStockNoLink: TStringField
      FieldName = 'TCStockNoLink'
      Origin = 'TCStockNoLink'
      Required = True
    end
    object StockAdjustTablest_adj_by: TStringField
      FieldName = 'st_adj_by'
      Origin = 'st_adj_by'
      Required = True
      Size = 30
    end
    object StockAdjustTablest_adj_value: TBCDField
      FieldName = 'st_adj_value'
      Origin = 'st_adj_value'
      Required = True
      Precision = 10
      Size = 2
    end
    object StockAdjustTablest_adj_date: TLongWordField
      FieldName = 'st_adj_date'
      Origin = 'st_adj_date'
      Required = True
      DisplayFormat = '0000/00/00'
    end
    object StockAdjustTablest_adj_timestamp: TSQLTimeStampField
      FieldName = 'st_adj_timestamp'
      Origin = 'st_adj_timestamp'
    end
    object StockAdjustTablest_adj_type: TStringField
      FieldName = 'st_adj_type'
      Origin = 'st_adj_type'
      Required = True
      Size = 10
    end
    object StockAdjustTableSyncHQ: TLongWordField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
  end
  object StockAdjustSource: TDataSource
    DataSet = StockAdjustTable
    Left = 640
    Top = 232
  end
  object StockHistoryTable: TADQuery
    Filtered = True
    Connection = ADConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from'
      
        '(select 1 as orderint, TCStockNoLink as TCStockNo,BranchNo,st_ad' +
        'j_date as ItemDate,st_adj_value as ItemValue,0 as ItemRef,'
      
        'Case st_adj_type when "Adj" then "Adjustment" when "Sync" then "' +
        'Received from HQ" end as ItemType, cast(SyncHQ as unsigned) as S' +
        'yncHQ from stockadjust_db'
      'union all'
      
        'select 0 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.Br' +
        'anchNo,invoice_db.InvDate as ItemDate,invoiceitem_db.Qty as Item' +
        'Value,'
      
        'invoice_db.InvNo as ItemRef,"Purchase Inv" as ItemType, cast(inv' +
        'oice_db.SyncHQ as unsigned) as SyncHQ from invoiceitem_db'
      
        'inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID)' +
        ' and (invoice_db.BranchNo = invoiceitem_db.BranchNo)'
      'where  invoice_db.InvClose = "PurcC"'
      'union all'
      
        'select 2 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.Br' +
        'anchNo,invoice_db.InvDate as ItemDate,invoiceitem_db.Qty as Item' +
        'Value,'
      
        'invoice_db.InvNo as ItemRef,"Invoice" as ItemType, cast(invoice_' +
        'db.SyncHQ as unsigned) as SyncHQ from invoiceitem_db'
      
        'inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID)' +
        ' and (invoice_db.BranchNo = invoiceitem_db.BranchNo)'
      
        'where ((invoice_db.InvClose = "Close") or (invoice_db.InvClose =' +
        ' "LaybC"))'
      'union all'
      
        'select 2 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.Br' +
        'anchNo,invoice_db.InvDate as ItemDate,invoiceitem_db.Qty as Item' +
        'Value,'
      
        'invoice_db.InvNo as ItemRef,"Open Lay Buy" as ItemType, cast(inv' +
        'oice_db.SyncHQ as unsigned) as SyncHQ from invoiceitem_db'
      
        'inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID)' +
        ' and (invoice_db.BranchNo = invoiceitem_db.BranchNo)'
      'where (invoice_db.InvClose = "LaybO")'
      'union all'
      
        'SELECT 2 as orderint, stocktrnsferitem_db.TCStockNo, stocktrnsfe' +
        'r_db.ToBranch as BranchNo, stocktrnsfer_db.Date as ItemDate, '
      
        'stocktrnsferitem_db.Qty as ItemValue,'#10'stocktrnsfer_db.Nr as Item' +
        'Ref,"Branch Transfer" as ItemType, cast(Transfered as unsigned) ' +
        'as SyncHQ FROM stocktrnsferitem_db'
      
        'inner join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stoc' +
        'ktrnsfer_db.Nr)'
      'where stocktrnsfer_db.Closed = "True"'
      ') a'
      'order by ItemDate,OrderInt')
    Left = 728
    Top = 168
    object StockHistoryTableorderint: TLargeintField
      FieldName = 'orderint'
      Origin = 'orderint'
      Required = True
    end
    object StockHistoryTableTCStockNo: TStringField
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object StockHistoryTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
    end
    object StockHistoryTableItemDate: TLongWordField
      FieldName = 'ItemDate'
      Origin = 'ItemDate'
      DisplayFormat = '0000/00/00'
    end
    object StockHistoryTableItemValue: TBCDField
      FieldName = 'ItemValue'
      Origin = 'ItemValue'
      Precision = 10
      Size = 2
    end
    object StockHistoryTableItemRef: TLargeintField
      FieldName = 'ItemRef'
      Origin = 'ItemRef'
      Required = True
    end
    object StockHistoryTableItemType: TStringField
      FieldName = 'ItemType'
      Origin = 'ItemType'
      Size = 16
    end
    object StockHistoryTableSyncHQ: TLargeintField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
      DisplayFormat = '0000/00/00'
    end
  end
  object StockHistorySource: TDataSource
    DataSet = StockHistoryTable
    Left = 728
    Top = 216
  end
  object StockTakeSource: TDataSource
    DataSet = StocktakeTable
    OnStateChange = StockTakeSourceStateChange
    Left = 48
    Top = 464
  end
  object StockTakeDetailSource: TDataSource
    DataSet = StockTakeDetailTable
    OnStateChange = StockTakeDetailSourceStateChange
    Left = 48
    Top = 512
  end
  object StocktakeTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      'select * from stocktake')
    Left = 112
    Top = 456
    object StocktakeTableStockTakeID: TADAutoIncField
      FieldName = 'StockTakeID'
      Origin = 'StockTakeID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object StocktakeTableStockTakeDescription: TStringField
      DisplayLabel = 'Description'
      FieldName = 'StockTakeDescription'
      Origin = 'StockTakeDescription'
      Size = 45
    end
    object StocktakeTableStockTakeStatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'StockTakeStatus'
      Origin = 'StockTakeStatus'
      Required = True
      Size = 10
    end
    object StocktakeTableStockTakeDate: TLongWordField
      DisplayLabel = 'Date'
      FieldName = 'StockTakeDate'
      Origin = 'StockTakeDate'
      DisplayFormat = '0000/00/00'
    end
  end
  object StockTakeDetailTable: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'select cast(stocktakedetail.StockTakeDetailID as UNSIGNED) as St' +
        'ockTakeDetailID,stocktakedetail.StockTakeID,stocktakedetail.TCSt' +
        'ockNo,stocktakedetail.Qty,stocktakedetail.BeforeQty,stocktakedet' +
        'ail.BranchNo, stock_db.Description, (stock_db.Qty - StockAtBranc' +
        'h.StAtBrQty) as LocalQty from stocktakedetail'
      
        'left join stock_db on stock_db.TCStockNo = stocktakedetail.TCSto' +
        'ckNo and stock_db.BranchNo is null'
      
        'left join (SELECT TCStockNo, Sum(stock_db.Qty) as StAtBrQty from' +
        ' stock_db where not BranchNo is null Group By TCStockNo)'
      'as StockAtBranch on stock_db.TCStockNo = StockAtBranch.TCStockNo'
      'order by StockTakedetailID')
    Left = 120
    Top = 504
    object StockTakeDetailTableStockTakeDetailID: TLargeintField
      FieldName = 'StockTakeDetailID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StockTakeDetailTableStockTakeID: TLongWordField
      FieldName = 'StockTakeID'
      Origin = 'StockTakeID'
      Required = True
    end
    object StockTakeDetailTableTCStockNo: TStringField
      DisplayLabel = 'Stock No'
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
      Required = True
    end
    object StockTakeDetailTableQty: TFloatField
      FieldName = 'Qty'
      Origin = 'Qty'
    end
    object StockTakeDetailTableBeforeQty: TFloatField
      FieldName = 'BeforeQty'
      Origin = 'BeforeQty'
    end
    object StockTakeDetailTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      ReadOnly = True
      Size = 45
    end
    object StockTakeDetailTableLocalQty: TFMTBCDField
      DisplayLabel = 'Local Qty'
      FieldName = 'LocalQty'
      Origin = 'LocalQty'
      ReadOnly = True
      Precision = 31
      Size = 2
    end
    object StockTakeDetailTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
    end
  end
  object InvItemAdvFindQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'select invoice_db.InvNo, invoice_db.BranchNo, invoice_db.InvDate' +
        ', invoice_db.ClientName, invoiceitem_db.TCStockNo, invoiceitem_d' +
        'b.Description, invoiceitem_db.Price as SellingPrice, invoiceitem' +
        '_db.Discount, invoiceitem_db.Qty as QtySold,'
      'invoiceitem_db.CostPrice from invoiceitem_db'
      
        'inner join invoice_db on invoice_db.Nr = invoiceitem_db.LinkId a' +
        'nd invoice_db.BranchNo = invoiceitem_db.BranchNo')
    Left = 432
    Top = 480
    object InvItemAdvFindQueryInvNo: TLongWordField
      DisplayLabel = 'Inv No'
      FieldName = 'InvNo'
      Origin = 'InvNo'
      Required = True
    end
    object InvItemAdvFindQueryBranchNo: TIntegerField
      DisplayLabel = 'Branch No'
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object InvItemAdvFindQueryInvDate: TLongWordField
      DisplayLabel = 'Inv Date'
      FieldName = 'InvDate'
      Origin = 'InvDate'
      DisplayFormat = '0000/00/00'
    end
    object InvItemAdvFindQueryClientName: TStringField
      DisplayLabel = 'Client Name'
      FieldName = 'ClientName'
      Origin = 'ClientName'
      Size = 30
    end
    object InvItemAdvFindQueryTCStockNo: TStringField
      DisplayLabel = 'Stock No'
      FieldName = 'TCStockNo'
      Origin = 'TCStockNo'
    end
    object InvItemAdvFindQueryDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 45
    end
    object InvItemAdvFindQuerySellingPrice: TBCDField
      DisplayLabel = 'Selling Price'
      FieldName = 'SellingPrice'
      Origin = 'Price'
      Precision = 10
      Size = 2
    end
    object InvItemAdvFindQueryDiscount: TBCDField
      FieldName = 'Discount'
      Origin = 'Discount'
      Precision = 10
      Size = 2
    end
    object InvItemAdvFindQueryQtySold: TBCDField
      DisplayLabel = 'Qty Sold'
      FieldName = 'QtySold'
      Origin = 'Qty'
      Precision = 8
      Size = 2
    end
    object InvItemAdvFindQueryCostPrice: TBCDField
      DisplayLabel = 'Cost Price'
      FieldName = 'CostPrice'
      Origin = 'CostPrice'
      Precision = 10
      Size = 2
    end
  end
  object InvItemAdvFindSource: TDataSource
    DataSet = InvItemAdvFindQuery
    Left = 360
    Top = 496
  end
  object QRExcelFilter1: TQRExcelFilter
    TextEncoding = DefaultEncoding
    Left = 592
    Top = 464
  end
  object QRHTMLFilter1: TQRHTMLFilter
    MultiPage = False
    PageLinks = False
    FinalPage = 0
    FirstLastLinks = False
    Concat = False
    ConcatCount = 1
    LinkFontSize = 12
    LinkFontName = 'Arial'
    TextEncoding = ASCIIEncoding
    Left = 592
    Top = 512
  end
  object RvRenderHTML1: TRvRenderHTML
    DisplayName = 'Web Page (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    UseBreakingSpaces = False
    Left = 672
    Top = 464
  end
  object RvRenderText1: TRvRenderText
    DisplayName = 'Plain Text (TXT)'
    FileExtension = '*.txt'
    CPI = 10.000000000000000000
    LPI = 6.000000000000000000
    Left = 672
    Top = 512
  end
  object BranchListQuery: TADQuery
    Connection = ADConnection
    SQL.Strings = (
      
        'select * from (select Concat(Name,'#39' ('#39',Nr,'#39')'#39') as BranchName, Nr' +
        ' from branch_db'
      'union'
      
        'select '#39'HQ (0)'#39' as BranchName, 0 as Nr from branch_db) as Branch' +
        'Table'
      'order by BranchName')
    Left = 584
    Top = 288
    object BranchListQueryBranchName: TStringField
      FieldName = 'BranchName'
      Origin = 'BranchName'
      Size = 43
    end
    object BranchListQueryNr: TLargeintField
      FieldName = 'Nr'
      Origin = 'Nr'
      Required = True
    end
  end
  object BranchListQuerySource: TDataSource
    DataSet = BranchListQuery
    Left = 640
    Top = 304
  end
end
