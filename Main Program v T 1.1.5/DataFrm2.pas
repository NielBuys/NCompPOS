unit DataFrm2;

interface

uses
  SysUtils, Classes, DB, DBTables, IniFiles, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompClient, uADCompDataSet, uADGUIxFormsWait, uADPhysMySQL,
  QRPDFFilt, RpDefine, RpRender, RpRenderPDF, UtilsUnit, RpRenderText,
  RpRenderHTML, QRWebFilt, QRExport;
    
type
  TDataForm2 = class(TDataModule)
    UserSource: TDataSource;
    Query1Source: TDataSource;
    NoteSource: TDataSource;
    StockSource: TDataSource;
    StockQuerySource: TDataSource;
    InvoiceSource: TDataSource;
    InvoiceItemSource: TDataSource;
    RvRenderPDF1: TRvRenderPDF;
    CashUpSource: TDataSource;
    BranchSource: TDataSource;
    StockTrnsferSource: TDataSource;
    StocktrnsferItemSource: TDataSource;
    PurchaseItemSource: TDataSource;
    TransQuerySource: TDataSource;
    InvoiceExportSource: TDataSource;
    GlobalSource: TDataSource;
    GRNSource: TDataSource;
    QRPDFFilter1: TQRPDFFilter;
    ADConnection: TADConnection;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    Query3: TADQuery;
    Query2: TADQuery;
    Query4: TADQuery;
    Query1: TADQuery;
    InvoiceTable: TADQuery;
    InvoiceTableClientName: TStringField;
    InvoiceTableClientTelW: TStringField;
    InvoiceTableClientTelC: TStringField;
    InvoiceTableClientAdr1: TStringField;
    InvoiceTableClientAdr2: TStringField;
    InvoiceTableClientAdr3: TStringField;
    InvoiceTableClientPCode: TStringField;
    InvoiceTableClientVatNo: TStringField;
    InvoiceTableInvBy: TStringField;
    InvoiceTableInvClose: TStringField;
    InvoiceTableAmmTendered: TBCDField;
    InvoiceTableInvoiceType: TStringField;
    InvoiceTableGLDebNo: TStringField;
    InvoiceTableInvTotal: TBCDField;
    InvoiceTableShiftSet: TStringField;
    InvoiceTableClientEMail: TStringField;
    InvoiceTableDays30: TBCDField;
    InvoiceTableDays60: TBCDField;
    InvoiceTableDays90: TBCDField;
    InvoiceTableDays120: TBCDField;
    InvoiceTablePremium: TBCDField;
    InvoiceTableRefNo: TStringField;
    InvoiceTableTestField: TStringField;
    GlobalTable: TADTable;
    StockQuery: TADQuery;
    StockQueryDescription: TStringField;
    StockQueryCostPrice: TBCDField;
    StockQuerySalesPrice: TBCDField;
    StockQuerySalesPrice2: TBCDField;
    StockQueryBarcode: TStringField;
    StockQueryQty: TBCDField;
    StockQueryAlertQty: TBCDField;
    StockQueryNonStockItem: TStringField;
    StockQueryStartingQty: TBCDField;
    StockQueryTCStockNo: TStringField;
    StockQueryChanged: TStringField;
    StockQueryGroup: TStringField;
    StockQueryExtraDescr: TStringField;
    StockQueryModelNo: TStringField;
    StockTable: TADQuery;
    StockTableDescription: TStringField;
    StockTableCostPrice: TBCDField;
    StockTableSalesPrice: TBCDField;
    StockTableSalesPrice2: TBCDField;
    StockTableBarcode: TStringField;
    StockTableQty: TBCDField;
    StockTableAlertQty: TBCDField;
    StockTableNonStockItem: TStringField;
    StockTableStartingQty: TBCDField;
    StockTableTCStockNo: TStringField;
    StockTableChanged: TStringField;
    StockTableGroup: TStringField;
    StockTableExtraDescr: TStringField;
    StockTableModelNo: TStringField;
    User_db: TADTable;
    User_dbUserName: TStringField;
    User_dbPassword: TStringField;
    CashUpTable: TADTable;
    CashUpTableUser: TStringField;
    CashUpTableRealCashTotal: TBCDField;
    CashUpTableRealChequesTotal: TBCDField;
    CashUpTableRealCreditCardTotal: TBCDField;
    CashUpTableRealOtherTotal: TBCDField;
    CashUpTableCountCashTotal: TBCDField;
    CashUpTableCountChequesTotal: TBCDField;
    CashUpTableCountCreditCardTotal: TBCDField;
    CashUpTableCountOtherTotal: TBCDField;
    CashUpTableCUClosed: TStringField;
    CashUpTableRealLayBuys: TBCDField;
    CashUpTableCountLayBuys: TBCDField;
    CashUpTableTimeStamp: TStringField;
    CashUpTableCashDiff: TCurrencyField;
    CashUpTableChequesDiff: TCurrencyField;
    CashUpTableCreditCardDiff: TCurrencyField;
    CashUpTableOtherDiff: TCurrencyField;
    StockTrnsferTable: TADQuery;
    StockTrnsferTableClosed: TStringField;
    TransQuery: TADQuery;
    TransQueryDescription: TStringField;
    TransQueryAmmount: TBCDField;
    TransQueryPaymentType: TStringField;
    TransQueryPaymentBy: TStringField;
    InvoiceExportQuery: TADQuery;
    InvoiceExportQueryInvClose: TStringField;
    InvoiceExportQueryInvTotal: TBCDField;
    InvoiceExportQueryInvoiceType: TStringField;
    InvoiceExportQueryInvBy: TStringField;
    InvoiceExportQueryShiftSet: TStringField;
    BranchTable: TADTable;
    BranchTableName: TStringField;
    BranchTableTel: TStringField;
    BranchTableAdr1: TStringField;
    BranchTableAdr2: TStringField;
    BranchTableAdr3: TStringField;
    BranchTablePCode: TStringField;
    BranchTableContact: TStringField;
    NotesQuery: TADQuery;
    NotesQueryFromWhere: TStringField;
    NotesQueryDescription: TStringField;
    NotesQueryNoteBy: TStringField;
    NotesQueryCompleted: TStringField;
    NotesQueryAttentionTime: TStringField;
    GRNTable: TADQuery;
    GRNTableTCStockNo: TStringField;
    GRNTableDescription: TStringField;
    GRNTableQty: TBCDField;
    GRNTablePrice2: TBCDField;
    GRNTableCostPrice: TBCDField;
    InvoiceItemTable: TADQuery;
    InvoiceItemTableDescription: TStringField;
    InvoiceItemTablePrice: TBCDField;
    InvoiceItemTableQty: TBCDField;
    InvoiceItemTableDiscount: TBCDField;
    InvoiceItemTableCostPrice: TBCDField;
    InvoiceItemTablePrice2: TBCDField;
    InvoiceItemTableBarcode: TStringField;
    InvoiceItemTableTCStockNo: TStringField;
    InvoiceItemTableExtraDescr: TStringField;
    InvoiceItemTableModelNo: TStringField;
    InvoiceItemTableComment: TStringField;
    InvoiceItemTableSellingPrice: TCurrencyField;
    PurchaseItemTable: TADQuery;
    PurchaseItemTableDescription: TStringField;
    PurchaseItemTablePrice: TBCDField;
    PurchaseItemTableQty: TBCDField;
    PurchaseItemTableDiscount: TBCDField;
    PurchaseItemTableCostPrice: TBCDField;
    PurchaseItemTablePrice2: TBCDField;
    PurchaseItemTableBarcode: TStringField;
    PurchaseItemTableTCStockNo: TStringField;
    PurchaseItemTableExtraDescr: TStringField;
    PurchaseItemTableModelNo: TStringField;
    PurchaseItemTableComment: TStringField;
    PurchaseItemTableCostIncl: TCurrencyField;
    PurchaseItemTableTotalCost: TCurrencyField;
    StocktrnsferItemTable: TADQuery;
    StocktrnsferItemTableQty: TBCDField;
    StocktrnsferItemTableBeforeQty: TBCDField;
    StocktrnsferItemTableDescription: TStringField;
    StocktrnsferItemTableTCStockNo: TStringField;
    AccountsTable: TADQuery;
    AccountsTableName: TStringField;
    AccountsTableCompanyName: TStringField;
    AccountsTableTel: TStringField;
    AccountsTableTelF: TStringField;
    AccountsTableTelC: TStringField;
    AccountsTableHAdr1: TStringField;
    AccountsTableHAdr2: TStringField;
    AccountsTableHAdr3: TStringField;
    AccountsTablePAdr1: TStringField;
    AccountsTablePAdr2: TStringField;
    AccountsTablePAdr3: TStringField;
    AccountsTablePCode: TStringField;
    AccountsTableEMail: TStringField;
    AccountsTableByUser: TStringField;
    AccountsTableTotal: TBCDField;
    AccountsTableID: TStringField;
    AccountsSource: TDataSource;
    AccountsTableSurname: TStringField;
    AccountSearch: TADQuery;
    AccountSearchSource: TDataSource;
    AccountSearchSurname: TStringField;
    AccountSearchName: TStringField;
    AccountSearchCompanyName: TStringField;
    AccountSearchID: TStringField;
    TransQueryTransType: TStringField;
    AccountsTableDays30: TBCDField;
    AccountsTableDays60: TBCDField;
    AccountsTableDays90: TBCDField;
    AccountsTableDays120: TBCDField;
    AccountsTableCurrent: TBCDField;
    AccountsTableRefNo: TStringField;
    AccountsTableTCNo: TStringField;
    AccountsTableBeginTotal: TBCDField;
    TransQueryRefNo: TStringField;
    InvoiceItemTableRentalSwi: TStringField;
    InvoiceItemTableCommentSwi: TStringField;
    DebtorInvList: TADQuery;
    DebtorInvListSource: TDataSource;
    DebtorInvListCompanyName: TStringField;
    TransQueryTransOrder: TStringField;
    StockQueryCommision: TBCDField;
    StockTableCommision: TBCDField;
    AccountsTableDiscount: TBCDField;
    AccountsTableAllowCredit: TStringField;
    Query2Source: TDataSource;
    InvAdvFindQuery: TADQuery;
    InvAdvFindSource: TDataSource;
    InvAdvFindQueryClientName: TStringField;
    InvAdvFindQueryClientTelW: TStringField;
    InvAdvFindQueryClientTelC: TStringField;
    InvAdvFindQueryClientAdr1: TStringField;
    InvAdvFindQueryClientAdr2: TStringField;
    InvAdvFindQueryClientAdr3: TStringField;
    InvAdvFindQueryClientPCode: TStringField;
    InvAdvFindQueryClientVatNo: TStringField;
    InvAdvFindQueryInvBy: TStringField;
    InvAdvFindQueryInvClose: TStringField;
    InvAdvFindQueryAmmTendered: TBCDField;
    InvAdvFindQueryInvoiceType: TStringField;
    InvAdvFindQueryGLDebNo: TStringField;
    InvAdvFindQueryInvTotal: TBCDField;
    InvAdvFindQueryShiftSet: TStringField;
    InvAdvFindQueryClientEMail: TStringField;
    InvAdvFindQueryPremium: TBCDField;
    InvAdvFindQueryRefNo: TStringField;
    StockQueryAvgCost: TBCDField;
    StockTableAvgCost: TBCDField;
    StockTableCreditorLink: TStringField;
    StockQueryCreditorLink: TStringField;
    AccountSearchTotal: TBCDField;
    AccountSearchRefNo: TStringField;
    AccountSearchTel: TStringField;
    AccountSearchAllowCredit: TStringField;
    AccountSearchEMail: TStringField;
    InvoiceTableNr: TADAutoIncField;
    User_dbNr: TADAutoIncField;
    GRNTableNr: TADAutoIncField;
    StockSearchQuery: TADQuery;
    StockSearchQueryDescription: TStringField;
    StockSearchQueryBarcode: TStringField;
    StockSearchQueryTCStockNo: TStringField;
    StockSearchQueryExtraDescr: TStringField;
    StockSearchQuerySource: TDataSource;
    StockSearchQueryQty: TBCDField;
    StockSearchQueryNonStockItem: TStringField;
    StockAdjustTable: TADQuery;
    StockAdjustTablest_adj_id: TADAutoIncField;
    StockAdjustTableTCStockNoLink: TStringField;
    StockAdjustTablest_adj_by: TStringField;
    StockAdjustTablest_adj_value: TBCDField;
    StockAdjustTablest_adj_timestamp: TSQLTimeStampField;
    StockAdjustSource: TDataSource;
    StockTablest_created_by: TStringField;
    StockTablest_changed_by: TStringField;
    StockTablest_nontaxitem: TStringField;
    StockQueryst_created_by: TStringField;
    StockQueryst_changed_by: TStringField;
    StockQueryst_nontaxitem: TStringField;
    StockHistoryTable: TADQuery;
    StockHistorySource: TDataSource;
    StockAdjustTablest_adj_type: TStringField;
    User_dbRights: TLongWordField;
    GlobalTableNr: TLongWordField;
    GlobalTableInvNo: TLongWordField;
    GlobalTablePurchaseInvNo: TLongWordField;
    GlobalTableDAccNo: TLongWordField;
    GlobalTableCAccNo: TLongWordField;
    GlobalTableDActiveMonth: TLongWordField;
    GlobalTableCActiveMonth: TLongWordField;
    GlobalTableBranchNo: TLongWordField;
    GlobalTableVat: TFloatField;
    GlobalTableReportTitle: TStringField;
    GlobalTableLayBuyEnable: TStringField;
    GlobalTableLayBuyTerm: TLongWordField;
    GlobalTableLayBuyDeposit: TBCDField;
    GlobalTableOtherDescr: TStringField;
    GlobalTableNegQty: TStringField;
    GlobalTableCommentDescr: TStringField;
    GlobalTableMinimumMarkup: TFloatField;
    GlobalTableShowAdditions: TStringField;
    GlobalTableCurrentUser: TStringField;
    GlobalTableTCCashDebNo: TStringField;
    GlobalTableTCStockNoBarcode: TStringField;
    GlobalTableDefaultRecPrintChoice: TStringField;
    GlobalTableUsr3AllowItemAmmChange: TStringField;
    GlobalTableUsr3AllowVisibleCashup: TStringField;
    GlobalTableSQLScriptsNo: TLongWordField;
    GlobalTableUsedCount: TLongWordField;
    GlobalTableReportedUsedCount: TLongWordField;
    InvoiceTableInvDate: TLongWordField;
    InvoiceTableMemLink: TLongWordField;
    InvoiceTableInvNo: TLongWordField;
    InvoiceTableTermMonths: TLongWordField;
    StockQueryDateCreated: TLongWordField;
    StockQueryDateChanged: TLongWordField;
    StockQueryNr: TADAutoIncField;
    StockQueryBranchMainStockNo: TLongWordField;
    StockTableDateCreated: TLongWordField;
    StockTableDateChanged: TLongWordField;
    StockTableBranchMainStockNo: TLongWordField;
    StockTableNr: TADAutoIncField;
    CashUpTableNr: TADAutoIncField;
    CashUpTableDate: TLongWordField;
    CashUpTableTotalInvoices: TLongWordField;
    CashUpTableSyncHQ: TLongWordField;
    CashUpTableTotalLayBuys: TLongWordField;
    StockTrnsferTableSync: TLongWordField;
    TransQueryLinkID: TLongWordField;
    TransQueryShiftSet: TLongWordField;
    TransQuerySyncHQ: TLongWordField;
    TransQueryCUSet: TLongWordField;
    InvoiceExportQueryInvNo: TLongWordField;
    InvoiceExportQueryInvDate: TLongWordField;
    BranchTableNr: TADAutoIncField;
    BranchTableLastSync: TLongWordField;
    BranchTableCreated: TLongWordField;
    BranchTableStartInvNo: TLongWordField;
    NotesQueryNr: TADAutoIncField;
    NotesQueryDate: TLongWordField;
    NotesQueryLinkID: TLongWordField;
    NotesQueryAttentionDate: TLongWordField;
    InvoiceItemTableNr: TADAutoIncField;
    InvoiceItemTableStockNo: TLongWordField;
    InvoiceItemTableLinkId: TLongWordField;
    PurchaseItemTableNr: TADAutoIncField;
    PurchaseItemTableStockNo: TLongWordField;
    PurchaseItemTableLinkId: TLongWordField;
    PurchaseItemTableRentalSwi: TStringField;
    PurchaseItemTableCommentSwi: TStringField;
    StockTrnsferTableDate: TLongWordField;
    StocktrnsferItemTableNr: TADAutoIncField;
    StocktrnsferItemTableStockNo: TLongWordField;
    StocktrnsferItemTableLinkID: TLongWordField;
    StocktrnsferItemTableTransfered: TLongWordField;
    AccountsTableNr: TADAutoIncField;
    AccountsTableAccType: TLongWordField;
    AccountsTableChangeDate: TLongWordField;
    AccountsTableCreateDate: TLongWordField;
    AccountsTableBeginDate: TLongWordField;
    AccountsTableEndDate: TLongWordField;
    AccountsTableDueDays: TLongWordField;
    AccountsTableSyncHQ: TLongWordField;
    AccountsTableSyncBranch: TLongWordField;
    AccountSearchNr: TADAutoIncField;
    AccountSearchBeginDate: TLongWordField;
    AccountSearchEndDate: TLongWordField;
    AccountSearchAccNo: TLongWordField;
    AccountsTableAccNo: TLongWordField;
    TransQueryNr: TADAutoIncField;
    TransQueryDate: TLongWordField;
    TransQueryTYear: TLongWordField;
    TransQueryTMonth: TLongWordField;
    TransQuerySyncBranch: TLongWordField;
    TransQueryIInvNo: TLongWordField;
    TransQueryIBranchNo: TLongWordField;
    InvoiceItemTableItemOrder: TLongWordField;
    PurchaseItemTableItemOrder: TLongWordField;
    DebtorInvListNr: TADAutoIncField;
    DebtorInvListAccNo: TLongWordField;
    DebtorInvListBranchNo: TLongWordField;
    InvAdvFindQueryNr: TADAutoIncField;
    InvAdvFindQueryInvDate: TLongWordField;
    InvAdvFindQueryInvNo: TLongWordField;
    StockAdjustTableSyncHQ: TLongWordField;
    StockAdjustTablest_adj_date: TLongWordField;
    InvoiceExportQueryCUSet: TIntegerField;
    InvoiceTableCUSet: TIntegerField;
    InvoiceTableSyncHQ: TIntegerField;
    InvoiceTableBranchNo: TIntegerField;
    StockTableSyncHQ: TIntegerField;
    StockTableBranchNo: TIntegerField;
    StockQueryBranchNo: TIntegerField;
    StockQuerySyncHQ: TIntegerField;
    InvoiceExportQueryBranchNo: TIntegerField;
    InvoiceItemTableBranchNo: TIntegerField;
    PurchaseItemTableBranchNo: TIntegerField;
    InvAdvFindQueryBranchNo: TIntegerField;
    InvAdvFindQueryCUSet: TIntegerField;
    InvAdvFindQuerySyncHQ: TIntegerField;
    DebtorInvListGLDebNo: TStringField;
    InvoiceItemTableDBGLineno: TIntegerField;
    StockTakeSource: TDataSource;
    StockTakeDetailSource: TDataSource;
    StocktakeTable: TADQuery;
    StocktakeTableStockTakeID: TADAutoIncField;
    StocktakeTableStockTakeDescription: TStringField;
    StocktakeTableStockTakeStatus: TStringField;
    StocktakeTableStockTakeDate: TLongWordField;
    StockTakeDetailTable: TADQuery;
    StockTakeDetailTableStockTakeID: TLongWordField;
    StockTakeDetailTableTCStockNo: TStringField;
    StockTakeDetailTableQty: TFloatField;
    StockTakeDetailTableBeforeQty: TFloatField;
    StockTakeDetailTableDescription: TStringField;
    GlobalTableSQLCount: TLongWordField;
    StockAdjustTableBranchNo: TIntegerField;
    AccountsTableBranchNo: TLongWordField;
    AccountSearchBranchNo: TLongWordField;
    TransQueryBranchNo: TIntegerField;
    InvItemAdvFindQuery: TADQuery;
    InvItemAdvFindQueryInvNo: TLongWordField;
    InvItemAdvFindQueryBranchNo: TIntegerField;
    InvItemAdvFindQueryInvDate: TLongWordField;
    InvItemAdvFindQueryClientName: TStringField;
    InvItemAdvFindQueryTCStockNo: TStringField;
    InvItemAdvFindQueryDescription: TStringField;
    InvItemAdvFindQuerySellingPrice: TBCDField;
    InvItemAdvFindQueryDiscount: TBCDField;
    InvItemAdvFindQueryQtySold: TBCDField;
    InvItemAdvFindQueryCostPrice: TBCDField;
    InvItemAdvFindSource: TDataSource;
    QRExcelFilter1: TQRExcelFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderText1: TRvRenderText;
    GlobalTableLogo: TBlobField;
    GlobalTableHeader: TMemoField;
    GlobalTableFooter: TMemoField;
    StockTakeDetailTableStockTakeDetailID: TLargeintField;
    StockTakeDetailTableBranchNo: TIntegerField;
    StockTrnsferTableToBranch: TLongWordField;
    StockTrnsferTableFromBranch: TLongWordField;
    StockTrnsferTableNr: TLongWordField;
    BranchListQuery: TADQuery;
    BranchListQuerySource: TDataSource;
    BranchListQueryBranchName: TStringField;
    BranchListQueryNr: TLargeintField;
    StockHistoryTableorderint: TLargeintField;
    StockHistoryTableTCStockNo: TStringField;
    StockHistoryTableBranchNo: TIntegerField;
    StockHistoryTableItemDate: TLongWordField;
    StockHistoryTableItemValue: TBCDField;
    StockHistoryTableItemRef: TLargeintField;
    StockHistoryTableItemType: TStringField;
    StockHistoryTableSyncHQ: TLargeintField;
    StockTakeDetailTableLocalQty: TBCDField;
    procedure UserSourceStateChange(Sender: TObject);
    procedure StockSourceStateChange(Sender: TObject);
    procedure InvoiceSourceStateChange(Sender: TObject);
    procedure InvoiceItemSourceStateChange(Sender: TObject);
    procedure InvoiceItemTableCalcFields(DataSet: TDataSet);
    procedure CashUpSourceStateChange(Sender: TObject);
    procedure CashUpTableCalcFields(DataSet: TDataSet);
    procedure BranchSourceStateChange(Sender: TObject);
    procedure StockTrnsferSourceStateChange(Sender: TObject);
    procedure StocktrnsferItemSourceStateChange(Sender: TObject);
    procedure PurchaseItemSourceStateChange(Sender: TObject);
    procedure PurchaseItemTableAfterInsert(DataSet: TDataSet);
    procedure PurchaseItemTableCalcFields(DataSet: TDataSet);
    procedure GlobalSourceStateChange(Sender: TObject);
    procedure GRNSourceStateChange(Sender: TObject);
    procedure AccountsSourceStateChange(Sender: TObject);
    procedure PurchaseItemTableBeforePost(DataSet: TDataSet);
    procedure InvoiceItemTableBeforePost(DataSet: TDataSet);
    procedure DebtorInvListCalcFields(DataSet: TDataSet);
    procedure InvoiceTableNewRecord(DataSet: TDataSet);
    procedure StockTakeSourceStateChange(Sender: TObject);
    procedure StockTakeDetailSourceStateChange(Sender: TObject);
    procedure StockTrnsferTableBeforePost(DataSet: TDataSet);

  private
    { Private declarations}
    FExcOldValue: Double;
    procedure SetExcOldValue(const Value: Double);
    function GetExcOldValue: Double;

  public
    { Public declarations }
    StockTablestrState: String;
    InvoiceTablestrState: String;
    InvoiceItemTablestrState: String;
    User_dbstrState: String;
    CashUpTablestrState: String;
    BranchTablestrState: String;
    StockTrnsferTablestrState: String;
    StocktrnsferItemTablestrState: String;
    PurchaseItemTablestrState, AccountsTablestrState: String;
    GlobalTablestrState: String;
    GRNTablestrState: String;
    StockTakeTablestrState: String;
    StockTakeDetailTablestrState: String;
    accessstr: Integer;
    UserNameStr: String;
    UserRights: Integer;
    IniFile: TIniFile;
    ProgramPath, UserDataPath,AllUsersDataPath: String;
    property ExcOldValue : Double  read GetExcOldValue write SetExcOldValue;
  end;

