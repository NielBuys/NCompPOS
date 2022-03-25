unit InvoiceListsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, RpDefine, RpBase, RpSystem, ExtCtrls, StdCtrls,
  Buttons, JvExButtons, JvBitBtn, ComCtrls, JvExComCtrls, JvDateTimePicker,
  DBCtrls, UtilsUnit, DateUtils, db;

type
  TInvoiceListsForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateListEdit: TJvDateTimePicker;
    PrintDailyInvoiceListBtn: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Fromdate: TJvDateTimePicker;
    ToDate: TJvDateTimePicker;
    PrintInvListDateRange: TButton;
    BitBtn1: TBitBtn;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    Report: TRvSystem;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    CheckBox1: TCheckBox;
    JvBitBtn7: TJvBitBtn;
    PrintDailyLayBuyPaymentList: TButton;
    procedure PrintDailyInvoiceListBtnClick(Sender: TObject);
    procedure PrintInvListDateRangeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure ReportBeforePrint(Sender: TObject);
    procedure ReportPrint(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvBitBtn7Click(Sender: TObject);
    procedure PrintDailyLayBuyPaymentListClick(Sender: TObject);
  private
    procedure PrintTaxHeader(BReport: TBaseReport);
    procedure PrintTaxReport(BReport: TBaseReport);
    procedure PrintSalesReport();
    procedure SupplierStockReport(BReport: TBaseReport);
    procedure PrintInvoiceList(BReport: TBaseReport);
    procedure PrintLayBuyPaymentsList(BReport: TBaseReport);
    procedure PrintPurchaseInvoiceList(BReport: TBaseReport);
    { Private declarations }
  public
    { Public declarations }
    Total, TotalVat, TotalWithoutVat,PayedTotal,OwedTotal: Currency;
    s, printfromwhere: String;
  end;

var
  InvoiceListsForm: TInvoiceListsForm;
  Fromwhere, ReportTitle: string;
  PageInt:Integer;

implementation
      uses DataFrm2, GridExportFrm, ExtractFrm, StockFrm;

{$R *.dfm}

procedure TInvoiceListsForm.BitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TInvoiceListsForm.PrintDailyInvoiceListBtnClick(Sender: TObject);
begin
      DataForm2.Query3.Close;
      s := 'WHERE (InvBy = "' + DataForm2.user_db.fieldbyname('UserName').asString + '")';
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT Nr, InvNo, BranchNo, InvDate, InvBy, ClientName, AmmTendered, Premium, RefNo, invoice_db.InvClose FROM invoice_db');
        Add(s);
        Add('and (InvDate = ' + InttoStr(DatetoIntDate(DateListEdit.Date)) + ')');
        Add('and (InvClose = "Close")');
        Add('Order by InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Inv';
      ReportTitle := 'Daily Invoices for: ' + DataForm2.user_db.fieldbyname('UserName').asString + ' and for Date: ' + DatetoStr(DateListEdit.Date);
      PrintFromWhere := 'InvoiceList';
      Report.Execute;
end;

procedure TInvoiceListsForm.PrintDailyLayBuyPaymentListClick(Sender: TObject);
begin
      DataForm2.Query3.Close;
      s := 'WHERE (trans_db.PaymentBy = "' + DataForm2.user_db.fieldbyname('UserName').asString + '")';
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('select invoice_db.Nr, invoice_db.InvNo, invoice_db.BranchNo, trans_db.Date, trans_db.PaymentBy, invoice_db.ClientName,');
        Add('invoice_db.AmmTendered, invoice_db.Premium, trans_db.Ammount, trans_db.Description, invoice_db.InvClose from trans_db');
        Add('left join invoice_db on trans_db.LinkID = invoice_db.InvNo and invoice_db.BranchNo = trans_db.BranchNo');
        Add(s);
        Add('and (trans_db.Date = ' + InttoStr(DatetoIntDate(DateListEdit.Date)) + ')');
        Add('Order by InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Inv';
      ReportTitle := 'Daily Lay Buy Payments for: ' + DataForm2.user_db.fieldbyname('UserName').asString + ' and for Date: ' + DatetoStr(DateListEdit.Date);
      PrintFromWhere := 'LayBuyPaymentsList';
      Report.Execute;
end;

procedure TInvoiceListsForm.PrintInvListDateRangeClick(Sender: TObject);
begin
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM invoice_db');
        Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and InvClose = "Close"');
        Add('Order by BranchNo, InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Inv';
      ReportTitle := 'Monthly Invoices from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'InvoiceList';
      Report.Execute;
end;


procedure TInvoiceListsForm.FormShow(Sender: TObject);
begin
        DateListEdit.Date := date;
        Fromdate.Date := Startofthemonth(date);
        ToDate.Date := Endofthemonth(date);
end;

procedure TInvoiceListsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      DataForm2.User_db.Locate('UserName', DataForm2.UserNameStr, [loPartialKey, loCaseInsensitive]);
      InvoiceListsForm.FreeOnRelease;
end;

procedure TInvoiceListsForm.ReportBeforePrint(Sender: TObject);
begin
        Report.BaseReport.SetPaperSize(DMPAPER_A4,0,0);
        if PrintFromWhere = 'SupplierStock' then
          Report.BaseReport.Orientation := poLandscape;
end;

procedure TInvoiceListsForm.ReportPrint(Sender: TObject);
begin
      if PrintFromWhere = 'TaxReport' then
        PrintTaxReport(Report.BaseReport);
      if PrintFromWhere = 'SupplierStock' then
        SupplierStockReport(Report.BaseReport);
      if PrintFromWhere = 'InvoiceList' then
        PrintInvoiceList(Report.BaseReport);
      if PrintFromWhere = 'LayBuyPaymentsList' then
        PrintLayBuyPaymentsList(Report.BaseReport);
      if PrintFromWhere = 'PurchaseInvoiceList' then
        PrintPurchaseInvoiceList(Report.BaseReport);
end;

procedure TInvoiceListsForm.JvBitBtn1Click(Sender: TObject);
begin
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM invoice_db');
        Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and InvClose = "LaybO"');
        Add('Order by BranchNo, InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Layb';
      ReportTitle := 'Monthly Open Lay Buys from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'InvoiceList';
      Report.Execute;
end;

procedure TInvoiceListsForm.JvBitBtn2Click(Sender: TObject);
begin
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM invoice_db');
        Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and InvClose = "LaybC"');
        Add('Order by BranchNo, InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Layb';
      ReportTitle := 'Monthly Closed Lay Buys from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'InvoiceList';
      Report.Execute;
end;

procedure TInvoiceListsForm.JvBitBtn3Click(Sender: TObject);
begin
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM invoice_db');
        Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and InvClose = "PurcC"');
        Add('Order by BranchNo, InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'PInv';
      ReportTitle := 'Monthly Purchase Invoices from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'PurchaseInvoiceList';
      Report.Execute;
end;

procedure TInvoiceListsForm.JvBitBtn4Click(Sender: TObject);
begin
        Application.CreateForm(TGridExportForm, GridExportForm);
        Dataform2.InvoiceExportQuery.Close;
        with Dataform2.InvoiceExportQuery.SQL do
        begin
          Clear;
          Add('SELECT BranchNo,InvNo, CUSet, InvDate, InvClose, InvTotal, InvoiceType, InvBy, ShiftSet FROM invoice_db');
          Add('where (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and (InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
          Add('and ((InvClose = "Close") or (InvClose = "LaybC"))');
          Add('order by InvClose,BranchNo,InvNo');
        end;
        Dataform2.InvoiceExportQuery.Open;
        GridExportForm.showmodal;
        DataForm2.InvoiceExportQuery.Close;
        GridExportForm.Free;
end;

procedure TInvoiceListsForm.JvBitBtn5Click(Sender: TObject);
begin
        If Dataform2.UserRights > 3 then
        begin
          PrintFromWhere := 'TaxReport';
          Report.Execute;
        end
        else
          showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceListsForm.JvBitBtn6Click(Sender: TObject);
begin
        If Dataform2.UserRights > 3 then
        begin
          PrintSalesReport();
        end
        else
          showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceListsForm.JvBitBtn7Click(Sender: TObject);
begin
        If Dataform2.UserRights > 3 then
        begin
          PrintFromWhere := 'SupplierStock';
          Report.Execute;
        end
        else
          showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceListsForm.PrintTaxReport(BReport:TBaseReport);
var
        LineCount:Integer;
        ExclAmount,VatAmount,ExclTotal,VatTotal,PExclTotal,PVatTotal:Currency;
begin
        with BReport do
        begin
          PageInt := 0;
          ExclTotal := 0;
          VatTotal := 0;
          PExclTotal := 0;
          PVatTotal := 0;
          LineCount := 0;
          PrintTaxHeader(BReport);
          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('SELECT * FROM invoice_db');
            Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
            Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
            Add('and ((InvClose = "Close") or (InvClose = "LaybC"))');
            Add('Order by InvClose,BranchNo, InvNo');
          end;
          DataForm2.Query3.Open;
          DataForm2.Query3.first;
          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 55 then
              begin
                LineCount := 1;
                NewPage;
                PrintTaxHeader(BReport);
              end;

              NewLine;
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('InvDate').asInteger));
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger));
              PrintTab('Invoice');
              PrintTab(Dataform2.Query3.FieldByName('GLDebNo').AsString);
//              ExclAmount := MyRoundTo((Dataform2.Query3.FieldByName('InvTotal').asFloat * 100 / (Dataform2.GlobalTableVat.Value + 100)) * -1,-2);
              ExclAmount := (Dataform2.Query3.FieldByName('InvTotal').asCurrency * 100 / (Dataform2.GlobalTableVat.Value + 100)) * -1;
              ExclTotal := ExclTotal + ExclAmount;
              PrintTab(Floattostrf(ExclAmount,ffCurrency,17,2));
              VatAmount := (Dataform2.Query3.FieldByName('InvTotal').asCurrency + ExclAmount) * -1;
//              VatAmount := MyRoundTo((Dataform2.Query3.FieldByName('InvTotal').asFloat + ExclAmount) * -1,-2);
              VatTotal := VatTotal + VatAmount;
              PrintTab(Floattostrf(VatAmount,ffCurrency,17,2));
              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('Invoice Totals');
          PrintTab('');
          PrintTab(Floattostrf(ExclTotal,ffCurrency,17,2));
          PrintTab(Floattostrf(VatTotal,ffCurrency,17,2));
          Bold := False;
          NewLine;

          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('SELECT * FROM invoice_db');
            Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
            Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
            Add('and InvClose = "PurcC"');
            Add('Order by InvClose,BranchNo, InvNo');
          end;
          DataForm2.Query3.Open;
          DataForm2.Query3.first;
          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 55 then
              begin
                LineCount := 1;
                NewPage;
                PrintTaxHeader(BReport);
              end;

              NewLine;
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('InvDate').asInteger));
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger));
              PrintTab('Purchase Invoice');
              PrintTab(Dataform2.Query3.FieldByName('GLDebNo').AsString);
              ExclAmount := Dataform2.Query3.FieldByName('InvTotal').asCurrency;
              PExclTotal := PExclTotal + ExclAmount;
              PrintTab(Floattostrf(ExclAmount,ffCurrency,17,2));
              VatAmount := Dataform2.Query3.FieldByName('InvTotal').asCurrency * Dataform2.GlobalTableVat.Value / 100;
