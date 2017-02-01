unit AccountSearchFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, db, JvExButtons, JvBitBtn,
  JvExDBGrids, JvDBGrid;

type
  TAccountSearchForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure GetCredDetailfromTC;
    procedure GetDebDetailfromTC;
    procedure TestFromWhere;
    procedure GetAccDebDetailfromTC;
    { Private declarations }
  public
    { Public declarations }
    FromWhere, Order: String;
  end;

var
  AccountSearchForm: TAccountSearchForm;

implementation
  uses InvoiceFrm, TCDataMod, TCsettingsFrm, DataFrm2;

{$R *.dfm}

procedure TAccountSearchForm.FormShow(Sender: TObject);
begin
        AccountSearchForm.Left := 10;
        AccountSearchForm.Top := Screen.Height - 400;
        If Order = '' then
        begin
          TCData.tblAccount.Close;
          TCData.tblAccount.IndexName := 'Ind_AccountCode';
          TCData.tblAccount.Open;
          Order := 'SAccountCode';
        end;
end;

procedure TAccountSearchForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        AccountSearchform.FreeOnRelease;
end;

procedure TAccountSearchForm.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
        If ACol = 0 then
        begin
          TCData.tblAccount.Close;
          TCData.tblAccount.IndexName := 'Ind_AccountCode';
          TCData.tblAccount.Open;
          Order := 'SAccountCode';
        end;
        If ACol = 1 then
        begin
          TCData.tblAccount.Close;
          TCData.tblAccount.IndexFieldNames := 'SDescription';
          TCData.tblAccount.Open;
          Order := 'SDescription';
        end;
end;

procedure TAccountSearchForm.JvDBGrid1DblClick(Sender: TObject);
begin
      TestFromWhere;
end;

procedure TAccountSearchForm.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
//      showmessage(InttoHex(Ord(Key), 2));
      If Key = #13 then
      begin
        TestFromWhere;
      end
      else
      begin
        If Key <> #00 then
          TCData.tblAccount.Locate(Order, Key, [loPartialKey, loCaseInsensitive]);
      end;
end;

procedure TAccountSearchForm.GetCredDetailfromTC();
begin
          TCData.creditordetail.Open;
          if Dataform2.InvoiceTableClientName.Value <> TCData.tblAccountSDescription.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientName.Value := TCData.tblAccountSDescription.Value;
          end;
          if Dataform2.InvoiceTableClientTelW.Value <> TCData.creditordetailSTelephone1.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelW.Value := TCData.creditordetailSTelephone1.Value;
          end;
          if Dataform2.InvoiceTableClientTelC.Value <> TCData.creditordetailSTelephone2.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelC.Value := TCData.creditordetailSTelephone2.Value;
          end;
          if Dataform2.InvoiceTableClientAdr1.Value <> TCData.creditordetailSPostal1.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr1.Value := TCData.creditordetailSPostal1.Value;
          end;
          if Dataform2.InvoiceTableClientAdr2.Value <> TCData.creditordetailSPostal2.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr2.Value := TCData.creditordetailSPostal2.Value;
          end;
          if Dataform2.InvoiceTableClientAdr3.Value <> TCData.creditordetailSPostal3.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr3.Value := TCData.creditordetailSPostal3.Value;
          end;
          if Dataform2.InvoiceTableClientPCode.Value <> TCData.creditordetailSPostalCode.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientPCode.Value := TCData.creditordetailSPostalCode.Value;
          end;
          if Dataform2.InvoiceTableClientVatNo.Value <> TCData.creditordetailSReference.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientVatNo.Value := TCData.creditordetailSReference.Value;
          end;
          if Dataform2.InvoiceTableClientEMail.Value <> TCData.creditordetailSEmail.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientEMail.Value := TCData.creditordetailSEmail.Value;
          end;
          TCData.creditordetail.Close;
end;

