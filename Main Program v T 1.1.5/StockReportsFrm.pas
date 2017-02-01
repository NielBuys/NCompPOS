unit StockReportsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpBase, RpSystem, ComCtrls,
  JvExComCtrls, JvDateTimePicker, JvExStdCtrls, JvCheckBox, JvExControls,
  JvDBLookup, JvExButtons, JvBitBtn, DateUtils, UtilsUnit;

type
  TStockReportsForm = class(TForm)
    PrintStockListBtn: TJvBitBtn;
    PrintOutofStockListBtn: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    RvSystem1: TRvSystem;
    PrintAvgReportBtn: TJvBitBtn;
    PrintStockAdjustmentsBtn: TJvBitBtn;
    procedure PrintStockListBtnClick(Sender: TObject);
    procedure PrintOutofStockListBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RvSystem1Print(Sender: TObject);
    procedure PrintAvgReportBtnClick(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
  private
    procedure PrintAverageSalesReport(report: TBaseReport);
    procedure PrintStockList(report: TBaseReport);
    procedure PrintStockAdjustmentList(report: TBaseReport);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StockReportsForm: TStockReportsForm;
  FromWhere: String;

implementation

uses DataFrm2, UserFrm, StockFrm, ReportFilterFrm;

{$R *.dfm}

procedure TStockReportsForm.PrintStockListBtnClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
        FromWhere := 'StockList';
        RvSystem1.Execute;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TStockReportsForm.PrintOutofStockListBtnClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
        FromWhere := 'OutOfStockList';
        RvSystem1.Execute;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TStockReportsForm.JvBitBtn3Click(Sender: TObject);
begin
            Close;
end;

procedure TStockReportsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Dataform2.BranchTable.Close;
      StockReportsform.FreeOnRelease;
end;

procedure TStockReportsForm.RvSystem1Print(Sender: TObject);
begin
    if (FromWhere = 'StockList') or (FromWhere = 'OutOfStockList') then
      PrintStockList(RvSystem1.BaseReport);
    if FromWhere = 'AvgReport' then
      PrintAverageSalesReport(RvSystem1.BaseReport);
    if FromWhere = 'AdjReport' then
      PrintStockAdjustmentList(RvSystem1.BaseReport);
end;

procedure TStockReportsForm.PrintAverageSalesReport(report: TBaseReport);
var
  SCount,PageCount: Integer;
  MonthsBetweenValue: Integer;
  s: String;
begin
//      If MonthsBetweenValue > 0 then
//      begin
        SCount := 0;
        with report do
        begin
          Application.CreateForm(TReportFilterForm, ReportFilterForm);
          ReportFilterForm.PopulateStockFilter1();
          ReportFilterForm.DateRangeBox.Visible := True;
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            ReportFilterForm.PopulateBranchFilter2();
          ReportFilterForm.showmodal;
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            s := 'and stock_db.BranchNo in (' + ReportFilterForm.CreateBranchList2() +')'
          else
            s := '';
          MonthsBetweenValue := MonthsBetween(ReportFilterForm.FromDate.Date, ReportFilterForm.ToDate.Date);
          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
                Clear;
                Add('select Nr, stock_db.BranchNo, Description, Qty, stock_db.TCStockNo, CostPrice, ifnull(QtySold,0) as QtySold');
                Add('from stock_db');
                Add('left join (');
                Add('SELECT invoiceitem_db.BranchNo,invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as QtySold');
                Add('from invoiceitem_db');
                Add('left join invoice_db on invoice_db.Nr = invoiceitem_db.LinkID and invoice_db.BranchNo = invoiceitem_db.BranchNo');
                Add('where ((invoice_db.InvClose = ''Close'') or (invoice_db.InvClose = ''LaybC''))');
                Add('and ((invoice_db.InvDate >= ' + InttoStr(DatetoIntDate(ReportFilterForm.FromDate.Date)) + ') and (invoice_db.InvDate <= ' + InttoStr(DatetoIntDate(ReportFilterForm.ToDate.Date)) + '))');
                Add('group by invoiceitem_db.TCStockNo, invoiceitem_db.BranchNo');
                Add(') as qtySold on qtySold.TCStockNo = stock_db.TCStockNo and qtySold.BranchNo = stock_db.BranchNo');
                Add('where stock_db.TCStockNo in (' + ReportFilterForm.CreateStockList1() + ')');
                Add(s);
                Add('and QtySold > 0');
                Add('Order by TCStockNo');
          end;
          DataForm2.Query3.Open;
          MarginLeft := 0.250;
          MarginTop := 0.250;
          SetFont('Arial',9);
          Bold := true;
          PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.250);
          NewLine;
          NewLine;
          PrintLeft('Print average units sold per month for Period From: ' + Datetostr(ReportFilterForm.FromDate.Date) + ' To: ' + Datetostr(ReportFilterForm.FromDate.Date) + ': Printed on ' + DatetoStr(now), 0.250);
          PageCount := 1;
          PrintRight('Page: ' + InttoStr(PageCount), 7);
          NewLine;
          NewLine;

          ClearTabs;
          SetTab(0.3, pjLeft,1,0,0,0);
          SetTab(NA, pjLeft,2.4,0,0,0);
          SetTab(NA, pjRight,1.5,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          SetTab(NA, pjRight,0.8,0,0,0);
          PrintTab('Stock No');
          PrintTab('Description');
          PrintTab('Avg units sold');
          PrintTab('Units');
          PrintTab('Cost / Unit');
          Bold := False;
          NewLine;

          Dataform2.Query3.DisableControls;
          Dataform2.Query3.First;
          while not Dataform2.Query3.EOF do
          begin
            NewLine;
            PrintTab(InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + ' / ' + Dataform2.Query3.Fieldbyname('TCStockNo').asString);
            PrintTab(Dataform2.Query3.Fieldbyname('Description').asString);
            If MonthsBetweenValue > 0 then
              PrintTab(Floattostrf(Dataform2.Query3.Fieldbyname('QtySold').asFloat / MonthsBetweenValue,ffFixed,17,2))
            else
              PrintTab(Floattostrf(Dataform2.Query3.Fieldbyname('QtySold').asFloat,ffFixed,17,2));
            PrintTab(FloattoStr(Dataform2.Query3.Fieldbyname('Qty').asFloat));
            PrintTab(Floattostrf(Dataform2.Query3.Fieldbyname('CostPrice').asFloat,ffFixed,17,2));
            Inc(SCount);
            If (SCount = 62) then
            begin
              NewPage;
              Bold := True;
              PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.250);
              NewLine;
              NewLine;
              PrintLeft('Print average units sold per month for Period From: ' + Datetostr(ReportFilterForm.FromDate.Date) + ' To: ' + Datetostr(ReportFilterForm.FromDate.Date) + ': Printed on ' + DatetoStr(now), 0.250);
              Inc(PageCount);
              PrintRight('Page: ' + InttoStr(PageCount), 7);
              NewLine;
              NewLine;
              PrintTab('Stock No');
              PrintTab('Description');
              PrintTab('Avg units sold');
              PrintTab('Units');
              PrintTab('Cost / Unit');
              Bold := False;

              SCount := 0;
            end;
            Dataform2.Query3.Next;
          end;
          Dataform2.Query3.EnableControls;
          ReportFilterForm.Free;
        end;