//              VatAmount := RoundTo(Dataform2.Query3.FieldByName('InvTotal').asFloat * Dataform2.GlobalTableVat.Value / 100,-2);
              PVatTotal := PVatTotal + VatAmount;
              PrintTab(Floattostrf(VatAmount,ffCurrency,17,2));
              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('Purchase Invoice Totals');
          PrintTab('');
          PrintTab(Floattostrf(PExclTotal,ffCurrency,17,2));
          PrintTab(Floattostrf(PVatTotal,ffCurrency,17,2));
          NewLine;
          NewLine;
          PrintTab('');
          PrintTab('');
          PrintTab('Total for Report');
          PrintTab('');
          PrintTab(Floattostrf(ExclTotal + PExclTotal,ffCurrency,17,2));
          PrintTab(Floattostrf(VatTotal + PVatTotal,ffCurrency,17,2));
          Bold := False;

        end;
end;

procedure TInvoiceListsForm.PrintTaxHeader(BReport:TBaseReport);
begin
        with BReport do
        begin
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',10);
          Inc(PageInt);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          Bold := False;
          printRight(datetostr(date) + '   Page ' + InttoStr(PageInt),6.25);
          NewLine;
          NewLine;
          printLeft('Tax Invoice Detail from ' + datetostr(FromDate.Date) + ' to ' + datetostr(ToDate.Date),0.5);
          ClearTabs;
          SetTab(0.5, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,2,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('Date');
          PrintTab('Reference No');
          PrintTab('Details');
          PrintTab('Account');
          PrintTab('Excl Amount');
          PrintTab('Tax Amount');
          Bold := False;
          NewLine;
          ClearTabs;
          SetTab(0.5, pjLeft,0.8,0,0,0);
          SetTab(NA, pjLeft,1,0,0,0);
          SetTab(NA, pjLeft,2,0,0,0);
          SetTab(NA, pjLeft,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
        end;
end;

procedure TInvoiceListsForm.PrintSalesReport();
var
        PreviousBranchNo:Integer;
        TotalInvoices,TotalCost,VatAmount,CostVATAmount,Am1,Am2,InvCostTot: Currency;
begin
          ExtractForm.Memo1.Clear;
          ExtractForm.Memo1.Lines.Add('"Sales Report from ' + datetostr(FromDate.Date) + ' to ' + datetostr(ToDate.Date) + '"');
          ExtractForm.Memo1.Lines.Add(',"Total Sales incl VAT","Total Sales Excl VAT","Cost of Sales Excl VAT","Gross Profit","Gross Profit %"');
          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('SELECT * FROM invoice_db');
            Add('WHERE (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
            Add('(InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
            Add('and ((InvClose = "Close") or (InvClose = "LaybC"))');
            Add('Order by BranchNo, InvNo');
          end;
          DataForm2.Query3.Open;
          PreviousBranchNo := 999999;
          TotalInvoices := 0;
          TotalCost := 0;
          DataForm2.Query3.first;
          try
            while not DataForm2.Query3.EOF do
            begin
              if (PreviousBranchNo <> Dataform2.Query3.FieldByName('BranchNo').AsInteger) and (PreviousBranchNo <> 999999) then
              begin
//                VatAmount := TotalInvoices * 100 / (Dataform2.GlobalTableVat.Value + 100);
                VatAmount := MyRoundTo(TotalInvoices * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
//                showmessage(floattostr(VatAmount));
//                CostVATAmount := TotalCost * 100 / (Dataform2.GlobalTableVat.Value + 100);
                CostVATAmount := MyRoundTo(TotalCost * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
                ExtractForm.Memo1.Lines.Add('"Total for Branch No ' + InttoStr(PreviousBranchNo) + '",' + FloattoStr(TotalInvoices) + ',' + FloattoStr(VatAmount) + ',' + FloattoStr(CostVATAmount) + ',' + FloattoStr((VatAmount) - (CostVATAmount)) + ',' + FloattoStr(((VatAmount) - (CostVATAmount)) / (CostVATAmount)));
                PreviousBranchNo := Dataform2.Query3.FieldByName('BranchNo').AsInteger;
                TotalInvoices := 0;
                TotalCost := 0;
              end
              else
                PreviousBranchNo := Dataform2.Query3.FieldByName('BranchNo').AsInteger;

              InvCostTot := StockForm.InvoiceCostTotal(Dataform2.Query3.FieldByName('Nr').asInteger,Dataform2.Query3.FieldByName('BranchNo').asInteger);
              if CheckBox1.Checked = True then
              begin
//                showmessage (floattostr(InvCostTot));
                Am1 := MyRoundTo(Dataform2.Query3.FieldByName('InvTotal').AsCurrency * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
                if InvCostTot <> 0 then
                begin
                  Am2 := MyRoundTo(InvCostTot * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
                  ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + '",' + FloattoStr(Dataform2.Query3.FieldByName('InvTotal').AsCurrency) + ',' + FloattoStr(Am1) + ',' + FloattoStr(Am2) + ',' + FloattoStr((Am1) - (Am2)) + ',' + FloattoStr(((Am1) - (Am2)) / (Am2)));
                end
                else
                begin
                  if (Am1 <> 0) and (Am2 = 0) then
                  begin
                    Am2 := 0;
                    ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + '",' + FloattoStr(Dataform2.Query3.FieldByName('InvTotal').AsCurrency) + ',' + FloattoStr(Am1) + ',' + FloattoStr(Am2) + ',' + FloattoStr((Am1) - (Am2)) + ',100');
                  end
                  else
                  begin
                    Am2 := 0;
                    ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + '",' + FloattoStr(Dataform2.Query3.FieldByName('InvTotal').AsCurrency) + ',' + FloattoStr(Am1) + ',' + FloattoStr(Am2) + ',' + FloattoStr((Am1) - (Am2)) + ',0');
                  end;
                end;
              end;
              TotalInvoices := TotalInvoices + Dataform2.Query3.FieldByName('InvTotal').AsCurrency;
              TotalCost := TotalCost + InvCostTot;
              DataForm2.Query3.Next;
            end;
          finally
          end;
          if (TotalInvoices <> 0) or (TotalCost <> 0) then
          begin
//            VatAmount := TotalInvoices * 100 / (Dataform2.GlobalTableVat.Value + 100);
            VatAmount := MyRoundTo(TotalInvoices * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
//                showmessage(floattostr(VatAmount));
//          CostVATAmount := TotalCost * 100 / (Dataform2.GlobalTableVat.Value + 100);
            CostVATAmount := MyRoundTo(TotalCost * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
            ExtractForm.Memo1.Lines.Add('"Total for Branch No ' + InttoStr(PreviousBranchNo) + '",' + FloattoStr(TotalInvoices) + ',' + FloattoStr(VatAmount) + ',' + FloattoStr(CostVATAmount) + ',' + FloattoStr((VatAmount) - (CostVATAmount)) + ',' + FloattoStr(((VatAmount) - (CostVATAmount)) / (CostVATAmount)));
          end;
          ExtractForm.SaveDialog.FileName := 'Sales Report from ' + inttostr(datetointdate(FromDate.Date)) + ' to ' + inttostr(datetointdate(ToDate.Date));
          if ExtractForm.SaveDialog.Execute then
            ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
          ExtractForm.Memo1.clear;
          Dataform2.Query3.Close;
end;

procedure TInvoiceListsForm.SupplierStockReport(BReport:TBaseReport);
var
        LineCount:Integer;
        totalCost,totalSales,totalGross:Currency;
        PreviousCreditor:String;
begin
        with BReport do
        begin
          TotalCost := 0;
          TotalSales := 0;
          TotalGross := 0;
          LineCount := 0;
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',10);
          PreviousCreditor := '';
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          printRight(datetostr(date),6.25);
          NewLine;
          NewLine;
          printLeft('Invoice Supplier Stock Report Detail from ' + datetostr(FromDate.Date) + ' to ' + datetostr(ToDate.Date),0.5);
          Bold := False;
          ClearTabs;
          SetTab(0.5, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,2,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('Stock No');
          PrintTab('Description');
          PrintTab('InvNo');
          PrintTab('InvDate');
          PrintTab('Cost Price');
          PrintTab('Qty');
          PrintTab('Total Cost');
          PrintTab('Selling Price');
          PrintTab('Total sales');
          PrintTab('Gross Profit');
          Bold := False;
          NewLine;
          ClearTabs;
          SetTab(0.5, pjLeft,0.8,0,0,0);
          SetTab(NA, pjLeft,2,0,0,0);
          SetTab(NA, pjLeft,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);
          SetTab(NA, pjRight,1,0,0,0);

          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('select stock_db.TCStockNo,invoice_db.BranchNo,invoiceitem_db.Description, invoiceitem_db.Price, invoiceitem_db.CostPrice, invoiceitem_db.Qty, invoice_db.InvNo, invoice_db.InvDate, stock_db.CreditorLink from invoiceitem_db');
            Add('left join invoice_db on invoiceitem_db.LinkID = invoice_db.Nr and invoiceitem_db.BranchNo = invoice_db.BranchNo');
            Add('left join stock_db on invoiceitem_db.StockNo = stock_db.Nr and stock_db.BranchNo = invoiceitem_db.BranchNo');
            Add('WHERE (invoice_db.InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
            Add('(invoice_db.InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
            Add('and ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC"))');
            Add('and (invoiceitem_db.CommentSwi = "False")');
            Add('order by stock_db.CreditorLink,invoice_db.InvDate');
          end;
          DataForm2.Query3.Open;
          DataForm2.Query3.first;

          Bold := True;
          Dataform2.Query2.Close;
          with Dataform2.Query2.SQL do
          begin
            Clear;
            Add('select * from invoice_db');
            Add('where GLDebNo = "' + Dataform2.Query3.FieldByname('CreditorLink').asString + '"');
            Add('and InvClose = "PurcC"');
            Add('order by Nr Desc');
          end;
          Dataform2.Query2.Open;
          printLeft(Dataform2.Query2.FieldByName('ClientName').asString + ' (' + Dataform2.Query3.FieldByname('CreditorLink').asString + ')', 0.5);
          PreviousCreditor := Dataform2.Query3.FieldByName('CreditorLink').AsString;
          Bold := False;

          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 36 then
              begin
                LineCount := 1;
                NewPage;
              end;

              if PreviousCreditor <> Dataform2.Query3.FieldByName('CreditorLink').asString then
              begin
                NewLine;
                Bold := True;
                PrintTab('');
                PrintTab('');
                PrintTab('');
                PrintTab('');
                PrintTab('');
                PrintTab('');
                PrintTab(Floattostrf(TotalCost,ffCurrency,17,2));
                PrintTab('');
                PrintTab(Floattostrf(totalSales,ffCurrency,17,2));
                PrintTab(Floattostrf(totalGross,ffCurrency,17,2));
                TotalCost := 0;
                TotalSales := 0;
                TotalGross := 0;
                NewLine;
                Inc(LineCount);
                if LineCount > 36 then
                begin
                  LineCount := 1;
                  NewPage;
                end;
                NewLine;
                Dataform2.Query2.Close;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('select * from invoice_db');
                  Add('where GLDebNo = "' + Dataform2.Query3.FieldByname('CreditorLink').asString + '"');
                  Add('and InvClose = "PurcC"');
                  Add('order by Nr Desc');
                end;
                Dataform2.Query2.Open;
                printLeft(Dataform2.Query2.FieldByName('ClientName').asString + ' (' + Dataform2.Query3.FieldByname('CreditorLink').asString + ')', 0.5);
                Inc(LineCount);
                PreviousCreditor := Dataform2.Query3.FieldByName('CreditorLink').AsString;
                Bold := False;
                if LineCount > 36 then
                begin
                  LineCount := 1;
                  NewPage;
                end;
              end;

              NewLine;
              PrintTab(Dataform2.Query3.FieldByName('TCStockNo').asString);
              PrintTab(Dataform2.Query3.FieldByName('Description').asString);
              PrintTab(inttostr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('InvDate').asInteger));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CostPrice').asCurrency,ffCurrency,17,2));
              PrintTab(FloattoStr(Dataform2.Query3.FieldByName('Qty').asFloat));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CostPrice').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat,ffCurrency,17,2));
              TotalCost := TotalCost + (Dataform2.Query3.FieldByName('CostPrice').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat);
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('Price').asCurrency,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('Price').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat,ffCurrency,17,2));
              totalSales := totalSales + (Dataform2.Query3.FieldByName('Price').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat);
              PrintTab(Floattostrf((Dataform2.Query3.FieldByName('Price').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat) - (Dataform2.Query3.FieldByName('CostPrice').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat),ffCurrency,17,2));
              totalGross := totalGross + ((Dataform2.Query3.FieldByName('Price').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat) - (Dataform2.Query3.FieldByName('CostPrice').asCurrency * Dataform2.Query3.FieldByName('Qty').asFloat));
              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab(Floattostrf(TotalCost,ffCurrency,17,2));
          PrintTab('');
          PrintTab(Floattostrf(totalSales,ffCurrency,17,2));
          PrintTab(Floattostrf(totalGross,ffCurrency,17,2));
          Bold := False;
          NewLine;
          DataForm2.Query3.Close;
          DataForm2.Query2.Close;
        end;
end;

procedure TInvoiceListsForm.PrintInvoiceList(BReport:TBaseReport);
var
        LineCount:Integer;
       invtotalstr,Tendered: Currency;
begin
        with BReport do
        begin
          Total := 0.00;
          TotalVat := 0.00;
          TotalWithoutVat := 0.00;
          PayedTotal := 0;
          OwedTotal := 0;

          LineCount := 0;
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',9);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          printRight(datetostr(date),6.25);
          NewLine;
          NewLine;
          printLeft(ReportTitle,0.5);
          Bold := False;
          ClearTabs;
          SetTab(0.5, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,1.2,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.6,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('Inv No');
          PrintTab('Date');
          PrintTab('By');
          PrintTab('Name');
          PrintTab('Total Excl');
          PrintTab('Vat');
          PrintTab('Total Incl');
          PrintTab('Payed');
          PrintTab('Owed');
          PrintTab('Ref No');
          Bold := False;
          NewLine;
          ClearTabs;
          SetTab(0.5, pjLeft,0.6,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,1.2,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjRight,0.6,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjRight,0.7,0,0,0);
          SetTab(NA, pjRight,0.7,0,0,0);
          SetTab(NA, pjLeft,0.6,0,0,0);

          DataForm2.Query3.first;

          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 58 then
              begin
                LineCount := 1;
                NewPage;
              end;

              Dataform2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
                Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger));
                Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
              end;
              Dataform2.Query2.Open;
              invtotalstr := DataForm2.Query2.Fieldbyname('Total').asCurrency;

              if (Dataform2.Query3.FieldByName('InvClose').asString = 'LaybV')
              or (Dataform2.Query3.FieldByName('InvClose').asString = 'LaybO')
              or (Dataform2.Query3.FieldByName('InvClose').asString = 'LaybC') then
              begin
                Dataform2.Query2.Close;
                with DataForm2.Query2.SQL do begin
                  Clear;
                  Add('select sum(Ammount) as TotalPayed from trans_db');
                  Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('InvNo').asInteger));
                  Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
                  Add('and TransType = ''L''');
                end;
                Dataform2.Query2.Open;
                Tendered := DataForm2.Query2.Fieldbyname('TotalPayed').asCurrency;
              end
              else
              begin
                Tendered := Dataform2.Query3.FieldByName('AmmTendered').AsCurrency + Dataform2.Query3.FieldByName('Premium').AsCurrency;
              end;

              NewLine;
              PrintTab(inttostr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('InvDate').asInteger));
              PrintTab(Dataform2.Query3.FieldByName('InvBy').asString);
              SetFont('Arial',8);
              PrintTab(Dataform2.Query3.FieldByName('ClientName').asString);
              SetFont('Arial',9);
              PrintTab(Floattostrf((invtotalstr) - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)),ffCurrency,17,2));
              PrintTab(Floattostrf(invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value) ,ffCurrency,17,2));
              PrintTab(Floattostrf(invtotalstr,ffCurrency,17,2));
              if (Tendered < invtotalstr)
                and not (Dataform2.Query3.FieldByName('InvClose').asString = 'LaybV') then
              begin
                PrintTab(Floattostrf(Tendered,ffCurrency,17,2));
                PrintTab(Floattostrf(invtotalstr - Tendered,ffCurrency,17,2));
                PayedTotal := PayedTotal + Tendered;
                OwedTotal := OwedTotal + (invtotalstr - Tendered);
              end
              else
              begin
                PrintTab(Floattostrf(invtotalstr,ffCurrency,17,2));
                PrintTab(Floattostrf(0,ffCurrency,17,2));
                PayedTotal := PayedTotal + invtotalstr;
              end;
              SetFont('Arial',8);
              PrintTab(Dataform2.Query3.FieldByName('RefNo').asString);
              SetFont('Arial',9);

              Total := Total + invtotalstr;
              TotalVat := TotalVat + (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value));
              TotalWithoutVat := TotalWithoutVat + (invtotalstr - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)));

              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab(Floattostrf(TotalWithoutVat,ffCurrency,17,2));
          PrintTab(Floattostrf(TotalVat,ffCurrency,17,2));
          PrintTab(Floattostrf(Total,ffCurrency,17,2));
          PrintTab(Floattostrf(PayedTotal,ffCurrency,17,2));
          PrintTab(Floattostrf(OwedTotal,ffCurrency,17,2));
          PrintTab('');
          Bold := False;
          NewLine;
          DataForm2.Query3.Close;
          DataForm2.Query2.Close;
        end;
