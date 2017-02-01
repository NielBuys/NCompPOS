unit AccountsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, Menus, RpDefine, RpBase, RpSystem,
  Easysize, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvCombobox,
  JvDBCombobox, JvExComCtrls, JvDateTimePicker, JvExButtons, JvBitBtn, DBCtrls,
  DateUtils, UtilsUnit;

type
  TAccountsForm = class(TForm)
    PageControl1: TPageControl;
    JvBitBtn1: TJvBitBtn;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    AddAccount: TJvBitBtn;
    SaveAccount: TJvBitBtn;
    TabSheet2: TTabSheet;
    BeginDateEdit: TJvDateTimePicker;
    EndDateEdit: TJvDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    JvBitBtn2: TJvBitBtn;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    JvDBGrid1: TJvDBGrid;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    FormResizer1: TFormResizer;
    DBText8: TDBText;
    DBText9: TDBText;
    Label23: TLabel;
    AddTransactions: TJvBitBtn;
    RvSystem1: TRvSystem;
    JvBitBtn3: TJvBitBtn;
    AllowCreditSel: TJvDBComboBox;
    DiscountEdit: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    TransactionMenu: TPopupMenu;
    PaymentforInvoice: TMenuItem;
    Label27: TLabel;
    ComboBox1: TComboBox;
    procedure AddAccountClick(Sender: TObject);
    procedure SaveAccountClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BeginDateEditChange(Sender: TObject);
    procedure EndDateEditChange(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AddTransactionsClick(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure PaymentforInvoiceClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1Change(Sender: TObject);
  private
    procedure CreateAccNo;
    procedure Showdates;
    procedure OpenTransactions;
    procedure PrintA4(Report: TBaseReport);
    procedure NewA4Page(Report: TBaseReport);
    { Private declarations }
  public
    FromWhere: String;
    procedure AddNewAccount;
    { Public declarations }
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  AccountsForm: TAccountsForm;
  count, linecount: Integer;
  MonthStr,YearStr: String;

implementation
      uses DataFrm2, AddTransactionFrm, UserFrm;

{$R *.dfm}

procedure TAccountsForm.AddAccountClick(Sender: TObject);
begin
        if (DataForm2.AccountsTablestrState = 'Edit') or (DataForm2.AccountsTablestrState = 'Insert') then
          showmessage('Save Account first')
        else
          AddNewAccount;
end;

procedure TAccountsForm.AddNewAccount();
begin
          Dataform2.AccountsTable.Append;
          if FromWhere = 'Debtor' then
            Dataform2.AccountsTableAccType.Value := 1;
          if FromWhere = 'Creditor' then
            Dataform2.AccountsTableAccType.Value := 2;
          Dataform2.AccountsTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
          Dataform2.AccountsTableCreateDate.Value := DatetoIntDate(date);
          Dataform2.AccountsTableByUser.Value := Dataform2.User_dbUserName.Value;
          Dataform2.AccountsTableBeginDate.Value := DatetoIntDate(date);
          Dataform2.AccountsTableEndDate.Value := 0;
          Dataform2.AccountsTableTotal.Value := 0;
          Dataform2.AccountsTableDays30.Value := 0;
          Dataform2.AccountsTableDays60.Value := 0;
          Dataform2.AccountsTableDays90.Value := 0;
          Dataform2.AccountsTableDays120.Value := 0;
          Dataform2.AccountsTableCurrent.Value := 0;
          Dataform2.AccountsTableBeginTotal.Value := 0;
end;

procedure TAccountsForm.AddTransactionsClick(Sender: TObject);
begin
        Application.CreateForm(TAddTransactionForm, AddTransactionForm);
        MonthStr := '0';
        YearStr := '0';
        OpenTransactions();
        AddTransactionForm.FromWhere := FromWhere;
        AddTransactionForm.showmodal;
        AddTransactionForm.Free;
end;

procedure TAccountsForm.BeginDateEditChange(Sender: TObject);
begin
        if (DatetoStr(BeginDateEdit.Date) <> IntDatetoString(DataForm2.AccountsTable.FieldByName('BeginDate').asInteger)) and (DatetoStr(BeginDateEdit.Date) <> '1899/12/30') then
        begin
          DataForm2.AccountsTable.Edit;
          DataForm2.AccountsTable.FieldByName('BeginDate').asInteger := DatetoIntDate(BeginDateEdit.Date);
        end;
end;

procedure TAccountsForm.ComboBox1Change(Sender: TObject);
begin
            OpenTransactions();
end;

procedure TAccountsForm.CreateAccNo();
begin
            if FromWhere = 'Debtor' then
            begin
              Dataform2.GlobalTable.Refresh;
              Dataform2.GlobalTable.Edit;
              Dataform2.AccountsTable.FieldByName('AccNo').asInteger := DataForm2.GlobalTableDAccNo.Value + 1;
              DataForm2.GlobalTableDAccNo.Value := Dataform2.AccountsTable.FieldByName('AccNo').asInteger;
              Dataform2.GlobalTable.Post;
            end;
            if FromWhere = 'Creditor' then
            begin
              Dataform2.GlobalTable.Refresh;
              Dataform2.GlobalTable.Edit;
              Dataform2.AccountsTable.FieldByName('AccNo').asInteger := DataForm2.GlobalTableCAccNo.Value + 1;
              DataForm2.GlobalTableCAccNo.Value := Dataform2.AccountsTable.FieldByName('AccNo').asInteger;
              Dataform2.GlobalTable.Post;
            end;
end;

procedure TAccountsForm.EndDateEditChange(Sender: TObject);
begin
        if EndDateEdit.Enabled = True then
        begin
          if (DatetoStr(EndDateEdit.Date) <> IntDatetoString(DataForm2.AccountsTable.FieldByName('EndDate').asInteger)) and (DatetoStr(EndDateEdit.Date) <> '1899/12/30') then
          begin
            DataForm2.AccountsTable.Edit;
            DataForm2.AccountsTable.FieldByName('EndDate').asInteger := DatetoIntDate(EndDateEdit.Date);
          end;
        end;
end;

procedure TAccountsForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
      if (DataForm2.AccountsTablestrState = 'Edit') or (DataForm2.AccountsTablestrState = 'Insert') then
      begin
        if MessageDlg('Do you want to exit without saving?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          DataForm2.AccountsTable.Cancel;
        end
        else
          CanClose := False;
      end;
end;

procedure TAccountsForm.FormCreate(Sender: TObject);
begin
        FormResizer1.InitializeForm;
end;

procedure TAccountsForm.FormResize(Sender: TObject);
begin
        FormResizer1.ResizeAll;
end;

procedure TAccountsForm.FormShow(Sender: TObject);
var
      TestStr:String;
      CurrentIsPresent:Boolean;
begin
        if Dataform2.User_dbRights.Value = 5 then
        begin
          AllowCreditSel.ReadOnly := False;
          DiscountEdit.ReadOnly := False;
        end
        else
        begin
          AllowCreditSel.ReadOnly := True;
          DiscountEdit.ReadOnly := True;
        end;
        PageControl1.ActivePage := TabSheet1;
        Showdates;
        MonthStr := '0';
        YearStr := '0';
        OpenTransactions();
        DataForm2.TransQuery.Last;
        if FromWhere = 'Debtor' then
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do begin
            Clear;
            Add('Select TYear,TMonth from trans_db');
            Add('left join accounts_db on (trans_db.LinkID = accounts_db.Nr) and (trans_db.BranchNo = accounts_db.BranchNo)');
            Add('where (trans_db.TransType = "A")');
            Add('and (accounts_db.AccType = 1)');
            add('group by TYear,TMonth');
            Add('order by TYear,TMonth');
          end;
          DataForm2.Query1.Open;
          DataForm2.Query1.First;
          Combobox1.Items.Clear;
          CurrentIsPresent := False;
          while not DataForm2.Query1.EOF do
          begin
            TestStr := InttoStr(Dataform2.Query1.FieldByName('TYear').asInteger) + InttoStr(Dataform2.Query1.FieldByName('TMonth').asInteger);
            Combobox1.Items.Add(TestStr);
            if TestStr = InttoStr(Dataform2.GlobalTableDActiveMonth.Value) then
              CurrentIsPresent := True;
            Dataform2.Query1.Next;
          end;
          if CurrentIsPresent = False then
            ComboBox1.Items.Add(InttoStr(Dataform2.GlobalTableDActiveMonth.Value));
          Dataform2.Query1.Close;
          AccountsForm.Caption := 'Debtor Account';
        end
        else
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do begin
            Clear;
            Add('Select TYear,TMonth from trans_db');
            Add('left join accounts_db on (trans_db.LinkID = accounts_db.Nr) and (trans_db.BranchNo = accounts_db.BranchNo)');
            Add('where (trans_db.TransType = "A")');
            Add('and (accounts_db.AccType = 2)');
            add('group by TYear,TMonth');
            Add('order by TYear,TMonth');
          end;
          DataForm2.Query1.Open;
          DataForm2.Query1.First;
          Combobox1.Items.Clear;
          CurrentIsPresent := False;
          while not DataForm2.Query1.EOF do
          begin
            TestStr := InttoStr(Dataform2.Query1.FieldByName('TYear').asInteger) + InttoStr(Dataform2.Query1.FieldByName('TMonth').asInteger);
            Combobox1.Items.Add(TestStr);
            if TestStr = InttoStr(Dataform2.GlobalTableCActiveMonth.Value) then
              CurrentIsPresent := True;
            Dataform2.Query1.Next;
          end;
          if CurrentIsPresent = False then
            ComboBox1.Items.Add(InttoStr(Dataform2.GlobalTableCActiveMonth.Value));
          Dataform2.Query1.Close;
          AccountsForm.Caption := 'Creditor Account';
        end;

end;

procedure TAccountsForm.JvBitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TAccountsForm.JvBitBtn2Click(Sender: TObject);
begin
        if DataForm2.AccountsTable.FieldByname('EndDate').asInteger = 0 then
        begin
          EndDateEdit.Enabled := True;
          EndDateEdit.Date := Date;
          if (DataForm2.AccountsTablestrState <> 'Edit') and (DataForm2.AccountsTablestrState <> 'Insert') then
            DataForm2.AccountsTable.Edit;
          DataForm2.AccountsTable.FieldByname('EndDate').asInteger := DatetoIntDate(date);
        end
        else
        begin
          if MessageDlg('Are you sure you want to remove the end date? / Remember Inseption date will be changed to today',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            if DataForm2.User_db.FieldByName('Rights').asInteger > 2 then
            begin
              EndDateEdit.Enabled := False;
              if (DataForm2.AccountsTablestrState <> 'Edit') and (DataForm2.AccountsTablestrState <> 'Insert') then
                DataForm2.AccountsTable.Edit;
              DataForm2.AccountsTable.FieldByname('EndDate').asInteger := 0;
            end
            else
              showmessage('You don''t have permission to remove a end date, Contact Supervisor!');
          end;
        end;
end;

procedure TAccountsForm.JvBitBtn3Click(Sender: TObject);
begin
        RvSystem1.Execute;
end;

procedure TAccountsForm.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
      if Dataform2.TransQueryPaymentType.Value = 'Invoice' then
      begin
        Dataform2.Query3.Close;
        with Dataform2.Query3.SQL do
        begin
          Clear;
          Add('Select Sum(Ammount) as Total from trans_db');
          Add('where (LinkID = ' + InttoStr(Dataform2.AccountsTable.FieldByName('Nr').asInteger) + ')');
          Add('and (BranchNo = ' + InttoStr(Dataform2.AccountsTable.FieldByName('BranchNo').asInteger) + ')');
//          Add('and (TYear = ' + YearStr + ')');
//          Add('and (TMonth = ' + MonthStr + ')');
          Add('and (TransType = "A")');
          Add('and (RefNo like "%' + Dataform2.TransQueryRefNo.Value + '%")');
        end;
        Dataform2.Query3.Open;
        if Dataform2.Query3.FieldByName('Total').AsFloat <> 0 then
          JvDBGrid1.Canvas.Font.Color := clLime;
      end;
      Dataform2.Query3.Close;

      JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TAccountsForm.SaveAccountClick(Sender: TObject);
begin
        if (DataForm2.AccountsTablestrState = 'Edit') or (DataForm2.AccountsTablestrState = 'Insert') then
        begin
          try
            if Dataform2.AccountsTableAccNo.Value = 0 then
              CreateAccNo;
            DataForm2.AccountsTable.Post;
          except
            on E : Exception do
              showmessage(E.Message);
          end;
        end;
end;

procedure TAccountsForm.Showdates();
begin
        IF (DataForm2.AccountsTable.FieldByname('BeginDate').asInteger = 0) then
        begin
          showmessage('This Member don''t have an Begin Date!');
          BeginDateEdit.Date := BeginDateEdit.NullDate;
        end
        else
          BeginDateEdit.Date := StrtoDate(IntDatetoString(DataForm2.AccountsTable.FieldByname('BeginDate').asInteger));
        if (DataForm2.AccountsTable.FieldByname('EndDate').asInteger = 0) then
        begin
          EndDateEdit.Date := EndDateEdit.NullDate;
          EndDateEdit.Enabled := False;
        end
        else
        begin
          EndDateEdit.Enabled := True;
          EndDateEdit.Date := StrtoDate(IntDatetoString(DataForm2.AccountsTable.FieldByname('EndDate').asInteger));
        end;
end;

procedure TAccountsForm.PaymentforInvoiceClick(Sender: TObject);
var
      f:Currency;
begin
        if Dataform2.TransQueryPaymentType.Value = 'Invoice' then
        begin
          Application.CreateForm(TAddTransactionForm, AddTransactionForm);
          AddTransactionForm.FromWhere := FromWhere;
          AddTransactionForm.TType.ItemIndex := 0;
          AddTransactionForm.PRefNo.Text := Dataform2.TransQueryRefNo.Value;
          Dataform2.Query3.Close;
          with Dataform2.Query3.SQL do
          begin
            Clear;
            Add('Select Sum(Ammount) as Total from trans_db');
            Add('where (LinkID = ' + InttoStr(Dataform2.AccountsTable.FieldByName('Nr').asInteger) + ')');
            Add('and (BranchNo = ' + InttoStr(Dataform2.AccountsTable.FieldByName('BranchNo').asInteger) + ')');
//            Add('and (TYear = ' + YearStr + ')');
//            Add('and (TMonth = ' + MonthStr + ')');
            Add('and (TransType = "A")');
            Add('and (RefNo like "%' + Dataform2.TransQueryRefNo.Value + '%")');
            Add('and ((PaymentType = "Cash") or (PaymentType = "Cheques") or (PaymentType = "CreditCard") or (PaymentType = "Other"))');
          end;
          Dataform2.Query3.Open;
//          showmessage(floattostr(Dataform2.TransQueryAmmount.Value) + '==' + FloattoStr(Dataform2.Query3.FieldByName('Total').AsFloat));
          if FromWhere = 'Debtor' then
            f := Dataform2.TransQueryAmmount.Value - (Dataform2.Query3.FieldByName('Total').AsFloat * -1)
          else
            f := Dataform2.TransQueryAmmount.Value - Dataform2.Query3.FieldByName('Total').AsFloat;
          AddTRansactionForm.PAmount.Value := f;
          MonthStr := '0';
          YearStr := '0';
          OpenTransactions();
          AddTransactionForm.showmodal;
          Dataform2.Query3.Close;
          AddTransactionForm.Free;
        end
        else
          showmessage('Transaction is not an Invoice');
end;

procedure TAccountsForm.OpenTransactions();
begin
          if ((MonthStr = '0') and (YearStr = '0')) or (Combobox1.Items[Combobox1.ItemIndex] = '') then
          begin
            if FromWhere = 'Debtor' then
            begin
              if Dataform2.GlobalTableDActiveMonth.Value <> 0 then
              begin
                Monthstr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),5,2);
                YearStr := copy(InttoStr(Dataform2.GlobalTableDActiveMonth.Value),1,4);
              end
              else
              begin
                Monthstr := InttoStr(monthof(date));
                YearStr := InttoStr(yearof(date));
                Dataform2.GlobalTable.Edit;
                Dataform2.GlobalTableDActiveMonth.Value := StrtoInt(YearStr + MonthStr);
                Dataform2.GlobalTable.Post;
              end;
            end
            else
            begin
              if Dataform2.GlobalTableCActiveMonth.Value <> 0 then
              begin
                Monthstr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),5,2);
                YearStr := copy(InttoStr(Dataform2.GlobalTableCActiveMonth.Value),1,4);
              end
              else
              begin
                Monthstr := InttoStr(monthof(date));
                YearStr := InttoStr(yearof(date));
                Dataform2.GlobalTable.Edit;
                Dataform2.GlobalTableCActiveMonth.Value := StrtoInt(YearStr + MonthStr);
                Dataform2.GlobalTable.Post;
              end;
            end;
          end
          else
          begin
            Monthstr := copy(Combobox1.Items[Combobox1.ItemIndex],5,2);
            YearStr := copy(Combobox1.Items[Combobox1.ItemIndex],1,4);
          end;
          Dataform2.TransQuery.Close;
          with Dataform2.TransQuery.SQL do begin
            Clear;
            Add('Select * from trans_db');
            Add('where (LinkID = ' + InttoStr(Dataform2.AccountsTable.FieldByName('Nr').asInteger) + ')');
            Add('and (BranchNo = ' + InttoStr(Dataform2.AccountsTable.FieldByName('BranchNo').asInteger) + ')');
            Add('and (TYear = ' + YearStr + ')');
            Add('and (TMonth = ' + MonthStr + ')');
            Add('and (TransType = "A")');
            Add('order by TransOrder,Nr');
          end;
          DataForm2.TransQuery.Open;
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do begin
            Clear;
            Add('Select Sum(Ammount) as Total from trans_db');
            Add('where (LinkID = ' + InttoStr(Dataform2.AccountsTable.FieldByName('Nr').asInteger) + ')');
            Add('and (BranchNo = ' + InttoStr(Dataform2.AccountsTable.FieldByName('BranchNo').asInteger) + ')');
            Add('and (TYear = ' + YearStr + ')');
            Add('and (TMonth = ' + MonthStr + ')');
            Add('and (TransType = "A")');
          end;
          DataForm2.Query1.Open;
          AccountsForm.Label26.Caption := 'Statement Total: ' + floattostrf(Dataform2.Query1.FieldByName('Total').AsCurrency,ffCurrency,17,2);
          Dataform2.Query1.Close;
