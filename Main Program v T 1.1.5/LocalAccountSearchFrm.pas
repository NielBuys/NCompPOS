unit LocalAccountSearchFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, RpDefine, RpBase, RpSystem,
  Menus, Easysize, DBGrids, JvExDBGrids, JvDBGrid, JvExButtons, JvBitBtn,
  JvExStdCtrls, JvCombobox, JvEdit, UtilsUnit, Registry, db;

type
  TLocalAccountSearchForm = class(TForm)
    Panel1: TPanel;
    SearchEdit: TJvEdit;
    Label1: TLabel;
    JvComboBox1: TJvComboBox;
    SearchBtn: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvBitBtn2: TJvBitBtn;
    FormResizer1: TFormResizer;
    JvBitBtn3: TJvBitBtn;
    ShowAccount: TJvBitBtn;
    MainMenu1: TMainMenu;
    ShortCuts1: TMenuItem;
    SearchButtonSelect1: TMenuItem;
    SearchBySelect1: TMenuItem;
    SearchTextSelect1: TMenuItem;
    ListSelect1: TMenuItem;
    CloseWindow1: TMenuItem;
    Lists1: TMenuItem;
    PrintAccountList1: TMenuItem;
    RvSystem1: TRvSystem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure ShowAccountClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchButtonSelect1Click(Sender: TObject);
    procedure SearchBySelect1Click(Sender: TObject);
    procedure SearchTextSelect1Click(Sender: TObject);
    procedure ListSelect1Click(Sender: TObject);
    procedure PrintAccountList1Click(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
  private
    procedure OpenSearchAccounts();
    procedure PrintDebtorList(Report: TBaseReport);
    { Private declarations }
  public
    FromWhere, order, searchdata: String;
    procedure SetInvoiceData(AccNr:Integer);
    { Public declarations }
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  LocalAccountSearchForm: TLocalAccountSearchForm;
  PrintfromWhere: String;

implementation
      uses Datafrm2, AccountsFrm, UserFrm;

{$R *.dfm}

procedure TLocalAccountSearchForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Dataform2.AccountsTable.Close;
        Dataform2.Accountsearch.Close;
        if not DirectoryExists(Dataform2.UserDataPath + '\NCompPOS') then
          CreateDir(Dataform2.UserDataPath + '\NCompPOS');
        JvDBGrid1.Columns.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\LocalAccSearch');
end;

procedure TLocalAccountSearchForm.FormCreate(Sender: TObject);
begin
        FormResizer1.InitializeForm;
end;

procedure TLocalAccountSearchForm.FormResize(Sender: TObject);
begin
        FormResizer1.ResizeAll;
end;

procedure TLocalAccountSearchForm.FormShow(Sender: TObject);
begin
        LocalAccountSearchForm.Width := Screen.Width;
        LocalAccountSearchForm.Left := 1;
        if FromWhere = 'Debtor' then
        begin
          LocalAccountSearchForm.Caption := 'Debtor Account Search Form';
          JvBitBtn3.Caption := 'Add New Debtor Account';
          JvBitBtn3.Enabled := True;
          ShowAccount.Enabled := True;
          try
            SearchEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastDSearch');
          except
            SearchEdit.Text := '';
          end;
          try
            JvCombobox1.ItemIndex := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastDSearchType');
          except
            JvCombobox1.ItemIndex := 1;
          end;
        end;
        if FromWhere = 'IDebtor' then
        begin
          LocalAccountSearchForm.Caption := 'Debtor Account Search Form (Enter or Dbl Click to Select)';
          JvBitBtn3.Caption := 'Add New Debtor Account';
          JvBitBtn3.Enabled := False;
          ShowAccount.Enabled := False;
          try
            SearchEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastDSearch');
          except
            SearchEdit.Text := '';
          end;
          try
            JvCombobox1.ItemIndex := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastDSearchType');
          except
            JvCombobox1.ItemIndex := 1;
          end;
        end;
        if FromWhere = 'Creditor' then
        begin
          LocalAccountSearchForm.Caption := 'Creditor Account Search Form';
          JvBitBtn3.Caption := 'Add New Creditor Account';
          JvBitBtn3.Enabled := True;
          ShowAccount.Enabled := True;
          try
            SearchEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastCSearch');
          except
            SearchEdit.Text := '';
          end;
          try
            JvCombobox1.ItemIndex := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastCSearchType');
          except
            JvCombobox1.ItemIndex := 1;
          end;
        end;
        if FromWhere = 'ICreditor' then
        begin
          LocalAccountSearchForm.Caption := 'Creditor Account Search Form (Enter or Dbl Click to Select)';
          JvBitBtn3.Caption := 'Add New Creditor Account';
          JvBitBtn3.Enabled := False;
          ShowAccount.Enabled := False;
          try
            SearchEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastCSearch');
          except
            SearchEdit.Text := '';
          end;
          try
            JvCombobox1.ItemIndex := GetRegistryData(HKEY_CURRENT_USER,'\Software\Riskfin', 'LastCSearchType');
          except
            JvCombobox1.ItemIndex := 1;
          end;
        end;
        if FileExists(Dataform2.UserDataPath + '\NCompPOS\LocalAccSearch') then
          JvDBGrid1.Columns.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\LocalAccSearch');
end;

procedure TLocalAccountSearchForm.SearchBtnClick(Sender: TObject);
begin
      if JvCombobox1.ItemIndex = 0 then
      begin
        order := 'AccNo';
        searchdata := 'where AccNo LIKE "%' + SearchEdit.text + '%"';
      end;
      if JvCombobox1.ItemIndex = 1 then
      begin
        order := 'Surname';
        searchdata := 'where Surname LIKE "%' + SearchEdit.text + '%"';
      end;
      if JvCombobox1.ItemIndex = 2 then
      begin
        order := 'CompanyName';
        searchdata := 'where CompanyName LIKE "%' + SearchEdit.text + '%"';
      end;
      if JvCombobox1.ItemIndex = 3 then
      begin
        order := 'ID';
        searchdata := 'where ID LIKE "%' + SearchEdit.text + '%"';
      end;
      OpenSearchAccounts();
      if (FromWhere = 'IDebtor') or (FromWhere = 'Debtor') then
      begin
        SetRegistryData(HKEY_CURRENT_USER,
          '\Software\Riskfin\',
          'LastDSearch', rdString, SearchEdit.Text);
        SetRegistryData(HKEY_CURRENT_USER,
          '\Software\Riskfin\',
          'LastDSearchType', rdInteger, JvCombobox1.ItemIndex);
      end
      else
      begin
        SetRegistryData(HKEY_CURRENT_USER,
          '\Software\Riskfin\',
          'LastCSearch', rdString, SearchEdit.Text);
        SetRegistryData(HKEY_CURRENT_USER,
          '\Software\Riskfin\',
          'LastCSearchType', rdInteger, JvCombobox1.ItemIndex);

      end;
end;

procedure TLocalAccountSearchForm.JvBitBtn2Click(Sender: TObject);
begin
              Close;
end;

procedure TLocalAccountSearchForm.JvBitBtn3Click(Sender: TObject);
var
      AccTypeInt: Integer;
begin
        Application.CreateForm(TAccountsForm, AccountsForm);
        if FromWhere = 'Debtor' then
          AccTypeInt := 1;
        if FromWhere = 'Creditor' then
          AccTypeInt := 2;
        Dataform2.AccountsTable.Close;
        with Dataform2.AccountsTable.SQL do
        begin
          Clear;
          Add('select * from accounts_db');
          Add('where AccType = ' + InttoStr(AccTypeInt));
        end;
        Dataform2.AccountsTable.Open;
        AccountsForm.FromWhere := FromWhere;
        AccountsForm.AddNewAccount;
        AccountsForm.ShowModal;
        Dataform2.AccountsTable.Close;
        AccountsForm.Free;
end;

procedure TLocalAccountSearchForm.JvDBGrid1DblClick(Sender: TObject);
begin
        if (FromWhere <> 'IDebtor') and (FromWhere <> 'ICreditor') then
          ShowAccount.Click
        else
        begin
          SetInvoiceData(Dataform2.AccountSearch.FieldByName('Nr').asInteger);
          close;
        end;
end;

procedure TLocalAccountSearchForm.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
      if Key = #13 then
      begin
        if (FromWhere <> 'IDebtor') and (FromWhere <> 'ICreditor') then
          ShowAccount.Click
        else
        begin
          SetInvoiceData(Dataform2.AccountSearch.FieldByName('Nr').asInteger);
          close;
        end;
      end;
end;

procedure TLocalAccountSearchForm.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if order <> FieldStore then
      begin
        order := FieldStore;
        OpenSearchAccounts();
      end
      else
      begin
        order := FieldStore + ' Desc';
        OpenSearchAccounts();
      end;
end;

procedure TLocalAccountSearchForm.ListSelect1Click(Sender: TObject);
begin
          JvDBGrid1.SetFocus;
end;

procedure TLocalAccountSearchForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

procedure TLocalAccountSearchForm.OpenSearchAccounts();
var
        sortaccount: String;
begin
        if (FromWhere = 'Debtor') or (FromWhere = 'IDebtor') then
          sortaccount := 'and AccType = 1'
        else
          sortaccount := 'and AccType = 2';

        Dataform2.Accountsearch.Close;
        with Dataform2.Accountsearch.SQL do
        begin
          Clear;
          Add('select Nr,AccNo,BranchNo,Surname,Name,CompanyName,ID,Total,BeginDate,EndDate,RefNo,Tel,AllowCredit,EMail from accounts_db');
          Add(Searchdata);
          Add(sortaccount);
          Add('order by ' + order);
        end;
        Dataform2.Accountsearch.Open;
end;

procedure TLocalAccountSearchForm.ShowAccountClick(Sender: TObject);
begin
        Application.CreateForm(TAccountsForm, AccountsForm);
        Dataform2.AccountsTable.Close;
        with Dataform2.AccountsTable.SQL do
        begin
          Clear;
          Add('select * from accounts_db');
          Add('where Nr = ' + InttoStr(Dataform2.AccountSearch.FieldByName('Nr').asInteger));
          Add('and BranchNo = ' + InttoStr(Dataform2.AccountSearchBranchNo.AsInteger));
        end;
        Dataform2.AccountsTable.Open;
        AccountsForm.FromWhere := FromWhere;
        AccountsForm.ShowModal;
        Dataform2.AccountsTable.Close;
        AccountsForm.Free;
end;

procedure TLocalAccountSearchForm.SearchButtonSelect1Click(Sender: TObject);
begin
          SearchBtn.SetFocus;
end;

procedure TLocalAccountSearchForm.SearchBySelect1Click(Sender: TObject);
begin
          JvCombobox1.SetFocus;
end;

procedure TLocalAccountSearchForm.SearchTextSelect1Click(Sender: TObject);
begin
          SearchEdit.SetFocus;
          SearchEdit.SelectAll;
end;

procedure TLocalAccountSearchForm.SetInvoiceData(AccNr:Integer);
begin
          Dataform2.AccountsTable.Close;
          with Dataform2.AccountsTable.SQL do
          begin
            Clear;
            Add('select * from accounts_db');
            Add('where Nr = ' + InttoStr(AccNr));
          end;
          Dataform2.AccountsTable.Open;
          if (Dataform2.AccountsTableCompanyName.Value = '') or (Dataform2.AccountsTableCompanyName.IsNull) then
          begin
            if Dataform2.InvoiceTableClientName.Value <> Dataform2.AccountsTableSurname.Value + ' ' + Dataform2.AccountsTableName.Value then
            begin
              if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                Dataform2.InvoiceTable.Edit;
              Dataform2.InvoiceTableClientName.Value := Dataform2.AccountsTableSurname.Value + ' ' + Dataform2.AccountsTableName.Value;
            end;
          end
          else
          begin
            if Dataform2.InvoiceTableClientName.Value <> Dataform2.AccountsTableCompanyName.Value then
            begin
              if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                Dataform2.InvoiceTable.Edit;
              Dataform2.InvoiceTableClientName.Value := Dataform2.AccountsTableCompanyName.Value;
            end;
          end;
          if Dataform2.InvoiceTableClientTelW.Value <> Dataform2.AccountsTableTel.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelW.Value := Dataform2.AccountsTableTel.Value;
          end;
          if Dataform2.InvoiceTableClientTelC.Value <> Dataform2.AccountsTableTelC.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelC.Value := Dataform2.AccountsTableTelC.Value;
          end;
          if Dataform2.InvoiceTableClientAdr1.Value <> Dataform2.AccountsTablePAdr1.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr1.Value := Dataform2.AccountsTablePAdr1.Value;
          end;
          if Dataform2.InvoiceTableClientAdr2.Value <> Dataform2.AccountsTablePAdr2.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr2.Value := Dataform2.AccountsTablePAdr2.Value;
          end;
          if Dataform2.InvoiceTableClientAdr3.Value <> Dataform2.AccountsTablePAdr3.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr3.Value := Dataform2.AccountsTablePAdr3.Value;
          end;
          if Dataform2.InvoiceTableClientPCode.Value <> Dataform2.AccountsTablePCode.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientPCode.Value := Dataform2.AccountsTablePCode.Value;
          end;
          if Dataform2.InvoiceTableClientVatNo.Value <> Dataform2.AccountsTableID.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientVatNo.Value := Dataform2.AccountsTableID.Value;
          end;
          if Dataform2.InvoiceTableClientEMail.Value <> Dataform2.AccountsTableEMail.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientEMail.Value := Dataform2.AccountsTableEMail.Value;
          end;
          if Dataform2.InvoiceTableRefNo.Value <> Dataform2.AccountsTableRefNo.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableRefNo.Value := Dataform2.AccountsTableRefNo.Value;
          end;
          if Dataform2.InvoiceTableGLDebNo.Value <> InttoStr(Dataform2.AccountsTableBranchNo.Value) + '/' + InttoStr(Dataform2.AccountsTableAccNo.Value) then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableGLDebNo.Value := InttoStr(Dataform2.AccountsTableBranchNo.Value) + '/' + InttoStr(Dataform2.AccountsTableAccNo.Value);
          end;
          Dataform2.AccountsTable.Close;
end;

procedure TLocalAccountSearchForm.PrintAccountList1Click(Sender: TObject);
begin
        PrintFromWhere := 'FullDebtorList';
        RvSystem1.Execute;
end;

procedure TLocalAccountSearchForm.PrintDebtorList(Report:TBaseReport);
var
      LineCount:Integer;
      sortaccount: String;
begin
      if (FromWhere = 'Debtor') or (FromWhere = 'IDebtor') then
        sortaccount := 'where AccType = 1'
      else
        sortaccount := 'where AccType = 2';
      Dataform2.Query1.Close;
      with Dataform2.Query1.SQL do
      begin
        Clear;
        Add('select * from accounts_db');
        Add(sortaccount);
        Add('order by CompanyName');
      end;
      Dataform2.Query1.Open;
      with report do
      begin
        MarginTop := 0.5;
        MarginLeft := 0.5;
        SetFont('Arial',10);
        Bold := True;
        printCenter(Dataform2.GlobalTableReportTitle.Value, 4.25);
        NewLine;
        if (FromWhere = 'Debtor') or (FromWhere = 'IDebtor') then
          PrintCenter('Report of all Debtor Accounts ' + Datetostr(date),4.25)
        else
          PrintCenter('Report of all Creditor Accounts ' + Datetostr(date),4.25);
        NewLine;
        NewLine;
        SetFont('Arial',8);
        ClearTabs;
        SetTab(0.3, pjLeft,0.6,0,0,0);
        SetTab(NA, pjLeft,0.4,0,0,0);
        SetTab(NA, pjLeft,1.5,0,0,0);
        SetTab(NA, pjLeft,0.9,0,0,0);
        SetTab(NA, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,0.9,0,0,0);
        SetTab(NA, pjRight,0.65,0,0,0);
        SetTab(NA, pjRight,0.65,0,0,0);
        SetTab(NA, pjRight,0.75,0,0,0);
        PrintTab('Acc No');
        PrintTab('Branch');
        PrintTab('Company Name');
        PrintTab('Name');
        PrintTab('Surname');
        PrintTab('ID');
        PrintTab('Begin Date');
        PrintTab('End Date');
        PrintTab('Balance');
        Bold := False;
        NewLine;
        NewLine;
        LineCount := 1;
        Dataform2.Query1.DisableControls;
        try
          Dataform2.Query1.First;
          while not Dataform2.Query1.EOF do
          begin
              if LineCount > 70 then
              begin
                NewPage;
                LineCount := 1;
              end
              else
                Inc(LineCount);
              PrintTab(inttoStr(Dataform2.Query1.FieldByName('AccNo').asInteger));
              PrintTab(inttoStr(Dataform2.Query1.FieldByName('BranchNo').asInteger));
              PrintTab(Dataform2.Query1.FieldByName('CompanyName').asString);
              PrintTab(Dataform2.Query1.FieldByName('Name').asString);
              PrintTab(Dataform2.Query1.FieldByName('Surname').asString);
              PrintTab(Dataform2.Query1.FieldByName('ID').asString);
              PrintTab(IntDatetoString(Dataform2.Query1.FieldByName('BeginDate').asInteger));
              PrintTab(IntDatetoString(Dataform2.Query1.FieldByName('EndDate').asInteger));
              PrintTab(floattostrf(Dataform2.Query1.FieldByName('Total').asFloat,ffCurrency,17,2));
              NewLine;
            Dataform2.Query1.Next;
          end;
        finally
        end;
        Dataform2.Query1.EnableControls;
      end;
      Dataform2.Query1.Close;
      Dataform2.Query2.Close;
end;

procedure TLocalAccountSearchForm.RvSystem1Print(Sender: TObject);
begin
        if PrintFromWhere = 'FullDebtorList' then
          PrintDebtorList(RVSystem1.BaseReport);
end;

end.
