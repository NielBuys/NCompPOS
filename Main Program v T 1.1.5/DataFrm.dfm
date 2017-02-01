object DataForm: TDataForm
  OldCreateOrder = False
  Height = 450
  Width = 583
  object UserSource: TDataSource
    DataSet = User_db
    Left = 48
    Top = 16
  end
  object StockSource: TDataSource
    Left = 48
    Top = 64
  end
  object CashUpSource: TDataSource
    Left = 48
    Top = 112
  end
  object StockTrnsferSource: TDataSource
    DataSet = StockTrnsferTable
    Left = 48
    Top = 160
  end
  object StocktrnsferItemSource: TDataSource
    DataSet = StocktrnsferItemTable
    Left = 48
    Top = 208
  end
  object BranchSource: TDataSource
    DataSet = BranchTable
    Left = 240
    Top = 80
  end
  object TransSource: TDataSource
    DataSet = TransTable
    Left = 240
    Top = 24
  end
  object HQADConnection: TADConnection
    Params.Strings = (
      'Database=ncomp'
      'User_Name=root'
      'Password=djb115'
      'Host=localhost'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 240
    Top = 295
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    ScreenCursor = gcrDefault
    Left = 416
    Top = 295
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 328
    Top = 311
  end
  object Query1: TADQuery
    Connection = HQADConnection
    Left = 336
    Top = 152
  end
  object Query2: TADQuery
    Connection = HQADConnection
    Left = 280
    Top = 152
  end
  object Query3: TADQuery
    Connection = HQADConnection
    Left = 224
    Top = 152
  end
  object BranchTable: TADTable
    Connection = HQADConnection
    UpdateOptions.UpdateTableName = 'branch_db'
    TableName = 'branch_db'
    Left = 328
    Top = 80
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
  object User_db: TADTable
    Connection = HQADConnection
    UpdateOptions.UpdateTableName = 'user_db'
    TableName = 'user_db'
    Left = 128
    Top = 16
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
  object StockTable: TADQuery
    Connection = HQADConnection
    SQL.Strings = (
      'select * from stock_db')
    Left = 128
    Top = 64
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
      FieldName = 'AvgCost'
      Origin = 'AvgCost'
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
      FieldName = 'st_created_by'
      Origin = 'st_created_by'
      Required = True
      Size = 45
    end
    object StockTablest_changed_by: TStringField
      FieldName = 'st_changed_by'
      Origin = 'st_changed_by'
      Required = True
      Size = 45
    end
    object StockTablest_nontaxitem: TStringField
      FieldName = 'st_nontaxitem'
      Origin = 'st_nontaxitem'
      Required = True
      Size = 5
    end
    object StockTableDateCreated: TLongWordField
      FieldName = 'DateCreated'
      Origin = 'DateCreated'
    end
    object StockTableDateChanged: TLongWordField
      FieldName = 'DateChanged'
      Origin = 'DateChanged'
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
  object StockTrnsferTable: TADQuery
    Connection = HQADConnection
    SQL.Strings = (
      'select * from stocktrnsfer_db')
    Left = 128
    Top = 176
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
    end
    object StockTrnsferTableFromBranch: TLongWordField
      FieldName = 'FromBranch'
      Origin = 'FromBranch'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object StocktrnsferItemTable: TADQuery
    Connection = HQADConnection
    SQL.Strings = (
      'select * from stocktrnsferitem_db')
    Left = 128
    Top = 224
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
    end
  end
  object TransTable: TADTable
    Connection = HQADConnection
    UpdateOptions.UpdateTableName = 'trans_db'
    TableName = 'trans_db'
    Left = 328
    Top = 24
    object TransTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object TransTableBranchNo: TIntegerField
      FieldName = 'BranchNo'
      Origin = 'BranchNo'
      Required = True
    end
    object TransTableDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
    end
    object TransTableDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 30
    end
    object TransTableAmmount: TBCDField
      FieldName = 'Ammount'
      Origin = 'Ammount'
      currency = True
      Precision = 10
      Size = 2
    end
    object TransTablePaymentType: TStringField
      FieldName = 'PaymentType'
      Origin = 'PaymentType'
      Size = 15
    end
    object TransTablePaymentBy: TStringField
      FieldName = 'PaymentBy'
      Origin = 'PaymentBy'
      Size = 45
    end
    object TransTableTransType: TStringField
      FieldName = 'TransType'
      Origin = 'TransType'
      FixedChar = True
      Size = 1
    end
    object TransTableRefNo: TStringField
      FieldName = 'RefNo'
      Origin = 'RefNo'
    end
    object TransTableTransOrder: TStringField
      FieldName = 'TransOrder'
      Origin = 'TransOrder'
      Size = 2
    end
    object TransTableLinkID: TLongWordField
      FieldName = 'LinkID'
      Origin = 'LinkID'
      Required = True
    end
    object TransTableShiftSet: TLongWordField
      FieldName = 'ShiftSet'
      Origin = 'ShiftSet'
    end
    object TransTableSyncHQ: TLongWordField
      FieldName = 'SyncHQ'
      Origin = 'SyncHQ'
    end
    object TransTableCUSet: TLongWordField
      FieldName = 'CUSet'
      Origin = 'CUSet'
    end
    object TransTableTYear: TLongWordField
      FieldName = 'TYear'
      Origin = 'TYear'
    end
    object TransTableTMonth: TLongWordField
      FieldName = 'TMonth'
      Origin = 'TMonth'
    end
    object TransTableSyncBranch: TLongWordField
      FieldName = 'SyncBranch'
      Origin = 'SyncBranch'
    end
    object TransTableIInvNo: TLongWordField
      FieldName = 'IInvNo'
      Origin = 'IInvNo'
    end
    object TransTableIBranchNo: TLongWordField
      FieldName = 'IBranchNo'
      Origin = 'IBranchNo'
    end
  end
  object CashUpTable: TADTable
    Connection = HQADConnection
    UpdateOptions.UpdateTableName = 'cashup_db'
    TableName = 'cashup_db'
    Left = 128
    Top = 112
    object CashUpTableNr: TADAutoIncField
      FieldName = 'Nr'
      Origin = 'Nr'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object CashUpTableDate: TLongWordField
      FieldName = 'Date'
      Origin = 'Date'
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
end