end;

procedure TInvoiceListsForm.PrintPurchaseInvoiceList(BReport:TBaseReport);
var
        LineCount:Integer;
       invtotalstr,Tendered: Currency;
begin
        with BReport do
        begin
          Total := 0;
          TotalVat := 0;
          TotalWithoutVat := 0;

          LineCount := 0;
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',9);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          printRight(datetostr(date),6.25);
          NewLine;
          NewLine;
          printLeft(ReportTitle,0.5);
          Bold := False;
          ClearTabs;
          SetTab(0.5, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,1.2,0,0,0);
          SetTab(NA, pjCenter,0.9,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.9,0,0,0);
          SetTab(NA, pjCenter,0.6,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('Inv No');
          PrintTab('Date');
          PrintTab('By');
          PrintTab('Name');
          PrintTab('Total Excl');
          PrintTab('Vat');
          PrintTab('Total Incl');
          PrintTab('Ref No');
          Bold := False;
          NewLine;
          ClearTabs;
          SetTab(0.5, pjLeft,0.6,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,1.2,0,0,0);
          SetTab(NA, pjRight,0.9,0,0,0);
          SetTab(NA, pjRight,0.7,0,0,0);
          SetTab(NA, pjRight,0.9,0,0,0);
          SetTab(NA, pjLeft,0.6,0,0,0);

          DataForm2.Query3.first;

          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 58 then
              begin
                LineCount := 1;
                NewPage;
              end;

              Dataform2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('SELECT SUM(Round(CostPrice * Qty,2) - (Round(CostPrice * Qty,2) * (ifnull(Discount,0) / 100))) as Total FROM invoiceitem_db');
                Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger));
                Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
              end;
              Dataform2.Query2.Open;
              invtotalstr := DataForm2.Query2.Fieldbyname('Total').asCurrency;

              NewLine;
              PrintTab(inttostr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('InvDate').asInteger));
              PrintTab(Dataform2.Query3.FieldByName('InvBy').asString);
              SetFont('Arial',8);
              PrintTab(Dataform2.Query3.FieldByName('ClientName').asString);
              SetFont('Arial',9);
              PrintTab(Floattostrf(invtotalstr,ffCurrency,17,2));
              PrintTab(Floattostrf(MyRoundTo(invtotalstr * Dataform2.GlobalTableVat.Value / 100, -2) ,ffCurrency,17,2));
              PrintTab(Floattostrf(invtotalstr + (MyRoundTo(invtotalstr * Dataform2.GlobalTableVat.Value / 100, -2)),ffCurrency,17,2));

              SetFont('Arial',8);
              PrintTab(Dataform2.Query3.FieldByName('RefNo').asString);
              SetFont('Arial',9);

              Total := Total + invtotalstr;
              TotalVat := TotalVat + (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value));
              TotalWithoutVat := TotalWithoutVat + (invtotalstr - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)));

              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab(Floattostrf(TotalWithoutVat,ffCurrency,17,2));
          PrintTab(Floattostrf(TotalVat,ffCurrency,17,2));
          PrintTab(Floattostrf(Total,ffCurrency,17,2));
          PrintTab('');
          Bold := False;
          NewLine;
          DataForm2.Query3.Close;
          DataForm2.Query2.Close;
        end;
