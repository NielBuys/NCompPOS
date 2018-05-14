unit CashUpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, JvExControls, JvDBLookup, UtilsUnit;

type
  TCashUpForm = class(TForm)
    GroupBox1: TGroupBox;
    JvDBLookupCombo1: TJvDBLookupCombo;
    Label1: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Button2: TButton;
    BitBtn1: TBitBtn;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    DBText8: TDBText;
    DBEdit4: TDBEdit;
    DBText9: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure CreateCashUp;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashUpForm: TCashUpForm;
  LastDocNo, TransActFromWhere :string;
  LastDocID : Integer;
  SNextPOSInv : String ='';
  Batchtotal: Currency;

implementation
    uses DataFrm2, InvoiceFrm, Listsmnu, PurchaseFrm, TCDataMod;
{$R *.dfm}

procedure TCashUpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        if (DataForm2.CashUpTablestrState = 'Edit') or (DataForm2.CashUpTablestrState = 'Insert') then
        begin
          DataForm2.CashUpTable.Cancel;
        end;
        Dataform2.CashUpTable.Close;
        Dataform2.Query1Source.Enabled := False;
        DataForm2.Query1.Close;
end;

procedure TCashUpForm.FormShow(Sender: TObject);
begin
        Label8.Caption := Dataform2.GlobalTableOtherDescr.Value;
        Label9.Caption := Dataform2.GlobalTableOtherDescr.Value;
        if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
        begin
          Dataform2.Query1.Close;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('SELECT UserName FROM user_db');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query1Source.Enabled := True;
          GroupBox2.Visible := True;
          GroupBox3.Visible := True;
          DBText5.Visible := True;
          DBText6.Visible := True;
          DBText7.Visible := True;
          DBText8.Visible := True;
        end
        else
        begin
          Dataform2.Query1.Close;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('SELECT UserName FROM user_db');
            Add('Where UserName = "' + DataForm2.User_db.FieldByName('UserName').asString + '"');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query1Source.Enabled := True;
          if (StrtoBool(Dataform2.GlobalTableUsr3AllowVisibleCashup.Value) = True) then
          begin
            GroupBox2.Visible := True;
            GroupBox3.Visible := True;
            DBText5.Visible := True;
            DBText6.Visible := True;
            DBText7.Visible := True;
            DBText9.Visible := True;
          end
          else
          begin
            GroupBox2.Visible := False;
            GroupBox3.Visible := False;
            DBText5.Visible := False;
            DBText6.Visible := False;
            DBText7.Visible := False;
            DBText9.Visible := False;
          end;
        end;
end;

