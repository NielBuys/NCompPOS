unit DataFrm;

interface

uses
  SysUtils, Classes, DB, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet,
  uADCompClient, uADPhysMySQL, uADGUIxFormsWait;

type
  TDataForm = class(TDataModule)
    UserSource: TDataSource;
    StockSource: TDataSource;
    CashUpSource: TDataSource;
    StockTrnsferSource: TDataSource;
    StocktrnsferItemSource: TDataSource;
    BranchSource: TDataSource;
    TransSource: TDataSource;
    HQADConnection: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    Query1: TADQuery;
    Query2: TADQuery;
    Query3: TADQuery;
    BranchTable: TADTable;
    BranchTableName: TStringField;
    BranchTableTel: TStringField;
    BranchTableAdr1: TStringField;
    BranchTableAdr2: TStringField;
    BranchTableAdr3: TStringField;
    BranchTablePCode: TStringField;
    BranchTableContact: TStringField;
    User_db: TADTable;
    User_dbUserName: TStringField;
    User_dbPassword: TStringField;
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
    StockTrnsferTable: TADQuery;
    StockTrnsferTableClosed: TStringField;
    StocktrnsferItemTable: TADQuery;
    StocktrnsferItemTableQty: TBCDField;
    StocktrnsferItemTableBeforeQty: TBCDField;
    StocktrnsferItemTableDescription: TStringField;
    StocktrnsferItemTableTCStockNo: TStringField;
    TransTable: TADTable;
    TransTableDescription: TStringField;
    TransTableAmmount: TBCDField;
    TransTablePaymentType: TStringField;
    TransTablePaymentBy: TStringField;
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
    StockTableCommision: TBCDField;
    TransTableTransType: TStringField;
    TransTableRefNo: TStringField;
    TransTableTransOrder: TStringField;
    StockTableAvgCost: TBCDField;
    StockTableCreditorLink: TStringField;
    StockTablest_created_by: TStringField;
    StockTablest_changed_by: TStringField;
    StockTablest_nontaxitem: TStringField;
    User_dbRights: TLongWordField;
    StockTableDateCreated: TLongWordField;
    StockTableDateChanged: TLongWordField;
    StockTableNr: TADAutoIncField;
    StockTableSyncHQ: TIntegerField;
    StockTableBranchMainStockNo: TLongWordField;
    StockTrnsferTableDate: TLongWordField;
    StocktrnsferItemTableNr: TADAutoIncField;
    StocktrnsferItemTableStockNo: TLongWordField;
    StocktrnsferItemTableLinkID: TLongWordField;
    StocktrnsferItemTableTransfered: TLongWordField;
    TransTableNr: TADAutoIncField;
    TransTableDate: TLongWordField;
    TransTableLinkID: TLongWordField;
    TransTableShiftSet: TLongWordField;
    TransTableSyncHQ: TLongWordField;
    TransTableCUSet: TLongWordField;
    StockTrnsferTableSync: TLongWordField;
    CashUpTableNr: TADAutoIncField;
    CashUpTableDate: TLongWordField;
    CashUpTableTotalInvoices: TLongWordField;
    CashUpTableSyncHQ: TLongWordField;
    CashUpTableTotalLayBuys: TLongWordField;
    TransTableTYear: TLongWordField;
    TransTableTMonth: TLongWordField;
    TransTableIInvNo: TLongWordField;
    TransTableIBranchNo: TLongWordField;
    TransTableSyncBranch: TLongWordField;
    BranchTableNr: TADAutoIncField;
    BranchTableLastSync: TLongWordField;
    BranchTableCreated: TLongWordField;
    BranchTableStartInvNo: TLongWordField;
    User_dbNr: TADAutoIncField;
    StockTableBranchNo: TIntegerField;
    TransTableBranchNo: TIntegerField;
    StockTrnsferTableNr: TLongWordField;
    StockTrnsferTableToBranch: TLongWordField;
    StockTrnsferTableFromBranch: TLongWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataForm: TDataForm;

implementation

{$R *.dfm}

end.