end;

procedure TInvoiceListsForm.PrintLayBuyPaymentsList(BReport:TBaseReport);
var
        LineCount:Integer;
       invtotalstr, totalpayed: Currency;
begin
        with BReport do
        begin
          Total := 0;
          TotalVat := 0;
          TotalWithoutVat := 0;
          PayedTotal := 0;
          OwedTotal := 0;

          LineCount := 0;
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',9);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          printRight(datetostr(date),6.25);
          NewLine;
          NewLine;
          printLeft(ReportTitle,0.5);
          Bold := False;
          ClearTabs;
          SetTab(0.5, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,1.2,0,0,0);
          SetTab(NA, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.6,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);

          NewLine;
          NewLine;
          Bold := True;
          PrintTab('Inv No');
          PrintTab('Date');
          PrintTab('By');
          PrintTab('Name');
          PrintTab('Payed');
          PrintTab('Total Excl');
          PrintTab('Vat');
          PrintTab('Total Incl');
          PrintTab('Owed');
          PrintTab('Description');
          Bold := False;
          NewLine;
          ClearTabs;
          SetTab(0.5, pjLeft,0.6,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);
          SetTab(NA, pjLeft,1.2,0,0,0);
          SetTab(NA, pjRight,0.6,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjRight,0.6,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjLeft,0.7,0,0,0);

          DataForm2.Query3.first;

          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 58 then
              begin
                LineCount := 1;
                NewPage;
              end;

              Dataform2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
                Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger));
                Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
              end;
              Dataform2.Query2.Open;
              invtotalstr := DataForm2.Query2.Fieldbyname('Total').asCurrency;

              Dataform2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('select sum(Ammount) as TotalPayed from trans_db');
                Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('InvNo').asInteger));
                Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
                Add('and TransType = ''L''');
              end;
              Dataform2.Query2.Open;
              totalpayed := DataForm2.Query2.Fieldbyname('TotalPayed').asCurrency;

              NewLine;
              PrintTab(inttostr(Dataform2.Query3.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('Date').asInteger));
              PrintTab(Dataform2.Query3.FieldByName('PaymentBy').asString);
              SetFont('Arial',8);
              PrintTab(Dataform2.Query3.FieldByName('ClientName').asString);
              SetFont('Arial',9);
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('Ammount').AsCurrency,ffCurrency,17,2));
              PrintTab(Floattostrf((invtotalstr) - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)),ffCurrency,17,2));
              PrintTab(Floattostrf(invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value) ,ffCurrency,17,2));
              PrintTab(Floattostrf(invtotalstr,ffCurrency,17,2));
              if Dataform2.Query3.FieldByName('InvClose').asString = 'LaybV' then
              begin
                PrintTab(Floattostrf(0,ffCurrency,17,2));
                SetFont('Arial',8);
                PrintTab('Cancelled');
                SetFont('Arial',9);
              end
              else
              begin
                PrintTab(Floattostrf(invtotalstr - totalpayed,ffCurrency,17,2));
                SetFont('Arial',8);
                PrintTab(Dataform2.Query3.FieldByName('Description').asString);
                SetFont('Arial',9);
                OwedTotal := OwedTotal + (invtotalstr - totalpayed);
              end;

              PayedTotal := PayedTotal + Dataform2.Query3.FieldByName('Ammount').AsCurrency;
              Total := Total + invtotalstr;
              TotalVat := TotalVat + (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value));
              TotalWithoutVat := TotalWithoutVat + (invtotalstr - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)));

              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab(Floattostrf(PayedTotal,ffCurrency,17,2));
          PrintTab(Floattostrf(TotalWithoutVat,ffCurrency,17,2));
          PrintTab(Floattostrf(TotalVat,ffCurrency,17,2));
          PrintTab(Floattostrf(Total,ffCurrency,17,2));
          PrintTab(Floattostrf(OwedTotal,ffCurrency,17,2));
          PrintTab('');
          Bold := False;
          NewLine;
          DataForm2.Query3.Close;
          DataForm2.Query2.Close;
        end;
end;

end.
