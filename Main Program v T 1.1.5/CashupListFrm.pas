unit CashupListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, QRCtrls, QuickRpt, ExtCtrls, Buttons,
  JvExButtons, JvBitBtn, JvExComCtrls, JvDateTimePicker, DBCtrls, UtilsUnit, db,
  RpDefine, RpBase, RpSystem;

type
  TCashupListForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateListEdit: TJvDateTimePicker;
    BtnPrintDailyList: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Fromdate: TJvDateTimePicker;
    ToDate: TJvDateTimePicker;
    BtnPrintMonthlyList: TButton;
    DailyList: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    RealChequesTotal: TQRLabel;
    QRLabel14: TQRLabel;
    RealCreditCardTotal: TQRLabel;
    RealCashTotal: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    CountCashTotal: TQRLabel;
    CountCreditCardTotal: TQRLabel;
    CountChequesTotal: TQRLabel;
    CashDiff: TQRLabel;
    CreditCardDiff: TQRLabel;
    ChequesDiff: TQRLabel;
    BitBtn1: TBitBtn;
    Button3: TButton;
    QRLabel4: TQRLabel;
    QRDBText13: TQRDBText;
    RealOtherTotal: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    CountOtherTotal: TQRLabel;
    QRLabel19: TQRLabel;
    OtherDiff: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText16: TQRDBText;
    JvBitBtn1: TJvBitBtn;
    CashDiffShow: TQRLabel;
    CreditCardDiffShow: TQRLabel;
    ChequesDiffShow: TQRLabel;
    OtherDiffShow: TQRLabel;
    JvBitBtn2: TJvBitBtn;
    Report: TRvSystem;
    BtnDetailedCashupList: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPrintDailyListClick(Sender: TObject);
    procedure BtnPrintMonthlyListClick(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DailyListBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure ReportPrint(Sender: TObject);
    procedure ReportBeforePrint(Sender: TObject);
    procedure BtnDetailedCashupListClick(Sender: TObject);
  private
    procedure PrintCashupListHeader(BReport: TBaseReport);
    procedure PrintCashupList(BReport: TBaseReport);
    procedure PrintDetailedCashupList(BReport: TBaseReport);
    procedure PrintDetailedCashupListHeader(BReport: TBaseReport);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashupListForm: TCashupListForm;
  RealCashTot, RealCreditCardTot, RealChequesTot, RealOtherTot, CountCashTot, CountCreditCardTot, CountChequesTot, CountOtherTot, CashDiffTot, CreditCardDiffTot, ChequesDiffTot, OtherDiffTot: Currency;
  StrReportTitle, PrintFromWhere: String;
  PageInt: Integer;

implementation
      uses Datafrm2, ExtractFrm, GridExportFrm;

{$R *.dfm}

procedure TCashupListForm.FormShow(Sender: TObject);
begin
        DateListEdit.Date := date;
        Fromdate.Date := date;
        ToDate.Date := date;
end;

procedure TCashupListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      DataForm2.CashUpTable.Filtered := False;
      DataForm2.User_db.Locate('UserName', DataForm2.UserNameStr, [loPartialKey, loCaseInsensitive]);
end;

procedure TCashupListForm.BitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TCashupListForm.BtnDetailedCashupListClick(Sender: TObject);
begin
      StrReportTitle := 'Monthly Detailed Cash up from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'DetailedMonthlyCashup';
      Report.Execute;

end;

procedure TCashupListForm.BtnPrintDailyListClick(Sender: TObject);
begin
{      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM cashup_db');
        Add('WHERE (User = "' + DataForm2.user_db.fieldbyname('UserName').asString + '") and');
        Add('(Date = ' + InttoStr(DatetoIntDate(DateListEdit.Date)) + ')');
        Add('and not TimeStamp is null');
      end;
      DataForm2.Query3.Open;
//      DataForm2.CashUpTable.Filtered := False;
//      DataForm2.CashUpTable.Filter := 'User = ''' + DataForm2.user_db.fieldbyname('UserName').asString + ''' and Date = ' + InttoStr(DatetoIntDate(DateListEdit.Date));
//      DataForm2.CashUpTable.Filtered := True;
//      Dataform2.CashUpTable.Open;
      QRLabel1.Caption := 'Daily Cash up for: ' + DataForm2.user_db.fieldbyname('UserName').asString + ' and for Date: ' + DatetoStr(DateListEdit.Date);
      DailyList.Preview;
      Dataform2.Query3.Close;   }
      StrReportTitle := 'Daily Cash up for: ' + DataForm2.user_db.fieldbyname('UserName').asString + ' and for Date: ' + DatetoStr(DateListEdit.Date);
      PrintFromWhere := 'DailyCashup';
      Report.Execute;
end;

procedure TCashupListForm.BtnPrintMonthlyListClick(Sender: TObject);
begin
//      DataForm2.Query3.Close;
//      with DataForm2.Query3.SQL do begin
//        Clear;
//        Add('SELECT * FROM cashup_db');
//        Add('WHERE (Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
//        Add('(Date <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
//        Add('and not TimeStamp is null');
//      end;
//      DataForm2.Query3.Open;
//      QRLabel1.Caption := 'Monthly Cash up from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
//      DailyList.Preview;
//      Dataform2.Query3.Close;

      StrReportTitle := 'Monthly Cash up from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      PrintFromWhere := 'MonthlyCashup';
      Report.Execute;

end;

procedure TCashupListForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
      Diff1, Diff2, Diff3, Diff4: Currency;
begin
      RealCashTot := RealCashTot + DataForm2.Query3.Fieldbyname('RealCashTotal').AsCurrency;
      RealCreditCardTot := RealCreditCardTot + DataForm2.Query3.Fieldbyname('RealCreditCardTotal').AsCurrency;
      RealChequesTot := RealChequesTot + DataForm2.Query3.Fieldbyname('RealChequesTotal').AsCurrency;
      RealOtherTot := RealOtherTot + DataForm2.Query3.Fieldbyname('RealOtherTotal').AsCurrency;
      CountCashTot := CountCashTot + DataForm2.Query3.Fieldbyname('CountCashTotal').AsCurrency;
      CountCreditCardTot := CountCreditCardTot + DataForm2.Query3.Fieldbyname('CountCreditCardTotal').AsCurrency;
      CountChequesTot := CountChequesTot + DataForm2.Query3.Fieldbyname('CountChequesTotal').AsCurrency;
      CountOtherTot := CountOtherTot + DataForm2.Query3.Fieldbyname('CountOtherTotal').AsCurrency;

      Diff1 := DataForm2.Query3.Fieldbyname('RealCashTotal').AsCurrency - DataForm2.Query3.Fieldbyname('CountCashTotal').AsCurrency;
      CashDiffTot := CashDiffTot + Diff1;
      CashDiffShow.Caption := Floattostrf(Diff1,ffCurrency,17,2);
      if Diff1 <> 0  then
        CashDiffShow.Color := clYellow
      else
        CashDiffShow.Color := clWhite;

      Diff2 := DataForm2.Query3.Fieldbyname('RealCreditCardTotal').AsCurrency - DataForm2.Query3.Fieldbyname('CountCreditCardTotal').AsCurrency;
      CreditCardDiffTot := CreditCardDiffTot + Diff2;
      CreditCardDiffShow.Caption := Floattostrf(Diff2,ffCurrency,17,2);
      if Diff2 <> 0  then
        CreditCardDiffShow.Color := clYellow
      else
        CreditCardDiffShow.Color := clWhite;

      Diff3 := DataForm2.Query3.Fieldbyname('RealChequesTotal').AsCurrency - DataForm2.Query3.Fieldbyname('CountChequesTotal').AsCurrency;
      ChequesDiffTot := ChequesDiffTot + Diff3;
      ChequesDiffShow.Caption := Floattostrf(Diff3,ffCurrency,17,2);
      if Diff3 <> 0  then
        ChequesDiffShow.Color := clYellow
      else
        ChequesDiffShow.Color := clWhite;

      Diff4 := DataForm2.Query3.Fieldbyname('RealOtherTotal').AsCurrency - DataForm2.Query3.Fieldbyname('CountOtherTotal').AsCurrency;
      OtherDiffTot := OtherDiffTot + Diff4;
      OtherDiffShow.Caption := Floattostrf(Diff4,ffCurrency,17,2);
      if Diff4 <> 0  then
        OtherDiffShow.Color := clYellow
      else
        OtherDiffShow.Color := clWhite;
end;

procedure TCashupListForm.DailyListBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      RealCashTot := 0.00;
      RealCreditCardTot := 0.00;
      RealChequesTot := 0.00;
      RealOtherTot := 0.00;
      CountCashTot := 0.00;
      CountCreditCardTot := 0.00;
      CountChequesTot := 0.00;
      CountOtherTot := 0.00;
      CashDiffTot := 0.00;
      CreditCardDiffTot := 0.00;
      ChequesDiffTot := 0.00;
      OtherDiffTot := 0.00;
end;

procedure TCashupListForm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      RealCashTotal.Caption := Floattostrf(RealCashTot,ffCurrency,17,2);
      RealCreditCardTotal.Caption := Floattostrf(RealCreditCardTot,ffCurrency,17,2);
      RealChequesTotal.Caption := Floattostrf(RealChequesTot,ffCurrency,17,2);
      RealOtherTotal.Caption := Floattostrf(RealOtherTot,ffCurrency,17,2);
      CountCashTotal.Caption := Floattostrf(CountCashTot,ffCurrency,17,2);
      CountCreditCardTotal.Caption := Floattostrf(CountCreditCardTot,ffCurrency,17,2);
      CountChequesTotal.Caption := Floattostrf(CountChequesTot,ffCurrency,17,2);
      CountOtherTotal.Caption := Floattostrf(CountOtherTot,ffCurrency,17,2);
      CashDiff.Caption := Floattostrf(CashDiffTot,ffCurrency,17,2);
      CreditCardDiff.Caption := Floattostrf(CreditCardDiffTot,ffCurrency,17,2);
      ChequesDiff.Caption := Floattostrf(ChequesDiffTot,ffCurrency,17,2);
      OtherDiff.Caption := Floattostrf(OtherDiffTot,ffCurrency,17,2);
end;

procedure TCashupListForm.ReportBeforePrint(Sender: TObject);
begin
      If (PrintFromWhere = 'DailyCashup') or (PrintFromWhere = 'MonthlyCashup') then
      begin
        Report.BaseReport.SetPaperSize(DMPAPER_A4,0,0);
        Report.BaseReport.Orientation := poLandscape;
      end;
      if (PrintFromWhere = 'DetailedMonthlyCashup') then
      begin
        Report.BaseReport.SetPaperSize(DMPAPER_A4,0,0);
        Report.BaseReport.Orientation := poPortrait;
      end;

end;

procedure TCashupListForm.ReportPrint(Sender: TObject);
begin
      If (PrintFromWhere = 'DailyCashup') or (PrintFromWhere = 'MonthlyCashup') then
      begin
        PrintCashupList(Report.BaseReport);
      end;
      if (PrintFromWhere = 'DetailedMonthlyCashup') then
      begin
        PrintDetailedCashupList(Report.BaseReport);
      end;
end;

procedure TCashupListForm.Button3Click(Sender: TObject);
var
    GivenTotal, CountTotal, CountCashTotal, CountCreditCardTotal, CountChequesTotal, CountOtherTotal, RealItemTotal, CountItemTotal, DiffTotal: Currency;
    OldUser: String;
begin
      ExtractForm.Memo1.Clear;
      ExtractForm.Memo1.Lines.Add('"Shorts and Overs",,,"' + datetoStr(date) + '"');
      ExtractForm.Memo1.Lines.Add('');
      ExtractForm.Memo1.Lines.Add('"User","Shift Date","Total System Sales","Cash Count","Credit Card Count","Cheques Count","Other Count","Total Counted","Cash (Short) / Over"');
      GivenTotal := 0;
      CountTotal := 0;
      CountCashTotal := 0;
      CountCreditCardTotal := 0;
      CountChequesTotal := 0;
      CountOtherTotal := 0;
      DiffTotal := 0;
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM cashup_db');
        Add('WHERE (Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(Date <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and not TimeStamp is null');
        Add('Order by User, Date');
      end;
      DataForm2.Query3.Open;
      Dataform2.Query3.DisableControls;
      DataForm2.Query3.First;
      OldUser := Dataform2.Query3.FieldByName('User').asString;
      while not DataForm2.Query3.EOF do
      begin
        If (OldUser <> Dataform2.Query3.FieldByName('User').asString) then
        begin
          ExtractForm.Memo1.Lines.Add('"Total",,' + FloattoStr(GivenTotal) + ',' + FloattoStr(CountCashTotal) + ',' + FloattoStr(CountCreditCardTotal) + ',' + FloattoStr(CountChequesTotal) + ',' + FloattoStr(CountOtherTotal) + ','+ Floattostr(CountTotal) + ',' + Floattostr(DiffTotal));
          ExtractForm.Memo1.Lines.Add('');
          GivenTotal := 0;
          CountTotal := 0;
          CountCashTotal := 0;
          CountCreditCardTotal := 0;
          CountChequesTotal := 0;
          CountOtherTotal := 0;
          DiffTotal := 0;
          OldUser := Dataform2.Query3.FieldByName('User').asString;
        end;
        RealItemTotal := DataForm2.Query3.Fieldbyname('RealCashTotal').asCurrency + DataForm2.Query3.Fieldbyname('RealChequesTotal').asCurrency + DataForm2.Query3.Fieldbyname('RealCreditCardTotal').asCurrency + DataForm2.Query3.Fieldbyname('RealOtherTotal').asCurrency;
        GivenTotal := GivenTotal + RealItemTotal;
        CountItemTotal := DataForm2.Query3.Fieldbyname('CountCashTotal').asCurrency + DataForm2.Query3.Fieldbyname('CountChequesTotal').asCurrency + DataForm2.Query3.Fieldbyname('CountCreditCardTotal').asCurrency + DataForm2.Query3.Fieldbyname('CountOtherTotal').asCurrency;
        CountTotal := CountTotal + CountItemTotal;
        CountCashTotal := CountCashTotal + DataForm2.Query3.Fieldbyname('CountCashTotal').asCurrency;
        CountCreditCardTotal := CountCreditCardTotal + DataForm2.Query3.Fieldbyname('CountCreditCardTotal').asCurrency;
        CountChequesTotal := CountChequesTotal + DataForm2.Query3.Fieldbyname('CountChequesTotal').asCurrency;
        CountOtherTotal := CountOtherTotal + DataForm2.Query3.Fieldbyname('CountOtherTotal').asCurrency;
        DiffTotal := DiffTotal + (RealItemTotal - CountItemTotal);
        ExtractForm.Memo1.Lines.Add('"' + DataForm2.Query3.Fieldbyname('User').asString + '","' + IntDatetoString(DataForm2.Query3.Fieldbyname('Date').asInteger) + '",' + FloattoStr(RealItemTotal) + ',' + FloattoStr(DataForm2.Query3.Fieldbyname('CountCashTotal').asCurrency) + ',' + FloattoStr(DataForm2.Query3.Fieldbyname('CountCreditCardTotal').asCurrency) + ',' + FloattoStr(DataForm2.Query3.Fieldbyname('CountChequesTotal').asCurrency)  + ',' + FloattoStr(DataForm2.Query3.Fieldbyname('CountOtherTotal').asCurrency)
                                    + ','+ Floattostr(CountItemTotal) + ',' + Floattostr(RealItemTotal - CountItemTotal));
        DataForm2.Query3.Next;
      end;
      Dataform2.Query3.EnableControls;
      ExtractForm.Memo1.Lines.Add('"Total",,' + FloattoStr(GivenTotal) + ',' + FloattoStr(CountCashTotal) + ',' + FloattoStr(CountCreditCardTotal) + ',' + FloattoStr(CountChequesTotal) + ',' + FloattoStr(CountOtherTotal) + ','+ Floattostr(CountTotal) + ',' + Floattostr(DiffTotal));
      ExtractForm.SaveDialog.FileName := 'Cashup User Report';
      If Extractform.SaveDialog.Execute then
      begin
        ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
      end;
      DataForm2.Query3.Close;
      showmessage('Finished with Cashup Report!');
end;

procedure TCashupListForm.JvBitBtn1Click(Sender: TObject);
begin
//      Dataform2.InvoiceExportQuery.Params.ParamByName('BeginDate').Value := DatetoIntDate(FromDate.Date);
//      Dataform2.InvoiceExportQuery.Params.ParamByName('EndDate').Value := DatetoIntDate(ToDate.Date);
//      Dataform2.InvoiceExportQuery.Params.ParamByName('InvClose').Value := 'Close';
//      Dataform2.InvoiceExportQuery.Params.ParamByName('order').Value := 'CUSet, InvoiceType';
      Dataform2.InvoiceExportQuery.Close;
      with Dataform2.InvoiceExportQuery.SQL do
      begin
        Clear;
        Add('SELECT invoice_db.InvNo,invoice_db.BranchNo, invoice_db.CUSet, invoice_db.InvDate, invoice_db.InvClose, invoice_db.InvTotal, invoice_db.InvoiceType, invoice_db.InvBy, invoice_db.ShiftSet FROM cashup_db');
        Add('left join invoice_db on invoice_db.CUSet = cashup_db.Nr');
        Add('WHERE ((cashup_db.`Date` >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and (cashup_db.`Date` <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + '))');
        Add('and not TimeStamp is null');
        Add('Order by cashup_db.Nr, invoice_db.InvDate');
      end;
      DataForm2.InvoiceExportQuery.Open;
      Application.CreateForm(TGridExportForm, GridExportForm);
      GridExportForm.showmodal;
      GridExportForm.Free;
      Dataform2.InvoiceExportQuery.Close;
