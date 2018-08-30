unit LayBuyFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, Easysize, JvExStdCtrls,
  JvCombobox, JvExButtons, JvBitBtn, JvExComCtrls, JvDateTimePicker, DBCtrls,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, db, UtilsUnit, Registry;

type
  TLayBuyForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    JvDBGrid2: TJvDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    InvoiceDateEdit: TJvDateTimePicker;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit11: TDBEdit;
    JvBitBtn1: TJvBitBtn;
    TabSheet2: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    TabSheet3: TTabSheet;
    JvBitBtn3: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    JvBitBtn8: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    GroupBox2: TGroupBox;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    JvBitBtn5: TJvBitBtn;
    Edit2: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    JvBitBtn7: TJvBitBtn;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    JvDateTimePicker1: TJvDateTimePicker;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    JvDBGrid3: TJvDBGrid;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Edit3: TEdit;
    JvBitBtn9: TJvBitBtn;
    JvBitBtn10: TJvBitBtn;
    JvBitBtn11: TJvBitBtn;
    Label17: TLabel;
    DBEdit23: TDBEdit;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    Label28: TLabel;
    DBEdit25: TDBEdit;
    Label29: TLabel;
    DBEdit26: TDBEdit;
    DoPaymentBtn: TJvBitBtn;
    Label30: TLabel;
    PaymentDateEdit: TJvDateTimePicker;
    Label31: TLabel;
    PremiumEdt: TEdit;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    JvBitBtn13: TJvBitBtn;
    JvBitBtn14: TJvBitBtn;
    Label33: TLabel;
    JvComboBox1: TJvComboBox;
    Label14: TLabel;
    LayBuyTotalDBText: TDBText;
    Label19: TLabel;
    PaydValueLbl: TLabel;
    Label35: TLabel;
    OwingValueLbl: TLabel;
    Label37: TLabel;
    JvComboBox2: TJvComboBox;
    Label38: TLabel;
    DBEdit10: TDBEdit;
    Label39: TLabel;
    DBEdit13: TDBEdit;
    FormResizer1: TFormResizer;
    Label40: TLabel;
    DBText3: TDBText;
    CheckBox1: TCheckBox;
    procedure JvBitBtn3Click(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure JvBitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn7Click(Sender: TObject);
    procedure JvDBGrid2TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure JvDBGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid2MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure JvDBGrid2MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure JvBitBtn9Click(Sender: TObject);
    procedure JvBitBtn10Click(Sender: TObject);
    procedure JvBitBtn11Click(Sender: TObject);
    procedure DoPaymentBtnClick(Sender: TObject);
    procedure JvBitBtn13Click(Sender: TObject);
    procedure JvBitBtn14Click(Sender: TObject);
    procedure JvComboBox1Exit(Sender: TObject);
    procedure InvoiceDateEditChange(Sender: TObject);
    procedure JvDateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    procedure ChangeLayBuy;
    procedure LayBuyDetailClose;
    procedure LayBuyDetailOpen;
    procedure OpenInvoice;
    { Private declarations }
  public
    { Public declarations }
    FromWhere, PTChanged: String;
  end;

var
  LayBuyForm: TLayBuyForm;
  Owing, Payed: Currency;
  OrderStr: String;
  SkipRefresh: Boolean;

implementation

uses DataFrm2, InvoiceFrm;

{$R *.dfm}

procedure TLayBuyForm.JvBitBtn3Click(Sender: TObject);
begin
        LaybuyDetailOpen;
        GroupBox1.SetFocus;
end;

procedure TLayBuyForm.JvBitBtn4Click(Sender: TObject);
begin
        LayBuyDetailClose;
        if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
        begin
          DataForm2.InvoiceTable.Post;
        end;
end;

procedure TLayBuyForm.JvBitBtn6Click(Sender: TObject);
begin
        if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
        begin
          DataForm2.InvoiceTable.Post;
        end;
        ChangeLayBuy;
        PageControl1.SelectNextPage(True);
end;

procedure TLayBuyForm.JvBitBtn8Click(Sender: TObject);
begin
        if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
        begin
          DataForm2.InvoiceTable.Post;
        end;
        PageControl1.ActivePage := TabSheet1;
end;

procedure TLayBuyForm.CheckBox1Click(Sender: TObject);
begin
        if SkipRefresh = False then
          OpenInvoice();
end;

procedure TLayBuyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        If FromWhere = 'MAIN' then
        begin
          Dataform2.InvoiceTable.Close;
          DataForm2.InvoiceTable.Filtered := False;
          Dataform2.InvoiceItemTable.Close;
          DataForm2.TransQuery.Close;
        end;
        LayBuyForm.FreeOnRelease;
end;

procedure TLayBuyForm.FormCreate(Sender: TObject);
begin
      FormResizer1.InitializeForm;
      SkipRefresh := True;
      try
        CheckBox1.Checked := StrtoBool(GetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS', 'LayBuyHideClosed'));
      except
        CheckBox1.Checked := False;
      end;
      SkipRefresh := False;
end;

procedure TLayBuyForm.FormDestroy(Sender: TObject);
begin
        SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','LayBuyHideClosed', rdString, BooltoStr(CheckBox1.Checked));
end;

procedure TLayBuyForm.FormResize(Sender: TObject);
begin
          FormResizer1.ResizeAll;
end;

procedure TLayBuyForm.FormShow(Sender: TObject);
begin
        If FromWhere = 'MAIN' then
        begin
          Tabsheet4.TabVisible := False;
          PageControl1.ActivePage := Tabsheet1;
          OrderStr := 'InvNo';
          OpenInvoice;
          ChangeLayBuy;
        end;
        If FromWhere = 'POS' then
        begin
          Tabsheet4.TabVisible := True;
          If dataForm2.InvoiceTableInvClose.Value <> 'LaybO' then
          begin
            PTChanged := '';
            PageControl1.ActivePage := Tabsheet4;
            JvDateTimePicker1.Date := StrtoDate(IntdatetoString(DataForm2.InvoiceTableInvDate.Value));
            PaymentDateEdit.Date := Date;
          end;
        end;
end;

procedure TLayBuyForm.JvBitBtn5Click(Sender: TObject);
var
    s: String;
begin
    If PTChanged <> '' then
    begin
      if MessageDlg('Are all the client detail filled out!', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
      begin
        If dataForm2.InvoiceTableInvClose.Value <> 'LaybO' then
        begin
          DataForm2.InvoiceTable.Edit;
          InvoiceForm.CreateInvNo;
          DataForm2.InvoiceTableInvClose.Value := 'LaybO';
          DataForm2.InvoiceTable.FieldByName('InvTotal').asCurrency := InvoiceForm.TotalStr;
          DataForm2.InvoiceTable.FieldByName('AmmTendered').asCurrency := InvoiceForm.TotalStr;
          Dataform2.InvoiceTableTermMonths.Value := Dataform2.GlobalTableLayBuyTerm.Value;
          Dataform2.InvoiceTablePremium.Value := (InvoiceForm.TotalStr - strtofloat(Edit1.Text)) / StrtoInt(Edit2.Text);
          DataForm2.InvoiceTable.FieldByName('InvoiceType').asString := 'LayBuy';
          DataForm2.InvoiceTable.Post;
          Dataform2.Query1.Close;
          s := '("Deposit",' + Edit1.Text + ',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger) + ',"' + JvComboBox2.Items[JvComboBox2.ItemIndex] + '","' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger) + ')';
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentType,PaymentBy,BranchNo) values ');
            Add(s);
          end;
          DataForm2.Query1.ExecSQL;
          Invoiceform.KickDrawer;
          InvoiceForm.FromWhereStatement := 'Other';
          InvoiceForm.ReceiptPrinting.Execute;
          Close;
        end;
      end;
    end
    else
      showmessage('Choose Payment Type first!');
end;

procedure TLayBuyForm.JvBitBtn7Click(Sender: TObject);
begin
          Label16.Caption := Floattostrf((InvoiceForm.TotalStr - strtofloat(Edit1.Text)) / StrtoInt(Edit2.Text),ffCurrency,17,2);
end;

procedure TLayBuyForm.JvDBGrid2TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
          If Acol = 0 then
          begin
            If OrderStr = 'InvNo' then
              OrderStr := 'InvNo DESC'
            else
              OrderStr := 'InvNo';
          end;
          If Acol = 1 then
          begin
            If OrderStr = 'BranchNo' then
              OrderStr := 'BranchNo DESC'
            else
              OrderStr := 'BranchNo';
          end;
          If Acol = 2 then
          begin
            If OrderStr = 'ClientName' then
              OrderStr := 'ClientName DESC'
            else
              OrderStr := 'ClientName';
          end;
          If Acol = 3 then
          begin
            If OrderStr = 'ClientVatNo' then
              OrderStr := 'ClientVatNo DESC'
            else
              OrderStr := 'ClientVatNo';
          end;
          If Acol = 4 then
          begin
            If OrderStr = 'InvDate' then
              OrderStr := 'InvDate DESC'
            else
              OrderStr := 'InvDate';
          end;
          If Acol = 5 then
          begin
            If OrderStr = 'InvBy' then
              OrderStr := 'InvBy DESC'
            else
              OrderStr := 'InvBy';
          end;
          If Acol = 6 then
          begin
            If OrderStr = 'InvTotal' then
              OrderStr := 'InvTotal DESC'
            else
              OrderStr := 'InvTotal';
          end;
          If Acol = 7 then
          begin
            If OrderStr = 'InvClose' then
              OrderStr := 'InvClose DESC'
            else
              OrderStr := 'InvClose';
          end;
          OpenInvoice;
end;

procedure TLayBuyForm.JvDBGrid2CellClick(Column: TColumn);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2DblClick(Sender: TObject);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
      if Dataform2.InvoiceTableInvClose.Value = 'LaybC' then
      begin
        JvDBGrid2.Canvas.Font.Color := clLime;
      end;
      if Dataform2.InvoiceTableInvClose.Value = 'LaybV' then
      begin
        JvDBGrid2.Canvas.Font.Color := clRed;
      end;
      JvDBGrid2.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TLayBuyForm.JvDBGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvDBGrid2MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvBitBtn9Click(Sender: TObject);
begin
          DataForm2.InvoiceTable.Locate('InvNo', Edit3.Text, [loPartialKey, loCaseInsensitive]);
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvBitBtn10Click(Sender: TObject);
begin
          DataForm2.InvoiceTable.Locate('ClientName', Edit3.Text, [loPartialKey, loCaseInsensitive]);
          ChangeLayBuy;
end;

procedure TLayBuyForm.JvBitBtn11Click(Sender: TObject);
begin
          DataForm2.InvoiceTable.Locate('ClientVatNo', Edit3.Text, [loPartialKey, loCaseInsensitive]);
          ChangeLayBuy;
end;

procedure TLayBuyForm.DoPaymentBtnClick(Sender: TObject);
var
      s: String;
begin
      If Owing >= StrtoFloat(PremiumEdt.Text) then
      begin
        If PTChanged <> '' then
        begin
          Dataform2.TransQuery.Close;
          Dataform2.Query1.Close;
          s := '("Payment",' + PremiumEdt.Text + ',' + InttoStr(DatetoIntDate(PaymentDateEdit.Date)) + ',' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger) + ',"' + JvComboBox1.Items[JvComboBox1.ItemIndex] + '","' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger) + ')';
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentType,PaymentBy,BranchNo) values ');
            Add(s);
          end;
          DataForm2.Query1.ExecSQL;
          ChangeLayBuy;
          If (Payed = 0.00) and (DataForm2.InvoiceTableInvClose.Value = 'LaybO') then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvClose.Value := 'LaybV';
            Dataform2.InvoiceTable.Post;
          end;
          If (Owing = 0.00) and (DataForm2.InvoiceTableInvClose.Value = 'LaybO') then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvClose.Value := 'LaybC';
            Dataform2.InvoiceTableInvDate.Value := datetointdate(date);
            Dataform2.InvoiceTable.Post;
            Invoiceform.QtyCountDown;
          end;
          If Dataform2.InvoiceTableDays120.Value > 0 then
          begin
            if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
              Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableDays120.Value := Dataform2.InvoiceTableDays120.Value - StrtoFloat(PremiumEdt.Text);
            Dataform2.InvoiceTable.Post;
          end
          else
          begin
            If Dataform2.InvoiceTableDays90.Value > 0 then
            begin
              if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                Dataform2.InvoiceTable.Edit;
              Dataform2.InvoiceTableDays90.Value := Dataform2.InvoiceTableDays90.Value - StrtoFloat(PremiumEdt.Text);
              Dataform2.InvoiceTable.Post;
            end
            else
            begin
              If Dataform2.InvoiceTableDays60.Value > 0 then
              begin
                if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                  Dataform2.InvoiceTable.Edit;
                Dataform2.InvoiceTableDays60.Value := Dataform2.InvoiceTableDays60.Value - StrtoFloat(PremiumEdt.Text);
                Dataform2.InvoiceTable.Post;
              end
              else
              begin
                if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                  Dataform2.InvoiceTable.Edit;
                Dataform2.InvoiceTableDays30.Value := Dataform2.InvoiceTableDays30.Value - StrtoFloat(PremiumEdt.Text);
                Dataform2.InvoiceTable.Post;
              end;
            end;
          end;
          Invoiceform.KickDrawer;
        end
        else
          showmessage('Choose Payment type first!');
      end
      else
        showmessage('You paying of too much for this Lay Buy account!');