var
  DataForm2: TDataForm2;

implementation

{$R *.dfm}

procedure TDataForm2.UserSourceStateChange(Sender: TObject);
begin
        case User_db.State of
           dsBrowse: User_dbstrState := 'Browse';
           dsEdit: User_dbstrState := 'Edit';
           dsInsert: User_dbstrState := 'Insert';
        else
        User_dbstrState := 'Other state';
        end;
end;

procedure TDataForm2.StockSourceStateChange(Sender: TObject);
begin
        case StockTable.State of
           dsBrowse: StockTablestrState := 'Browse';
           dsEdit: StockTablestrState := 'Edit';
           dsInsert: StockTablestrState := 'Insert';
        else
        StockTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.StockTakeDetailSourceStateChange(Sender: TObject);
begin
        case StockTakeDetailTable.State of
           dsBrowse: StockTakeDetailTablestrState := 'Browse';
           dsEdit: StockTakeDetailTablestrState := 'Edit';
           dsInsert: StockTakeDetailTablestrState := 'Insert';
        else
        StockTakeDetailTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.StockTakeSourceStateChange(Sender: TObject);
begin
        case StockTakeTable.State of
           dsBrowse: StockTakeTablestrState := 'Browse';
           dsEdit: StockTakeTablestrState := 'Edit';
           dsInsert: StockTakeTablestrState := 'Insert';
        else
        StockTakeTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.InvoiceSourceStateChange(Sender: TObject);