//      end
//      else
//        showmessage('Dates must span more than one Month!');
end;

procedure TStockReportsForm.PrintAvgReportBtnClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
        FromWhere := 'AdjReport';
        RvSystem1.Execute;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TStockReportsForm.PrintStockList(report: TBaseReport);
var
          s:String;
          SCount,PageCount:Integer;
          TotalQty,TotalCost,Cost: Currency;
begin
         Application.CreateForm(TReportFilterForm, ReportFilterForm);
         ReportFilterForm.PopulateStockFilter1();
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            ReportFilterForm.PopulateBranchFilter2();
          ReportFilterForm.showmodal;
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            s := 'and BranchNo in (' + ReportFilterForm.CreateBranchList2() +')'
          else
            s := '';
          Dataform2.Query3.Close;
          if FromWhere = 'StockList' then
          begin
            with Dataform2.Query3.SQL do
            begin
              Clear;
              Add('select TCStockNo, BranchNo, Description, Barcode, Qty, CostPrice from stock_db');
              Add('where TCStockNo in (' + ReportFilterForm.CreateStockList1() + ')');
              Add(s);
              Add('and Qty <> 0');
              Add('and NonStockItem = ''False''');
              Add('order by TCStockNo');
            end;
          end;
          if FromWhere = 'OutOfStockList' then
          begin
            with Dataform2.Query3.SQL do
            begin
              Clear;
              Add('select TCStockNo, BranchNo, Description, Barcode, Qty, CostPrice from stock_db');
              Add('where TCStockNo in (' + ReportFilterForm.CreateStockList1() + ')');
              Add(s);
              Add('and NonStockItem = ''False''');
              Add('and Qty <= AlertQty');
              Add('order by TCStockNo');
            end;
          end;

          Dataform2.Query3.Open;
          ReportFilterForm.Free;
          SCount := 0;
          with report do
          begin
            MarginLeft := 0.250;
            MarginTop := 0.250;
            SetFont('Arial',9);
            Bold := true;
            PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.3);
            NewLine;
            NewLine;
            PageCount := 1;
            if FromWhere = 'StockList' then
              PrintLeft('Stock List: Printed on ' + DatetoStr(now), 0.3);
            if FromWhere = 'OutOfStockList' then
              PrintLeft('Out of Stock List: Printed on ' + DatetoStr(now), 0.3);
            PrintRight('Page: ' + InttoStr(PageCount), 7);
            NewLine;
            NewLine;

            ClearTabs;
            SetTab(0.3, pjLeft,1,0,0,0);
            SetTab(NA, pjLeft,2.4,0,0,0);
            SetTab(NA, pjLeft,1.1,0,0,0);
            SetTab(NA, pjRight,1,0,0,0);
            SetTab(NA, pjRight,1,0,0,0);
            SetTab(NA, pjRight,1,0,0,0);
            PrintTab('Stock No');
            PrintTab('Description');
            PrintTab('Barcode');
            PrintTab('Units');
            PrintTab('Cost / Unit');
            PrintTab('Total Cost');
            NewLine;
            Bold := False;

            Dataform2.Query3.DisableControls;
            PageCount := 1;
            TotalCost := 0;
            Dataform2.Query3.First;
            while not Dataform2.Query3.EOF do
            begin
              NewLine;
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + ' / ' + Dataform2.Query3.Fieldbyname('TCStockNo').asString);
              PrintTab(Dataform2.Query3.Fieldbyname('Description').asString);
              PrintTab(Dataform2.Query3.Fieldbyname('Barcode').asString);
              TotalQty := TotalQty + Dataform2.Query3.Fieldbyname('Qty').asFloat;
              PrintTab(FloattoStr(Dataform2.Query3.Fieldbyname('Qty').asFloat));
              PrintTab(Floattostrf(Dataform2.Query3.Fieldbyname('CostPrice').asFloat,ffFixed,17,2));
              Cost := Dataform2.Query3.Fieldbyname('Qty').asFloat * Dataform2.Query3.Fieldbyname('CostPrice').asFloat;
              TotalCost := TotalCost + Cost;
              PrintTab(Floattostrf(Cost,ffFixed,17,2));
              Inc(SCount);
              If (SCount = 62) then
              begin
                NewPage;
                Bold := True;
                PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.250);
                NewLine;
                NewLine;
                if FromWhere = 'StockList' then
                  PrintLeft('Stock List: Printed on ' + DatetoStr(now), 0.3);
                if FromWhere = 'OutOfStockList' then
                  PrintLeft('Out of Stock List: Printed on ' + DatetoStr(now), 0.3);
                Inc(PageCount);
                PrintRight('Page: ' + InttoStr(PageCount), 7);
                NewLine;
                NewLine;
                PrintTab('Stock No');
                PrintTab('Description');
                PrintTab('Barcode');
                PrintTab('Units');
                PrintTab('Cost / Unit');
                PrintTab('Total Cost');
                NewLine;
                Bold := False;
                SCount := 0;
              end;
              Dataform2.Query3.Next;
            end;
            NewLine;
            NewLine;
            Bold := True;
            PrintTab('');
            PrintTab('Totals');
            PrintTab('');
            PrintTab(FloattoStr(TotalQty));
            PrintTab('');
            PrintTab(Floattostrf(TotalCost,ffFixed,17,2));
            Bold := False;

            Dataform2.Query3.EnableControls;
            Dataform2.Query3.Close;
          end;