end;

procedure TLayBuyForm.JvBitBtn13Click(Sender: TObject);
begin
//        If FromWhere = 'MAIN' then
//          Application.CreateForm(TInvoiceForm, InvoiceForm);
        InvoiceForm.FromWhereStatement := 'LayBuy';
        InvoiceForm.ReceiptPrinting.Execute;
//        If FromWhere = 'MAIN' then
//          InvoiceForm.FreeOnRelease;
end;

procedure TLayBuyForm.JvBitBtn14Click(Sender: TObject);
begin
        if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
        begin
          DataForm2.InvoiceTable.Post;
        end;
        PageControl1.ActivePage := TabSheet2;
end;

procedure TLayBuyForm.JvBitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TLayBuyForm.JvComboBox1Exit(Sender: TObject);
begin
      PTChanged := 'Changed';
end;

procedure TLayBuyForm.ChangeLayBuy();
var
      e: Currency;
begin
          Dataform2.TransQuery.Close;
          with Dataform2.TransQuery.SQL do begin
            Clear;
            Add('Select * from trans_db');
            Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
            Add('and (TransType = "L")');
          end;
          DataForm2.TransQuery.Open;
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('SELECT Sum(Ammount) as Total FROM trans_db');
            Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
            Add('and (TransType = "L")');
          end;
          Dataform2.Query2.Open;
          Dataform2.InvoiceItemTable.Close;
          with Dataform2.InvoiceItemTable.SQL do
          begin
            Clear;
            Add('select * from invoiceitem_db');
            Add('where (LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value) + ')');
            Add('and (BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ')');
          end;
          Dataform2.InvoiceItemTable.Open;
          Payed := Dataform2.Query2.FieldByName('Total').asCurrency;

          PaydValueLbl.Caption := Floattostrf(Payed,ffCurrency,10,2);
          Dataform2.Query2.Close;
          Owing := Dataform2.InvoiceTableInvTotal.Value - Payed;
          OwingValueLbl.Caption := Floattostrf(Owing,ffCurrency,10,2);
          if (Owing - Dataform2.InvoiceTablePremium.Value) < 0.10 then
            e := (Owing - Dataform2.InvoiceTablePremium.Value)
          else
            e := 0;
          PremiumEdt.Text := Floattostrf(Dataform2.InvoiceTablePremium.Value + e,ffFixed,17,2);
          If not DataForm2.InvoiceTableInvDate.IsNull then
            InvoiceDateEdit.Date := StrtoDate(IntdatetoString(DataForm2.InvoiceTableInvDate.Value))
          else
            InvoiceDateEdit.Date := InvoiceDateEdit.NullDate;
          PTChanged := '';
          PaymentDateEdit.Date := Date;
          LayBuyDetailClose;
