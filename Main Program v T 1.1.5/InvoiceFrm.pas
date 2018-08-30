unit InvoiceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  RpDefine, RpBase, RpSystem, CPort, Menus, ComCtrls, JvExComCtrls,
  JvStatusBar, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvGroupBox,
  JvValidateEdit, ExtCtrls, JvExExtCtrls, JvExtComponent, JvSpeedbar, JvExMask,
  JvSpin, Buttons, JvExButtons, JvBitBtn, JvEdit, StdCtrls, JvExControls,
  JvDBLookup, JvDateTimePicker, Mask, DBCtrls, JvSpeedButton, UtilsUnit, db,
  uADCompClient, DateUtils, Easysize;


type
  TInvoiceForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;                     
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    JvSpeedBar1: TJvSpeedBar;
    InsertButton: TJvSpeedButton;
    EditButton: TJvSpeedButton;
    UndoButton: TJvSpeedButton;
    JvGroupBox1: TJvGroupBox;
    InvoiceItemGrid: TJvDBGrid;
    InvoiceDateEdit: TJvDateTimePicker;
    Label8: TLabel;
    Edit1: TEdit;
    Label9: TLabel;
    SearchButton: TJvSpeedButton;
    SaveButton: TJvSpeedButton;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Total: TLabel;
    VAT: TLabel;
    Label10: TLabel;
    CloseInvButton: TJvSpeedButton;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Button2: TButton;
    ComPort1: TComPort;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    PrintButton: TJvSpeedButton;
    ReceiptPrinting: TRvSystem;
    Label13: TLabel;
    JvSpeedButton3: TJvSpeedButton;
    DeleteInvoice1: TMenuItem;
    Change: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    JvSpeedButton4: TJvSpeedButton;
    Label15: TLabel;
    CreditCartLabel: TLabel;
    JvSpeedButton5: TJvSpeedButton;
    JvSpeedButton7: TJvSpeedButton;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    JvSpeedButton6: TJvSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    DescDisp: TLabel;
    EditInvoice1: TMenuItem;
    SaveInvoice1: TMenuItem;
    UndoInvoiceChanges1: TMenuItem;
    PrintInvoice1: TMenuItem;
    Clearallinvoices1: TMenuItem;
    NewCleanInvoice1: TMenuItem;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    LayBuyBtn: TJvBitBtn;
    CashEdit: TJvValidateEdit;
    CreditCardEdit: TJvValidateEdit;
    ChequesEdit: TJvValidateEdit;
    OtherEdit: TJvValidateEdit;
    JvSpeedButton8: TJvSpeedButton;
    Label1: TLabel;
    DBText1: TDBText;
    Button4: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    Button1: TJvBitBtn;
    JvSpeedButton9: TJvSpeedButton;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    JvSpeedButton10: TJvSpeedButton;
    GroupBox6: TGroupBox;
    FindInvEdit: TJvEdit;
    JvBitBtn3: TJvBitBtn;
    MarkCurrentInvoicenotendofShifted1: TMenuItem;
    DBText6: TDBText;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    JvSpinEdit1: TJvSpinEdit;
    JvStatusBar1: TJvStatusBar;
    Options1: TMenuItem;
    ShowmoreInvoicesthan30days1: TMenuItem;
    EnableSecondPrice1: TMenuItem;
    FormResizer1: TFormResizer;
    JvSpeedButton11: TJvSpeedButton;
    Shortcuts1: TMenuItem;
    AddProducts1: TMenuItem;
    CloseInvoice1: TMenuItem;
    SearchStock1: TMenuItem;
    GoToInvItems1: TMenuItem;
    POSAdditions1: TMenuItem;
    LayBuy1: TMenuItem;
    NewInvoice1: TMenuItem;
    SuLogin1: TMenuItem;
    SuDisable1: TMenuItem;
    OpenInvoiceDetail1: TMenuItem;
    DBText2: TDBText;
    Label18: TLabel;
    N1: TMenuItem;
    JvSpeedButton12: TJvSpeedButton;
    JvDBLookupCombo1: TJvDBLookupCombo;
    Searchfordebtor1: TMenuItem;
    MarkCurrentInvoiceasnotsendtohq1: TMenuItem;
    AddComment1: TMenuItem;
    Open1: TMenuItem;
    NextInvoice1: TMenuItem;
    PreviousInvoice1: TMenuItem;
    PrintQuote1: TMenuItem;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    JvBitBtn7: TJvBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure InvoiceDateEditChange(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure InvoiceItemGridExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CloseInvButtonClick(Sender: TObject);
    procedure CashEditKeyPress(Sender: TObject; var Key: Char);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReceiptPrintingPrint(Sender: TObject);
    procedure InvoiceItemGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvSpeedButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure DeleteInvoice1Click(Sender: TObject);
    procedure InvoiceItemGridEnter(Sender: TObject);
    procedure InvoiceItemGridKeyPress(Sender: TObject; var Key: Char);
    procedure CashEditEnter(Sender: TObject);
    procedure JvSpeedButton4Click(Sender: TObject);
    procedure CreditCardEditKeyPress(Sender: TObject; var Key: Char);
    procedure ChequesEditKeyPress(Sender: TObject; var Key: Char);
    procedure CreditCardEditEnter(Sender: TObject);
    procedure ChequesEditEnter(Sender: TObject);
    procedure CashEditExit(Sender: TObject);
    procedure CreditCardEditExit(Sender: TObject);
    procedure ChequesEditExit(Sender: TObject);
    procedure JvSpeedButton7Click(Sender: TObject);
    procedure JvSpeedButton5Click(Sender: TObject);
    procedure JvSpeedButton6Click(Sender: TObject);
    procedure KickDrawer;
    procedure CashEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreditCardEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditInvoice1Click(Sender: TObject);
    procedure SaveInvoice1Click(Sender: TObject);
    procedure UndoInvoiceChanges1Click(Sender: TObject);
    procedure PrintInvoice1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure InvoiceDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure ChequesEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure Clearallinvoices1Click(Sender: TObject);
    procedure NewCleanInvoice1Click(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit11Enter(Sender: TObject);
    procedure OtherEditEnter(Sender: TObject);
    procedure OtherEditExit(Sender: TObject);
    procedure OtherEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OtherEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure LayBuyBtnClick(Sender: TObject);
    procedure InvoiceItemGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvSpeedButton8Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvSpeedButton9Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure JvSpeedButton10Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure MarkCurrentInvoicenotendofShifted1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure UndoButtonClick(Sender: TObject);
    procedure ShowmoreInvoicesthan30days1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure JvSpeedButton11Click(Sender: TObject);
    procedure ReceiptPrintingBeforePrint(Sender: TObject);
    procedure AddProducts1Click(Sender: TObject);
    procedure CloseInvoice1Click(Sender: TObject);
    procedure SearchStock1Click(Sender: TObject);
    procedure GoToInvItems1Click(Sender: TObject);
    procedure POSAdditions1Click(Sender: TObject);
    procedure LayBuy1Click(Sender: TObject);
    procedure NewInvoice1Click(Sender: TObject);
    procedure SuLogin1Click(Sender: TObject);
    procedure SuDisable1Click(Sender: TObject);
    procedure OpenInvoiceDetail1Click(Sender: TObject);
    procedure JvSpeedButton12Click(Sender: TObject);
    procedure JvDBLookupCombo1Change(Sender: TObject);
    procedure Searchfordebtor1Click(Sender: TObject);
    procedure MarkCurrentInvoiceasnotsendtohq1Click(Sender: TObject);
    procedure AddComment1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure NextInvoice1Click(Sender: TObject);
    procedure PreviousInvoice1Click(Sender: TObject);
    procedure PrintQuote1Click(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure JvBitBtn7Click(Sender: TObject);
  private
    procedure ShowDates;
    procedure RefreshTotal;
    procedure PrintReceipttoCOM;
    procedure PrintInv(Report: TBaseReport);
    procedure CloseInvPros;
    procedure PrintReceipttoLPT;
    procedure PrintA4(Report: TBaseReport);
    procedure NewA4Page(Report:TBaseReport);
    procedure DeleteInvoiceTrans;
    procedure CheckDouble;
    procedure WriteCloseInfo;
    procedure SaveInvoiceItems;
    procedure InvoiceDetailOpen;
    procedure InvoiceDetailClose;
    procedure OpenInvoiceItems;
    procedure UpdateDebAcc;
    procedure SetInvoiceLineColumns(Report:TBaseReport;ShowTitles:Boolean);
    { Private declarations }
  public
    { Public declarations }
    Totalstr, ItemSalesPrice: Currency;
    FromWherePaid: String;
    FromWhereStatement: String;
    FromWhereFormOpen: String;
    su: String;
    procedure OpenInvoices;
    procedure DeleteInvoiceItems;
    procedure QtyCountDown;
    function OpenLayBuyQty(TCStockNo: String;BranchNoInt:Integer): extended;
    procedure CreateInvNo;
    procedure InsertProduct(TCStockNoStr:String);
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  InvoiceForm: TInvoiceForm;
  AmmTendered, AmmTendered2: currency;
  linecount: Integer;
  ReceiptFromWhere,DoubleStart: String;
  AttentionDStr, AttentionTStr: String;

implementation
      uses DataFrm2,StockSearchFrm, UserFrm, LayBuyFrm,
  BarcodePrintingFrm, PriceChooseFrm, LocalAccountSearchFrm, MainFrm, StockFrm,
  InvAdvFindFrm;

{$R *.dfm}

procedure TInvoiceForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

procedure TInvoiceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Dataform2.InvoiceTable.Close;
        Dataform2.InvoiceItemTable.Close;
        Dataform2.StockTable.Close;
        Dataform2.AccountsTable.Close;
        Dataform2.DebtorInvList.Close;
        StockSearchform.Free;
        if FromWhereFormOpen = 'InvFind' then
          InvAdvFindForm.show
        else
          MainForm.Show;
end;

procedure TInvoiceForm.EditButtonClick(Sender: TObject);
begin
      if ((Dataform2.InvoiceTable.FieldByName('InvClose').AsString = 'Open') or (su = 'True')
         or (Dataform2.User_dbRights.Value > 4)) and (Dataform2.InvoiceTable.RecordCount > 0) then
      begin
        if Dataform2.InvoiceTableInvClose.Value <> 'Open' then
        begin
          AttentionDStr := '0';
          AttentionTStr := '';
          DataForm2.Query1.Active := False;
          with DataForm2.Query1.SQL do
          begin
            Clear;
            Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
            Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.InvoiceTableNr.Value) + ',"I","Closed Invoice was Edited  (' + InttoStr(DataForm2.InvoiceTableInvNo.Value) + ' / ' + InttoStr(DataForm2.InvoiceTableBranchNo.Value) + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
          end;
          DataForm2.Query1.ExecSQL;
        end;
        if GroupBox1.Visible = False then
        begin
          JvSpeedButton4.Click;
        end;
        InvoiceDetailOpen;
      end
      else
        showmessage('Invoice already closed');
end;

procedure TInvoiceForm.SaveButtonClick(Sender: TObject);
begin
        if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
        begin
          try
            DataForm2.InvoiceTable.Post;
          except
            on E : Exception do
              showmessage(E.Message);
          end;
        end;
        ShowDates;
end;

procedure TInvoiceForm.ShowDates();
var
      i: Integer;
begin
      If DataForm2.InvoiceTable.FieldByname('InvDate').asInteger <> 0 then
        InvoiceDateEdit.Date := StrtoDate(IntDatetoString(DataForm2.InvoiceTable.FieldByname('InvDate').asInteger))
      else
        InvoiceDateEdit.Date := InvoiceDateEdit.NullDate;
      Dataform2.AccountsTable.Close;
      if Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value then
      begin
        i := pos('/',Dataform2.InvoiceTableGLDebNo.Value);
        if i <> 0 then
        begin
          with Dataform2.AccountsTable.SQL do
          begin
            Clear;
            Add('select * from accounts_db');
            Add('where BranchNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,1,i-1));
            Add('and AccNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,i+1,Length(Dataform2.InvoiceTableGLDebNo.Value)-(i)));
          end;
          Dataform2.AccountsTable.Open;
          InvoiceForm.Caption := 'Debtor Invoice (' + Dataform2.InvoiceTableClientName.Value + ',Balance Outstanding ' + FloattoStrF(Dataform2.AccountsTable.FieldByName('Total').asCurrency,ffCurrency,17,2) + ')';
        end
        else
          InvoiceForm.Caption := 'Debtor Invoice (' + Dataform2.InvoiceTableClientName.Value + ')';
      end
      else
        InvoiceForm.Caption := 'Point of Sale';
      if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'Open') then
        InvoiceDetailClose
      else
        InvoiceDetailOpen;
end;

procedure TInvoiceForm.InvoiceDateEditChange(Sender: TObject);
begin
        if (DatetoStr(InvoiceDateEdit.Date) <> IntDatetoString(DataForm2.InvoiceTable.FieldByName('InvDate').asInteger)) and (DatetoStr(InvoiceDateEdit.Date) <> '1899/12/30') then
        begin
          if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
            DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.FieldByName('InvDate').asInteger := DatetoIntDate(InvoiceDateEdit.Date);
          AttentionDStr := '0';
          AttentionTStr := '';
          DataForm2.Query1.Active := False;
          with DataForm2.Query1.SQL do
          begin
            Clear;
            Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
            Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.InvoiceTableNr.Value) + ',"I","Invoice Date was Changed from Default",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
          end;
          DataForm2.Query1.ExecSQL;
        end;
end;

procedure TInvoiceForm.SearchButtonClick(Sender: TObject);
begin
    SaveButton.Click;
    if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'Close')
      and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> '')
      and (Dataform2.InvoiceItemSource.Enabled <> False)
      and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'LaybO')
      and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'LaybC') then
    begin
      StockSearchform.FromWhereTmp := 'Invoice';
      StockSearchForm.ShowModal;
    end
    else
      showmessage('Create new Invoice First!');
