unit CashupListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, QRCtrls, QuickRpt, ExtCtrls, Buttons,
  JvExButtons, JvBitBtn, JvExComCtrls, JvDateTimePicker, DBCtrls, UtilsUnit, db;

type
  TCashupListForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateListEdit: TJvDateTimePicker;
    Button1: TButton;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashupListForm: TCashupListForm;
  RealCashTot, RealCreditCardTot, RealChequesTot, RealOtherTot, CountCashTot, CountCreditCardTot, CountChequesTot, CountOtherTot, CashDiffTot, CreditCardDiffTot, ChequesDiffTot, OtherDiffTot: Currency;

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

procedure TCashupListForm.Button1Click(Sender: TObject);
begin
      DataForm2.Query3.Close;
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
      Dataform2.Query3.Close;
end;

procedure TCashupListForm.Button2Click(Sender: TObject);
begin
      DataForm2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT * FROM cashup_db');
        Add('WHERE (Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and');
        Add('(Date <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')');
        Add('and not TimeStamp is null');
      end;
      DataForm2.Query3.Open;
//      Dataform2.CashUpTable.Open;
//      DataForm2.CashUpTable.Filtered := False;
//      DataForm2.CashUpTable.Filter := 'Date >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ' and Date <= ' + InttoStr(DatetoIntDate(ToDate.Date));
//      DataForm2.CashUpTable.Filtered := True;
      QRLabel1.Caption := 'Monthly Cash up from: ' + datetostr(FromDate.Date) + ' to: ' + DatetoStr(ToDate.Date);
      DailyList.Preview;
      Dataform2.Query3.Close;
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

end.