end;

procedure TLayBuyForm.InvoiceDateEditChange(Sender: TObject);
begin
        if (DatetoStr(InvoiceDateEdit.Date) <> IntDatetoString(DataForm2.InvoiceTable.FieldByName('InvDate').asInteger)) and (DatetoStr(InvoiceDateEdit.Date) <> '1899/12/30') then
        begin
          if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
            DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.FieldByName('InvDate').asInteger := DatetoIntDate(InvoiceDateEdit.Date);
        end;
end;

procedure TLayBuyForm.JvDateTimePicker1Change(Sender: TObject);
begin
        if (DatetoStr(JvDateTimePicker1.Date) <> IntDatetoString(DataForm2.InvoiceTable.FieldByName('InvDate').asInteger)) and (DatetoStr(JvDateTimePicker1.Date) <> '1899/12/30') then
        begin
          if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
            DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.FieldByName('InvDate').asInteger := DatetoIntDate(JvDateTimePicker1.Date);
        end;
end;

procedure TLayBuyForm.LayBuyDetailOpen();
begin
        DBEdit1.ReadOnly := False;
        DBEdit2.ReadOnly := False;
        DBEdit4.ReadOnly := False;
        DBEdit5.ReadOnly := False;
        DBEdit6.ReadOnly := False;
        DBEdit7.ReadOnly := False;
        DBEdit8.ReadOnly := False;
        DBEdit9.ReadOnly := False;
        DBEdit11.ReadOnly := False;
        DBEdit13.ReadOnly := False;
        InvoiceDateEdit.Enabled := True;
