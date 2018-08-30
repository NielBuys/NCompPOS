unit InvoiceListsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, RpDefine, RpBase, RpSystem, QuickRpt, ExtCtrls, StdCtrls,
  Buttons, JvExButtons, JvBitBtn, ComCtrls, JvExComCtrls, JvDateTimePicker,
  DBCtrls, UtilsUnit, DateUtils, db;

type
  TInvoiceListsForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateListEdit: TJvDateTimePicker;
    PrintDailyListBtn: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Fromdate: TJvDateTimePicker;
    ToDate: TJvDateTimePicker;
    Button2: TButton;
    DailyList: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    BitBtn1: TBitBtn;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    QRDBText3: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    JvBitBtn4: TJvBitBtn;
    Report: TRvSystem;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    CheckBox1: TCheckBox;
    JvBitBtn7: TJvBitBtn;
    procedure PrintDailyListBtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DailyListBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
  private
    procedure PrintTaxHeader(BReport: TBaseReport);
    procedure PrintTaxReport(BReport: TBaseReport);
    procedure PrintSalesReport();
    procedure SupplierStockReport(BReport: TBaseReport);
    { Private declarations }
  public
    { Public declarations }
    Total, TotalVat, TotalWithoutVat,PayedTotal,OwedTotal: Currency;
    s, printfromwhere: String;
  end;

var
  InvoiceListsForm: TInvoiceListsForm;
  Fromwhere: string;
  PageInt:Integer;

implementation
      uses DataFrm2, GridExportFrm, ExtractFrm, StockFrm;

{$R *.dfm}

procedure TInvoiceListsForm.BitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TInvoiceListsForm.PrintDailyListBtnClick(Sender: TObject);
begin
      DataForm2.Query3.Close;
      s := 'WHERE (InvBy = "' + DataForm2.user_db.fieldbyname('UserName').asString + '") and';
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM invoice_db');
        Add(s);
        Add('(InvDate = ' + InttoStr(DatetoIntDate(DateListEdit.Date)) + ')');
        Add('and (InvClose = "Close" or InvClose = "LaybC")');
        Add('Order by InvNo');
      end;
      DataForm2.Query3.Open;
      Fromwhere := 'Inv';
      QRLabel1.Caption := 'Daily Invoices for: ' + DataForm2.user_db.fieldbyname('UserName').asString + ' and for Date: ' + DatetoStr(DateListEdit.Date);
      DailyList.Preview;
end;

procedure TInvoiceListsForm.Button2Click(Sender: TObject);
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
      QRLabel1.Caption := 'Monthly Invoices from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      DailyList.Preview;
end;

procedure TInvoiceListsForm.DailyListBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
       Total := 0.00;
       TotalVat := 0.00;
       TotalWithoutVat := 0.00;
       PayedTotal := 0;
       OwedTotal := 0;
       If (Fromwhere = 'PInv') then
       begin
         QRLabel17.Caption := '';
         QRLabel18.Caption := '';
         QRLabel19.Caption := '';
         QRLabel20.Caption := '';
       end
       else
       begin
         QRLabel17.Caption := 'Payed';
         QRLabel19.Caption := 'Owed';
       end;
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