begin
        case InvoiceTable.State of
           dsBrowse: InvoiceTablestrState := 'Browse';
           dsEdit: InvoiceTablestrState := 'Edit';
           dsInsert: InvoiceTablestrState := 'Insert';
        else
        InvoiceTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.InvoiceTableNewRecord(DataSet: TDataSet);
begin
 //       Dataform2.Query1.Close;

 //       Dataset.FieldByName('Nr').
end;

procedure TDataForm2.InvoiceItemSourceStateChange(Sender: TObject);
begin
        case InvoiceItemTable.State of
           dsBrowse: InvoiceItemTablestrState := 'Browse';
           dsEdit: InvoiceItemTablestrState := 'Edit';
           dsInsert: InvoiceItemTablestrState := 'Insert';
        else
        InvoiceItemTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.InvoiceItemTableBeforePost(DataSet: TDataSet);
begin
          if (Dataform2.InvoiceItemTableItemOrder.IsNull) then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('select max(ItemOrder) as NextItem from invoiceitem_db');
              Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
              Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
              Add('order by ItemOrder, Nr');
            end;
            Dataform2.Query4.Open;
            Dataform2.InvoiceItemTableItemOrder.Value := Dataform2.Query4.FieldByName('NextItem').asInteger + 1;
            Dataform2.Query4.Close;
          end;
          if (Dataform2.InvoiceItemTableLinkID.IsNull) or (Dataform2.InvoiceItemTableLinkID.AsInteger = 0) then
          begin
            Dataform2.InvoiceItemTableLinkID.Value := Dataform2.InvoiceTableNr.Value;
            Dataform2.InvoiceItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
          end;