procedure TAccountSearchForm.GetDebDetailfromTC();
begin
          TCData.tblDebtor.Open;
          if Dataform2.InvoiceTableClientName.Value <> TCData.tblAccountSDescription.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientName.Value := TCData.tblAccountSDescription.Value;
          end;
          if Dataform2.InvoiceTableClientTelW.Value <> TCData.tblDebtorSTelephone1.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelW.Value := TCData.tblDebtorSTelephone1.Value;
          end;
          if Dataform2.InvoiceTableClientTelC.Value <> TCData.tblDebtorSTelephone2.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientTelC.Value := TCData.tblDebtorSTelephone2.Value;
          end;
          if Dataform2.InvoiceTableClientAdr1.Value <> TCData.tblDebtorSPostal1.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr1.Value := TCData.tblDebtorSPostal1.Value;
          end;
          if Dataform2.InvoiceTableClientAdr2.Value <> TCData.tblDebtorSPostal2.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr2.Value := TCData.tblDebtorSPostal2.Value;
          end;
          if Dataform2.InvoiceTableClientAdr3.Value <> TCData.tblDebtorSPostal3.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientAdr3.Value := TCData.tblDebtorSPostal3.Value;
          end;
          if Dataform2.InvoiceTableClientPCode.Value <> TCData.tblDebtorSPostalCode.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientPCode.Value := TCData.tblDebtorSPostalCode.Value;
          end;
          if Dataform2.InvoiceTableClientVatNo.Value <> TCData.tblDebtorSReference.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientVatNo.Value := TCData.tblDebtorSReference.Value;
          end;
          if Dataform2.InvoiceTableClientEMail.Value <> TCData.tblDebtorSEmail.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableClientEMail.Value := TCData.tblDebtorSEmail.Value;
          end;
          TCData.tblDebtor.Close;
end;

procedure TAccountSearchForm.TestFromWhere();
begin
        If FromWhere = 'Purchases' then
        begin
          FromWhere := '';
          GetCredDetailfromTC;
          if Dataform2.InvoiceTableGLDebNo.Value <> TCData.tblAccountSAccountCode.Value then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableGLDebNo.Value := TCData.tblAccountSAccountCode.Value;
          end;
          close;
        end;
        If FromWhere = 'OutputTax' then
        begin
          TCSettingsForm.Edit2.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'InputTax' then
        begin
          TCSettingsForm.Edit7.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'SalesAccount' then
        begin
          TCSettingsForm.Edit8.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'CostofSales' then
        begin
          TCSettingsForm.Edit9.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'StockControl' then
        begin
          TCSettingsForm.Edit10.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'LBCredAcc' then
        begin
          TCSettingsForm.Edit14.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'LBdebAcc' then
        begin
          TCSettingsForm.Edit15.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'CashDebAcc' then
        begin
          if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
            Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableTCCashDebNo.Value := TCData.tblAccountSAccountCode.Value;
        //          TCSettingsForm.Edit1.Text := TCData.tblAccountSAccountCode.Value;
          close;
        end;
        If FromWhere = 'BankAcc' then
        begin
          TCSettingsForm.Edit3.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'DebCntrlAcc' then
        begin
          TCSettingsForm.Edit17.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'CrdCntrlAcc' then
        begin
          TCSettingsForm.Edit19.Text := InttoStr(TCData.tblAccountWAccountID.Value);
          close;
        end;
        If FromWhere = 'InvDebAcc' then
        begin
          GetDebDetailfromTC;
          if Dataform2.InvoiceTableGLDebNo.Value <> TCData.tblAccountSAccountCode.Value then
          begin
            if (DataForm2.InvoiceItemTablestrState <> 'Edit') and (DataForm2.InvoiceItemTablestrState <> 'Insert') then
              DataForm2.InvoiceTable.Edit;
            Dataform2.InvoiceTableGLDebNo.Value := TCData.tblAccountSAccountCode.Value;
            InvoiceForm.Caption := 'Debtor Invoice (' + Dataform2.InvoiceTableClientName.Value + ')';
            DataForm2.InvoiceTable.Post;
          end;
          close;
        end;
        if FromWhere = 'AccountDebtor' then
        begin
          GetAccDebDetailfromTC;
          if Dataform2.AccountsTableTCNo.Value <> TCData.tblAccountSAccountCode.Value then
          begin
            Dataform2.AccountsTableTCNo.Value := TCData.tblAccountSAccountCode.Value;
          end;
          close;
        end;
end;

procedure TAccountSearchForm.GetAccDebDetailfromTC();
begin
          TCData.tblDebtor.Open;
          Dataform2.AccountsTableCompanyName.Value := TCData.tblAccountSDescription.Value;
          Dataform2.AccountsTableTel.Value := TCData.tblDebtorSTelephone1.Value;
          Dataform2.AccountsTableTelC.Value := TCData.tblDebtorSTelephone2.Value;
          Dataform2.AccountsTablePAdr1.Value := TCData.tblDebtorSPostal1.Value;
          Dataform2.AccountsTablePAdr2.Value := TCData.tblDebtorSPostal2.Value;
          Dataform2.AccountsTablePAdr3.Value := TCData.tblDebtorSPostal3.Value;
          Dataform2.AccountsTablePCode.Value := TCData.tblDebtorSPostalCode.Value;
          Dataform2.AccountsTableID.Value := TCData.tblDebtorSReference.Value;
          Dataform2.AccountsTableEMail.Value := TCData.tblDebtorSEmail.Value;
          TCData.tblDebtor.Close;
end;

end.