end;

procedure TAccountsForm.PrintA4(Report:TBaseReport);
var
        StatementTotal:Currency;
begin
      with report do
      begin
        NewA4Page(Report);

        OpenTransactions;

        StatementTotal := 0;
        Dataform2.TransQuery.DisableControls;
        DataForm2.TransQuery.first;
        try
          while not DataForm2.TransQuery.EOF do
          begin
            NewLine;
            If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
            begin
              NewPage;
              NewA4Page(Report);
            end
            else
              Inc(linecount);
            PrintTab(DataForm2.TransQuery.Fieldbyname('Description').asString);
            PrintTab(IntDatetoString(Dataform2.TransQueryDate.Value));
            if Dataform2.TransQueryPaymentType.Value <> 'Other' then
              PrintTab(Dataform2.TransQueryPaymentType.Value)
            else
              PrintTab(Dataform2.GlobalTableOtherDescr.Value);
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              PrintTab(floattostrf(Dataform2.TransQueryAmmount.Value * 100 / (Dataform2.GlobalTableVat.Value + 100),ffCurrency,17,2));
              PrintTab(floattostrf(Dataform2.TransQueryAmmount.Value * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),ffCurrency,17,2));
              PrintTab(floattostrf(Dataform2.TransQueryAmmount.Value,ffCurrency,17,2));
            end
            else
            begin
              PrintTab(floattostrf(Dataform2.TransQueryAmmount.Value,ffCurrency,17,2));
            end;
            PrintTab(Dataform2.TransQueryRefNo.Value);
            StatementTotal := StatementTotal + Dataform2.TransQueryAmmount.Value;
            DataForm2.TransQuery.Next;
          end;
        finally
        end;
        Dataform2.TransQuery.EnableControls;
        NewLine;
        If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
        begin
          NewPage;
          NewA4Page(Report);
        end
        else
          Inc(linecount);

        Bold := True;
        PrintTab('Statement Total');
        PrintTab('');
        PrintTab('');
        if Dataform2.GlobalTableVat.Value <> 0 then
        begin
          PrintTab('');
          PrintTab('');
          PrintTab(floattostrf(StatementTotal,ffCurrency,17,2));
        end
        else
          PrintTab(floattostrf(StatementTotal,ffCurrency,17,2));

        PrintTab('');
        Bold := False;

        SetFont('Arial',10);

        NewLine;
        NewLine;
        Bold := True;
        printXY(0.250,DataForm2.IniFile.ReadFloat ('Settings', 'A4InvBottomStart', 8.5),'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;
        NewLine;
        printLeft('Name:',5.25);
        printLeft('_____________________',6.25);
        NewLine;
        printLeft('Date:',5.25);
        printLeft('_____________________',6.25);
        NewLine;
        NewLine;
        printLeft('Signature:',5.25);
        printLeft('_____________________',6.25);
        NewLine;
        NewLine;
        SetFont('Arial',DataForm2.IniFile.ReadInteger ('Settings', 'FooterFontSize', 10));
//        UserForm.Memo3.Lines.loadfromfile(Dataform2.AllUsersDataPath + '\invfooter.txt');
        UserForm.Memo3.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        for count := 0 to UserForm.Memo3.Lines.Count - 1 do
        begin
          printLeft(UserForm.Memo3.Lines[count], 0.5);
          NewLine;
        end;
        Bold := False;
        DataForm2.Query3.Close;
      end;
end;

procedure TAccountsForm.RvSystem1Print(Sender: TObject);
begin
        PrintA4(RvSystem1.BaseReport)
end;

procedure TAccountsForm.NewA4Page(Report:TBaseReport);
var
    logo: TBitmap;
begin
      with report do
      begin
        logo := TBitmap.Create;
        try
          logo.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
          PrintBitmapRect(0.75,0.50,4,3.25,logo);
        finally
        logo.Free;
        end;

        MarginLeft := 0.250;
        MarginTop := 0.5;
        SetFont('Arial',10);
        Bold := True;
        UserForm.Memo2.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        for count := 0 to UserForm.Memo2.Lines.Count - 1 do
        begin
          printLeft(UserForm.Memo2.Lines[count], 4.75);
          NewLine;
        end;
        linecount := 0;
        printLeft('---------------------------------------------------', 4.75);
        NewLine;
        if Fromwhere = 'Debtor' then
          printLeft('Debtor Statement', 4.75)
        else
          printLeft('Creditor Statement', 4.75);

        ClearTabs;
        SetTab(4.75, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,2.5,0,0,0);
        NewLine;
        SetFont('Arial',8);
        printTab('Name:');
        PrintTab(DataForm2.AccountsTable.FieldByName('Surname').asString + ' ' + DataForm2.AccountsTable.FieldByName('Name').asString);
        NewLine;
        if DataForm2.AccountsTableCompanyName.asString <> '' then
        begin
          printTab('Company Name:');
          PrintTab(DataForm2.AccountsTableCompanyName.asString);
          NewLine;
        end;
        NewLine;
        Bold := False;
        if DataForm2.AccountsTable.Fieldbyname('ID').asString <> '' then
        begin
          printTab('ID / Vat No:');
          PrintTab(DataForm2.AccountsTable.Fieldbyname('ID').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('PAdr1').asString <> '' then
        begin
          printTab('Address:');
          printTab(DataForm2.AccountsTable.Fieldbyname('PAdr1').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('PAdr2').asString <> '' then
        begin
          printTab('');
          printTab(DataForm2.AccountsTable.Fieldbyname('PAdr2').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('PAdr3').asString <> '' then
        begin
          printTab('');
          printTab(DataForm2.AccountsTable.Fieldbyname('PAdr3').asString + ' ' + DataForm2.AccountsTable.Fieldbyname('PCode').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('Tel').asString <> '' then
        begin
          printTab('Tel:');
          printTab(DataForm2.AccountsTable.Fieldbyname('Tel').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('TelC').asString <> '' then
        begin
          printTab('Tel (C):');
          printTab(DataForm2.AccountsTable.Fieldbyname('TelC').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('TelF').asString <> '' then
        begin
          printTab('Tel (F):');
          printTab(DataForm2.AccountsTable.Fieldbyname('TelF').asString);
          NewLine;
        end;
        if DataForm2.AccountsTable.Fieldbyname('RefNo').asString <> '' then
        begin
          printTab('Ref No:');
          printTab(DataForm2.AccountsTable.Fieldbyname('RefNo').asString);
          NewLine;
        end;
        NewLine;
        printTab('Statement By:');
        printTab(Dataform2.User_dbUserName.Value);
        NewLine;
        printTab('Statement Date:');
        printTab(datetostr(date));
        NewLine;
        printTab('Account No:');
        printTab(InttoStr(DataForm2.AccountsTable.Fieldbyname('AccNo').asInteger) + '/' + InttoStr(DataForm2.AccountsTable.Fieldbyname('BranchNo').asInteger));
        NewLine;
        Bold := True;
        printXY(0.250,3.4,'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;

        SetFont('Arial',8);

        ClearTabs;
        if Dataform2.GlobalTableVat.Value <> 0 then
          SetTab(0.3, pjCenter,2,0,0,0)
        else
          SetTab(1, pjCenter,2,0,0,0);
        SetTab(NA, pjCenter,0.8,0,0,0);
        SetTab(NA, pjCenter,1,0,0,0);
        if Dataform2.GlobalTableVat.Value <> 0 then
        begin
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
        end
        else
        begin
          SetTab(NA, pjCenter,1,0,0,0);
        end;
        SetTab(NA, pjCenter,1,0,0,0);

        Bold := True;

        NewLine;
        PrintTab('Description');
        PrintTab('Date');
        PrintTab('Transaction Type');
        if Dataform2.GlobalTableVat.Value <> 0 then
        begin
          PrintTab('Amount Ex');
          PrintTab('VAT');
          PrintTab('Amount Inc');
        end
        else
        begin
          PrintTab('Amount');
        end;
        PrintTab('Ref No');
        Bold := false;
        ClearTabs;
        if Dataform2.GlobalTableVat.Value <> 0 then
          SetTab(0.3, pjLeft,2,0,BOXLINEALL,0)
        else
          SetTab(1, pjLeft,2,0,BOXLINEALL,0);
        SetTab(NA, pjLeft,0.8,0,BOXLINEALL,0);
        SetTab(NA, pjLeft,1,0,BOXLINEALL,0);
        if Dataform2.GlobalTableVat.Value <> 0 then
        begin
          SetTab(NA, pjRight,1,0,BOXLINEALL,0);
          SetTab(NA, pjRight,1,0,BOXLINEALL,0);
          SetTab(NA, pjRight,1,0,BOXLINEALL,0);
        end
        else
        begin
          SetTab(NA, pjRight,1,0,BOXLINEALL,0);
        end;
        SetTab(NA, pjRight,1,0,BOXLINEALL,0);
      end;
end;

procedure TAccountsForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

end.
