object TCData: TTCData
  OldCreateOrder = False
  Height = 379
  Width = 582
  object TurbocashDb: TDatabase
    DatabaseName = 'NCompPOS'
    DriverName = 'STANDARD'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'path=c:\TCash3\Examplesa\')
    SessionName = 'Default'
    Left = 64
    Top = 32
  end
  object TCStockTable: TTable
    AfterInsert = TCStockTableAfterInsert
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'WStockID'
    TableName = 'Stock.DB'
    Left = 168
    Top = 32
    object TCStockTableWStockID: TIntegerField
      FieldName = 'WStockID'
    end
    object TCStockTableSStockCode: TStringField
      FieldName = 'SStockCode'
      Size = 15
    end
    object TCStockTableSBarCodeNumber: TStringField
      FieldName = 'SBarCodeNumber'
      Size = 25
    end
    object TCStockTableSDescription: TStringField
      FieldName = 'SDescription'
      Size = 35
    end
    object TCStockTableWReportingGroup1ID: TIntegerField
      FieldName = 'WReportingGroup1ID'
    end
    object TCStockTableWReportingGroup2ID: TIntegerField
      FieldName = 'WReportingGroup2ID'
    end
    object TCStockTableWCostAccountID: TIntegerField
      FieldName = 'WCostAccountID'
    end
    object TCStockTableWInputTaxID: TIntegerField
      FieldName = 'WInputTaxID'
    end
    object TCStockTableWOutputTaxID: TIntegerField
      FieldName = 'WOutputTaxID'
    end
    object TCStockTableFOpeningAveCost: TFloatField
      FieldName = 'FOpeningAveCost'
    end
    object TCStockTableFQtyOnHand: TFloatField
      FieldName = 'FQtyOnHand'
    end
    object TCStockTableFOpeningQty: TFloatField
      FieldName = 'FOpeningQty'
    end
    object TCStockTableFInvQtyOnHand: TFloatField
      FieldName = 'FInvQtyOnHand'
    end
    object TCStockTableFReorderQty: TFloatField
      FieldName = 'FReorderQty'
    end
    object TCStockTableWSalesAccountID: TIntegerField
      FieldName = 'WSalesAccountID'
    end
    object TCStockTableBApplyInvoiceDiscount: TBooleanField
      FieldName = 'BApplyInvoiceDiscount'
    end
    object TCStockTableWStockAccountID: TIntegerField
      FieldName = 'WStockAccountID'
    end
    object TCStockTableFSellingPrice1: TFloatField
      FieldName = 'FSellingPrice1'
    end
    object TCStockTableFSellingPrice2: TFloatField
      FieldName = 'FSellingPrice2'
    end
    object TCStockTableFSellingPrice3: TFloatField
      FieldName = 'FSellingPrice3'
    end
    object TCStockTableFUnitAveCost: TFloatField
      FieldName = 'FUnitAveCost'
    end
    object TCStockTableFUnitCost: TFloatField
      FieldName = 'FUnitCost'
    end
    object TCStockTableWUnitID: TIntegerField
      FieldName = 'WUnitID'
    end
    object TCStockTableDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object TCStockTableBApplyTax: TBooleanField
      FieldName = 'BApplyTax'
    end
    object TCStockTableWInputTax2ID: TIntegerField
      FieldName = 'WInputTax2ID'
    end
    object TCStockTableBTaxable: TBooleanField
      FieldName = 'BTaxable'
    end
    object TCStockTableWSupplier1ID: TIntegerField
      FieldName = 'WSupplier1ID'
    end
    object TCStockTableWSupplier2ID: TIntegerField
      FieldName = 'WSupplier2ID'
    end
    object TCStockTableWStockTypeID: TIntegerField
      FieldName = 'WStockTypeID'
    end
    object TCStockTableWOutputTax2ID: TIntegerField
      FieldName = 'WOutputTax2ID'
    end
    object TCStockTableWProfileID: TIntegerField
      FieldName = 'WProfileID'
    end
    object TCStockTableBDisabled: TBooleanField
      FieldName = 'BDisabled'
    end
    object TCStockTableWPerentID: TIntegerField
      FieldName = 'WPerentID'
    end
    object TCStockTableWLocationID: TIntegerField
      FieldName = 'WLocationID'
    end
    object TCStockTableWFileNameID: TIntegerField
      FieldName = 'WFileNameID'
    end
    object TCStockTableSExtraDesc: TStringField
      FieldName = 'SExtraDesc'
      Size = 255
    end
  end
  object TCStockSource: TDataSource
    DataSet = TCStockTable
    Left = 248
    Top = 32
  end
  object TcStockInstall: TTable
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'WStockID'
    TableName = 'Stock.DB'
    Left = 344
    Top = 32
    object TcStockInstallSStockCode: TStringField
      FieldName = 'SStockCode'
      Size = 15
    end
    object TcStockInstallSBarCodeNumber: TStringField
      FieldName = 'SBarCodeNumber'
      Size = 25
    end
    object TcStockInstallSDescription: TStringField
      FieldName = 'SDescription'
      Size = 35
    end
    object TcStockInstallFQtyOnHand: TFloatField
      FieldName = 'FQtyOnHand'
    end
    object TcStockInstallFReorderQty: TFloatField
      FieldName = 'FReorderQty'
    end
    object TcStockInstallFSellingPrice1: TFloatField
      FieldName = 'FSellingPrice1'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object TcStockInstallFUnitCost: TFloatField
      FieldName = 'FUnitCost'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object TcStockInstallSExtraDesc: TStringField
      FieldName = 'SExtraDesc'
      Size = 255
    end
    object TcStockInstallFSellingPrice2: TFloatField
      FieldName = 'FSellingPrice2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object tblAccount: TTable
    AutoCalcFields = False
    AfterInsert = tblAccountAfterInsert
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'SMainAccountCode'
    TableName = 'Account.DB'
    Left = 64
    Top = 93
    object tblAccountSAccountCode: TStringField
      DisplayLabel = 'Account Code'
      DisplayWidth = 8
      FieldName = 'SAccountCode'
      Size = 6
    end
    object tblAccountSDescription: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'SDescription'
      Size = 35
    end
    object tblAccountWAccountID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WAccountID'
      Visible = False
    end
    object tblAccountBIncomeExpense: TBooleanField
      FieldName = 'BIncomeExpense'
    end
    object tblAccountSMainAccountCode: TStringField
      DisplayWidth = 5
      FieldName = 'SMainAccountCode'
      Visible = False
      Size = 3
    end
    object tblAccountSSubAccountCode: TStringField
      DisplayWidth = 4
      FieldName = 'SSubAccountCode'
      Visible = False
      Size = 3
    end
    object tblAccountWAccountTypeID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WAccountTypeID'
      Visible = False
    end
    object tblAccountWReportingGroup1ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WReportingGroup1ID'
      Visible = False
    end
    object tblAccountWReportingGroup2ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WReportingGroup2ID'
      Visible = False
    end
    object tblAccountBSubAccounts: TBooleanField
      DisplayWidth = 5
      FieldName = 'BSubAccounts'
      Visible = False
    end
    object tblAccountDSysDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSysDate'
      Visible = False
    end
  end
  object dsAccount: TDataSource
    DataSet = tblAccount
    Left = 126
    Top = 97
  end
  object tblSysParams: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'SysParams.DB'
    Left = 216
    Top = 96
    object tblSysParamsWUserID: TIntegerField
      FieldName = 'WUserID'
    end
    object tblSysParamsSParamName: TStringField
      FieldName = 'SParamName'
      Size = 25
    end
    object tblSysParamsSParamValue: TStringField
      FieldName = 'SParamValue'
      Size = 50
    end
    object tblSysParamsWTypeID: TIntegerField
      FieldName = 'WTypeID'
    end
    object tblSysParamsWSourceID: TIntegerField
      FieldName = 'WSourceID'
    end
    object tblSysParamsWSourceTypeID: TIntegerField
      FieldName = 'WSourceTypeID'
    end
    object tblSysParamsDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object tblSysParamsWParentID: TIntegerField
      FieldName = 'WParentID'
    end
    object tblSysParamsWParentTypeID: TIntegerField
      FieldName = 'WParentTypeID'
    end
    object tblSysParamsBActive: TBooleanField
      FieldName = 'BActive'
    end
    object tblSysParamsWParamID: TIntegerField
      FieldName = 'WParamID'
    end
  end
  object creditordetail: TTable
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'WAccountID'
    MasterFields = 'WAccountID'
    MasterSource = dsAccount
    TableName = 'creditor.DB'
    Left = 280
    Top = 96
    object creditordetailWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object creditordetailWContactID: TIntegerField
      FieldName = 'WContactID'
    end
    object creditordetailSPassword: TStringField
      FieldName = 'SPassword'
      Size = 8
    end
    object creditordetailSPostal1: TStringField
      FieldName = 'SPostal1'
      Size = 30
    end
    object creditordetailSPostal2: TStringField
      FieldName = 'SPostal2'
      Size = 30
    end
    object creditordetailSPostal3: TStringField
      FieldName = 'SPostal3'
      Size = 30
    end
    object creditordetailSPostalCode: TStringField
      FieldName = 'SPostalCode'
      Size = 8
    end
    object creditordetailSDelivery1: TStringField
      FieldName = 'SDelivery1'
      Size = 30
    end
    object creditordetailSDelivery2: TStringField
      FieldName = 'SDelivery2'
      Size = 30
    end
    object creditordetailSDelivery3: TStringField
      FieldName = 'SDelivery3'
      Size = 30
    end
    object creditordetailSTelephone1: TStringField
      FieldName = 'STelephone1'
    end
    object creditordetailSTelephone2: TStringField
      FieldName = 'STelephone2'
    end
    object creditordetailSFax: TStringField
      FieldName = 'SFax'
    end
    object creditordetailSEmail: TStringField
      FieldName = 'SEmail'
      Size = 50
    end
    object creditordetailWBankName: TStringField
      FieldName = 'WBankName'
    end
    object creditordetailSBranchCode: TStringField
      FieldName = 'SBranchCode'
      Size = 10
    end
    object creditordetailSBankAccountNumber: TStringField
      FieldName = 'SBankAccountNumber'
    end
    object creditordetailSBankAccountName: TStringField
      FieldName = 'SBankAccountName'
      Size = 30
    end
    object creditordetailFCreditLimit: TFloatField
      FieldName = 'FCreditLimit'
    end
    object creditordetailFChargeAmount: TFloatField
      FieldName = 'FChargeAmount'
    end
    object creditordetailSCode: TStringField
      FieldName = 'SCode'
      Size = 6
    end
    object creditordetailBOpenItem: TBooleanField
      FieldName = 'BOpenItem'
    end
    object creditordetailBPostBBF: TBooleanField
      FieldName = 'BPostBBF'
    end
    object creditordetailDLastActivity: TDateField
      FieldName = 'DLastActivity'
    end
    object creditordetailWCurrencyID: TIntegerField
      FieldName = 'WCurrencyID'
    end
    object creditordetailWForexAccountID: TIntegerField
      FieldName = 'WForexAccountID'
    end
    object creditordetailSMessage: TStringField
      FieldName = 'SMessage'
      Size = 50
    end
    object creditordetailSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object creditordetailFDiscount: TFloatField
      FieldName = 'FDiscount'
    end
    object creditordetailWDefaultPriceTypeID: TSmallintField
      FieldName = 'WDefaultPriceTypeID'
    end
    object creditordetailDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object creditordetailWDueDays: TIntegerField
      FieldName = 'WDueDays'
    end
    object creditordetailWDefaultAccount: TIntegerField
      FieldName = 'WDefaultAccount'
    end
  end
  object tblDocHeader: TTable
    AfterInsert = tblDocHeaderAfterInsert
    DatabaseName = 'NCompPOS'
    TableName = 'DocHead.DB'
    Left = 64
    Top = 152
    object tblDocHeaderWDocID: TIntegerField
      FieldName = 'WDocID'
    end
    object tblDocHeaderSDocNo: TStringField
      FieldName = 'SDocNo'
      Size = 15
    end
    object tblDocHeaderWTypeID: TIntegerField
      FieldName = 'WTypeID'
    end
    object tblDocHeaderDDate: TDateField
      FieldName = 'DDate'
    end
    object tblDocHeaderDAllocatedDate: TDateField
      FieldName = 'DAllocatedDate'
    end
    object tblDocHeaderWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object tblDocHeaderWPaymentTypeID: TIntegerField
      FieldName = 'WPaymentTypeID'
    end
    object tblDocHeaderWPostal1ID: TIntegerField
      FieldName = 'WPostal1ID'
    end
    object tblDocHeaderWPostal2ID: TIntegerField
      FieldName = 'WPostal2ID'
    end
    object tblDocHeaderWPostal3ID: TIntegerField
      FieldName = 'WPostal3ID'
    end
    object tblDocHeaderWPostalCodeID: TIntegerField
      FieldName = 'WPostalCodeID'
    end
    object tblDocHeaderWMessage1ID: TIntegerField
      FieldName = 'WMessage1ID'
    end
    object tblDocHeaderWMessage2ID: TIntegerField
      FieldName = 'WMessage2ID'
    end
    object tblDocHeaderWMessage3ID: TIntegerField
      FieldName = 'WMessage3ID'
    end
    object tblDocHeaderFInvoiceDiscount: TFloatField
      FieldName = 'FInvoiceDiscount'
    end
    object tblDocHeaderWSalesmanID: TIntegerField
      FieldName = 'WSalesmanID'
    end
    object tblDocHeaderSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object tblDocHeaderWDelAddress1ID: TIntegerField
      FieldName = 'WDelAddress1ID'
    end
    object tblDocHeaderWDelAddress2ID: TIntegerField
      FieldName = 'WDelAddress2ID'
    end
    object tblDocHeaderWDelAddress3ID: TIntegerField
      FieldName = 'WDelAddress3ID'
    end
    object tblDocHeaderWDelCodeID: TIntegerField
      FieldName = 'WDelCodeID'
    end
    object tblDocHeaderBPrinted: TBooleanField
      FieldName = 'BPrinted'
    end
    object tblDocHeaderBPosted: TBooleanField
      FieldName = 'BPosted'
    end
    object tblDocHeaderWReportingGroup1ID: TIntegerField
      FieldName = 'WReportingGroup1ID'
    end
    object tblDocHeaderWReportingGroup2ID: TIntegerField
      FieldName = 'WReportingGroup2ID'
    end
    object tblDocHeaderWPaymentGroupID: TIntegerField
      FieldName = 'WPaymentGroupID'
    end
    object tblDocHeaderBExclusive: TBooleanField
      FieldName = 'BExclusive'
    end
    object tblDocHeaderWCurrencyID: TIntegerField
      FieldName = 'WCurrencyID'
    end
    object tblDocHeaderFDocAmount: TFloatField
      FieldName = 'FDocAmount'
      currency = True
    end
    object tblDocHeaderFTaxAmount: TFloatField
      FieldName = 'FTaxAmount'
      currency = True
    end
    object tblDocHeaderBRepeating: TBooleanField
      FieldName = 'BRepeating'
    end
    object tblDocHeaderDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object tblDocHeaderWSourceTypeID: TIntegerField
      FieldName = 'WSourceTypeID'
    end
    object tblDocHeaderWProfileID: TIntegerField
      FieldName = 'WProfileID'
    end
    object tblDocHeaderWTerms: TIntegerField
      FieldName = 'WTerms'
    end
    object tblDocHeaderWJobCodeID: TIntegerField
      FieldName = 'WJobCodeID'
    end
    object tblDocHeaderDDueDate: TDateTimeField
      FieldName = 'DDueDate'
    end
    object tblDocHeaderWUserID: TIntegerField
      FieldName = 'WUserID'
    end
  end
  object tblUser: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'User.db'
    Left = 137
    Top = 263
    object tblUserWUserID: TIntegerField
      FieldName = 'WUserID'
    end
    object tblUserSUserName: TStringField
      FieldName = 'SUserName'
    end
  end
  object TCTotal: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'Totals.DB'
    Left = 208
    Top = 160
    object TCTotalWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object TCTotalWPeriodID: TIntegerField
      FieldName = 'WPeriodID'
    end
    object TCTotalBActual: TBooleanField
      FieldName = 'BActual'
    end
    object TCTotalFAmount: TFloatField
      FieldName = 'FAmount'
    end
    object TCTotalDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
  end
  object TCTax: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'Tax.DB'
    Left = 272
    Top = 160
    object TCTaxWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
  end
  object tblGlobal: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'Global.DB'
    Left = 328
    Top = 155
    object tblGlobalWNewAccountID: TIntegerField
      FieldName = 'WNewAccountID'
    end
    object tblGlobalWNewBackOrderID: TIntegerField
      FieldName = 'WNewBackOrderID'
    end
    object tblGlobalWNewContactID: TIntegerField
      FieldName = 'WNewContactID'
    end
    object tblGlobalWNewBatchTypeID: TIntegerField
      FieldName = 'WNewBatchTypeID'
    end
    object tblGlobalWNewBatchID: TIntegerField
      FieldName = 'WNewBatchID'
    end
    object tblGlobalWNewGroupID: TIntegerField
      FieldName = 'WNewGroupID'
    end
    object tblGlobalWNewCurrencyID: TIntegerField
      FieldName = 'WNewCurrencyID'
    end
    object tblGlobalWNewDocID: TIntegerField
      FieldName = 'WNewDocID'
    end
    object tblGlobalWNewLabSpecsID: TIntegerField
      FieldName = 'WNewLabSpecsID'
    end
    object tblGlobalWNewReportID: TIntegerField
      FieldName = 'WNewReportID'
    end
    object tblGlobalWNewTransactionID: TIntegerField
      FieldName = 'WNewTransactionID'
    end
    object tblGlobalWNewStockID: TIntegerField
      FieldName = 'WNewStockID'
    end
    object tblGlobalWNewUnitID: TIntegerField
      FieldName = 'WNewUnitID'
    end
    object tblGlobalWNewUserID: TIntegerField
      FieldName = 'WNewUserID'
    end
    object tblGlobalWNewMessageID: TIntegerField
      FieldName = 'WNewMessageID'
    end
    object tblGlobalWNewStockTransID: TIntegerField
      FieldName = 'WNewStockTransID'
    end
  end
  object dsGlobal: TDataSource
    DataSet = tblGlobal
    Left = 384
    Top = 152
  end
  object tblDocLine: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'DocLine.DB'
    Left = 136
    Top = 152
    object tblDocLineWDocLineID: TIntegerField
      FieldName = 'WDocLineID'
    end
    object tblDocLineWDocID: TIntegerField
      FieldName = 'WDocID'
    end
    object tblDocLineWStockID: TIntegerField
      FieldName = 'WStockID'
    end
    object tblDocLineWLineTypeID: TIntegerField
      FieldName = 'WLineTypeID'
    end
    object tblDocLineWDescriptionID: TIntegerField
      FieldName = 'WDescriptionID'
    end
    object tblDocLineFQtyOrdered: TFloatField
      FieldName = 'FQtyOrdered'
    end
    object tblDocLineFQtyShipped: TFloatField
      FieldName = 'FQtyShipped'
    end
    object tblDocLineFSellingPrice: TFloatField
      FieldName = 'FSellingPrice'
      currency = True
    end
    object tblDocLineFItemDiscount: TFloatField
      FieldName = 'FItemDiscount'
    end
    object tblDocLineWTaxID: TIntegerField
      FieldName = 'WTaxID'
    end
    object tblDocLineFExclusiveAmt: TFloatField
      FieldName = 'FExclusiveAmt'
      currency = True
    end
    object tblDocLineFInclusiveAmt: TFloatField
      FieldName = 'FInclusiveAmt'
      currency = True
    end
    object tblDocLineFTaxAmount: TFloatField
      FieldName = 'FTaxAmount'
      currency = True
    end
    object tblDocLineDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object tblDocLineWProfileID: TIntegerField
      FieldName = 'WProfileID'
    end
    object tblDocLineWSerialNoID: TIntegerField
      FieldName = 'WSerialNoID'
    end
    object tblDocLineSUnit: TStringField
      FieldName = 'SUnit'
      Size = 8
    end
    object tblDocLineSSTockCode: TStringField
      FieldName = 'SSTockCode'
      Size = 15
    end
  end
  object tblGroups: TTable
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'WGroupID'
    TableName = 'Groups.db'
    Left = 137
    Top = 212
    object tblGroupsWGroupID: TIntegerField
      FieldName = 'WGroupID'
    end
    object tblGroupsSDescription: TStringField
      FieldName = 'SDescription'
      Size = 30
    end
  end
  object TCBatCon: TTable
    DatabaseName = 'NCompPOS'
    Exclusive = True
    TableName = 'BatCon.DB'
    Left = 208
    Top = 216
    object TCBatConWBatchID: TIntegerField
      FieldName = 'WBatchID'
    end
    object TCBatConWUserID: TIntegerField
      FieldName = 'WUserID'
    end
    object TCBatConWBatchTypeID: TIntegerField
      FieldName = 'WBatchTypeID'
    end
    object TCBatConSBatchNumber: TStringField
      FieldName = 'SBatchNumber'
      Size = 8
    end
    object TCBatConBPosted: TBooleanField
      FieldName = 'BPosted'
    end
    object TCBatConBImported: TBooleanField
      FieldName = 'BImported'
    end
    object TCBatConBDocSource: TBooleanField
      FieldName = 'BDocSource'
    end
    object TCBatConWLineCount: TIntegerField
      FieldName = 'WLineCount'
    end
    object TCBatConSFilename: TStringField
      FieldName = 'SFilename'
      Size = 16
    end
    object TCBatConWDocID: TIntegerField
      FieldName = 'WDocID'
    end
    object TCBatConDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object TCBatConWInitBatID: TIntegerField
      FieldName = 'WInitBatID'
    end
    object TCBatConSAlias: TStringField
      FieldName = 'SAlias'
      Size = 15
    end
    object TCBatConSUniqueID: TStringField
      FieldName = 'SUniqueID'
      Size = 8
    end
  end
  object tblDebtor: TTable
    DatabaseName = 'NCompPOS'
    IndexFieldNames = 'WAccountID'
    MasterFields = 'WAccountID'
    MasterSource = dsAccount
    TableName = 'Debtor.DB'
    Left = 270
    Top = 213
    object tblDebtorWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object tblDebtorSCode: TStringField
      FieldName = 'SCode'
      Size = 6
    end
    object tblDebtorWContactID: TIntegerField
      FieldName = 'WContactID'
    end
    object tblDebtorSPostal1: TStringField
      FieldName = 'SPostal1'
      Size = 30
    end
    object tblDebtorSPostal2: TStringField
      FieldName = 'SPostal2'
      Size = 30
    end
    object tblDebtorSPostal3: TStringField
      FieldName = 'SPostal3'
      Size = 30
    end
    object tblDebtorSPostalCode: TStringField
      FieldName = 'SPostalCode'
      Size = 8
    end
    object tblDebtorSDelivery1: TStringField
      FieldName = 'SDelivery1'
      Size = 30
    end
    object tblDebtorSDelivery2: TStringField
      FieldName = 'SDelivery2'
      Size = 30
    end
    object tblDebtorSDelivery3: TStringField
      FieldName = 'SDelivery3'
      Size = 30
    end
    object tblDebtorSDeliveryCode: TStringField
      FieldName = 'SDeliveryCode'
      Size = 8
    end
    object tblDebtorSTelephone1: TStringField
      FieldName = 'STelephone1'
    end
    object tblDebtorSTelephone2: TStringField
      FieldName = 'STelephone2'
    end
    object tblDebtorSFax: TStringField
      FieldName = 'SFax'
    end
    object tblDebtorSEmail: TStringField
      FieldName = 'SEmail'
      Size = 50
    end
    object tblDebtorSBankName: TStringField
      FieldName = 'SBankName'
    end
    object tblDebtorSBranchCode: TStringField
      FieldName = 'SBranchCode'
      Size = 10
    end
    object tblDebtorSBankAccountNumber: TStringField
      FieldName = 'SBankAccountNumber'
    end
    object tblDebtorSBankAccountName: TStringField
      FieldName = 'SBankAccountName'
      Size = 30
    end
    object tblDebtorSCreditCardNumber: TStringField
      FieldName = 'SCreditCardNumber'
    end
    object tblDebtorDExpiryDate: TDateField
      FieldName = 'DExpiryDate'
    end
    object tblDebtorSCreditCardType: TStringField
      FieldName = 'SCreditCardType'
    end
    object tblDebtorSCreditCardHolder: TStringField
      FieldName = 'SCreditCardHolder'
    end
    object tblDebtorFCreditLimit: TFloatField
      FieldName = 'FCreditLimit'
    end
    object tblDebtorFChargeAmount: TFloatField
      FieldName = 'FChargeAmount'
    end
    object tblDebtorFDiscount: TFloatField
      FieldName = 'FDiscount'
    end
    object tblDebtorFInterest: TFloatField
      FieldName = 'FInterest'
    end
    object tblDebtorWBankID: TIntegerField
      FieldName = 'WBankID'
    end
    object tblDebtorWSalesmanID: TIntegerField
      FieldName = 'WSalesmanID'
    end
    object tblDebtorBOpenItem: TBooleanField
      FieldName = 'BOpenItem'
    end
    object tblDebtorBDisabled: TBooleanField
      FieldName = 'BDisabled'
    end
    object tblDebtorSMessage: TStringField
      FieldName = 'SMessage'
      Size = 50
    end
    object tblDebtorWDefaultPriceTypeID: TIntegerField
      FieldName = 'WDefaultPriceTypeID'
    end
    object tblDebtorDLastActivity: TDateField
      FieldName = 'DLastActivity'
    end
    object tblDebtorWCurrencyID: TIntegerField
      FieldName = 'WCurrencyID'
    end
    object tblDebtorWForexAccountID: TIntegerField
      FieldName = 'WForexAccountID'
    end
    object tblDebtorSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object tblDebtorSPassword: TStringField
      FieldName = 'SPassword'
      Size = 8
    end
    object tblDebtorBPostBBF: TBooleanField
      FieldName = 'BPostBBF'
    end
    object tblDebtorDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object tblDebtorWDueDays: TIntegerField
      FieldName = 'WDueDays'
    end
    object tblDebtorWDefaultAccount: TIntegerField
      FieldName = 'WDefaultAccount'
    end
  end
  object TCPeriod: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'Periods.DB'
    Left = 328
    Top = 216
    object TCPeriodWPeriodID: TIntegerField
      FieldName = 'WPeriodID'
    end
    object TCPeriodDStartDate: TDateField
      FieldName = 'DStartDate'
    end
    object TCPeriodDEndDate: TDateField
      FieldName = 'DEndDate'
    end
  end
  object TCPeriodSource: TJvDataSource
    DataSet = TCPeriod
    Left = 400
    Top = 216
  end
  object tblMessage: TTable
    AfterInsert = tblMessageAfterInsert
    DatabaseName = 'NCompPOS'
    TableName = 'message.DB'
    Left = 64
    Top = 208
    object tblMessageWMessageID: TIntegerField
      FieldName = 'WMessageID'
    end
    object tblMessageSDescription: TStringField
      FieldName = 'SDescription'
      Size = 35
    end
  end
  object TCTransAct: TTable
    AfterInsert = TCTransActAfterInsert
    DatabaseName = 'NCompPOS'
    TableName = 'TransAct.DB'
    Left = 64
    Top = 264
    object TCTransActWTransactionID: TIntegerField
      FieldName = 'WTransactionID'
    end
    object TCTransActWBatchID: TIntegerField
      FieldName = 'WBatchID'
    end
    object TCTransActWBatchTypeID: TIntegerField
      FieldName = 'WBatchTypeID'
    end
    object TCTransActWLineID: TIntegerField
      FieldName = 'WLineID'
    end
    object TCTransActBCarriedForward: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'BCarriedForward'
    end
    object TCTransActBLastYear: TBooleanField
      FieldName = 'BLastYear'
    end
    object TCTransActBLinksUsed: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'BLinksUsed'
    end
    object TCTransActBMultipleItems: TBooleanField
      DefaultExpression = 'True'
      FieldName = 'BMultipleItems'
    end
    object TCTransActWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object TCTransActDDate: TDateField
      FieldName = 'DDate'
    end
    object TCTransActWPeriodID: TIntegerField
      FieldName = 'WPeriodID'
    end
    object TCTransActSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object TCTransActFTaxRate: TFloatField
      FieldName = 'FTaxRate'
    end
    object TCTransActWTaxAccountID: TIntegerField
      FieldName = 'WTaxAccountID'
    end
    object TCTransActFAmount: TFloatField
      DefaultExpression = '0.00'
      FieldName = 'FAmount'
    end
    object TCTransActFTaxAmount: TFloatField
      DefaultExpression = '0.00'
      FieldName = 'FTaxAmount'
    end
    object TCTransActFOutstandingAmount: TFloatField
      FieldName = 'FOutstandingAmount'
    end
    object TCTransActBReconciled: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'BReconciled'
    end
    object TCTransActWBalancingAccountID: TIntegerField
      FieldName = 'WBalancingAccountID'
    end
    object TCTransActWDescriptionID: TIntegerField
      FieldName = 'WDescriptionID'
    end
    object TCTransActWCurrencyID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'WCurrencyID'
    end
    object TCTransActFForexAmount: TFloatField
      DefaultExpression = '1.00'
      FieldName = 'FForexAmount'
    end
    object TCTransActWUserID: TIntegerField
      FieldName = 'WUserID'
    end
  end
  object TCBatTypes: TTable
    DatabaseName = 'NCompPOS'
    TableName = 'BatTypes.DB'
    Left = 208
    Top = 264
    object TCBatTypesWBatchTypeID: TIntegerField
      FieldName = 'WBatchTypeID'
    end
    object TCBatTypesSDescription: TStringField
      FieldName = 'SDescription'
      Size = 16
    end
  end
  object TCBatTypesSource: TDataSource
    DataSet = TCBatTypes
    Left = 288
    Top = 264
  end
  object TCQuery: TQuery
    DatabaseName = 'NCompPOS'
    Left = 456
    Top = 40
  end
  object TCQuery2: TQuery
    DatabaseName = 'NCompPOS'
    Left = 504
    Top = 40
  end
  object TCQuery3: TQuery
    DatabaseName = 'NCompPOS'
    Left = 504
    Top = 88
  end
  object TCQuery4: TQuery
    DatabaseName = 'NCompPOS'
    Left = 504
    Top = 136
  end
end