end;

procedure TDataForm2.InvoiceItemTableCalcFields(DataSet: TDataSet);
begin
        Dataset['SellingPrice'] := MyRoundTo((DataSet.FieldByName('Price').AsCurrency)
                                 * (DataSet.FieldByName('Qty').asfloat), -2);
//        Dataset['SellingPrice'] := (DataSet.FieldByName('Price').asfloat)
//                                 * (DataSet.FieldByName('Qty').asfloat);
        Dataset['DBGLineno'] := Dataset.RecNo;
        If Dataset['DBGLineno'] = 0 then
          Dataset['DBGLineno'] := Dataset['DBGLineno'] + 1;
//        If Dataset['DBGLineno'] < 1 then
//          Dataset['DBGLineno'] := Dataset['DBGLineno'] * -1;
end;

procedure TDataForm2.CashUpSourceStateChange(Sender: TObject);
begin
        case CashUpTable.State of
           dsBrowse: CashUpTablestrState := 'Browse';
           dsEdit: CashUpTablestrState := 'Edit';
           dsInsert: CashUpTablestrState := 'Insert';
        else
        CashUpTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.SetExcOldValue(const Value: Double);
begin
  FExcOldValue := Value;
end;

function TDataForm2.GetExcOldValue: Double;
begin
 result := FExcOldValue;