end;

procedure TInvoiceForm.Searchfordebtor1Click(Sender: TObject);
begin
        JvSpeedButton8.Click;
end;

procedure TInvoiceForm.SearchStock1Click(Sender: TObject);
begin
        SaveButton.Click;
        SearchButton.Click;
end;

procedure TInvoiceForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'Close') and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> '')
       and (Dataform2.InvoiceItemSource.Enabled <> False)
       and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'LaybO')
       and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'LaybC') then
    begin
      if Key = #13 then
      begin
        If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = True then
        begin
          if not Dataform2.StockTable.Locate('TCStockNo', Edit1.Text,[]) then
          begin
            Beep;
            showmessage('Can''t find product!');
          end
          else
          begin
            SaveButton.Click;
            InsertProduct(Dataform2.StockTableTCStockNo.Value);
          end;
        end
        else
        begin
          if not Dataform2.StockTable.Locate('Barcode', Edit1.Text,[]) then
          begin
            Beep;
            showmessage('Can''t find product!');
          end
          else
          begin
            SaveButton.Click;
            InsertProduct(Dataform2.StockTableTCStockNo.Value);
          end;
        end;
        Edit1.Text := '';
      end;
    end
    else
      showmessage('Create new Invoice First!');
end;

procedure TInvoiceForm.InsertProduct(TCStockNoStr:String);
begin
      Dataform2.StockTable.Locate('TCStockNo', TCStockNoStr,[]);
      DataForm2.InvoiceItemTable.Append;
      DataForm2.InvoiceItemTable.FieldByName('Description').asString := DataForm2.StockTable.FieldByName('Description').asString;
      DataForm2.InvoiceItemTable.FieldByName('StockNo').asInteger := DataForm2.StockTable.FieldByName('Nr').asInteger;
      DataForm2.InvoiceItemTable.FieldByName('LinkId').asInteger := DataForm2.InvoiceTable.FieldByName('Nr').asInteger;
      DataForm2.InvoiceItemTable.FieldByName('BranchNo').asInteger := DataForm2.InvoiceTable.FieldByName('BranchNo').asInteger;
      DataForm2.InvoiceItemTable.FieldByName('Qty').asfloat := 1;
      If (DataForm2.StockTable.FieldByName('SalesPrice2').asFloat = 0) or (DataForm2.StockTable.FieldByName('SalesPrice2').asFloat = DataForm2.StockTable.FieldByName('SalesPrice').asFloat) then
 //        or (EnableSecondPrice1.Checked = False)
      begin
        DataForm2.InvoiceItemTable.FieldByName('Price').asfloat := DataForm2.StockTable.FieldByName('SalesPrice').asFloat;
      end
      else
      begin
        ItemSalesPrice := 0;
        Application.CreateForm(TPriceChooseForm, PriceChooseForm);
        PriceChooseForm.Price1.Caption := Floattostrf(Dataform2.StockTable.Fieldbyname('SalesPrice').asFloat ,ffFixed,17,2);
        PriceChooseForm.Price2.Caption := Floattostrf(Dataform2.StockTable.Fieldbyname('SalesPrice2').asFloat ,ffFixed,17,2);
        Beep;
        PriceChooseForm.showmodal;
        DataForm2.InvoiceItemTable.FieldByName('Price').asfloat := ItemSalesPrice;
        PriceChooseForm.FreeonRelease;
//        JvDBgrid1.SetFocus;
      end;
      DataForm2.InvoiceItemTable.FieldByName('CostPrice').asfloat := DataForm2.StockTable.FieldByName('CostPrice').asFloat;
      DescDisp.Caption := DataForm2.InvoiceItemTable.FieldByName('Description').asString + ' ' + Floattostrf(DataForm2.InvoiceItemTable.FieldByName('Price').asfloat,ffCurrency,17,2);
      if Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value then
      begin
        if (Dataform2.AccountsTableDiscount.Value <> 0) then
          DataForm2.InvoiceItemTable.FieldByName('Discount').asfloat := Dataform2.AccountsTableDiscount.Value
        else
          DataForm2.InvoiceItemTable.FieldByName('Discount').asfloat := 0.00;
      end
      else
        DataForm2.InvoiceItemTable.FieldByName('Discount').asfloat := 0.00;
      DataForm2.InvoiceItemTableTCStockNo.Value := Dataform2.StockTableTCStockNo.Value;
      Dataform2.InvoiceItemTableModelNo.Value := Dataform2.StockTableModelNo.Value;
      Dataform2.InvoiceItemTableCommentSwi.Value := 'False';
      SaveInvoiceItems;
      RefreshTotal;
//      Dataform2.InvoiceItemTable.;
      InvoiceForm.Edit1.setFocus;
end;

procedure TInvoiceForm.RefreshTotal();
begin
      Dataform2.Query3.Close;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
        Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
        Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
        Add('and CommentSwi = ''False''');
      end;
      Dataform2.Query3.Prepare;
      Dataform2.Query3.Open;
      TotalStr := DataForm2.Query3.Fieldbyname('Total').asCurrency;
      Total.Caption := 'Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2);
      if Dataform2.GlobalTableVat.Value <> 0 then
      begin
        VAT.Caption := 'VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100) ,ffCurrency,17,2);
      end
      else
      begin
        VAT.Visible := False;
      end;
      CashEdit.Text := '0.00';
      CreditCardEdit.Text := '0.00';
      ChequesEdit.Text := '0.00';
      OtherEdit.Text := '0.00';
      If (Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'Cash') or (Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'LayBuy') then
        CashEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2)
      else
      begin
        If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'CreditCard' then
          CreditCardEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2)
        else
        begin
          if Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = Dataform2.GlobalTableOtherDescr.Value then
            OtherEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2)
          else
          begin
            If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'Cheques' then
              ChequesEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2)
            else
            begin
              If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleCR' then
              begin
                CashEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                CreditCardEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
              end
              else
              begin
                If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleCH' then
                begin
                  CashEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                  ChequesEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
                end
                else
                begin
                  If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleCO' then
                  begin
                    CashEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                    OtherEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
                  end
                  else
                  begin
                    If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleRH' then
                    begin
                      CreditCardEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                      ChequesEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
                    end
                    else
                    begin
                      If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleRO' then
                      begin
                        CreditCardEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                        OtherEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
                      end
                      else
                      begin
                        If Dataform2.InvoiceTable.FieldByName('InvoiceType').asString = 'DoubleHO' then
                        begin
                          ChequesEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('AmmTendered').asCurrency ,ffFixed,17,2);
                          OtherEdit.Text := Floattostrf(Dataform2.InvoiceTable.Fieldbyname('Premium').asCurrency ,ffFixed,17,2);
                        end
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
      Dataform2.Query3.Close;
      Dataform2.Query3.Unprepare;
end;

procedure TInvoiceForm.CheckDouble();
begin
  //
  //  C=Cash, R=CreditCard, H=Cheque, O=Other
  //
    If FromWherePaid = 'Double' then
    begin
      If (CashEdit.Value > 0) and (CreditCardEdit.Value > 0) then
      begin
        FromWherePaid := 'DoubleCR';
        AmmTendered := CashEdit.Value;
        AmmTendered2 := CreditCardEdit.Value;
      end
      else
      begin
        If (CashEdit.Value > 0) and (ChequesEdit.Value > 0) then
        begin
          FromWherePaid := 'DoubleCH';
          AmmTendered := CashEdit.Value;
          AmmTendered2 := ChequesEdit.Value;
        end
        else
        begin
          If (CashEdit.Value > 0) and (OtherEdit.Value > 0) then
          begin
            FromWherePaid := 'DoubleCO';
            AmmTendered := CashEdit.Value;
            AmmTendered2 := OtherEdit.Value;
          end
          else
          begin
            If (CreditCardEdit.Value > 0) and (ChequesEdit.Value > 0) then
            begin
              FromWherePaid := 'DoubleRH';
              AmmTendered := CreditCardEdit.Value;
              AmmTendered2 := ChequesEdit.Value;
            end
            else
            begin
              If (CreditCardEdit.Value > 0) and (OtherEdit.Value > 0) then
              begin
                FromWherePaid := 'DoubleRO';
                AmmTendered := CreditCardEdit.Value;
                AmmTendered2 := OtherEdit.Value;
              end
              else
              begin
                If (ChequesEdit.Value > 0) and (OtherEdit.Value > 0) then
                begin
                  FromWherePaid := 'DoubleHO';
                  AmmTendered := ChequesEdit.Value;
                  AmmTendered2 := OtherEdit.Value;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
end;

procedure TInvoiceForm.FormShow(Sender: TObject);
begin
      GroupBox5.Visible := StrtoBool(Dataform2.GlobalTableShowAdditions.Value);
      POSAdditions1.Enabled := StrtoBool(Dataform2.GlobalTableShowAdditions.Value);
      LayBuyBtn.Visible := StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value);
      LayBuy1.Enabled := StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value);
      if FromWhereFormOpen <> 'InvFind' then
      begin
        OpenInvoices();
        OpenInvoiceItems();
        ShowDates();
        RefreshTotal();
      end;
      Dataform2.StockTable.Close;
      with Dataform2.StockTable.SQL do
      begin
        Clear;
        Add('select * from stock_db');
        Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
      end;
      Dataform2.StockTable.Open;
      Dataform2.DebtorInvList.Open;
      su := 'False';
      JvStatusBar1.Panels[0].Text := 'Super User disabled';
      DescDisp.Caption := '';
      DoubleStart := '';
      FromWherePaid := '';
      ReceiptFromWhere := '';
      AmmTendered := 0;
      AmmTendered2 := 0;
      Label22.Caption := Dataform2.GlobalTableOtherDescr.Value;
      InvoiceItemGrid.Columns[6].Title.Caption := Dataform2.GlobalTableCommentDescr.Value;
      Application.CreateForm(TStockSearchForm, StockSearchForm);
      Button4.SetFocus;
end;

procedure TInvoiceForm.GoToInvItems1Click(Sender: TObject);
begin
        JvSpeedButton3.Click;
end;

procedure TInvoiceForm.InvoiceItemGridExit(Sender: TObject);
begin
        If DataForm2.InvoiceTable.FieldByName('InvClose').AsString = 'Close' then
          InvoiceItemGrid.ReadOnly := False;
        SaveInvoiceItems;
        RefreshTotal;
end;

procedure TInvoiceForm.Button2Click(Sender: TObject);
begin
        JvSpeedButton4.Click;
        SaveButton.Click;
        Edit1.SetFocus;
end;

procedure TInvoiceForm.CloseInvButtonClick(Sender: TObject);
begin
        SaveInvoiceItems;
        Dataform2.Query4.Close;
        with Dataform2.Query4.SQL do
        begin
          Clear;
          Add('select nr from invoiceitem_db');
          Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
          Add('and CommentSwi = ''False''');
       end;
        Dataform2.Query4.Open;
        if Dataform2.Query4.RecordCount < 1 then
          showmessage('No Items in invoice!')
        else
        begin
          RefreshTotal;
          CashEdit.SetFocus;
        end;
        Dataform2.Query4.Close;
end;

procedure TInvoiceForm.CloseInvoice1Click(Sender: TObject);
begin
        SaveButton.Click;
        CloseInvButton.Click;
end;

procedure TInvoiceForm.PrintReceipttoCOM();
var
        count: Integer;