procedure TInvoiceListsForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   invtotalstr,Tendered: Currency;
begin
       If (Fromwhere <> 'PInv') then
       begin
         QRLabel18.Caption := '';
         QRLabel20.Caption := '';
         Dataform2.Query2.Close;
         with DataForm2.Query2.SQL do begin
           Clear;
           Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
           Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger));
           Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
         end;
         Dataform2.Query2.Open;
         invtotalstr := DataForm2.Query2.Fieldbyname('Total').asCurrency;
         Tendered := Dataform2.Query3.FieldByName('AmmTendered').AsCurrency + Dataform2.Query3.FieldByName('Premium').AsCurrency;
         if Tendered < invtotalstr then
         begin
           QRLabel10.Caption := Floattostrf((invtotalstr) - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)),ffCurrency,17,2);
           QRLabel12.Caption := Floattostrf(invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value) ,ffCurrency,17,2);
           QRLabel3.Caption := Floattostrf(invtotalstr,ffCurrency,17,2);
           QRLabel18.Caption := Floattostrf(Tendered,ffCurrency,17,2);
           PayedTotal := PayedTotal + Tendered;
           QRLabel20.Caption := Floattostrf(invtotalstr - Tendered,ffCurrency,17,2);
           OwedTotal := OwedTotal + (invtotalstr - Tendered);
         end
         else
         begin
           QRLabel10.Caption := Floattostrf(invtotalstr - (DataForm2.Query2.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)),ffCurrency,17,2);
           QRLabel12.Caption := Floattostrf(invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value) ,ffCurrency,17,2);
           QRLabel3.Caption := Floattostrf(invtotalstr,ffCurrency,17,2);
           QRLabel18.Caption := Floattostrf(invtotalstr,ffCurrency,17,2);
           PayedTotal := PayedTotal + invtotalstr;
           QRLabel20.Caption := Floattostrf(0,ffCurrency,17,2);
         end;
         Total := Total + invtotalstr;
         TotalVat := TotalVat + (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value));
         TotalWithoutVat := TotalWithoutVat + (invtotalstr - (invtotalstr * Dataform2.GlobalTableVat.Value / (100 + Dataform2.GlobalTableVat.Value)));
       end
       else
       begin
         Dataform2.Query2.Close;
         with DataForm2.Query2.SQL do begin
           Clear;
           Add('SELECT SUM(Round(CostPrice * Qty,2) - (Round(CostPrice * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
           Add('where LinkId = ' + inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger));
           Add('and BranchNo = ' + inttostr(Dataform2.Query3.Fieldbyname('BranchNo').asInteger));
         end;
         Dataform2.Query2.Open;
         QRLabel10.Caption := Floattostrf(DataForm2.Query2.Fieldbyname('Total').asCurrency,ffCurrency,17,2);
         QRLabel12.Caption := Floattostrf(MyRoundTo(DataForm2.Query2.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / 100, -2) ,ffCurrency,17,2);
         QRLabel3.Caption := Floattostrf(DataForm2.Query2.Fieldbyname('Total').asFloat + (MyRoundTo(DataForm2.Query2.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / 100, -2)),ffCurrency,17,2);
         Total := Total + (DataForm2.Query2.Fieldbyname('Total').asCurrency + (DataForm2.Query2.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / 100));
         TotalVat := TotalVat + (DataForm2.Query2.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / 100);
         TotalWithoutVat := TotalWithoutVat + DataForm2.Query2.Fieldbyname('Total').asCurrency;
       end;
       QRLabel11.Caption := IntDatetoString(DataForm2.Query3.Fieldbyname('InvDate').asInteger);
       If FromWhere = 'Layb' then
       begin
         DataForm2.Query2.Close;
         with DataForm2.Query2.SQL do begin
           Clear;
           Add('SELECT Sum(Ammount) as Total FROM trans_db');
           Add('where LinkID = ' + InttoStr(Dataform2.Query3.FieldByName('InvNo').asInteger));
           Add('and BranchNo = ' + InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger));
           Add('and TransType = ''L''');
         end;
         Dataform2.Query2.Open;
         QRLabel18.Caption := Floattostrf(DataForm2.Query2.Fieldbyname('Total').asCurrency,ffCurrency,17,2);
         QrLabel20.Caption := Floattostrf(invtotalstr - DataForm2.Query2.Fieldbyname('Total').asCurrency,ffCurrency,17,2);
       end;
end;

procedure TInvoiceListsForm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
       QRLabel15.Caption := Floattostrf(TotalWithoutVat,ffCurrency,17,2);
       QRLabel4.Caption := Floattostrf(TotalVat,ffCurrency,17,2);
       QRLabel13.Caption := Floattostrf(Total,ffCurrency,17,2);
       QRLabel23.Caption := Floattostrf(PayedTotal,ffCurrency,17,2);
       QrLabel24.Caption := Floattostrf(OwedTotal,ffCurrency,17,2);
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
      QRLabel1.Caption := 'Monthly Open Lay Buys from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      DailyList.Preview;
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
      QRLabel1.Caption := 'Monthly Closed Lay Buys from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      DailyList.Preview;
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
      QRLabel1.Caption := 'Monthly Purchase Invoices from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      DailyList.Preview;
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


end.