end;

procedure TDataForm2.CashUpTableCalcFields(DataSet: TDataSet);
begin
        Dataset['CashDiff'] := ((DataSet.FieldByName('RealCashTotal').AsCurrency)
                           - (DataSet.FieldByName('CountCashTotal').AsCurrency));
        Dataset['ChequesDiff'] := ((DataSet.FieldByName('RealChequesTotal').AsCurrency)
                           - (DataSet.FieldByName('CountChequesTotal').AsCurrency));
        Dataset['CreditCardDiff'] := ((DataSet.FieldByName('RealCreditCardTotal').AsCurrency)
                           - (DataSet.FieldByName('CountCreditCardTotal').AsCurrency));
        Dataset['OtherDiff'] := ((DataSet.FieldByName('RealOtherTotal').AsCurrency)
                           - (DataSet.FieldByName('CountOtherTotal').AsCurrency));
end;

procedure TDataForm2.DebtorInvListCalcFields(DataSet: TDataSet);
begin
        Dataset['GLDebNo'] := InttoStr(Dataset['BranchNo']) + '/' + InttoStr(Dataset['AccNo']);
end;

procedure TDataForm2.AccountsSourceStateChange(Sender: TObject);
begin
        case AccountsTable.State of
           dsBrowse: AccountsTablestrState := 'Browse';
           dsEdit: AccountsTablestrState := 'Edit';
           dsInsert: AccountsTablestrState := 'Insert';
        else
        AccountsTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.BranchSourceStateChange(Sender: TObject);