procedure TCashUpForm.BitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TCashUpForm.Button1Click(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to do cash up for user ' + DataForm2.Query1.Fieldbyname('UserName').asString, mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
      begin
        If Groupbox3.Visible = False then
          Groupbox3.Visible := True;
        InvoiceForm.KickDrawer();
        Dataform2.CashUpTable.Open;
        JvDBLookupCombo1.Enabled := False;
        CreateCashUp;
        If (DataForm2.CashUpTable.FieldByName('RealCashTotal').asFloat = 0) and
           (DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asFloat = 0) and
           (DataForm2.CashUpTable.FieldByName('RealChequesTotal').asFloat = 0) and
           (DataForm2.CashUpTable.FieldByName('RealOtherTotal').asFloat = 0) then
        begin
          showmessage('There is nothing to cashup!');
          Dataform2.CashUpTable.Close;
          JvDBLookupCombo1.Enabled := True;
        end;
      end;
end;

procedure TCashUpForm.CreateCashUp();
var
    e: Currency;
    s:String;
    i: Integer;
begin
      DataForm2.CashUpTable.Insert;
      DataForm2.CashUpTable.FieldByName('Date').asInteger := DatetoIntDate(date);
      Dataform2.CashUpTable.FieldByName('User').asString := Dataform2.Query1.Fieldbyname('UserName').asString;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(InvTotal) as Total FROM invoice_db');
        Add('where (InvoiceType = "Cash") and (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency := Dataform2.Query2.Fieldbyname('Total').asCurrency;
      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(Ammount) as Total FROM trans_db');
        Add('where (PaymentType = "Cash") and (CUSet is null) and (PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (TransType = "L")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(trans_db.Ammount)*-1 as Total FROM trans_db');
        Add('left join accounts_db on (accounts_db.Nr = trans_db.LinkID) and (accounts_db.BranchNo = trans_db.BranchNo)');
        Add('where (trans_db.PaymentType = "Cash") and (trans_db.CUSet is null) and (trans_db.PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (trans_db.TransType = "A")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(InvTotal) as Total FROM invoice_db');
        Add('where (InvoiceType = "CreditCard") and (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency := Dataform2.Query2.Fieldbyname('Total').asCurrency;
      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(Ammount) as Total FROM trans_db');
        Add('where (PaymentType = "CreditCard") and (CUSet is null) and (PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (TransType = "L")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(trans_db.Ammount)*-1 as Total FROM trans_db');
        Add('left join accounts_db on (accounts_db.Nr = trans_db.LinkID) and (accounts_db.BranchNo = trans_db.BranchNo)');
        Add('where (trans_db.PaymentType = "CreditCard") and (trans_db.CUSet is null) and (trans_db.PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (trans_db.TransType = "A")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(InvTotal) as Total FROM invoice_db');
        Add('where (InvoiceType = "Cheques") and (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency := Dataform2.Query2.Fieldbyname('Total').asCurrency;
      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(Ammount) as Total FROM trans_db');
        Add('where (PaymentType = "Cheques") and (CUSet is null) and (PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (TransType = "L")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(trans_db.Ammount)*-1 as Total FROM trans_db');
        Add('left join accounts_db on (accounts_db.Nr = trans_db.LinkID) and (accounts_db.BranchNo = trans_db.BranchNo)');
        Add('where (trans_db.PaymentType = "Cheques") and (trans_db.CUSet is null) and (trans_db.PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (trans_db.TransType = "A")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(InvTotal) as Total FROM invoice_db');
        Add('where (InvoiceType = "' + Dataform2.GlobalTableOtherDescr.Value + '") and (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency := Dataform2.Query2.Fieldbyname('Total').asCurrency;
      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(Ammount) as Total FROM trans_db');
        Add('where (PaymentType = "Other") and (CUSet is null) and (PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (TransType = "L")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Sum(trans_db.Ammount)*-1 as Total FROM trans_db');
        Add('left join accounts_db on (accounts_db.Nr = trans_db.LinkID) and (accounts_db.BranchNo = trans_db.BranchNo)');
        Add('where (trans_db.PaymentType = "Other") and (trans_db.CUSet is null) and (trans_db.PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
        Add('and (trans_db.TransType = "A")');
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency + Dataform2.Query2.Fieldbyname('Total').asCurrency;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT Count(Nr) as Total FROM invoice_db');
        Add('where (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
      end;
      Dataform2.Query2.Open;
      DataForm2.CashUpTable.FieldByName('TotalInvoices').asInteger := Dataform2.Query2.Fieldbyname('Total').asInteger;

      DataForm2.Query2.Close;
      with DataForm2.Query2.SQL do begin
        Clear;
        Add('SELECT InvTotal, Premium, AmmTendered, InvoiceType FROM invoice_db');
        Add('where (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
        Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
      end;
      Dataform2.Query2.Open;
      Dataform2.Query2.DisableControls;
      DataForm2.Query2.First;
      while not DataForm2.Query2.EOF do
      begin
        If copy(Dataform2.Query2.FieldByName('InvoiceType').AsString,1,6) = 'Double' then
        begin
          If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,7,1) = 'C' then
          begin
            e := (Dataform2.Query2.Fieldbyname('AmmTendered').asCurrency + DataForm2.Query2.FieldByName('Premium').asCurrency) - Dataform2.Query2.FieldByName('InvTotal').asCurrency;
            DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCashTotal').asCurrency + (Dataform2.Query2.FieldByName('AmmTendered').asCurrency - e);
          end
          else
          begin
            If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,7,1) = 'R' then
            begin
              DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency + Dataform2.Query2.FieldByName('AmmTendered').asCurrency;
            end
            else
            begin
              If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,7,1) = 'H' then
              begin
                DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency + Dataform2.Query2.FieldByName('AmmTendered').asCurrency;
              end;
            end;
          end;
          If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,8,1) = 'R' then
          begin
            DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asCurrency + Dataform2.Query2.FieldByName('Premium').asCurrency;
          end
          else
          begin
            If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,8,1) = 'H' then
            begin
              DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealChequesTotal').asCurrency + Dataform2.Query2.FieldByName('Premium').asCurrency;
            end
            else
            begin
              If copy(DataForm2.Query2.Fieldbyname('InvoiceType').asString,8,1) = 'O' then
              begin
                DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency := DataForm2.CashUpTable.FieldByName('RealOtherTotal').asCurrency + Dataform2.Query2.FieldByName('Premium').asCurrency;
              end;
            end;
          end;
        end;
        DataForm2.Query2.Next;
      end;
      Dataform2.Query2.EnableControls;
      If (DataForm2.CashUpTable.FieldByName('RealCashTotal').asFloat = 0) and
         (DataForm2.CashUpTable.FieldByName('RealCreditCardTotal').asFloat = 0) and
         (DataForm2.CashUpTable.FieldByName('RealChequesTotal').asFloat = 0) and
         (DataForm2.CashUpTable.FieldByName('RealOtherTotal').asFloat = 0) then
      begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('SELECT Sum(InvTotal) as Total FROM invoice_db');
          Add('where (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
          Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")');
        end;
        Dataform2.Query2.Open;
        if (Dataform2.Query2.Fieldbyname('Total').asCurrency = 0) and (Dataform2.Query2.RecordCount > 0) then
        begin
          DataForm2.CashUpTable.Post;
          Dataform2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Update invoice_db set CUSet = ' + InttoStr(DataForm2.CashUpTable.FieldbyName('Nr').asInteger));
            Add('where (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
            Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
          end;
          Dataform2.Query2.ExecSQL;
        end;
      end;
      DataForm2.Query2.Close;
end;

procedure TCashUpForm.Button2Click(Sender: TObject);
begin
      if (DataForm2.CashUpTablestrState = 'Edit') or (DataForm2.CashUpTablestrState = 'Insert') then
      begin
        Dataform2.CashUpTableTimeStamp.Value := dateTimetostr(now);
        DataForm2.CashUpTable.Post;
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('Update invoice_db set CUSet = ' + InttoStr(DataForm2.CashUpTable.FieldbyName('Nr').asInteger));
          Add('where (CUSet is null) and (InvBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '") and (Invclose = "Close")');
          Add('and (GLDebNo = "' + Dataform2.GlobalTableTCCashDebNo.Value + '")')
        end;
        Dataform2.Query2.ExecSQL;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('update trans_db set CUSet = ' + InttoStr(DataForm2.CashUpTable.FieldbyName('Nr').asInteger));
          Add('where (CUSet is null) and (PaymentBy = "' + Dataform2.Query1.Fieldbyname('UserName').asString + '")');
          Add('and ((PaymentType = "Other") or (PaymentType = "Cheques") or (PaymentType = "CreditCard") or (PaymentType = "Cash"))');
        end;
        Dataform2.Query2.ExecSQL;
        DataForm2.CashUpTable.Close;
        JvDBLookupCombo1.Enabled := True;
      end;
end;


end.
