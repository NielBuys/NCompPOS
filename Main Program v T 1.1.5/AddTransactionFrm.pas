unit AddTransactionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,UtilsUnit, JvExComCtrls,
  JvDateTimePicker, JvEdit, JvExStdCtrls, JvValidateEdit, JvExButtons, JvBitBtn,
  JvCombobox, JvComCtrls;

type
  TAddTransactionForm = class(TForm)
    JvPageControl1: TJvPageControl;
    TabSheet1: TTabSheet;
    JvBitBtn1: TJvBitBtn;
    TType: TJvComboBox;
    JvBitBtn2: TJvBitBtn;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    Label33: TLabel;
    PType: TJvComboBox;
    Label2: TLabel;
    PAmount: TJvValidateEdit;
    Label3: TLabel;
    PRefNo: TJvEdit;
    JvBitBtn3: TJvBitBtn;
    PDate: TJvDateTimePicker;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    JDate: TJvDateTimePicker;
    Label6: TLabel;
    JAmount: TJvValidateEdit;
    Label7: TLabel;
    JRefNo: TJvEdit;
    Label8: TLabel;
    JAccNo: TEdit;
    Label9: TLabel;
    JBranchNo: TEdit;
    JvBitBtn4: TJvBitBtn;
    JAge: TJvComboBox;
    Label10: TLabel;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    CDate: TJvDateTimePicker;
    Label13: TLabel;
    CAmount: TJvValidateEdit;
    Label14: TLabel;
    CRefNo: TJvEdit;
    JvBitBtn5: TJvBitBtn;
    Label15: TLabel;
    CAge: TJvComboBox;
    TabSheet5: TTabSheet;
    Label11: TLabel;
    IDate: TJvDateTimePicker;
    Label16: TLabel;
    IAmount: TJvValidateEdit;
    Label17: TLabel;
    IRefNo: TJvEdit;
    JvBitBtn6: TJvBitBtn;
    procedure TTypeChange(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FromWhere: String;
    { Public declarations }
  end;

var
  AddTransactionForm: TAddTransactionForm;

implementation
        uses DataFrm2, LocalAccountSearchFrm;

{$R *.dfm}

procedure TAddTransactionForm.FormShow(Sender: TObject);
begin
        PDate.Date := date;
        JDate.Date := date;
        CDate.Date := date;
        IDate.Date := date;
//        PType.ItemIndex := 0;
        if TType.ItemIndex = 0 then
        begin
          JvBitBtn2.Enabled := True;
          JvBitBtn2.Click
        end
        else
          JvPageControl1.ActivePage := Tabsheet1;
        if FromWhere = 'Debtor' then
        begin
          TabSheet4.Caption := 'Credit Note';
          JvBitBtn5.Caption := 'Add Credit Note';
          TType.Items[3] := 'Credit Note';
        end
        else
        begin
          TabSheet4.Caption := 'Debit Note';
          JvBitBtn5.Caption := 'Add Debit Note';
          TType.Items[3] := 'Debit Note';
        end;
end;

procedure TAddTransactionForm.JvBitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TAddTransactionForm.JvBitBtn2Click(Sender: TObject);
begin
        if TType.ItemIndex = 0 then
        begin
          TabSheet2.Enabled := True;
          JvPageControl1.ActivePage := Tabsheet2;
        end;
        if TType.ItemIndex = 1 then
        begin
          TabSheet3.Enabled := True;
          JvPageControl1.ActivePage := Tabsheet3;
        end;
        if TType.ItemIndex = 2 then
        begin
          TabSheet5.Enabled := True;
          JvPageControl1.ActivePage := Tabsheet5;
        end;
        if TType.ItemIndex = 3 then
        begin
          TabSheet4.Enabled := True;
          JvPageControl1.ActivePage := Tabsheet4;
        end;
end;

procedure TAddTransactionForm.JvBitBtn3Click(Sender: TObject);
var
        MonthStr, YearStr, s: String;
        AmountStore, TempAmount: Currency;
        e: Currency;
begin
            if FromWhere = 'Debtor' then
            begin
              e := PAmount.Value * -1;
              Monthstr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),1,4);
            end
            else
            begin
              e := PAmount.Value;
              Monthstr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),1,4);
            end;
            Dataform2.Query1.Close;
            s := '("Payment",' + FloattoStr(e) + ',' + InttoStr(DatetoIntDate(PDate.Date)) + ',' + InttoStr(Dataform2.AccountsTableNr.Value) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.AccountsTableBranchNo.Value) + ',"' + PType.Items[PType.ItemIndex] + '",' + YearStr + ',' + MonthStr + ',"A","' + PrefNo.Text + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            with Dataform2.Query1.SQL do
            begin
              Clear;
