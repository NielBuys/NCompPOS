program ncompPOS;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  ExtractFrm in 'ExtractFrm.pas' {ExtractForm},
  Listsmnu in 'Listsmnu.pas' {ListsMenu},
  DataFrm2 in 'DataFrm2.pas' {DataForm2: TDataModule},
  UserFrm in 'UserFrm.pas' {UserForm},
  AboutFrm in 'AboutFrm.pas' {AboutForm},
  NotesFrm in 'NotesFrm.pas' {NotesForm},
  StockFrm in 'StockFrm.pas' {StockForm},
  StockSearchFrm in 'StockSearchFrm.pas' {StockSearchForm},
  InvoiceFrm in 'InvoiceFrm.pas' {InvoiceForm},
  InvoiceListsFrm in 'InvoiceListsFrm.pas' {InvoiceListsForm},
  CashUpFrm in 'CashUpFrm.pas' {CashUpForm},
  CashupListFrm in 'CashupListFrm.pas' {CashupListForm},
  BranchFrm in 'BranchFrm.pas' {BranchForm},
  StockTransferFrm in 'StockTransferFrm.pas' {StockTransferForm},
  DataFrm in 'DataFrm.pas' {DataForm: TDataModule},
  BarcodePrintingFrm in 'BarcodePrintingFrm.pas' {BarcodePrintingForm},
  StockReportsFrm in 'StockReportsFrm.pas' {StockReportsForm},
  PurchaseFrm in 'PurchaseFrm.pas' {PurchaseForm},
  LayBuyFrm in 'LayBuyFrm.pas' {LayBuyForm},
  ImpData in 'ImpData.pas' {ImportData: TDataModule},
  GridExportFrm in 'GridExportFrm.pas' {GridExportForm},
  PriceChooseFrm in 'PriceChooseFrm.pas' {PriceChooseForm},
  PeriodFrm in 'PeriodFrm.pas' {PeriodForm},
  ImportFrm in 'ImportFrm.pas' {ImportForm},
  grnfrm in 'grnfrm.pas' {GrnForm},
  LocalAccountSearchFrm in 'LocalAccountSearchFrm.pas' {LocalAccountSearchForm},
  UtilsUnit in 'UtilsUnit.pas',
  AccountsFrm in 'AccountsFrm.pas' {AccountsForm},
  AddTransactionFrm in 'AddTransactionFrm.pas' {AddTransactionForm},
  TempGrid in 'TempGrid.pas' {TempGridForm},
  InvAdvFindFrm in 'InvAdvFindFrm.pas' {InvAdvFindForm},
  YearMonthChooseFrm in 'YearMonthChooseFrm.pas' {YearMonthChooseForm},
  StockEditFrm in 'StockEditFrm.pas' {StockEditForm},
  server in 'server.pas',
  StockTakeFrm in 'StockTakeFrm.pas' {StockTakeForm},
  StockTakeDetailFrm in 'StockTakeDetailFrm.pas' {StockTakeDetailForm},
  StockUtils in 'StockUtils.pas',
  ReportFilterFrm in 'ReportFilterFrm.pas' {ReportFilterForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'NCompPOS';
  Application.HelpFile := '';
  Application.CreateForm(TDataForm2, DataForm2);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInvoiceForm, InvoiceForm);
  Application.CreateForm(TExtractForm, ExtractForm);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TDataForm, DataForm);
  Application.CreateForm(TImportData, ImportData);
  Application.CreateForm(TStockForm, StockForm);
  Application.CreateForm(TInvAdvFindForm, InvAdvFindForm);
  Application.Run;
end.