begin
        case BranchTable.State of
           dsBrowse: BranchTablestrState := 'Browse';
           dsEdit: BranchTablestrState := 'Edit';
           dsInsert: BranchTablestrState := 'Insert';
        else
        BranchTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.StockTrnsferSourceStateChange(Sender: TObject);
begin
        case StockTrnsferTable.State of
           dsBrowse: StockTrnsferTablestrState := 'Browse';
           dsEdit: StockTrnsferTablestrState := 'Edit';
           dsInsert: StockTrnsferTablestrState := 'Insert';
        else
        StockTrnsferTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.StockTrnsferTableBeforePost(DataSet: TDataSet);
var
  LocalQuery1: TADQuery;
  I: integer;
begin
        If Dataform2.StockTrnsferTableNr.ISNull then
        begin
          LocalQuery1 := TADQuery.Create(Self);
          LocalQuery1.Connection := Dataform2.ADConnection;
          with LocalQuery1.SQL do
          begin
            Clear;
            Add('select Nr from stocktrnsfer_db');
            Add('where FromBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            Add('order by Nr desc Limit 1');
          end;
          LocalQuery1.Open;
          I := LocalQuery1.FieldByName('Nr').Value + 1;
          Dataform2.StockTrnsferTableNr.Value := I;
          LocalQuery1.Close;
          LocalQuery1.Free;
        end;
end;

procedure TDataForm2.StocktrnsferItemSourceStateChange(Sender: TObject);
begin
        case StocktrnsferItemTable.State of
           dsBrowse: StocktrnsferItemTablestrState := 'Browse';
           dsEdit: StocktrnsferItemTablestrState := 'Edit';
           dsInsert: StocktrnsferItemTablestrState := 'Insert';
        else
        StocktrnsferItemTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.PurchaseItemSourceStateChange(Sender: TObject);
begin
        case PurchaseItemTable.State of
           dsBrowse: PurchaseItemTablestrState := 'Browse';
           dsEdit: PurchaseItemTablestrState := 'Edit';
           dsInsert: PurchaseItemTablestrState := 'Insert';
        else
        PurchaseItemTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.PurchaseItemTableAfterInsert(DataSet: TDataSet);
begin
        Dataset.FieldByName('Discount').Value := 0.00;
        Dataset.FieldByName('CostPrice').AsCurrency := 0.00;
        Dataset.FieldByName('Price').AsCurrency := 0.00;
        Dataset.FieldByName('Price2').AsCurrency := 0.00;
        Dataset.FieldByName('Qty').Value := 1;
end;

procedure TDataForm2.PurchaseItemTableBeforePost(DataSet: TDataSet);
begin
          if (Dataform2.PurchaseItemTableLinkID.IsNull) or (Dataform2.PurchaseItemTableLinkID.AsInteger = 0) then
          begin
            Dataform2.PurchaseItemTableLinkID.Value := Dataform2.InvoiceTableNr.Value;
            Dataform2.PurchaseItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
          end;
end;

procedure TDataForm2.PurchaseItemTableCalcFields(DataSet: TDataSet);
begin
        Dataset.FieldByName('CostIncl').Value := Dataset.FieldbyName('CostPrice').Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value));
        Dataset.FieldByName('TotalCost').Value := Dataset.FieldByName('CostIncl').Value * Dataset.FieldByName('Qty').Value;
end;

procedure TDataForm2.GlobalSourceStateChange(Sender: TObject);
begin
        case GlobalTable.State of
           dsBrowse: GlobalTablestrState := 'Browse';
           dsEdit: GlobalTablestrState := 'Edit';
           dsInsert: GlobalTablestrState := 'Insert';
        else
        GlobalTablestrState := 'Other state';
        end;
end;

procedure TDataForm2.GRNSourceStateChange(Sender: TObject);
begin
        case GRNTable.State of
           dsBrowse: GRNTablestrState := 'Browse';
           dsEdit: GRNTablestrState := 'Edit';
           dsInsert: GRNTablestrState := 'Insert';
        else
        GRNTablestrState := 'Other state';
        end;
end;

end.