//              Add('update accounts_db set Total = Total - ' + floattostr(PAmount.Value));
              Add('update accounts_db set Total = Total + ' + floattostr(e));
              Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
              Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
              Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
            end;
            DataForm2.Query1.ExecSQL;
            if FromWhere = 'Debtor' then
            begin
              AmountStore := PAmount.Value;
              if Dataform2.AccountsTableDays120.Value > 0 then
              begin
                TempAmount := Dataform2.AccountsTableDays120.Value - AmountStore;
                if TempAmount < 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days120 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays90.Value > 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays90.Value - AmountStore;
                if TempAmount < 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days90 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays60.Value > 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays60.Value - AmountStore;
                if TempAmount < 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days60 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays30.Value > 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays30.Value - AmountStore;
                if TempAmount < 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days30 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableCurrent.Value > 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableCurrent.Value - AmountStore;
                s := FloattoStr(TempAmount);
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Current = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
            end
            else
            begin
              AmountStore := PAmount.Value;
              if Dataform2.AccountsTableDays120.Value < 0 then
              begin
                TempAmount := Dataform2.AccountsTableDays120.Value + AmountStore;
                if TempAmount > 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days120 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays90.Value < 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays90.Value + AmountStore;
                if TempAmount > 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days90 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays60.Value < 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays60.Value + AmountStore;
                if TempAmount > 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days60 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableDays30.Value < 0) and (AmountStore > 0) then
              begin
                TempAmount := Dataform2.AccountsTableDays30.Value + AmountStore;
                if TempAmount > 0 then
                begin
                  s := '0';
                  AmountStore := TempAmount * -1;
                end
                else
                begin
                  s := FloattoStr(TempAmount);
                  AmountStore := 0;
                end;
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Days30 = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
              if (Dataform2.AccountsTableCurrent.Value < 0) and (AmountStore > 0) then
              begin
//                showmessage('1');
                TempAmount := Dataform2.AccountsTableCurrent.Value + AmountStore;
                s := FloattoStr(TempAmount);
                with Dataform2.Query1.SQL do
                begin
                  Clear;
                  Add('update accounts_db set Current = ' + s);
                  Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
                  Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
                  Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
                end;
                DataForm2.Query1.ExecSQL;
              end;
            end;

            Dataform2.TransQuery.Refresh;
            Dataform2.AccountsTable.Refresh;
            Close;
end;

procedure TAddTransactionForm.JvBitBtn4Click(Sender: TObject);
var
        MonthStr, YearStr, s, Age, AccTypeStr: String;
        e: Currency;
begin
          if FromWhere = 'Debtor' then
          begin
            AccTypeStr := 'and AccType = 1';
            Monthstr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),5,2);
            YearStr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),1,4);
            e := JAmount.Value * -1;
          end
          else
          begin
            AccTypeStr := 'and AccType = 2';
            Monthstr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),5,2);
            YearStr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),1,4);
            e := JAmount.Value;
          end;

          Dataform2.Query2.Close;
          with Dataform2.Query2.SQL do
          begin
            Clear;
            Add('select Nr from accounts_db');
            Add('where AccNo = ' + JAccNo.Text);
            Add('and BranchNo = ' + JBranchNo.Text);
            Add(AcctypeStr);
          end;
          Dataform2.Query2.Open;
          if Dataform2.Query2.RecordCount = 1 then
          begin
            Dataform2.Query1.Close;
            s := '("Journal",' + FloattoStr(e) + ',' + InttoStr(DatetoIntDate(JDate.Date)) + ',' + InttoStr(Dataform2.AccountsTableNr.Value) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.AccountsTableBranchNo.Value) + ',"Journal",' + YearStr + ',' + MonthStr + ',"A","' + JrefNo.Text + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            s := '("Journal",' + FloattoStr(e * -1) + ',' + InttoStr(DatetoIntDate(JDate.Date)) + ',' + JAccNo.Text + ',"' + DataForm2.User_dbUserName.Value + '",' + JBranchNo.Text + ',"Journal",' + YearStr + ',' + MonthStr + ',"A","' + JrefNo.Text + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            if JAge.ItemIndex = 0 then
            begin
              Age := 'Current';
            end
            else
            begin
              if JAge.ItemIndex = 1 then
              begin
                Age := 'Days30';
              end
              else
              begin
                if JAge.ItemIndex = 2 then
                begin
                  Age := 'Days60';
                end
                else
                begin
                  if JAge.ItemIndex = 3 then
                  begin
                    Age := 'Days90';
                  end
                  else
                  begin
                    Age := 'Days120';
                  end;
                end;
              end;
            end;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('update accounts_db set Total = Total + ' + floattostr(e) + ',' + Age + ' = ' + Age + ' + ' + floattostr(e));
              Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
              Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
              Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
            end;
            DataForm2.Query1.ExecSQL;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('update accounts_db set Total = Total - ' + floattostr(e) + ',' + Age + ' = ' + Age + ' - ' + floattostr(e));
              Add('where BranchNo = ' + JBranchNo.Text);
              Add('and Nr = ' + JAccNo.Text);
              Add(AcctypeStr);
            end;
            DataForm2.Query1.ExecSQL;
            Dataform2.TransQuery.Refresh;
            Dataform2.AccountsTable.Refresh;
            Close;
          end
          else
            showmessage('Can''t find Account number to move money to!');