begin
        Comport1.Port := DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0');
        Comport1.Connected := True;
        UserForm.Memo2.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        for count := 0 to UserForm.Memo2.Lines.Count - 1 do
        begin
          Comport1.WriteStr(UserForm.Memo2.Lines[count] + #13 + #10);
        end;
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr('RETAIN AS PROOF OF PAYMENT' + #13 + #10);
        Comport1.WriteStr('------------------------------' + #13 + #10);
        Comport1.WriteStr('Name: ' + DataForm2.InvoiceTable.FieldByName('ClientName').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString <> '' then
          Comport1.WriteStr('Vat No: ' + DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString <> '' then
          Comport1.WriteStr('Address: ' + DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString <> '' then
          Comport1.WriteStr(DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString <> '' then
          Comport1.WriteStr(DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString <> '' then
          Comport1.WriteStr('Postal Code: ' + DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString <> '' then
          Comport1.WriteStr('Tel (W): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString <> '' then
          Comport1.WriteStr('Tel (C): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString <> '' then
          Comport1.WriteStr('E Mail: ' + DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('RefNo').asString <> '' then
          Comport1.WriteStr('Ref No: ' + DataForm2.InvoiceTable.Fieldbyname('RefNo').asString + #13 + #10);
        if DataForm2.InvoiceTableGLDebNo.asString <> DataForm2.IniFile.ReadString ('TCSetup', 'TCCashDebNo', '') then
          Comport1.WriteStr('Debtor No: ' + DataForm2.InvoiceTableGLDebNo.asString + #13 + #10);
        Comport1.WriteStr('Invoice By: ' + DataForm2.InvoiceTable.FieldByName('InvBy').asString + #13 + #10);
        Comport1.WriteStr('------------------------------' + #13 + #10);

        DataForm2.InvoiceItemTable.first;
        try
          while not DataForm2.InvoiceItemTable.EOF do
          begin
            if Dataform2.InvoiceItemTableCommentSwi.Value = 'False' then
            begin
              Comport1.WriteStr(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString + #13 + #10);
              Comport1.WriteStr('Prc R ' + floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat,ffFixed,17,2) + ' Qty ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + ' Tot R ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + #13 + #10);
            end
            else
            begin
              Comport1.WriteStr(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString + #13 + #10);
            end;
            DataForm2.InvoiceItemTable.Next;
          end;
        finally
        end;
        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Price * Qty - (Price * Qty * (Discount / 100))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('BranchNo').asInteger));
          Add('and CommentSwi = ''False''');
        end;
        Dataform2.Query3.Open;
        Comport1.WriteStr('----------------------------------' + #13 + #10);
        Comport1.WriteStr('Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + #13 + #10);
        Comport1.WriteStr('VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * 14 / 114 ,ffCurrency,17,2) + #13 + #10);
        Comport1.WriteStr('Paid: ' + Floattostrf(AmmTendered + AmmTendered2,ffCurrency,17,2) + #13 + #10);
        Comport1.WriteStr('Change: ' + Floattostrf((AmmTendered + AmmTendered2) - TotalStr,ffCurrency,17,2) + #13 + #10);
        Comport1.WriteStr('----------------------------------' + #13 + #10);

        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr('Inv Date: ' + IntDatetoString(DataForm2.InvoiceTable.Fieldbyname('InvDate').asInteger) + '  Inv No: ' + InttoStr(DataForm2.InvoiceTable.FieldByName('BranchNo').asInteger) + ' / ' + InttoStr(DataForm2.InvoiceTable.Fieldbyname('InvNo').asInteger) + #13 + #10);
        Comport1.WriteStr(#13 + #10);
        UserForm.Memo3.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        for count := 0 to UserForm.Memo3.Lines.Count - 1 do
        begin
          Comport1.WriteStr(UserForm.Memo3.Lines[count] + #13 + #10);
        end;
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr(#13 + #10);
        Comport1.WriteStr(#13 + #10);
        Dataform2.Query3.Close;
        Comport1.Connected := False;
end;

procedure TInvoiceForm.CashEditKeyPress(Sender: TObject; var Key: Char);
begin
      if (Key = #13) and (FromWherePaid <> 'Double') then
      begin
        AmmTendered := CashEdit.Value;
        AmmTendered2 := 0.00;
        FromWherePaid := 'Cash';
        Change.Caption := 'Change ' + Floattostrf(AmmTendered - TotalStr,ffCurrency,17,2);
        Button1.Click;
      end;
      if (Key = #13) and (FromWherePaid = 'Double') then
      begin
        CheckDouble;
        Button1.Click;
      end;
end;

procedure TInvoiceForm.JvSpeedButton1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) or (su = 'True') then
      begin
        Dataform2.InvoiceTable.Prior;
        OpenInvoiceItems();
        ShowDates();
        RefreshTotal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceForm.JvSpeedButton2Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) or (su = 'True') then
      begin
        Dataform2.InvoiceTable.Next;
        OpenInvoiceItems();
        ShowDates();
        refreshTotal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceForm.PrintButtonClick(Sender: TObject);
begin
    CloseInvPros;
end;

procedure TInvoiceForm.PrintInv(Report:TBaseReport);
var
    count: Integer;
begin
      with report do
      begin
        MarginLeft := 0.250;
        MarginTop := 0.250;
        SetFont('Arial',9);
        UserForm.Memo2.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        for count := 0 to UserForm.Memo2.Lines.Count - 1 do
        begin
          printLeft(UserForm.Memo2.Lines[count], 0.250);
          NewLine;
        end;
        NewLine;
        printLeft('RETAIN AS PROOF OF PAYMENT', 0.250);
        NewLine;
        printLeft('------------------------------', 0.250);
        NewLine;
        printLeft('Name: ' + DataForm2.InvoiceTable.FieldByName('ClientName').asString, 0.250);
        NewLine;
        if DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString <> '' then
        begin
          printLeft('Vat No: ' + DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString <> '' then
        begin
          printLeft('Address: ' + DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString <> '' then
        begin
          printLeft(DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString <> '' then
        begin
          printLeft(DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString <> '' then
        begin
          printLeft('Postal Code: ' + DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString <> '' then
        begin
          printLeft('Tel (W): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString <> '' then
        begin
          printLeft('Tel (C): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString <> '' then
        begin
          printLeft('E Mail: ' + DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('RefNo').asString <> '' then
        begin
          printLeft('Ref No: ' + DataForm2.InvoiceTable.Fieldbyname('RefNo').asString, 0.250);
          NewLine;
        end;
        if DataForm2.InvoiceTableGLDebNo.asString <> DataForm2.IniFile.ReadString ('TCSetup', 'TCCashDebNo', '') then
        begin
          printLeft('Debtor No: ' + DataForm2.InvoiceTableGLDebNo.asString, 0.250);
          NewLine;
        end;
        NewLine;
        printLeft('Invoice By: ' + DataForm2.InvoiceTable.FieldByName('InvBy').asString, 0.250);
        NewLine;
        printLeft('------------------------------', 0.250);
        NewLine;

        DataForm2.InvoiceItemTable.first;
        try
          while not DataForm2.InvoiceItemTable.EOF do
          begin
            if Dataform2.InvoiceItemTableCommentSwi.Value = 'False' then
            begin
              printLeft(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString, 0.250);
              NewLine;
              printLeft('Prc R ' + floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat,ffFixed,17,2) + ' Qty ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + ' Tot R ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2), 0.250);
              NewLine;
            end
            else
            begin
              printLeft(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString, 0.250);
              NewLine;
            end;
            DataForm2.InvoiceItemTable.Next;
          end;
        finally
        end;
        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Price * Qty - (Price * Qty * (Discount / 100))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('BranchNo').asInteger));
          Add('and CommentSwi = ''False''');
        end;
        Dataform2.Query3.Open;
        printLeft('----------------------------------', 0.250);
        NewLine;
        printLeft('Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2), 0.250);
        NewLine;
        printLeft('VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * 14 / 114 ,ffCurrency,17,2), 0.250);
        NewLine;
        printLeft('Paid: ' + Floattostrf(AmmTendered + AmmTendered2,ffCurrency,17,2), 0.250);
        NewLine;
        printLeft('Change: ' + Floattostrf((AmmTendered + AmmTendered2) - TotalStr,ffCurrency,17,2), 0.250);
        NewLine;
        printLeft('----------------------------------', 0.250);

        NewLine;
        NewLine;
        printLeft('Inv Date: ' + IntDatetoString(DataForm2.InvoiceTable.Fieldbyname('InvDate').asInteger) + '  Inv No: ' + InttoStr(DataForm2.InvoiceTable.FieldByName('BranchNo').asInteger) + ' / ' + InttoStr(DataForm2.InvoiceTable.Fieldbyname('InvNo').asInteger), 0.250);
        NewLine;
        NewLine;
        UserForm.Memo3.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        for count := 0 to UserForm.Memo3.Lines.Count - 1 do
        begin
          printLeft(UserForm.Memo3.Lines[count], 0.250);
          NewLine;
        end;
        DataForm2.Query3.Close;
      end;
end;

procedure TInvoiceForm.ReceiptPrintingBeforePrint(Sender: TObject);
begin
      if (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver A4') then
      begin
        ReceiptPrinting.BaseReport.SetPaperSize(DMPAPER_A4,0,0);
      end;
end;

procedure TInvoiceForm.ReceiptPrintingPrint(Sender: TObject);
begin
    if ReceiptFromWhere <> 'Quote' then
    begin
      if ReceiptFromWhere = 'A4' then
      begin
        PrintA4(ReceiptPrinting.BaseReport)
      end
      else
      begin
        if (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver Receipt') then
          PrintInv(ReceiptPrinting.BaseReport)
        else
          PrintA4(ReceiptPrinting.BaseReport);
      end;
      ReceiptFromWhere := '';
    end
    else
    begin
      PrintA4(ReceiptPrinting.BaseReport);
      ReceiptFromWhere := '';
    end;
end;

procedure TInvoiceForm.QtyCountDown();
begin
      DataForm2.InvoiceItemTable.DisableControls;
      try
        DataForm2.InvoiceItemTable.First;
        while not DataForm2.InvoiceItemTable.EOF do
        begin
          DataForm2.Query3.Close;
          with DataForm2.Query3.SQL do begin
                Clear;
                Add('update stock_db');
                Add('set Qty = Qty - ' + floattostr(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat));
                Add('where Nr = ' + Inttostr(DataForm2.InvoiceItemTable.Fieldbyname('StockNo').asInteger));
                Add('and NonStockItem = "False"');
          end;
          DataForm2.Query3.ExecSQL;
          DataForm2.InvoiceItemTable.Next;
        end;
      finally
      end;
      DataForm2.InvoiceItemTable.EnableControls;
end;

procedure TInvoiceForm.InvoiceItemGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if HiWord(GetKeyState(vk_delete)) <> 0 then
      begin
        If (Dataform2.InvoiceTableInvClose.Value <> 'Close') and (Dataform2.InvoiceTableInvClose.Value <> 'LaybO') and (Dataform2.InvoiceTableInvClose.Value <> 'LaybC') then
        begin
          if MessageDlg('Are you sure you want to delete line ' + DataForm2.InvoiceItemTable.Fieldbyname('Description').asString, mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
            DataForm2.InvoiceItemTable.Delete;
          end;
          RefreshTotal;
          Edit1.SetFocus;
        end
        else
          showmessage('You can''t delete an item on an closed Invoice!');
      end;
end;

procedure TInvoiceForm.JvSpeedButton3Click(Sender: TObject);
begin
      InvoiceItemGrid.SetFocus;
end;

procedure TInvoiceForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      if (DataForm2.InvoiceTablestrState = 'Edit') or (DataForm2.InvoiceTablestrState = 'Insert') then
      begin
        if MessageDlg('Do you want to exit without saving?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          DataForm2.InvoiceTable.Cancel;
        end
        else
          CanClose := False;
      end;
end;

procedure TInvoiceForm.FormCreate(Sender: TObject);
begin
        FormResizer1.InitializeForm;
        InvoiceForm.WindowState := wsMaximized;
end;

procedure TInvoiceForm.FormResize(Sender: TObject);
begin
        FormResizer1.ResizeAll;
end;

procedure TInvoiceForm.Edit1Enter(Sender: TObject);
begin
        SaveButton.Click;
end;

procedure TInvoiceForm.DeleteInvoice1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) or (su = 'True') or (DataForm2.InvoiceTableInvClose.Value = 'Open') then
      begin
        if MessageDlg('Are you sure you want to Delete the Selected Invoice!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if Dataform2.InvoiceTableInvClose.Value <> 'Open' then
          begin
            AttentionDStr := '0';
            AttentionTStr := '';
            DataForm2.Query1.Active := False;
            with DataForm2.Query1.SQL do
            begin
              Clear;
              Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
              Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.InvoiceTableNr.Value) + ',"I","Invoice Deleted (' + InttoStr(DataForm2.InvoiceTableInvNo.Value) + ' / ' + InttoStr(DataForm2.InvoiceTableBranchNo.Value) + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
            end;
            DataForm2.Query1.ExecSQL;
          end;
          DeleteInvoiceItems;
          DeleteInvoiceTrans;
          DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.Delete;
          OpenInvoiceItems();
          refreshTotal;
          showdates;
          Button4.SetFocus;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TInvoiceForm.DeleteInvoiceItems();
begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('Delete FROM invoiceitem_db');
          Add('WHERE LinkId = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('BranchNo').asInteger));
        end;
        DataForm2.Query2.ExecSQL;
end;

procedure TInvoiceForm.DeleteInvoiceTrans();
begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('Delete FROM trans_db');
          Add('WHERE LinkId = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('InvNo').asInteger));
          Add('and BranchNo = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('BranchNo').asInteger));
          Add('and TransType = ''L''');
        end;
        DataForm2.Query2.ExecSQL;
end;

procedure TInvoiceForm.InvoiceItemGridEnter(Sender: TObject);
begin
      If (DataForm2.InvoiceTable.FieldByName('InvClose').AsString = 'Close') then
        InvoiceItemGrid.ReadOnly := True;
      If Dataform2.GlobalTableMinimumMarkup.Value <> 0 then
      begin
        InvoiceItemGrid.Columns[4].ReadOnly := False;
      end
      else
      begin
        InvoiceItemGrid.Columns[4].ReadOnly := True;
      end;
      if (su = 'True') or (Dataform2.User_dbRights.Value > 3) or (StrtoBool(Dataform2.GlobalTableUsr3AllowItemAmmChange.Value) = True) then
      begin
        InvoiceItemGrid.Columns[4].ReadOnly := False;
        InvoiceItemGrid.Columns[7].ReadOnly := False;
      end
      else
      begin
        If Dataform2.GlobalTableMinimumMarkup.Value = 0 then
          InvoiceItemGrid.Columns[4].ReadOnly := True;
        InvoiceItemGrid.Columns[7].ReadOnly := True;
      end;
      Dataform2.InvoiceItemTable.Last;
      if Dataform2.InvoiceItemTableCommentSwi.Value = 'False' then
        InvoiceItemGrid.Col := 4
      else
        InvoiceItemGrid.Col := 2;
end;

procedure TInvoiceForm.InvoiceItemGridKeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        SaveInvoiceItems;
        RefreshTotal;
        Edit1.SetFocus;
      end;
end;

procedure TInvoiceForm.JvDBLookupCombo1Change(Sender: TObject);
begin
            Application.CreateForm(TLocalAccountSearchForm, LocalAccountSearchForm);
            LocalAccountSearchForm.SetInvoiceData(Dataform2.DebtorInvListNr.asInteger);
            LocalAccountSearchForm.Free;
end;

procedure TInvoiceForm.CloseInvPros();
var
  DoPrint:Boolean;
begin
    FromWhereStatement := 'POS';
    ReceiptFromWhere := '';
    Dataform2.Query4.Close;
    with Dataform2.Query4.SQL do
    begin
      Clear;
      Add('select Nr from invoiceitem_db');
      Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
      Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
      Add('and CommentSwi = ''False''');
    end;
    Dataform2.Query4.Open;
    if Dataform2.Query4.RecordCount <> 0 then
    begin
//      showmessage(FloattoStr((AmmTendered + AmmTendered2)) + '---' + FloattoStr(TotalStr));
      If ((AmmTendered + AmmTendered2) >= TotalStr) or (DataForm2.InvoiceTableInvoiceType.Value = 'LayBuy') or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'True')) then
      begin
        WriteCloseInfo;
        if StrtoBool(Dataform2.GlobalTableDefaultRecPrintChoice.Value) = False then
        begin
          If MessageBox( Self.Handle,
              'Do you want to print the Receipt?',
              'Confirm',
              MB_ICONQUESTION Or MB_YESNO Or MB_DEFBUTTON2 )
              = IDNO Then
            DoPrint := False
          else
            DoPrint := True;
        end
        else
        begin
          If MessageBox( Self.Handle,
              'Do you want to print the Receipt?',
              'Confirm',
              MB_ICONQUESTION Or MB_YESNO Or MB_DEFBUTTON1 )
              = IDYES Then
            DoPrint := True
          else
            DoPrint := False;
        end;
        if DoPrint = False then
        begin
          If (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') <> 'Driver Receipt') and (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') <> 'Driver A4') then
          begin
            KickDrawer;
          end
          else
          begin
            If (DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'Serial Drawer') then
            begin
              KickDrawer;
            end;
          end;
        end
        else
        begin
          if StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'A4andCom', '0')) = True then
          begin
            If MessageBox( Self.Handle,
                'Do you want to print A4 Invoice?',
                'Confirm',
                MB_ICONQUESTION Or MB_YESNO Or MB_DEFBUTTON2 )
                = IDYES Then
            begin
              ReceiptFromWhere := 'A4';
              KickDrawer;
              ReceiptPrinting.Execute;
              ShowDates;
              Button4.setfocus;
              exit;
            end;
          end;
          If (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver Receipt') or (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver A4') then
          begin
            If (DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'Serial Drawer') then
            begin
              KickDrawer;
            end;
            ReceiptPrinting.Execute;
          end
          else
          begin
            KickDrawer;
            if copy(DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0'),1,3) = 'COM' then
              PrintReceipttoCOM()
            else
              PrintReceipttoLPT();
          end;
        end;
        ShowDates;
        Button4.setfocus;
      end
      else
      begin
        showmessage('Money is not enough!');
        if FromWherePaid <> 'Double' then
          FromWherePaid := '';
        AmmTendered := 0.00;
        AmmTendered2 := 0.00;
      end;
    end
    else
      showmessage('Add Products First!');
    Dataform2.Query4.Close;
end;

procedure TInvoiceForm.KickDrawer();
var
    F: TextFile;
begin
      if (copy(DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0'),1,3) = 'COM') or (DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'Serial Drawer') then
      begin
        if DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'Serial Drawer' then
        begin
          InvoiceForm.Comport1.Port := DataForm2.IniFile.ReadString ('ComportSection', 'SerialCom', '0');
          InvoiceForm.Comport1.Connected := True;
          InvoiceForm.Comport1.WriteStr(#07);
          InvoiceForm.Comport1.Connected := False;
        end
        else
        begin
          InvoiceForm.Comport1.Port := DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0');
          InvoiceForm.Comport1.Connected := True;
          if DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'EPSON' then
            InvoiceForm.Comport1.WriteStr(#027 + #112 + #000 + #025 + #250);
          InvoiceForm.Comport1.Connected := False;
        end;
      end
      else
      begin
        AssignFile(F, Dataform2.UserDataPath + '\NCompPOS\' + DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0'));
        Rewrite(F);
        if DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') = 'EPSON' then
          Write(F, #27 + #112 + #0 + #25 + #250);
//          Write(F, #027 + #112 + #000 + #025 + #250);
//        showmessage('Mmmmmm');
        CloseFile(F);
      end;
end;

procedure TInvoiceForm.LayBuy1Click(Sender: TObject);
begin
        LayBuyBtn.SetFocus;
        LayBuyBtn.Click;
end;

procedure TInvoiceForm.PrintReceipttoLPT();
var
        count: Integer;
        F: TextFile;
begin
        AssignFile(F, DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0'));
        Rewrite(F);
        UserForm.Memo2.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        for count := 0 to UserForm.Memo2.Lines.Count - 1 do
        begin
          Write(F, UserForm.Memo2.Lines[count] + #13 + #10);
        end;
        Write(F, #13 + #10);
        Write(F, 'RETAIN AS PROOF OF PAYMENT' + #13 + #10);
        Write(F, '----------------------------------' + #13 + #10);
        Write(F, 'Name: ' + DataForm2.InvoiceTable.FieldByName('ClientName').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString <> '' then
          Write(F, 'Vat No: ' + DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString <> '' then
          Write(F, 'Address: ' + DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString <> '' then
          Write(F, DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString <> '' then
          Write(F, DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString <> '' then
          Write(F, 'Postal Code: ' + DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString <> '' then
          Write(F, 'Tel (W): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString <> '' then
          Write(F, 'Tel (C): ' + DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString <> '' then
          Write(F, 'E Mail: ' + DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString + #13 + #10);
        if DataForm2.InvoiceTable.Fieldbyname('RefNo').asString <> '' then
          Write(F, 'Ref No: ' + DataForm2.InvoiceTable.Fieldbyname('RefNo').asString + #13 + #10);
        if DataForm2.InvoiceTableGLDebNo.asString <> DataForm2.IniFile.ReadString ('TCSetup', 'TCCashDebNo', '') then
          Write(F, 'Debtor No: ' + DataForm2.InvoiceTableGLDebNo.asString + #13 + #10);
        Write(F, 'Invoice By: ' + DataForm2.InvoiceTable.FieldByName('InvBy').asString + #13 + #10);
        Write(F, '----------------------------------' + #13 + #10);

        DataForm2.InvoiceItemTable.first;
        try
          while not DataForm2.InvoiceItemTable.EOF do
          begin
//            Write(F, DataForm2.InvoiceItemTable.Fieldbyname('Description').asString + #13 + #10);
//            Write(F, 'Prc R ' + floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat,ffFixed,17,2) + ' Qty ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + ' Tot R ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + #13 + #10);
            if Dataform2.InvoiceItemTableCommentSwi.Value = 'False' then
            begin
              Write(F, DataForm2.InvoiceItemTable.Fieldbyname('Description').asString + #13 + #10);
              Write(F, 'Prc R ' + floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat,ffFixed,17,2) + ' Qty ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + ' Tot R ' + Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asFloat * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2) + #13 + #10);
            end
            else
            begin
              Write(F, DataForm2.InvoiceItemTable.Fieldbyname('Description').asString + #13 + #10);
            end;
            DataForm2.InvoiceItemTable.Next;
          end;
        finally
        end;
        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Price * Qty - (Price * Qty * (Discount / 100))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('BranchNo').asInteger));
          Add('and CommentSwi = ''False''');
        end;
        Dataform2.Query3.Open;
        Write(F, '----------------------------------' + #13 + #10);
        Write(F, 'Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + #13 + #10);
        Write(F, 'VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * 14 / 114 ,ffCurrency,17,2) + #13 + #10);
        Write(F, 'Paid: ' + Floattostrf(AmmTendered + AmmTendered2,ffCurrency,17,2) + #13 + #10);
        Write(F, 'Change: ' + Floattostrf((AmmTendered + AmmTendered2) - TotalStr,ffCurrency,17,2) + #13 + #10);
        Write(F, '----------------------------------' + #13 + #10);

        Write(F, #13 + #10);
        Write(F, 'Inv Date: ' + IntDatetoString(DataForm2.InvoiceTable.Fieldbyname('InvDate').asInteger) + '  Inv No: ' + InttoStr(DataForm2.InvoiceTable.FieldByName('BranchNo').asInteger) + ' / ' + InttoStr(DataForm2.InvoiceTable.Fieldbyname('InvNo').asInteger) + #13 + #10);
        Write(F, #13 + #10);
        UserForm.Memo3.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        for count := 0 to UserForm.Memo3.Lines.Count - 1 do
        begin
          Write(F, UserForm.Memo3.Lines[count] + #13 + #10);
        end;
        Write(F, #13 + #10);
        Write(F, #13 + #10);
        Write(F, #13 + #10);
        Write(F, #13 + #10);
        Write(F, #13 + #10);
        Write(F, #13 + #10);
        dataform2.Query3.Close;
        CloseFile(F);
end;

procedure TInvoiceForm.CashEditEnter(Sender: TObject);
begin
      if (FromWherePaid <> 'Double') then
      begin
          if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
            CashEdit.Text := Floattostrf(TotalStr,ffFixed,17,2);
          if (DataForm2.InvoiceTableInvClose.Value = 'Open') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cash') or (Dataform2.InvoiceTableInvoiceType.Value = 'CreditCard') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cheques') or (Dataform2.InvoiceTableInvoiceType.Value = Dataform2.GlobalTableOtherDescr.Value) then
            FromWherePaid := ''
          else
            FromWherePaid := 'Double';
          DoubleStart := '';
          CashEdit.SelectAll;
          AmmTendered := 0;
          AmmTendered2 := 0;
      end
      else
      begin
        if DoubleStart <> 'Cash' then
        begin
          if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          begin
            CashEdit.Text := Floattostrf(TotalStr - (CreditCardEdit.Value + ChequesEdit.Value + OtherEdit.Value),ffFixed,17,2);
            CashEdit.SelectAll;
          end;
        end;
      end;
end;

procedure TInvoiceForm.JvSpeedButton4Click(Sender: TObject);
begin
    if GroupBox1.Visible = False then
    begin
      GroupBox1.Visible := True;
      GroupBox1.BringToFront;
      DbEdit1.SetFocus;
    end
    else
    begin
      GroupBox1.Visible := False;
      GroupBox1.SendToBack;
      Edit1.SetFocus;
    end;
end;

procedure TInvoiceForm.CreditCardEditKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (Key = #13) and (FromWherePaid <> 'Double') then
      begin
        AmmTendered := CreditCardEdit.Value;
        AmmTendered2 := 0.00;
        FromWherePaid := 'CreditCard';
        Change.Caption := 'Change ' + Floattostrf(AmmTendered - TotalStr,ffCurrency,17,2);
        Button1.Click;
      end;
      if (Key = #13) and (FromWherePaid = 'Double') then
      begin
        CheckDouble;
        Button1.Click;
      end;
end;

procedure TInvoiceForm.ChequesEditKeyPress(Sender: TObject; var Key: Char);
begin
      if (Key = #13) and (FromWherePaid <> 'Double') then
      begin
        AmmTendered := ChequesEdit.Value;
        AmmTendered2 := 0.00;
        FromWherePaid := 'Cheques';
        Change.Caption := 'Change ' + Floattostrf(AmmTendered - TotalStr,ffCurrency,17,2);
        Button1.Click;
      end;
      if (Key = #13) and (FromWherePaid = 'Double') then
      begin
        CheckDouble;
        Button1.Click;
      end;
end;

procedure TInvoiceForm.CreditCardEditEnter(Sender: TObject);
begin
      if (FromWherePaid <> 'Double') then
      begin
        if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          CreditCardEdit.Text := Floattostrf(TotalStr,ffFixed,17,2);
        if (DataForm2.InvoiceTableInvClose.Value = 'Open') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cash') or (Dataform2.InvoiceTableInvoiceType.Value = 'CreditCard') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cheques') or (Dataform2.InvoiceTableInvoiceType.Value = Dataform2.GlobalTableOtherDescr.Value) then
          FromWherePaid := ''
        else
          FromWherePaid := 'Double';
        DoubleStart := '';
        CreditCardEdit.SelectAll;
      end
      else
      begin
        if DoubleStart <> 'CreditCard' then
        begin
          if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          Begin
            CreditCardEdit.Text := Floattostrf(TotalStr - (CashEdit.Value + ChequesEdit.Value + OtherEdit.Value),ffFixed,17,2);
            CreditCardEdit.SelectAll;
          End;
        end;
      end;
end;

procedure TInvoiceForm.ChequesEditEnter(Sender: TObject);
begin
      if (FromWherePaid <> 'Double') then
      begin
        if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          ChequesEdit.Text := Floattostrf(TotalStr,ffFixed,17,2);
        if (DataForm2.InvoiceTableInvClose.Value = 'Open') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cash') or (Dataform2.InvoiceTableInvoiceType.Value = 'CreditCard') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cheques') or (Dataform2.InvoiceTableInvoiceType.Value = Dataform2.GlobalTableOtherDescr.Value) then
          FromWherePaid := ''
        else
          FromWherePaid := 'Double';
        DoubleStart := '';
        ChequesEdit.SelectAll;
      end
      else
      begin
        if DoubleStart <> 'Cheques' then
        begin
          if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          begin
            ChequesEdit.Text := Floattostrf(TotalStr - (CashEdit.Value + CreditCardEdit.Value + OtherEdit.Value),ffFixed,17,2);
            ChequesEdit.SelectAll;
          end;
        end;
      end;
end;

procedure TInvoiceForm.CashEditExit(Sender: TObject);
begin
      if DataForm2.InvoiceTableInvClose.Value <> 'Close' then
      begin
        if (FromWherePaid <> 'Cash') and (FromWherePaid <> 'Double') then
          CashEdit.Text := '0.00';
        if (FromWherePaid = 'Double') and (DoubleStart <> 'Cash') then
          CashEdit.Text := '0.00';
      end;
end;

procedure TInvoiceForm.CreditCardEditExit(Sender: TObject);
begin
      if DataForm2.InvoiceTableInvClose.Value <> 'Close' then
      begin
        if (FromWherePaid <> 'CreditCard') and (FromWherePaid <> 'Double') then
          CreditCardEdit.Text := '0.00';
        if (FromWherePaid = 'Double') and (DoubleStart <> 'CreditCard') then
          CreditCardEdit.Text := '0.00';
      end;
end;

procedure TInvoiceForm.ChequesEditExit(Sender: TObject);
begin
      if DataForm2.InvoiceTableInvClose.Value <> 'Close' then
      begin
        if (FromWherePaid <> 'Cheques') and (FromWherePaid <> 'Double') then
          ChequesEdit.Text := '0.00';
        if (FromWherePaid = 'Double') and (DoubleStart <> 'Cheques') then
          ChequesEdit.Text := '0.00';
      end;
end;

procedure TInvoiceForm.JvSpeedButton7Click(Sender: TObject);
begin
      su := 'False';
      JvStatusBar1.Panels[0].Text := 'Super User disabled';
      Edit1.SetFocus;
end;

procedure TInvoiceForm.JvSpeedButton5Click(Sender: TObject);
begin
    if GroupBox4.Visible = False then
    begin
      GroupBox4.Visible := True;
      GroupBox4.BringToFront;
      Edit2.SetFocus;
    end
    else
    begin
      GroupBox4.Visible := False;
      GroupBox4.SendToBack;
      Edit1.SetFocus;
    end;
end;

procedure TInvoiceForm.JvSpeedButton6Click(Sender: TObject);
begin
    DataForm2.Query3.Close;
    with DataForm2.Query3.SQL do begin
      Clear;
      Add('Select UserName, Password, Rights from user_db');
      Add('where UserName = "' + Edit2.Text + '"');
    end;
    DataForm2.Query3.Open;
    If (Dataform2.Query3.FieldByName('UserName').asString = Edit2.Text) and
       (Dataform2.Query3.FieldByName('Password').AsString = Encrypt(Edit3.text))
       and (DataForm2.Query3.FieldByName('Rights').asInteger > 4) then
    begin
      Dataform2.InvoiceItemTableDiscount.ReadOnly := False;
      su := 'True';
      Edit2.Text := '';
      Edit3.Text := '';
      JvStatusBar1.Panels[0].Text := 'Super User enabled';
      GroupBox4.Visible := False;
      GroupBox4.SendToBack;
    end
    else
    begin
      showmessage('Wrong Password');
      su := 'False';
      Edit2.Text := '';
      Edit3.Text := '';
      JvStatusBar1.Panels[0].Text := 'Super User disabled';
    end;
    DataForm2.Query3.Close;
end;

procedure TInvoiceForm.CashEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (HiWord(GetKeyState(VK_NEXT)) <> 0) then
      begin
        FromwherePaid := 'Double';
        DoubleStart := 'Cash';
        CreditCardEdit.SetFocus;
      end;
end;

procedure TInvoiceForm.CreditCardEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if (HiWord(GetKeyState(VK_NEXT)) <> 0) then
      begin
        FromwherePaid := 'Double';
        DoubleStart := 'CreditCard';
        CashEdit.SetFocus;
      end;
end;

procedure TInvoiceForm.EditInvoice1Click(Sender: TObject);
begin
      EditButton.Click;
end;

procedure TInvoiceForm.SaveInvoice1Click(Sender: TObject);
begin
      SaveButton.Click;
end;

procedure TInvoiceForm.UndoInvoiceChanges1Click(Sender: TObject);
begin
      UndoButton.Click;
end;

procedure TInvoiceForm.PrintInvoice1Click(Sender: TObject);
begin
      Button1.Click;
end;

procedure TInvoiceForm.PrintQuote1Click(Sender: TObject);
begin
        JvSpeedButton11.Click;
end;

procedure TInvoiceForm.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.InvoiceDateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.ChequesEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//      if (Key = 'd') or (Key = 'D') then
//      begin
//        FromwherePaid := 'Double';
//      end;
      if (HiWord(GetKeyState(VK_NEXT)) <> 0) then
      begin
        FromwherePaid := 'Double';
        DoubleStart := 'Cheques';
        CashEdit.SetFocus;
      end;
end;

procedure TInvoiceForm.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.Clearallinvoices1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to Delete ALL INVOICES including purchase invoices (This cannot be undone)!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          AttentionDStr := '0';
          AttentionTStr := '';
          DataForm2.Query1.Active := False;
          with DataForm2.Query1.SQL do
          begin
            Clear;
            Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
            Add('(' + InttoStr(DatetoIntDate(date)) + ',0,"I","All Invoices Deleted",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
          end;
          DataForm2.Query1.ExecSQL;

          DataForm2.Query2.Active := False;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM invoiceitem_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM trans_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM invoice_db');
          end;
          DataForm2.Query2.ExecSQL;
          showmessage('Finished with Delete');
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TInvoiceForm.NewCleanInvoice1Click(Sender: TObject);
begin
      Button4.Click;
end;

procedure TInvoiceForm.NewInvoice1Click(Sender: TObject);
begin
        Button4.Click;
end;

procedure TInvoiceForm.NextInvoice1Click(Sender: TObject);
begin
      JvSpeedButton2.Click;
end;

procedure TInvoiceForm.InsertButtonClick(Sender: TObject);
begin
      Button4.Click;
end;

procedure TInvoiceForm.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Edit1.SetFocus;
      end;
end;

procedure TInvoiceForm.DBEdit12KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Edit1.SetFocus;
      end;
end;

procedure TInvoiceForm.DBEdit13KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Edit1.SetFocus;
      end;
end;

procedure TInvoiceForm.DBEdit11Enter(Sender: TObject);
begin
        DBEdit11.SelectAll;
end;

procedure TInvoiceForm.POSAdditions1Click(Sender: TObject);
begin
        DBEdit11.SetFocus;
end;

procedure TInvoiceForm.PreviousInvoice1Click(Sender: TObject);
begin
        JvSpeedButton1.Click;
end;

procedure TInvoiceForm.PrintA4(Report:TBaseReport);
var
    count: Integer;
    strcomment: String;
    SubTotal: Currency;
begin
      with report do
      begin
        NewA4Page(Report);
        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Price * Qty - (Price * Qty * (Discount / 100))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTableBranchNo.Value));
        end;
        Dataform2.Query3.Open;

//        Dataform2.InvoiceItemTable.Refresh;
        If DataForm2.IniFile.ReadString ('Settings', 'InvoiceItems', 'Standard') = 'Standard' then
        begin
          DataForm2.InvoiceItemTable.first;
          try
            while not DataForm2.InvoiceItemTable.EOF do
            begin
              NewLine;
              If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
              begin
                NewPage;
                NewA4Page(Report);
                NewLine;
              end
              else
                Inc(linecount);
              if DataForm2.InvoiceItemTableCommentSwi.Value = 'False' then
              begin
                SetInvoiceLineColumns(Report,False);
                PrintTab(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString);
                PrintTab(DataForm2.InvoiceItemTableTCStockNo.Value);
                PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
                PrintTab(floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency,ffFixed,17,2));
                PrintTab(floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Discount').asFloat,ffFixed,17,2));
                if Dataform2.GlobalTableVat.Value <> 0 then
                begin
                  PrintTab(Floattostrf((Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat) * 100 / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
                  PrintTab(Floattostrf((Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat) * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
                  PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
                end
                else
                begin
                  PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
                end;
                PrintTab(Dataform2.InvoiceItemTableComment.Value);
              end
              else
              begin
                if Dataform2.GlobalTableVat.Value <> 0 then
                begin
                  ClearTabs;
                  SetTab(0.25, pjLeft,7.88,0,BOXLINEALL,0);
                end
                else
                begin
                  ClearTabs;
                  SetTab(0.25, pjLeft,6.8,0,BOXLINEALL,0);
                end;
                PrintTab(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString);
              end;
              DataForm2.InvoiceItemTable.Next;
            end;
          finally
          end;
          If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
          begin
            NewPage;
            NewA4Page(Report);
            NewLine;
          end
          else
            Inc(linecount);
          SetInvoiceLineColumns(Report,False);
          NewLine;
          Bold := True;
          PrintTab('Total');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          if Dataform2.GlobalTableVat.Value <> 0 then
          begin
            PrintTab(Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency  * 100 / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
            PrintTab(Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
            PrintTab(Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffFixed,17,2));
          end
          else
          begin
            PrintTab(Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffFixed,17,2));
          end;
          PrintTab('');
          Bold := False;
        end
        else
        begin
          strcomment := '000000';
          SubTotal := 0;
          DataForm2.InvoiceItemTable.first;
          try
            while not DataForm2.InvoiceItemTable.EOF do
            begin
              NewLine;
              if (strcomment <> Dataform2.InvoiceItemTableComment.Value) and (strcomment <> '000000')
                 and (Dataform2.InvoiceItemTableComment.Value <> '') then
              begin
                If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
                begin
                  NewPage;
                  NewA4Page(Report);
                  NewLine;
                end
                else
                  Inc(linecount);
                PrintTab('');
                Bold := True;
                PrintTab('Sub Total');
                PrintTab('');
                PrintTab('');
                PrintTab('');
                if Dataform2.GlobalTableVat.Value <> 0 then
                begin
                  PrintTab('');
                  PrintTab('');
                  PrintTab(Floattostrf(SubTotal,ffFixed,17,2));
                end
                else
                begin
                  PrintTab(Floattostrf(SubTotal,ffFixed,17,2));
                end;
                Bold := False;
                NewLine;
                strcomment := Dataform2.InvoiceItemTableComment.Value;
                SubTotal := 0;
                SubTotal := SubTotal + (Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat);
              end
              else
              begin
                If (strcomment = '000000') then
                  strcomment := Dataform2.InvoiceItemTableComment.Value;
                SubTotal := SubTotal + (Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat);
              end;
              If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
              begin
                NewPage;
                NewA4Page(Report);
                NewLine;
              end
              else
                Inc(linecount);
              Bold := True;
              PrintTab(Dataform2.InvoiceItemTableComment.Value);
              Bold := False;
              PrintTab(DataForm2.InvoiceItemTable.Fieldbyname('Description').asString);
              PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
              PrintTab(DataForm2.InvoiceItemTableModelNo.Value);
              PrintTab(floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency,ffFixed,17,2));
              if Dataform2.GlobalTableVat.Value <> 0 then
              begin
                PrintTab(Floattostrf((Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat) * 100 / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
                PrintTab(Floattostrf((Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat) * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),ffFixed,17,2));
                PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
              end
              else
              begin
                PrintTab(Floattostrf(Dataform2.InvoiceItemTable.Fieldbyname('Price').asCurrency * Dataform2.InvoiceItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
              end;
              DataForm2.InvoiceItemTable.Next;
            end;
          finally
          end;
          NewLine;
          If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
          begin
            NewPage;
            NewA4Page(Report);
            NewLine;
          end
          else
            Inc(linecount);
          PrintTab('');
          Bold := True;
          PrintTab('Sub Total');
          PrintTab('');
          PrintTab('');
          PrintTab('');
          if Dataform2.GlobalTableVat.Value <> 0 then
          begin
            PrintTab('');
            PrintTab('');
            PrintTab(Floattostrf(SubTotal,ffFixed,17,2));
          end
          else
          begin
            PrintTab(Floattostrf(SubTotal,ffFixed,17,2));
          end;
          Bold := False;
          NewLine;
        end;

        SetFont('Arial',10);

        If Dataform2.InvoiceTableInvoiceType.Value = 'LayBuy' then
        begin
          NewLine;
          If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
          begin
            NewPage;
            NewA4Page(Report);
            NewLine;
          end
          else
            Inc(linecount);
          ClearTabs;
          SetTab(0.25, pjCenter,2,0,0,0);
          SetTab(NA, pjCenter,0.9,0,0,0);
          SetTab(NA, pjCenter,0.9,0,0,0);
          SetTab(NA, pjCenter,0.9,0,0,0);

          NewLine;
          If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
          begin
            NewPage;
            NewA4Page(Report);
            NewLine;
          end
          else
            Inc(linecount);
          PrintTab('Description');
          PrintTab('Date');
          PrintTab('Amount');
          PrintTab('Nr');

          ClearTabs;
          SetTab(0.25, pjLeft,2,0,BOXLINEALL,0);
          SetTab(NA, pjLeft,0.9,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.9,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.9,0,BOXLINEALL,0);

          If FromWhereStatement <> 'LayBuy' then
          begin
            Dataform2.TransQuery.Close;
            with Dataform2.TransQuery.SQL do begin
              Clear;
              Add('Select * from trans_db');
              Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
              Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
              Add('and TransType = ''L''');
            end;
            DataForm2.TransQuery.Open;
          end;
          DataForm2.TransQuery.first;
          try
            while not DataForm2.TransQuery.EOF do
            begin
              NewLine;
              If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
              begin
                NewPage;
                NewA4Page(Report);
                NewLine;
              end
              else
                Inc(linecount);

              PrintTab(DataForm2.TransQuery.Fieldbyname('Description').asString);
              PrintTab(IntDatetoString(Dataform2.TransQuery.Fieldbyname('Date').asInteger));
              PrintTab(floattostrf(Dataform2.TransQuery.Fieldbyname('Ammount').asFloat,ffFixed,17,2));
              PrintTab(InttoStr(Dataform2.TransQuery.Fieldbyname('Nr').asInteger));

              DataForm2.TransQuery.Next;
            end;
          finally
          end;
          If FromWhereStatement <> 'LayBuy' then
            Dataform2.TransQuery.Close;
        end;

        NewLine;
        NewLine;
        Bold := True;
        printXY(0.250,DataForm2.IniFile.ReadFloat ('Settings', 'A4InvBottomStart', 8.5),'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;
        If (Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) then
        begin
          if ReceiptFromWhere <> 'Quote' then
          begin
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              printLeft('Invoice Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2) + '   VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100) ,ffCurrency,17,2), 0.5);
            end
            else
            begin
              printLeft('Invoice Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2), 0.5);
            end;
            printLeft('Invoice Accepted', 5.25);
            NewLine;
            If (Dataform2.InvoiceTableInvoiceType.Value <> 'LayBuy') then
            begin
              printLeft('Cash Tendered: ' + Floattostrf(AmmTendered + AmmTendered2,ffCurrency,17,2), 0.5);
              NewLine;
              printLeft('Change: ' + Floattostrf((Dataform2.InvoiceTableAmmTendered.asCurrency + Dataform2.InvoiceTablePremium.asCurrency) - TotalStr,ffCurrency,17,2), 0.5);
            end
            else
            begin
              DataForm2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('SELECT Sum(Ammount) as Total FROM trans_db');
                Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
                Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
                Add('and TransType = ''L''');
              end;
              Dataform2.Query2.Open;

              printLeft('Payed: ' + Floattostrf(Dataform2.Query2.FieldByName('Total').asCurrency,ffCurrency,17,2), 0.5);
              NewLine;
              printLeft('Owing: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency - Dataform2.Query2.FieldByName('Total').asCurrency,ffCurrency,17,2), 0.5);
            end;
          end
          else
          begin
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              printLeft('Quote Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2) + '   VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100) ,ffCurrency,17,2), 0.5);
            end
            else
            begin
              printLeft('Quote Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2), 0.5);
            end;
            printLeft('Quote Accepted', 5.25);
            NewLine;
          end;
        end
        else
        begin
          if ReceiptFromWhere <> 'Quote' then
          begin
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              printLeft('Debtor Invoice Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2) + '   VAT: ' + Floattostrf(MyRoundTo(DataForm2.Query3.Fieldbyname('Total').asFloat * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),-2) ,ffCurrency,17,2), 0.5);
            end
            else
            begin
              printLeft('Debtor Invoice Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asCurrency,ffCurrency,17,2), 0.5);
            end;
            printLeft('Invoice Accepted', 5.25);
            NewLine;
            If Dataform2.InvoiceTableAmmTendered.Value <> 0 then
            begin
              printLeft('Payed: ' + Floattostrf(Dataform2.InvoiceTableAmmTendered.asCurrency,ffCurrency,17,2), 0.5);
              NewLine;
              If (Dataform2.InvoiceTableAmmTendered.asCurrency + Dataform2.InvoiceTablePremium.asCurrency) > Dataform2.InvoiceTableInvTotal.asCurrency then
              begin
                printLeft('Change: ' + Floattostrf((Dataform2.InvoiceTableAmmTendered.asCurrency + Dataform2.InvoiceTablePremium.asCurrency) - TotalStr,ffCurrency,17,2), 0.5);
              end
              else
              begin
                printLeft('Owing: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat - (Dataform2.InvoiceTableAmmTendered.Value + Dataform2.InvoiceTablePremium.Value),ffCurrency,17,2), 0.5);
              end;
            end;
          end
          else
          begin
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              printLeft('Debtor Quote Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + '   VAT: ' + Floattostrf(MyRoundTo(DataForm2.Query3.Fieldbyname('Total').asFloat * Dataform2.GlobalTableVat.Value / (Dataform2.GlobalTableVat.Value + 100),-2) ,ffCurrency,17,2), 0.5);
            end
            else
            begin
              printLeft('Debtor Quote Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2), 0.5);
            end;
            printLeft('Quote Accepted', 5.25);
            NewLine;
          end;

          NewLine;
        end;
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

procedure TInvoiceForm.NewA4Page(Report:TBaseReport);
var
    count: Integer;
    logo: TBitmap;
begin
      with report do
      begin
        logo := TBitmap.Create;
        try
          logo.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
          PrintBitmapRect(0.75,0.50,4,3.25,logo);
//          PrintBitmapRect(0.75,0.50,CalcGraphicWidth(3.0,logo),CalcGraphicHeight(3.0,logo),logo);
        finally
        logo.Free;
        end;

        MarginLeft := 0.250;
        MarginTop := 0.5;
        SetFont('Arial',14);
        Bold := True;
        Italic := True;
        if ReceiptFromWhere <> 'Quote' then
        begin
          If FromWhereStatement <> 'LAYBUY' then
          begin
            If (Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) then
            begin
              printLeft('INVOICE', 4.75);
            end
            else
            begin
              printLeft('DEBTOR INVOICE', 4.75);
            end;
          end
          else
          begin
              printLeft('INVOICE / STATEMENT', 4.75);
          end;
        end
        else
        begin
          printLeft('QUOTATION', 4.75);
        end;
        Bold := False;
        Italic := False;
        NewLine;
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
        ClearTabs;
        SetTab(4.75, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,2.5,0,0,0);
        NewLine;
        printTab('Name:');
        PrintTab(DataForm2.InvoiceTable.FieldByName('ClientName').asString);
        NewLine;
        NewLine;
        Bold := False;
        SetFont('Arial',8);
        if DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString <> '' then
        begin
          printTab('Vat No:');
          PrintTab(DataForm2.InvoiceTable.Fieldbyname('ClientVatNo').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString <> '' then
        begin
          printTab('Address:');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientAdr1').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString <> '' then
        begin
          printTab('');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientAdr2').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString <> '' then
        begin
          printTab('');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientAdr3').asString + ' ' + DataForm2.InvoiceTable.Fieldbyname('ClientPCode').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString <> '' then
        begin
          printTab('Tel (W):');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientTelW').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString <> '' then
        begin
          printTab('Tel (C):');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientTelC').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString <> '' then
        begin
          printTab('E Mail:');
          printTab(DataForm2.InvoiceTable.Fieldbyname('ClientEMail').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTable.Fieldbyname('RefNo').asString <> '' then
        begin
          printTab('Ref No:');
          printTab(DataForm2.InvoiceTable.Fieldbyname('RefNo').asString);
          NewLine;
        end;
        if DataForm2.InvoiceTableGLDebNo.asString <> DataForm2.IniFile.ReadString ('TCSetup', 'TCCashDebNo', '') then
        begin
          printTab('Debtor No:');
          printTab(DataForm2.InvoiceTableGLDebNo.asString);
          NewLine;
        end;
        NewLine;
        if ReceiptFromWhere <> 'Quote' then
          printTab('Invoice By:')
        else
          printTab('Quote By:');
        printTab(DataForm2.InvoiceTable.FieldByName('InvBy').asString);
        NewLine;
        if ReceiptFromWhere <> 'Quote' then
          printTab('Invoice Date:')
        else
          printTab('Quote Date:');
        printTab(IntDatetoString(DataForm2.InvoiceTable.Fieldbyname('InvDate').asInteger));
        NewLine;
        if ReceiptFromWhere <> 'Quote' then
          printTab('Invoice No:')
        else
          printTab('Quote No:');
        printTab(InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ' / ' + InttoStr(DataForm2.InvoiceTable.Fieldbyname('InvNo').asInteger));
        SetFont('Arial',10);
        NewLine;
        Bold := True;
        printXY(0.250,3.4,'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;

        SetFont('Arial',8);
        SetInvoiceLineColumns(Report,True);
      end;
end;

procedure TInvoiceForm.SetInvoiceLineColumns(Report:TBaseReport;ShowTitles:Boolean);
begin
      with report do
      begin
        If DataForm2.IniFile.ReadString ('Settings', 'InvoiceItems', 'Standard') = 'Standard' then
        begin
          if ShowTitles = True then
          begin
            ClearTabs;
            if Dataform2.GlobalTableVat.Value <> 0 then
              SetTab(0.25, pjCenter,1.5,0,0,0)
            else
              SetTab(0.25, pjCenter,2,0,0,0);
            SetTab(NA, pjCenter,1,0,0,0);
            SetTab(NA, pjCenter,0.7,0,0,0);
            SetTab(NA, pjCenter,0.8,0,0,0);
            SetTab(NA, pjCenter,0.6,0,0,0);
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              SetTab(NA, pjCenter,0.8,0,0,0);
              SetTab(NA, pjCenter,0.78,0,0,0);
              SetTab(NA, pjCenter,0.8,0,0,0);
            end
            else
            begin
              SetTab(NA, pjCenter,0.8,0,0,0);
            end;
            SetTab(NA, pjCenter,0.9,0,0,0);

            NewLine;
            PrintTab('Description');
            PrintTab('Stock No');
            PrintTab('Qty');
            PrintTab('Price');
            PrintTab('% Disc');
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              PrintTab('Amm Excl');
              PrintTab('VAT');
              PrintTab('Amm Incl');
            end
            else
            begin
              PrintTab('Amount');
            end;
            PrintTab(Dataform2.GlobalTableCommentDescr.Value);
            Bold := false;
          end;
          ClearTabs;
          if Dataform2.GlobalTableVat.Value <> 0 then
            SetTab(0.25, pjLeft,1.5,0,BOXLINEALL,0)
          else
            SetTab(0.25, pjLeft,2,0,BOXLINEALL,0);
          SetTab(NA, pjCenter,1,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.7,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.6,0,BOXLINEALL,0);
          if Dataform2.GlobalTableVat.Value <> 0 then
          begin
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
            SetTab(NA, pjRight,0.78,0,BOXLINEALL,0);
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          end
          else
          begin
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          end;
          SetTab(NA, pjRight,0.9,0,BOXLINEALL,0);
        end
        else
        begin
          if ShowTitles = True then
          begin
            ClearTabs;
            if Dataform2.GlobalTableVat.Value <> 0 then
              SetTab(0.25, pjCenter,1.5,0,0,0)
            else
              SetTab(0.25, pjCenter,2,0,0,0);
            SetTab(NA, pjCenter,1.7,0,0,0);
            SetTab(NA, pjCenter,0.6,0,0,0);
            SetTab(NA, pjCenter,0.9,0,0,0);
            SetTab(NA, pjCenter,0.8,0,0,0);
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              SetTab(NA, pjCenter,0.8,0,0,0);
              SetTab(NA, pjCenter,0.78,0,0,0);
              SetTab(NA, pjCenter,0.8,0,0,0);
            end
            else
            begin
              SetTab(NA, pjCenter,0.8,0,0,0);
            end;

            NewLine;
            PrintTab(Dataform2.GlobalTableCommentDescr.Value);
            PrintTab('Description');
            PrintTab('Qty');
            PrintTab('Unit');
            PrintTab('Price');
            if Dataform2.GlobalTableVat.Value <> 0 then
            begin
              PrintTab('Amm Excl');
              PrintTab('VAT');
              PrintTab('Amm Incl');
            end
            else
            begin
              PrintTab('Amount');
            end;
            Bold := false;
          end;
          ClearTabs;
          if Dataform2.GlobalTableVat.Value <> 0 then
            SetTab(0.25, pjLeft,1.5,0,BOXLINEALL,0)
          else
            SetTab(0.25, pjLeft,2,0,BOXLINEALL,0);
          SetTab(NA, pjCenter,1.7,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.6,0,BOXLINEALL,0);
          SetTab(NA, pjCenter,0.9,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          if Dataform2.GlobalTableVat.Value <> 0 then
          begin
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
            SetTab(NA, pjRight,0.78,0,BOXLINEALL,0);
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          end
          else
          begin
            SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          end;
        end;
      end;
end;

procedure TInvoiceForm.OtherEditEnter(Sender: TObject);
begin
      if (FromWherePaid <> 'Double') then
      begin
        if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          OtherEdit.Text := Floattostrf(TotalStr,ffFixed,17,2);
        if (DataForm2.InvoiceTableInvClose.Value = 'Open') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cash') or (Dataform2.InvoiceTableInvoiceType.Value = 'CreditCard') or (Dataform2.InvoiceTableInvoiceType.Value = 'Cheques') or (Dataform2.InvoiceTableInvoiceType.Value = Dataform2.GlobalTableOtherDescr.Value) then
          FromWherePaid := ''
        else
          FromWherePaid := 'Double';
        DoubleStart := '';
        OtherEdit.SelectAll;
      end
      else
      begin
        if DoubleStart <> 'Other' then
        begin
          if (DataForm2.InvoiceTableInvClose.Value <> 'Close') and ((Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or ((Dataform2.InvoiceTableGLDebNo.Value <> Dataform2.GlobalTableTCCashDebNo.Value) and (Dataform2.AccountsTableAllowCredit.Value = 'False'))) then
          begin
            OtherEdit.Text := Floattostrf(TotalStr - (CashEdit.Value + CreditCardEdit.Value + ChequesEdit.Value),ffFixed,17,2);
            OtherEdit.SelectAll;
          end;
        end;
      end;
end;

procedure TInvoiceForm.OtherEditExit(Sender: TObject);
begin
      if DataForm2.InvoiceTableInvClose.Value <> 'Close' then
      begin
        if (FromWherePaid <> Label22.Caption) and (FromWherePaid <> 'Double') then
          OtherEdit.Text := '0.00';
        if (FromWherePaid = 'Double') and (DoubleStart <> 'Other') then
          OtherEdit.Text := '0.00';
      end;
end;

procedure TInvoiceForm.OtherEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//      if (Key = 'd') or (Key = 'D') then
//      begin
//        FromwherePaid := 'Double';
//      end;

      if (HiWord(GetKeyState(VK_NEXT)) <> 0) then
      begin
        FromwherePaid := 'Double';
        DoubleStart := 'Other';
        CashEdit.SetFocus;
      end;
end;

procedure TInvoiceForm.OtherEditKeyPress(Sender: TObject; var Key: Char);
begin
      if (Key = #13) and (FromWherePaid <> 'Double') then
      begin
        AmmTendered := OtherEdit.Value;
        AmmTendered2 := 0.00;
        FromWherePaid := Label22.Caption;
        Change.Caption := 'Change ' + Floattostrf(AmmTendered - TotalStr,ffCurrency,17,2);
        Button1.Click;
      end;
      if (Key = #13) and (FromWherePaid = 'Double') then
      begin
        CheckDouble;
        Button1.Click;
      end;
end;

procedure TInvoiceForm.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        Button2.Click;
      end;
end;

procedure TInvoiceForm.LayBuyBtnClick(Sender: TObject);
var
     Persentage: String;
     e,e2: extended;
     MSContinue:Boolean;
begin
    If DataForm2.InvoiceTable.FieldByName('Invclose').asString <> 'Close' then
    begin
      MSContinue := True;
      If Dataform2.GlobalTableMinimumMarkup.Value <> 0 then
      begin
        If Dataform2.GlobalTableMinimumMarkup.Value < 10 then
          Persentage := '1.0' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value)
        else
        begin
          If Dataform2.GlobalTableMinimumMarkup.Value > 99 then
            Persentage := '2.' + copy(FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value),2,2)
          else
            Persentage := '1.' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value);
        end;
        DataForm2.InvoiceItemTable.DisableControls;
        DataForm2.InvoiceItemTable.First;
        while not DataForm2.InvoiceItemTable.EOF do
        begin
          If (Dataform2.InvoiceItemTablePrice.Value < (Dataform2.InvoiceItemTableCostPrice.Value * StrtoFloat(Persentage))) and (su <> 'True') then
          begin
            showmessage('One Item is below Minimum Sales Price Fix Item!');
            MSContinue := False;
            break;
          end;
          DataForm2.InvoiceItemTable.Next;
        end;
        Dataform2.InvoiceItemTable.EnableControls;
      end;

      if StrtoBool(Dataform2.GlobalTableNegQty.Value) = true then
      begin
        DataForm2.InvoiceItemTable.DisableControls;
        DataForm2.InvoiceItemTable.First;
        while not DataForm2.InvoiceItemTable.EOF do
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Select Qty from stock_db');
            Add('where TCStockNo = "' + DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString + '"');
            Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          end;
          Dataform2.Query2.Prepared := True;
          Dataform2.Query2.Open;
          e2 := InvoiceForm.OpenLayBuyQty(DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
          If (DataForm2.InvoiceItemTableQty.Value > DataForm2.Query2.FieldByName('Qty').asInteger - e2) and (DataForm2.User_db.FieldByName('Rights').asInteger < 5) and (su <> 'True')  then
          begin
            showmessage('Trying to convert to Lay Buy Stock that is not Available!');
            MSContinue := False;
            break;
          end;
          DataForm2.InvoiceItemTable.Next;
        end;
        Dataform2.InvoiceItemTable.EnableControls;
      end;


      if (MSContinue = True) then
      begin
        if (MessageDlg('Are you sure you want to convert to a lay buy account', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
        begin
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do
          begin
            Clear;
            Add('select nr from invoiceitem_db');
            Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
            Add('and CommentSwi = ''False''');
          end;
          Dataform2.Query4.Open;
          if Dataform2.Query4.RecordCount <> 0 then
          begin
            Application.CreateForm(TLayBuyForm, LayBuyForm);
            LayBuyform.FromWhere := 'POS';
            LayBuyForm.Label13.Caption := Floattostrf(TotalStr,ffCurrency,17,2);
            LayBuyForm.Label16.Caption := '';
            LayBuyForm.Edit2.Text := Inttostr(Dataform2.GlobalTableLayBuyTerm.Value);
            LayBuyForm.Edit1.text := Floattostr(MyRoundTo(TotalStr * Dataform2.GlobalTableLayBuyDeposit.Value / 100, -2));
            Button4.SetFocus;
            LayBuyform.showmodal;
            LayBuyform.Free;
          end
          else
            showmessage('Add Products First!');
          Dataform2.Query4.Close;
        end;
      end;
    end
    else
      showmessage('Invoice already closed!');
end;

procedure TInvoiceForm.JvBitBtn2Click(Sender: TObject);
begin
          Close;
end;

procedure TInvoiceForm.InvoiceItemGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Persentage: String;
  e,e2: Extended;
begin
     //  Rooi as gecancel.
      If (Dataform2.GlobalTableMinimumMarkup.Value <> 0) and (Dataform2.InvoiceTableInvClose.Value = 'Open') then
      begin
        If Dataform2.GlobalTableMinimumMarkup.Value < 10 then
          Persentage := '1.0' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value)
        else
        begin
          If Dataform2.GlobalTableMinimumMarkup.Value > 99 then
            Persentage := '2.' + copy(FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value),2,2)
          else
            Persentage := '1.' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value);
        end;
        If Dataform2.InvoiceItemTablePrice.Value < (Dataform2.InvoiceItemTableCostPrice.Value * StrtoFloat(Persentage)) then
        begin
          InvoiceItemGrid.Canvas.Font.Color := clRed;
        end;
      end;

      if (StrtoBool(Dataform2.GlobalTableNegQty.Value) = true) and (Dataform2.InvoiceTableInvClose.Value = 'Open') then
      begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('Select Qty,NonStockItem from stock_db');
          Add('where TCStockNo = "' + DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString + '"');
          Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        end;
        Dataform2.Query2.Prepared := True;
        Dataform2.Query2.Open;
        e2 := InvoiceForm.OpenLayBuyQty(DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
        If (DataForm2.InvoiceItemTableQty.Value > DataForm2.Query2.FieldByName('Qty').asInteger - e2) and (Dataform2.Query2.FieldByName('NonStockItem').Value <> 'True')  then
        begin
          InvoiceItemGrid.Canvas.Font.Color := clLime;
        end;
        Dataform2.Query2.Close;
        Dataform2.Query2.Prepared := False;
      end;

     // Default drawing.
      InvoiceItemGrid.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TInvoiceForm.JvSpeedButton8Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
      begin
        if (DataForm2.InvoiceTableInvClose.Value <> 'Close') then
        begin
          Application.CreateForm(TLocalAccountSearchForm, LocalAccountSearchForm);
          LocalAccountSearchForm.FromWhere := 'IDebtor';
          LocalAccountSearchForm.Showmodal;
          LocalAccountSearchForm.Free;
        end
        else
          showMessage('Invoice already closed!');
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceForm.Button4Click(Sender: TObject);
begin
        SaveButton.Click;
        DataForm2.InvoiceTable.Append;
        DataForm2.InvoiceTable.FieldByName('InvDate').AsInteger := datetoIntDate(date);
        DataForm2.InvoiceTable.FieldByName('ClientName').AsString := 'Cash';
        DataForm2.InvoiceTable.FieldByName('GLDebNo').asString := Dataform2.GlobalTableTCCashDebNo.Value;
        DataForm2.InvoiceTable.FieldByName('InvBy').asString := Dataform2.User_db.Fieldbyname('UserName').asString;
        DataForm2.InvoiceTable.FieldByName('InvClose').asString := 'Open';
        Dataform2.InvoiceTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
        DataForm2.InvoiceTableShiftSet.Value := '';
        Dataform2.InvoicetableInvNo.Value := 0;
        OpenInvoiceItems();
        DescDisp.Caption := '';
        Change.Caption := 'Change 0.00';
        Total.Caption := 'Total 0.00';
        VAT.Caption := 'VAT: 0.00';
        CashEdit.Text := '0.00';
        CreditCardEdit.Text := '0.00';
        ChequesEdit.Text := '0.00';
        OtherEdit.Text := '0.00';
        su := 'False';
        JvStatusBar1.Panels[0].Text := 'Super User disabled';
        AmmTendered := 0;
        AmmTendered2 := 0;
        ShowDates;
        Edit1.SetFocus;
end;

procedure TInvoiceForm.AddComment1Click(Sender: TObject);
begin
        JvSpeedButton12.Click;
end;

procedure TInvoiceForm.AddProducts1Click(Sender: TObject);
begin
        if GroupBox1.Visible = True then
        begin
          GroupBox1.Visible := False;
          GroupBox1.SendToBack;
        end;
        Edit1.SetFocus;
        Edit1.SelectAll;
end;

procedure TInvoiceForm.Button1Click(Sender: TObject);
var
  MSContinue, Persentage: String;
  e,e2: Extended;
begin
    if (Dataform2.InvoiceTableInvClose.Value <> 'Close') and (Dataform2.InvoiceTableInvClose.Value <> 'LaybC') then
    begin
      MSContinue := 'True';

      If (Dataform2.GlobalTableMinimumMarkup.Value <> 0) and (Dataform2.InvoiceTableInvClose.Value = 'Open') then
      begin
        If Dataform2.GlobalTableMinimumMarkup.Value < 10 then
          Persentage := '1.0' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value)
        else
        begin
          If Dataform2.GlobalTableMinimumMarkup.Value > 99 then
            Persentage := '2.' + copy(FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value),2,2)
          else
            Persentage := '1.' + FloattoStr(Dataform2.GlobalTableMinimumMarkup.Value);
        end;
        DataForm2.InvoiceItemTable.DisableControls;
        DataForm2.InvoiceItemTable.First;
        while not DataForm2.InvoiceItemTable.EOF do
        begin
          If (Dataform2.InvoiceItemTablePrice.Value < (Dataform2.InvoiceItemTableCostPrice.Value * StrtoFloat(Persentage))) and (su <> 'True') then
          begin
            showmessage('One Item is below Minimum Sales Price Fix Item!');
            MSContinue := 'False';
            break;
          end;
          DataForm2.InvoiceItemTable.Next;
        end;
        Dataform2.InvoiceItemTable.EnableControls;
      end;

      if (StrtoBool(Dataform2.GlobalTableNegQty.Value) = true) and (Dataform2.InvoiceTableInvClose.Value = 'Open') then
      begin
        DataForm2.InvoiceItemTable.DisableControls;
        DataForm2.InvoiceItemTable.First;
        while not DataForm2.InvoiceItemTable.EOF do
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Select Qty from stock_db');
            Add('where TCStockNo = "' + DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString + '"');
            Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          end;
          Dataform2.Query2.Prepared := True;
          Dataform2.Query2.Open;
          e2 := InvoiceForm.OpenLayBuyQty(DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
          If (DataForm2.InvoiceItemTableQty.Value > DataForm2.Query2.FieldByName('Qty').asInteger - e2) and (DataForm2.User_db.FieldByName('Rights').asInteger < 5) and (su <> 'True')  then
          begin
            showmessage('Trying to sell Stock that is not Available!');
            MSContinue := 'False';
            break;
          end;
          DataForm2.InvoiceItemTable.Next;
        end;
        Dataform2.InvoiceItemTable.EnableControls;
      end;

      If MSContinue <> 'False' then
      begin
        If (FromWherePaid = '') then
        begin
          Showmessage('Invoice not Closed, to Close press "ENTER" on Cash, Credit Card, Cheque or Other Value!');
          CashEdit.SetFocus;
        end
        else
          CloseInvPros;
      end
      else
        InvoiceItemGrid.SetFocus;
    end
    else
    begin
          If (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver Receipt') or (DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') = 'Driver A4') then
          begin
            ReceiptPrinting.Execute;
          end
          else
          begin
            if copy(DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0'),1,3) = 'COM' then
              PrintReceipttoCOM()
            else
              PrintReceipttoLPT();
          end;
    end;
end;

procedure TInvoiceForm.JvSpeedButton9Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 2 then
      begin
        Application.CreateForm(TBarcodePrintingForm, BarcodePrintingForm);
        BarCodePrintingForm.Fromwhere := 'InvItem';
        BarcodePrintingForm.showmodal;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TInvoiceForm.DBEdit10Exit(Sender: TObject);
begin
      SaveButton.Click;
end;

procedure TInvoiceForm.WriteCloseInfo();
begin
          If (Dataform2.InvoiceTableGLDebNo.Value = Dataform2.GlobalTableTCCashDebNo.Value) or
             (AmmTendered + AmmTendered2 > TotalStr) then
            Change.Caption := 'Change ' + Floattostrf((AmmTendered + AmmTendered2) - TotalStr,ffCurrency,17,2)
          else
            Change.Caption := '';
          If (DataForm2.InvoiceTable.FieldByName('Invclose').asString <> 'Close') and (DataForm2.InvoiceTable.FieldByName('Invclose').asString <> 'LaybC')
             and (DataForm2.InvoiceTable.FieldByName('Invclose').asString <> 'LaybO') then
          begin
            DataForm2.InvoiceTable.Edit;
            CreateInvNo;
            DataForm2.InvoiceTable.FieldByName('Invclose').asString := 'Close';
            DataForm2.InvoiceTable.FieldByName('InvTotal').asCurrency := TotalStr;
            DataForm2.InvoiceTable.FieldByName('AmmTendered').asCurrency := AmmTendered;
            Dataform2.InvoiceTable.FieldByName('Premium').asCurrency := AmmTendered2;
            DataForm2.InvoiceTable.FieldByName('InvoiceType').asString := FromWherePaid;
            SaveButton.Click;
            QtyCountDown;
            Dataform2.StockTable.Refresh;
            UpdateDebAcc;
          end;
end;

procedure TInvoiceForm.JvSpeedButton10Click(Sender: TObject);
begin
    if GroupBox6.Visible = False then
    begin
      GroupBox6.Visible := True;
      GroupBox6.BringToFront;
      FindInvEdit.SetFocus;
    end
    else
    begin
      GroupBox6.Visible := False;
      GroupBox6.SendToBack;
      Edit1.SetFocus;
    end;
end;

procedure TInvoiceForm.JvSpeedButton11Click(Sender: TObject);
begin
            CreateInvNo;
            SaveButton.Click;
            ReceiptFromWhere := 'Quote';
            ReceiptPrinting.Execute;
            SaveButton.Click;
end;

procedure TInvoiceForm.JvSpeedButton12Click(Sender: TObject);
begin
    If DataForm2.IniFile.ReadString ('Settings', 'InvoiceItems', 'Standard') = 'Standard' then
    begin
      if (Dataform2.InvoiceTable.FieldByName('InvClose').AsString = 'Open') then
      begin
        DataForm2.InvoiceItemTable.Append;
        DataForm2.InvoiceItemTable.FieldByName('LinkId').asInteger := DataForm2.InvoiceTable.FieldByName('Nr').asInteger;
        DataForm2.InvoiceItemTable.FieldByName('BranchNo').asInteger := DataForm2.InvoiceTable.FieldByName('BranchNo').asInteger;
        Dataform2.InvoiceItemTableCommentSwi.Value := 'True';
        SaveInvoiceItems;
        InvoiceItemGrid.SetFocus;
      end
      else
        showmessage('Create New Invoice First!');
    end
    else
    begin
      Showmessage('Comment line not available in selected type of invoice');
    end;
end;

procedure TInvoiceForm.JvBitBtn3Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) or (su = 'True') then
      begin
        If not Dataform2.InvoiceTable.Locate('InvNo;BranchNo',VarArrayOf([FindInvEdit.Text,JvSpinEdit1.Text]),[loPartialKey, loCaseInsensitive]) then
        begin
          If not Dataform2.InvoiceTable.Locate('InvNo',FindInvEdit.Text,[loPartialKey, loCaseInsensitive]) then
            showmessage('Inv Could not be found press on ''Options,Show All Invoices'' then try again');
        end;
        OpenInvoiceItems();
        ShowDates();
        RefreshTotal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TInvoiceForm.JvBitBtn5Click(Sender: TObject);
begin
          JvSpeedButton4.Click;
end;

procedure TInvoiceForm.JvBitBtn6Click(Sender: TObject);
begin
        SaveButton.Click;
end;

procedure TInvoiceForm.JvBitBtn7Click(Sender: TObject);
begin
        JvSpeedButton11.Click;
end;

procedure TInvoiceForm.MarkCurrentInvoiceasnotsendtohq1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) or (su = 'True') then
      begin
        if MessageDlg('Are you sure you want to Mark Current invoice as not send to hq!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          If not DataForm2.InvoiceTableSyncHQ.IsNull then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableSyncHQ.Clear;
            SaveButton.Click;
          end
          else
            showmessage('Invoice are already marked to be send to hq!');
          Button4.SetFocus;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TInvoiceForm.MarkCurrentInvoicenotendofShifted1Click(
  Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) or (su = 'True') then
      begin
        if MessageDlg('Are you sure you want to Mark Current invoice as not end of shifted!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          If DataForm2.InvoiceTableShiftSet.Value <> '' then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableShiftSet.Value := '';
            SaveButton.Click;
          end
          else
            showmessage('Invoice are already marked not end of shifted, run end of shift again or call support!');
          Button4.SetFocus;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TInvoiceForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        JvSpeedButton6.Click;
      end;
end;

procedure TInvoiceForm.UndoButtonClick(Sender: TObject);
begin
        DataForm2.InvoiceItemTable.Cancel;
        Dataform2.InvoiceTable.Cancel;
        ShowDates;
end;

function TInvoiceForm.OpenLayBuyQty(TCStockNo:String;BranchNoInt:Integer): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do
        begin
          Clear;
          Add('SELECT SUM(invoiceitem_db.Qty) as Total');
          Add('from invoiceitem_db inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where (invoice_db.InvClose = "LaybO")');
          Add('and (invoiceitem_db.CommentSwi = "False")');
          Add('and (invoiceitem_db.TCStockNo = "' + TCStockNo + '")');
          Add('and (invoice_db.BranchNo = ' + InttoStr(BranchNoInt) + ')');
        end;
        Query1.Prepare;
        Query1.Open;
        OpenLayBuyQty := Query1.Fieldbyname('Total').asFloat;
        Query1.Close;
        Query1.Free;
end;

procedure TInvoiceForm.SaveInvoiceItems();
begin
        if (DataForm2.InvoiceItemTablestrState = 'Edit') or (DataForm2.InvoiceItemTablestrState = 'Insert') then
        begin
          try
            DataForm2.InvoiceItemTable.Post;
          except
            on E : Exception do
              showmessage(E.Message);
          end;
        end;
end;

procedure TInvoiceForm.Open1Click(Sender: TObject);
begin
        JvSpeedButton10.Click;
end;

procedure TInvoiceForm.OpenInvoiceDetail1Click(Sender: TObject);
begin
        JvSpeedButton4.Click;
end;

procedure TInvoiceForm.OpenInvoices();
var
      thirtyDays: String;
      PreviousMonth:Integer;
      Datestore:TDateTime;
begin
      If (Dataform2.User_dbRights.Value > 3) and (not StrtoBool(Dataform2.GlobalTableCurrentUser.Value)) then
        Userstr := ''
      else
        Userstr := 'and InvBy = "' + Dataform2.User_dbUserName.Value + '"';
      If ShowmoreInvoicesthan30days1.Checked = False then
      begin
        DateStore := StartoftheMonth(date);
        PreviousMonth := MonthOf(StartoftheMonth(DateStore))-1;
        if PreviousMonth = 0 then
        begin
          DateStore := RecodeYear(Datestore,Yearof(DateStore)-1);
          DateStore := RecodeMonth(DateStore,12);
        end
        else
        begin
          DateStore := RecodeMonth(DateStore,PreviousMonth);
        end;
        thirtyDays := 'and InvDate >= ' + inttostr(datetointdate(DateStore))
      end
      else
        thirtyDays := '';
//      Showmessage(thirtyDays);
//      Dataform2.InvoiceItemTable.Close;
      Dataform2.InvoiceTable.Close;
      with Dataform2.InvoiceTable.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
        Add('where ((InvClose=''Open'') or (InvClose=''Close'') or (InvClose=''LaybO'') or (InvClose=''LaybC''))');
        Add(thirtyDays);
        Add(Userstr);
      end;
      Dataform2.InvoiceTable.Open;
      DataForm2.InvoiceTable.Last;
//      Dataform2.InvoiceItemTable.Open;
end;

procedure TInvoiceForm.ShowmoreInvoicesthan30days1Click(Sender: TObject);
begin
      OpenInvoices();
      OpenInvoiceItems();
      ShowDates;
end;

procedure TInvoiceForm.SuDisable1Click(Sender: TObject);
begin
        JvSpeedButton7.Click;
end;

procedure TInvoiceForm.SuLogin1Click(Sender: TObject);
begin
        JvSpeedButton5.Click;
end;

procedure TInvoiceForm.InvoiceDetailOpen();
begin
      DBEdit1.ReadOnly := False;
      DBEdit2.ReadOnly := False;
      DBEdit3.ReadOnly := True;
      DBEdit4.ReadOnly := False;
      DBEdit5.ReadOnly := False;
      DBEdit6.ReadOnly := False;
      DBEdit7.ReadOnly := False;
      DBEdit8.ReadOnly := False;
      DBEdit9.ReadOnly := False;
      DBEdit10.ReadOnly := False;
      DBEdit11.ReadOnly := False;
      DBEdit12.ReadOnly := False;
      DBEdit13.ReadOnly := False;
      DBEdit14.ReadOnly := False;
      DBEdit15.ReadOnly := False;
      JvDBLookupCombo1.ReadOnly := False;
      JvSpeedButton8.Enabled := True;
      If (Dataform2.User_dbRights.Value > 3) then
        InvoiceDateEdit.Enabled := True
      else
        InvoiceDateEdit.Enabled := False;
end;

procedure TInvoiceForm.InvoiceDetailClose();
begin
      DBEdit1.ReadOnly := True;
      DBEdit2.ReadOnly := True;
      DBEdit3.ReadOnly := True;
      DBEdit4.ReadOnly := True;
      DBEdit5.ReadOnly := True;
      DBEdit6.ReadOnly := True;
      DBEdit7.ReadOnly := True;
      DBEdit8.ReadOnly := True;
      DBEdit9.ReadOnly := True;
      DBEdit10.ReadOnly := True;
      DBEdit11.ReadOnly := True;
      DBEdit12.ReadOnly := True;
      DBEdit13.ReadOnly := True;
      DBEdit14.ReadOnly := True;
      DBEdit15.ReadOnly := True;
      JvDBLookupCombo1.ReadOnly := True;
      JvSpeedButton8.Enabled := False;
      InvoiceDateEdit.Enabled := False;
end;

procedure TInvoiceForm.CreateInvNo;
begin
            if Dataform2.InvoiceTableInvNo.Value = 0 then
            begin
              DataForm2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('SELECT MAX(InvNo) FROM invoice_db');
                Add('where InvClose = "Close" or InvClose = "LaybC" or InvClose = "LaybO"');
              end;
              Dataform2.Query2.UpdateOptions.ReadOnly := True;
              DataForm2.Query2.Open;
              Dataform2.GlobalTable.Refresh;
              Dataform2.GlobalTable.Edit;
              If DataForm2.GlobalTableInvNo.Value < DataForm2.Query2.FieldByName('MAX(InvNo)').asInteger then
                DataForm2.GlobalTableInvNo.Value := DataForm2.Query2.FieldByName('MAX(InvNo)').asInteger;
              if (DataForm2.InvoiceTablestrState <> 'Edit') and (DataForm2.InvoiceTablestrState <> 'Insert') then
                DataForm2.InvoiceTable.Edit;
              Dataform2.InvoiceTable.FieldByName('InvNo').asInteger := DataForm2.GlobalTableInvNo.Value + 1;
              DataForm2.GlobalTableInvNo.Value := Dataform2.InvoiceTable.FieldByName('InvNo').asInteger;
              Dataform2.GlobalTable.Post;
              Dataform2.Query2.Close;
              Dataform2.Query2.UpdateOptions.ReadOnly := False;
            end;
end;

procedure TInvoiceForm.OpenInvoiceItems();
begin
        Dataform2.InvoiceItemTable.Close;
        with Dataform2.InvoiceItemTable.SQL do
        begin
          Clear;
          Add('select * from invoiceitem_db');
          Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
          Add('order by ItemOrder, Nr');
        end;
        Dataform2.InvoiceItemTable.Open;
end;

procedure TInvoiceForm.UpdateDebAcc();
var
      i: Integer;
      s,YearStr,MonthStr: String;
      e:Currency;
begin
        i := pos('/',Dataform2.InvoiceTableGLDebNo.Value);
        if i <> 0 then
        begin
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do
          begin
            Clear;
            Add('select Nr,BranchNo,AccType from accounts_db');
            Add('where BranchNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,1,i-1));
            Add('and AccNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,i+1,Length(Dataform2.InvoiceTableGLDebNo.Value)-(i)));
            Add('and AccType = 1');
          end;
          Dataform2.Query4.Prepare;
          Dataform2.Query4.Open;
          if Dataform2.Query4.RecordCount = 1 then
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
            Dataform2.Query1.Close;
            s := '("Invoice",' + FloattoStr(Dataform2.InvoiceTableInvTotal.Value) + ',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger) + ',"Invoice",' + YearStr + ',' + MonthStr + ',"A",' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ',' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ',"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,IInvNo,IBranchNo,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
            e := Dataform2.InvoiceTableAmmTendered.Value + Dataform2.InvoiceTablePremium.Value;
            if e > Dataform2.InvoiceTableInvTotal.Value then
              e := Dataform2.InvoiceTableInvTotal.Value;
            if e <> 0 then
            begin
              s := '("Payment",' + FloattoStr(e * -1) + ',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger) + ',"' + Dataform2.InvoiceTableInvoiceType.Value + '",' + YearStr + ',' + MonthStr + ',"A",' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ',' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ',"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + '")';
              with DataForm2.Query1.SQL do begin
                Clear;
                Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,IInvNo,IBranchNo,RefNo) values ');
                Add(s);
              end;
              DataForm2.Query1.ExecSQL;
            end;
            e := Dataform2.InvoiceTableInvTotal.Value - e;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('update accounts_db set Total = Total + ' + floattostr(e) + ',Current = Current + ' + floattostr(e));
              Add('where BranchNo = ' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').AsInteger));
              Add('and Nr = ' + InttoStr(Dataform2.Query4.FieldByName('Nr').AsInteger));
              Add('and AccType = ' + InttoStr(Dataform2.Query4.FieldByName('AccType').AsInteger));
            end;
            DataForm2.Query1.ExecSQL;
          end
          else
            showmessage('Could not find Account to Update!');
          Dataform2.Query4.Close;
          Dataform2.Query4.Unprepare;
        end;
end;

end.