end;

procedure TLayBuyForm.LayBuyDetailClose();
begin
        DBEdit1.ReadOnly := True;
        DBEdit2.ReadOnly := True;
        DBEdit4.ReadOnly := True;
        DBEdit5.ReadOnly := True;
        DBEdit6.ReadOnly := True;
        DBEdit7.ReadOnly := True;
        DBEdit8.ReadOnly := True;
        DBEdit9.ReadOnly := True;
        DBEdit11.ReadOnly := True;
        DBEdit13.ReadOnly := True;
        InvoiceDateEdit.Enabled := False;
end;

procedure TLayBuyForm.OpenInvoice();
var
      TypeString: String;
begin
          if CheckBox1.Checked = False then
            TypeString := ('where (InvClose=''LaybO'' or InvClose=''LaybC'' or InvClose=''LaybV'')')
          else
            TypeString := ('where (InvClose=''LaybO'')');
          Dataform2.InvoiceTable.Close;
          with Dataform2.InvoiceTable.SQL do
          begin
            Clear;
            Add('select * from invoice_db');
            Add(TypeString);
            Add('order by ' + OrderStr);
          end;
          Dataform2.InvoiceTable.Open;
end;

procedure TLayBuyForm.TabSheet2Show(Sender: TObject);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.TabSheet3Enter(Sender: TObject);
begin
          ChangeLayBuy;
end;

procedure TLayBuyForm.TabSheet3Show(Sender: TObject);
begin
          ChangeLayBuy;
end;

end.