end;

procedure TAddTransactionForm.JvBitBtn5Click(Sender: TObject);
var
        MonthStr, YearStr, s, Age, TypeStr: String;
        e: Currency;
begin
            if FromWhere = 'Debtor' then
            begin
              Monthstr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),1,4);
              e := CAmount.Value * -1;
              TypeStr := '"CR-Note"';
            end
            else
            begin
              Monthstr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),1,4);
              e := CAmount.Value;
              TypeStr := '"DT-Note"';
            end;
            Dataform2.Query1.Close;
            s := '(' + TypeStr + ',' + FloattoStr(e) + ',' + InttoStr(DatetoIntDate(CDate.Date)) + ',' + InttoStr(Dataform2.AccountsTableNr.Value) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.AccountsTableBranchNo.Value) + ',' + TypeStr + ',' + YearStr + ',' + MonthStr + ',"A","' + CRefNo.Text + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            if CAge.ItemIndex = 0 then
            begin
              Age := 'Current';
            end
            else
            begin
              if CAge.ItemIndex = 1 then
              begin
                Age := 'Days30';
              end
              else
              begin
                if CAge.ItemIndex = 2 then
                begin
                  Age := 'Days60';
                end
                else
                begin
                  if CAge.ItemIndex = 3 then
                  begin
                    Age := 'Days90';
                  end
                  else
                  begin
                    Age := 'Days120';
                  end;
                end;
              end;
            end;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('update accounts_db set Total = Total + ' + floattostr(e) + ',' + Age + ' = ' + Age + ' + ' + floattostr(e));
              Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
              Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
              Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
            end;
            DataForm2.Query1.ExecSQL;
            Dataform2.TransQuery.Refresh;
            Dataform2.AccountsTable.Refresh;
            Close;
end;

procedure TAddTransactionForm.JvBitBtn6Click(Sender: TObject);
var
        MonthStr, YearStr, s, Age: String;
        e: Currency;
begin
            if FromWhere = 'Debtor' then
            begin
              Monthstr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),1,4);
              e := IAmount.Value;
            end
            else
            begin
              Monthstr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),5,2);
              YearStr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),1,4);
              e := IAmount.Value * -1;
            end;
            Dataform2.Query1.Close;
            s := '("Invoice",' + FloattoStr(e) + ',' + InttoStr(DatetoIntDate(IDate.Date)) + ',' + InttoStr(Dataform2.AccountsTableNr.Value) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.AccountsTableBranchNo.Value) + ',"Invoice",' + YearStr + ',' + MonthStr + ',"A","' + IRefNo.Text + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('update accounts_db set Total = Total + ' + floattostr(e) + ',Current = Current + ' + floattostr(e));
              Add('where BranchNo = ' + InttoStr(Dataform2.AccountsTableBranchNo.Value));
              Add('and Nr = ' + InttoStr(Dataform2.AccountsTableNr.Value));
              Add('and AccType = ' + InttoStr(Dataform2.AccountsTableAccType.Value));
            end;
            DataForm2.Query1.ExecSQL;
            Dataform2.TransQuery.Refresh;
            Dataform2.AccountsTable.Refresh;
            Close;
end;

procedure TAddTransactionForm.TTypeChange(Sender: TObject);
begin
        JvBitBtn2.Enabled := True;
end;

end.