end;

procedure TCashupListForm.JvBitBtn2Click(Sender: TObject);
begin
      Dataform2.InvoiceExportQuery.Close;
      with Dataform2.InvoiceExportQuery.SQL do
      begin
        Clear;
        Add('SELECT invoice_db.InvNo,invoice_db.BranchNo, invoice_db.CUSet, invoice_db.InvDate, invoice_db.InvClose, invoice_db.InvTotal, invoice_db.InvoiceType, invoice_db.InvBy, invoice_db.ShiftSet FROM invoice_db');
//        Add('left join invoice_db on invoice_db.CUSet = cashup_db.Nr');
        Add('WHERE ((invoice_db.InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and (invoice_db.InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + '))');
        Add('and (invoice_db.CUSet is null)');
        Add('and (Invclose = "Close")');
        Add('Order by invoice_db.InvDate,invoice_db.InvNo');
      end;
      DataForm2.InvoiceExportQuery.Open;
      Application.CreateForm(TGridExportForm, GridExportForm);
      GridExportForm.showmodal;
      GridExportForm.Free;
      Dataform2.InvoiceExportQuery.Close;
end;

procedure TCashupListForm.PrintCashupList(BReport:TBaseReport);
var
      LineCount:Integer;
      CashDiff, ChequesDiff, CreditCardDiff, OtherDiff: Currency;