end;

procedure TStockReportsForm.PrintStockAdjustmentList(report: TBaseReport);
var
          s:String;
          SCount,PageCount:Integer;
          TotalQty,TotalCost,Cost: Currency;
begin
         Application.CreateForm(TReportFilterForm, ReportFilterForm);
         ReportFilterForm.PopulateStockFilter1();
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            ReportFilterForm.PopulateBranchFilter2();
          ReportFilterForm.DateRangeBox.Visible := True;
          ReportFilterForm.showmodal;
          if Dataform2.GlobalTableBranchNo.Value = 0 then
            s := 'and stock_db.BranchNo in (' + ReportFilterForm.CreateBranchList2() +')'
          else
            s := '';
          Dataform2.Query3.Close;
          with Dataform2.Query3.SQL do
          begin
            Clear;
            Add('select stock_db.TCStockNo, stock_db.BranchNo, stock_db.Description, st_adj_value, st_adj_date, st_adj_by from stockadjust_db');
            Add('inner join stock_db on stock_db.TCStockNo = stockadjust_db.TCStockNoLink and stock_db.BranchNo = stockadjust_db.BranchNo');
            Add('where st_adj_type = ''Adj''');
            Add('and stock_db.TCStockNo in (' + ReportFilterForm.CreateStockList1() + ')');
            Add(s);
            Add('and ((st_adj_date >= ' + InttoStr(DatetoIntDate(ReportFilterForm.FromDate.Date)) + ') and (st_adj_date <= ' + InttoStr(DatetoIntDate(ReportFilterForm.ToDate.Date)) + '))');
            Add('order by st_adj_date');
          end;

          Dataform2.Query3.Open;
          SCount := 0;
          with report do
          begin
            MarginLeft := 0.8;
            MarginTop := 0.250;
            SetFont('Arial',9);
            Bold := true;
            PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.8);
            NewLine;
            NewLine;
            PageCount := 1;
            PrintLeft('Stock Adjustments for Period From: ' + Datetostr(ReportFilterForm.FromDate.Date) + ' To: ' + Datetostr(ReportFilterForm.FromDate.Date) + ': Printed on ' + DatetoStr(now), 0.8);
            PrintRight('Page: ' + InttoStr(PageCount), 7);
            NewLine;
            NewLine;

            ClearTabs;
            SetTab(0.8, pjLeft,1,0,0,0);
            SetTab(NA, pjLeft,2.4,0,0,0);
            SetTab(NA, pjRight,1,0,0,0);
            SetTab(NA, pjRight,1,0,0,0);
            SetTab(NA, pjRight,1.5,0,0,0);
            PrintTab('Stock No');
            PrintTab('Description');
            PrintTab('Date');
            PrintTab('Value');
            PrintTab('Adjusted By');
            NewLine;
            Bold := False;

            Dataform2.Query3.DisableControls;
            PageCount := 1;
            TotalCost := 0;
            Dataform2.Query3.First;
            while not Dataform2.Query3.EOF do
            begin
              NewLine;
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('BranchNo').asInteger) + ' / ' + Dataform2.Query3.Fieldbyname('TCStockNo').asString);
              PrintTab(Dataform2.Query3.Fieldbyname('Description').asString);
              PrintTab(IntDatetoString(Dataform2.Query3.Fieldbyname('st_adj_date').asInteger));
              PrintTab(FloattoStr(Dataform2.Query3.Fieldbyname('st_adj_value').asFloat));
              PrintTab(Dataform2.Query3.Fieldbyname('st_adj_by').asString);
              Inc(SCount);
              If (SCount = 62) then
              begin
                NewPage;
                Bold := True;
                PrintLeft(Dataform2.GlobalTableReportTitle.Value, 0.8);
                NewLine;
                NewLine;
                Inc(PageCount);
                PrintLeft('Stock Adjustments for Period From: ' + Datetostr(ReportFilterForm.FromDate.Date) + ' To: ' + Datetostr(ReportFilterForm.FromDate.Date) + ': Printed on ' + DatetoStr(now), 0.8);
                PrintRight('Page: ' + InttoStr(PageCount), 7);
                NewLine;
                NewLine;
                PrintTab('Stock No');
                PrintTab('Description');
                PrintTab('Date');
                PrintTab('Value');
                PrintTab('Adjusted By');
                NewLine;
                Bold := False;
                SCount := 0;
              end;
              Dataform2.Query3.Next;
            end;
            NewLine;
            NewLine;

            Dataform2.Query3.EnableControls;
            ReportFilterForm.Free;
            Dataform2.Query3.Close;
          end;
end;


end.