begin
        with BReport do
        begin
          PageInt := 0;
          LineCount := 0;
          RealCashTot := 0.00;
          RealCreditCardTot := 0.00;
          RealChequesTot := 0.00;
          RealOtherTot := 0.00;
          CountCashTot := 0.00;
          CountCreditCardTot := 0.00;
          CountChequesTot := 0.00;
          CountOtherTot := 0.00;
          CashDiffTot := 0.00;
          CreditCardDiffTot := 0.00;
          ChequesDiffTot := 0.00;
          OtherDiffTot := 0.00;
          PrintCashupListHeader(BReport);
          if PrintFromWhere = 'DailyCashup' then
          begin
            DataForm2.Query3.Close;
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('SELECT * FROM cashup_db');
              Add('WHERE (User = "' + DataForm2.user_db.fieldbyname('UserName').asString + '") and');
              Add('(Date = ' + InttoStr(DatetoIntDate(DateListEdit.Date)) + ')');
              Add('and not TimeStamp is null');
              Add('order by Date');
            end;
            DataForm2.Query3.Open;
          end;
          if PrintFromWhere = 'MonthlyCashup' then
          begin
            DataForm2.Query3.Close;
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('SELECT * FROM cashup_db');
              Add('WHERE (Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
              Add('(Date <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
              Add('and not TimeStamp is null');
              Add('order by Date');
            end;
            DataForm2.Query3.Open;
          end;
          DataForm2.Query3.first;
          try
            while not DataForm2.Query3.EOF do
            begin
              Inc(LineCount);
              if LineCount > 24 then
              begin
                LineCount := 1;
                NewPage;
                PrintCashupListHeader(BReport);
              end;

              NewLine;
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('Date').asInteger));
              PrintTab(Dataform2.Query3.FieldByName('User').asString);
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('RealCashTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('RealChequesTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('RealCreditCardTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('RealOtherTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CountCashTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CountChequesTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CountCreditCardTotal').asFloat,ffCurrency,17,2));
              PrintTab(Floattostrf(Dataform2.Query3.FieldByName('CountOtherTotal').asFloat,ffCurrency,17,2));
              CashDiff := Dataform2.Query3.FieldByName('RealCashTotal').asFloat - Dataform2.Query3.FieldByName('CountCashTotal').asFloat;
              ChequesDiff := Dataform2.Query3.FieldByName('RealChequesTotal').asFloat - Dataform2.Query3.FieldByName('RealChequesTotal').asFloat;
              CreditCardDiff := Dataform2.Query3.FieldByName('RealCreditCardTotal').asFloat - Dataform2.Query3.FieldByName('CountCreditCardTotal').asFloat;
              OtherDiff := Dataform2.Query3.FieldByName('RealOtherTotal').asFloat - Dataform2.Query3.FieldByName('CountOtherTotal').asFloat;
              PrintTab(Floattostrf(CashDiff,ffCurrency,17,2));
              PrintTab(Floattostrf(ChequesDiff,ffCurrency,17,2));
              PrintTab(Floattostrf(CreditCardDiff,ffCurrency,17,2));
              PrintTab(Floattostrf(OtherDiff,ffCurrency,17,2));
              RealCashTot := RealCashTot + Dataform2.Query3.FieldByName('RealCashTotal').asFloat;
              RealChequesTot := RealChequesTot + Dataform2.Query3.FieldByName('RealChequesTotal').asFloat;
              RealCreditCardTot := RealCreditCardTot + Dataform2.Query3.FieldByName('RealCreditCardTotal').asFloat;
              RealOtherTot := RealOtherTot + Dataform2.Query3.FieldByName('RealOtherTotal').asFloat;
              CountCashTot := CountCashTot + Dataform2.Query3.FieldByName('CountCashTotal').asFloat;
              CountChequesTot := CountChequesTot + Dataform2.Query3.FieldByName('CountChequesTotal').asFloat;
              CountCreditCardTot := CountCreditCardTot + Dataform2.Query3.FieldByName('CountCreditCardTotal').asFloat;
              CountOtherTot := CountOtherTot + Dataform2.Query3.FieldByName('CountOtherTotal').asFloat;
              CashDiffTot := CashDiffTot + CashDiff;
              ChequesDiffTot := ChequesDiffTot + ChequesDiff;
              CreditCardDiffTot := CreditCardDiffTot + CreditCardDiff;
              OtherDiffTot := OtherDiffTot + OtherDiff;

              NewLine;
              PrintTab('');
              PrintTab(DateTimetoStr(Dataform2.Query3.FieldByName('TimeStamp').asDateTime));
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');

              DataForm2.Query3.Next;
            end;
          finally
          end;
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab(Floattostrf(RealCashTot,ffCurrency,17,2));
          PrintTab(Floattostrf(RealChequesTot,ffCurrency,17,2));
          PrintTab(Floattostrf(RealCreditCardTot,ffCurrency,17,2));
          PrintTab(Floattostrf(RealOtherTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CountCashTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CountChequesTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CountCreditCardTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CountOtherTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CashDiffTot,ffCurrency,17,2));
          PrintTab(Floattostrf(ChequesDiffTot,ffCurrency,17,2));
          PrintTab(Floattostrf(CreditCardDiffTot,ffCurrency,17,2));
          PrintTab(Floattostrf(OtherDiffTot,ffCurrency,17,2));
          Bold := False;
          DataForm2.Query3.Close;
        end;
end;

procedure TCashupListForm.PrintCashupListHeader(BReport:TBaseReport);
begin
        with BReport do
        begin
          MarginLeft := 0.5;
          MarginTop := 0.5;
          SetFont('Arial',8);
          Inc(PageInt);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          Bold := False;
          printRight(datetostr(date) + '   Page ' + InttoStr(PageInt),15);
          NewLine;
          NewLine;
          printLeft(StrReportTitle,0.5);
          ClearTabs;
          SetTab(0.5, pjLeft,1,0,0,0);
          SetTab(NA, pjLeft,3.2,0,0,0);
          SetTab(NA, pjLeft,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          SetTab(NA, pjRight,1.7,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('Real');
          PrintTab('Real');
          PrintTab('Real');
          PrintTab('Real');
          PrintTab('Counted');
          PrintTab('Counted');
          PrintTab('Counted');
          PrintTab('Counted');
          PrintTab('Diff');
          PrintTab('Diff');
          PrintTab('Diff');
          PrintTab('Diff');
          NewLine;
          PrintTab('CU No');
          PrintTab('CU Date');
          PrintTab('CU By');
          PrintTab('Cash Tot');
          PrintTab('Cheques Tot');
          PrintTab('Credit Tot');
          PrintTab('Other Tot');
          PrintTab('Cash Tot');
          PrintTab('Cheques Tot');
          PrintTab('Credit Tot');
          PrintTab('Other Tot');
          PrintTab('Cash');
          PrintTab('Cheques');
          PrintTab('Credit');
          PrintTab('Other');
          Bold := False;
          NewLine;
        end;
end;
procedure TCashupListForm.PrintDetailedCashupList(BReport:TBaseReport);
var
      LineCount:Integer;
      CashDiff, ChequesDiff, CreditCardDiff, OtherDiff: Currency;
begin
        with BReport do
        begin
          PageInt := 0;
          LineCount := 0;
          RealCashTot := 0.00;
          PrintDetailedCashupListHeader(BReport);
          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('SELECT * FROM cashup_db');
            Add('WHERE (Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
            Add('(Date <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
            Add('and not TimeStamp is null');
            Add('order by Date');
          end;
          DataForm2.Query3.Open;
          DataForm2.Query3.first;
          try
            while not DataForm2.Query3.EOF do
            begin
              Dataform2.Query4.Close;
              with Dataform2.Query4.SQL do
              begin
                Clear;
                Add('select * from invoice_db');
                Add('where CUSet = ' + InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
                Add('and InvBy = "' + Dataform2.Query3.FieldByName('User').asString + '"');
                Add('order by InvDate');
              end;
              Dataform2.Query4.Open;
              RealCashTot := 0;
              while not DataForm2.Query4.EOF do
              begin
                Inc(LineCount);
                if LineCount > 50 then
                begin
                  LineCount := 1;
                  NewPage;
                  PrintDetailedCashupListHeader(BReport);
                end
                else
                  NewLine;
                PrintTab(InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
                PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('Date').asInteger));
                PrintTab(DateTimetoStr(Dataform2.Query3.FieldByName('TimeStamp').asDateTime));
                PrintTab(Dataform2.Query3.FieldByName('User').asString);
                PrintTab('Invoice');
                PrintTab(Dataform2.Query4.FieldByName('InvoiceType').asString);
                PrintTab(InttoStr(Dataform2.Query4.FieldByName('InvNo').asInteger) + '/' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger));
                PrintTab(IntDatetoString(Dataform2.Query4.FieldByName('InvDate').asInteger));
                PrintTab(Floattostrf(Dataform2.Query4.FieldByName('InvTotal').asFloat,ffCurrency,17,2));
                RealCashTot := RealCashTot + Dataform2.Query4.FieldByName('InvTotal').asFloat;

                DataForm2.Query4.Next;
              end;

              Dataform2.Query4.Close;
              with Dataform2.Query4.SQL do
              begin
                Clear;
                Add('select * from trans_db');
                Add('where CUSet = ' + InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
                Add('and PaymentBy = "' + Dataform2.Query3.FieldByName('User').asString + '"');
                Add('order by Date');
              end;
              Dataform2.Query4.Open;
              while not DataForm2.Query4.EOF do
              begin
                Inc(LineCount);
                if LineCount > 50 then
                begin
                  LineCount := 1;
                  NewPage;
                  PrintDetailedCashupListHeader(BReport);
                end
                else
                  NewLine;
                PrintTab(InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
                PrintTab(IntDatetoString(Dataform2.Query3.FieldByName('Date').asInteger));
                PrintTab(DateTimetoStr(Dataform2.Query3.FieldByName('TimeStamp').asDateTime));
                PrintTab(Dataform2.Query3.FieldByName('User').asString);
                PrintTab('Payment');
                PrintTab(Dataform2.Query4.FieldByName('PaymentType').asString + ' ' + Dataform2.Query4.FieldByName('Description').asString);
                PrintTab(InttoStr(Dataform2.Query4.FieldByName('LinkID').asInteger) + '/' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger));
                PrintTab(IntDatetoString(Dataform2.Query4.FieldByName('Date').asInteger));
                PrintTab(Floattostrf(Dataform2.Query4.FieldByName('Ammount').asFloat,ffCurrency,17,2));
                RealCashTot := RealCashTot + Dataform2.Query4.FieldByName('Ammount').asFloat;

                DataForm2.Query4.Next;
              end;
              Inc(LineCount);
              Inc(LineCount);
              if LineCount > 50 then
              begin
                LineCount := 1;
                NewPage;
                PrintDetailedCashupListHeader(BReport);
              end
              else
              begin
                NewLine;
                NewLine;
              end;
              Bold := True;
              PrintTab(InttoStr(Dataform2.Query3.FieldByName('Nr').asInteger));
              PrintTab('');
              PrintTab('');
              PrintTab('Total');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab('');
              PrintTab(Floattostrf(RealCashTot,ffCurrency,17,2));
              Bold := False;
              NewLine;

              DataForm2.Query3.Next;
            end;
          finally
          end;
          DataForm2.Query3.Close;
          DataForm2.Query4.Close;
        end;
end;

procedure TCashupListForm.PrintDetailedCashupListHeader(BReport:TBaseReport);
begin
        with BReport do
        begin
          MarginLeft := 0.5;
          MarginTop := 0.8;
          SetFont('Arial',9);
          Inc(PageInt);
          Bold := True;
          printLeft(Dataform2.GlobalTableReportTitle.Value, 0.5);
          Bold := False;
          printRight(datetostr(date) + '   Page ' + InttoStr(PageInt),15);
          NewLine;
          NewLine;
          printLeft(StrReportTitle,0.5);
          ClearTabs;
          SetTab(0.5, pjLeft,1.2,0,0,0);
          SetTab(NA, pjLeft,2,0,0,0);
          SetTab(NA, pjLeft,3.2,0,0,0);
          SetTab(NA, pjLeft,1.7,0,0,0);
          SetTab(NA, pjLeft,1.7,0,0,0);
          SetTab(NA, pjLeft,3,0,0,0);
          SetTab(NA, pjLeft,2,0,0,0);
          SetTab(NA, pjLeft,2,0,0,0);
          SetTab(NA, pjRight,2,0,0,0);
          NewLine;
          NewLine;
          Bold := True;
          PrintTab('CU No');
          PrintTab('CU Date');
          PrintTab('CU Time Stamp');
          PrintTab('CU By');
          PrintTab('Type');
          PrintTab('Description');
          PrintTab('Ref No');
          PrintTab('Tran. Date');
          PrintTab('Ammount');
          Bold := False;
          NewLine;
        end;
end;


end.
