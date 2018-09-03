unit PurchaseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, Mask, DBCtrls, Buttons, Math,
  db, UtilsUnit, RpDefine, RpBase, RpSystem, Easysize, Menus, JvDialogs,
  JvExControls, JvDBLookup, JvExDBGrids, JvDBGrid, JvExButtons, JvBitBtn,
  JvExComCtrls, JvDateTimePicker, JvSpeedButton, DateUtils, uADCompClient;


type
  TPurchaseForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    InvoiceDateEdit: TJvDateTimePicker;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    JvBitBtn8: TJvBitBtn;
    DBEdit7: TDBEdit;
    JvBitBtn9: TJvBitBtn;
    PurchaseInvGrid: TJvDBGrid;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    JvBitBtn7: TJvBitBtn;
    JvBitBtn11: TJvBitBtn;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    JvSpeedButton1: TJvSpeedButton;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    ExcelFileEdit: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    OpenExcel: TJvOpenDialog;
    JvDBGrid3: TJvDBGrid;
    JvBitBtn12: TJvBitBtn;
    GroupBox2: TGroupBox;
    JvBitBtn13: TJvBitBtn;
    JvDBLookupCombo1: TJvDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    DeleteselectedPurchaseInv1: TMenuItem;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Import1: TMenuItem;
    Purchaseinvoicesfromturbocah1: TMenuItem;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBText2: TDBText;
    FormResizer1: TFormResizer;
    ReceiptPrinting: TRvSystem;
    JvBitBtn17: TJvBitBtn;
    JvSpeedButton9: TJvSpeedButton;
    DeleteSelectedUnpostedTurbocashPurchaseinvoice1: TMenuItem;
    N1: TMenuItem;
    JvSpeedButton2: TJvSpeedButton;
    MarkcurrentPurchaseInvoiceasnotEndofShifted1: TMenuItem;
    N2: TMenuItem;
    Options1: TMenuItem;
    ShowallRecords1: TMenuItem;
    FixCreditorLinkonstockTable1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure InvoiceDateEditChange(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure JvBitBtn8Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure PurchaseInvGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PurchaseInvGridMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure PurchaseInvGridDblClick(Sender: TObject);
    procedure PurchaseInvGridCellClick(Column: TColumn);
    procedure JvBitBtn9Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure JvBitBtn7Click(Sender: TObject);
    procedure JvBitBtn11Click(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure JvBitBtn12Click(Sender: TObject);
    procedure JvBitBtn13Click(Sender: TObject);
    procedure JvDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DeleteselectedPurchaseInv1Click(Sender: TObject);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Purchaseinvoicesfromturbocah1Click(Sender: TObject);
    procedure TabSheet3Exit(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ReceiptPrintingPrint(Sender: TObject);
    procedure JvBitBtn17Click(Sender: TObject);
    procedure JvSpeedButton9Click(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
    procedure DeleteSelectedUnpostedTurbocashPurchaseinvoice1Click(
      Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure MarkcurrentPurchaseInvoiceasnotEndofShifted1Click(
      Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure ShowallRecords1Click(Sender: TObject);
    procedure FixCreditorLinkonstockTable1Click(Sender: TObject);
  private
    procedure Showdates;
    procedure PurchaseDetailclose;
    procedure PurchaseDetailopen;
    procedure DoButtons;
    procedure WriteHQInvItem(StockLink, LinkID: String);
    procedure SavePurchaseItem;
    procedure PrintA4(Report: TBaseReport);
    procedure NewA4Page(Report: TBaseReport);
    procedure OpenInvoiceItems;
    procedure UpdateCredAcc;
    function AvgCostCalc(TCStockNo: String; NoValueCost: Currency;PurchItemNr:Integer): Currency;
    { Private declarations }
  public
    Totalstr: Currency;
    FromWhere: String;
    procedure ClosePurchaseInv;
    procedure CreateStock;
    procedure UpdateStock(Nr:Integer);
    procedure SaveInvoice;
    procedure InsertProduct(TCStockNoStr:String);
    procedure CreateInvNo;
    { Public declarations }
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  PurchaseForm: TPurchaseForm;
  MyCurrentUser : Integer ;
  LastDocNo :string;
  LastDocID : Integer;
  InvLine:integer;
  Imperror: Boolean;

implementation

uses DataFrm2, AccountSearchFrm, StockSearchFrm, ImpData, ExtractFrm,
  InvoiceFrm, PeriodFrm, DataFrm, Listsmnu, UserFrm, TCDataMod, grnfrm,
  BarcodePrintingFrm, StockTransferFrm, LocalAccountSearchFrm, StockFrm;

{$R *.dfm}

procedure TPurchaseForm.FixCreditorLinkonstockTable1Click(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to run this',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
              Dataform2.Query2.Close;
              Dataform2.Query1.Close;
              with Dataform2.Query1.SQL do
              begin
                Clear;
                Add('select invoiceitem_db.TCStockNo,invoice_db.GLDebNo from invoiceitem_db');
                Add('left join invoice_db on invoice_db.Nr = invoiceitem_db.LinkID and invoice_db.BranchNo = invoiceitem_db.BranchNo');
                Add('where invoice_db.InvClose = "PurcC"');
                Add('order by invoice_db.InvDate');
              end;
              Dataform2.Query1.Open;
              while not DataForm2.Query1.EOF do
              begin
                Dataform2.Query2.Close;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('select * from stock_db');
                  Add('where TCStockNo = "' + Dataform2.Query1.FieldByName('TCStockNo').asString + '"');
                  Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                end;
                Dataform2.Query2.Open;
                if Dataform2.Query2.RecordCount = 1 then
                begin
                  Dataform2.Query2.Edit;
                  Dataform2.Query2.FieldByName('CreditorLink').AsString := Dataform2.Query1.FieldByName('GLDebNo').asString;
                  Dataform2.Query2.Post;
                end;
                Dataform2.Query1.Next;
              end;
              Dataform2.Query1.close;
              Dataform2.Query2.Close;
              showmessage('Finished');
      end;
end;

procedure TPurchaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        SavePurchaseItem;
        DataForm2.InvoiceTable.Filtered := False;
        DataForm2.InvoiceTable.Close;
        DataForm2.PurchaseItemTable.Close;
        dataForm2.StockTable.Close;
        Dataform2.BranchTable.Close;
        If FromWhere = 'GRN' then
          GrnForm.FreeOnRelease;
        if not DirectoryExists(Dataform2.UserDataPath + '\NCompPOS') then
          CreateDir(Dataform2.UserDataPath + '\NCompPOS');
        JvDBGrid1.Columns.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\PurchaseInvoiceItems');
        PurchaseForm.FreeOnRelease;
end;

procedure TPurchaseForm.FormShow(Sender: TObject);
begin
        PurchaseForm.WindowState := wsMaximized;
        DoButtons;
        if FileExists(Dataform2.UserDataPath + '\NCompPOS\PurchaseInvoiceItems') then
          JvDBGrid1.Columns.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\PurchaseInvoiceItems');
        Dataform2.StockTable.Close;
        with Dataform2.StockTable.SQL do
        begin
          Clear;
          Add('select * from stock_db');
          Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        end;
        Dataform2.StockTable.Open;
        Dataform2.BranchTable.Open;

        Dataform2.InvoiceTable.Last;
        OpenInvoiceItems;
        PageControl1.ActivePage := Tabsheet2;

        PurchaseForm.Width := Screen.Width;
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          GroupBox2.Visible := False;
        end;
        ShowDates;
        PurchaseDetailclose;
end;

procedure TPurchaseForm.JvBitBtn2Click(Sender: TObject);
begin
        DataForm2.InvoiceTable.Append;
        DataForm2.InvoiceTableClientName.Value := 'Creditor Name';
        DataForm2.InvoiceTable.FieldByName('InvDate').AsInteger := datetoIntDate(date);
        InvoiceDateEdit.Date := date;
        DataForm2.InvoiceTable.FieldByName('GLDebNo').asString := '';
        DataForm2.InvoiceTable.FieldByName('InvBy').asString := Dataform2.User_db.Fieldbyname('UserName').asString;
        Dataform2.InvoiceTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
        DataForm2.InvoiceTableShiftSet.Value := '';
        Dataform2.InvoiceTableInvNo.Value := 0;
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
          DataForm2.InvoiceTable.FieldByName('InvClose').asString := 'RecqO'
        else
        begin
          If (FromWhere <> 'orders') then
            DataForm2.InvoiceTable.FieldByName('InvClose').asString := 'PurcO'
          else
            DataForm2.InvoiceTable.FieldByName('InvClose').asString := 'OrdrO';

          PurchaseDetailopen;
        end;
        SaveInvoice;
        OpenInvoiceItems;
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
          PageControl1.SelectNextPage(True)
        else
        begin
          DBEdit1.SetFocus;
          DBEdit1.SelectAll;
        end;
end;

procedure TPurchaseForm.InvoiceDateEditChange(Sender: TObject);
begin
        if (DatetoStr(InvoiceDateEdit.Date) <> IntDatetoString(DataForm2.InvoiceTable.FieldByName('InvDate').asInteger)) and (DatetoStr(InvoiceDateEdit.Date) <> '1899/12/30') then
        begin
          if (DataForm2.PurchaseItemTablestrState <> 'Edit') and (DataForm2.PurchaseItemTablestrState <> 'Insert') then
            DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.FieldByName('InvDate').asInteger := DatetoIntDate(InvoiceDateEdit.Date);
        end;
end;

procedure TPurchaseForm.JvBitBtn3Click(Sender: TObject);
begin
        PurchaseDetailopen;
        GroupBox1.SetFocus;
end;

procedure TPurchaseForm.JvBitBtn4Click(Sender: TObject);
begin
        PurchaseDetailclose;
        SaveInvoice;
        ShowDates;
end;

procedure TPurchaseForm.JvBitBtn8Click(Sender: TObject);
begin
        SaveInvoice;
        SavePurchaseItem;
        PageControl1.ActivePage := TabSheet2;
end;

procedure TPurchaseForm.JvBitBtn6Click(Sender: TObject);
begin
        SaveInvoice;
        PageControl1.SelectNextPage(True);
end;

procedure TPurchaseForm.TabSheet2Exit(Sender: TObject);
begin
        SaveInvoice;
end;

procedure TPurchaseForm.TabSheet2Hide(Sender: TObject);
begin
        SaveInvoice;
end;

procedure TPurchaseForm.PurchaseInvGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        Showdates;
        OpenInvoiceItems;
end;

procedure TPurchaseForm.PurchaseInvGridMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
        Showdates;
        OpenInvoiceItems;
end;

procedure TPurchaseForm.PurchaseInvGridDblClick(Sender: TObject);
begin
      ShowDates;
      OpenInvoiceItems;
end;

procedure TPurchaseForm.PurchaseInvGridCellClick(Column: TColumn);
begin
      Showdates;
      OpenInvoiceItems;
end;

procedure TPurchaseForm.JvBitBtn9Click(Sender: TObject);
begin
    if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'PurcC') and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> '') then
    begin
      DataForm2.PurchaseItemTable.Append;
      DataForm2.PurchaseItemTableLinkID.Value := Dataform2.InvoiceTableNr.Value;
      DataForm2.PurchaseItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
      JvDBGrid1.SetFocus;
      JvDBGrid1.Col := 1;
    end
    else
      showmessage('Create new Invoice First!');
end;

procedure TPurchaseForm.TabSheet3Show(Sender: TObject);
begin
        Showdates();
        OpenInvoiceItems;
end;

procedure TPurchaseForm.JvBitBtn7Click(Sender: TObject);
begin
    if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'PurcC') and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> '') then
    begin
      Application.CreateForm(TStockSearchForm, StockSearchForm);
      StockSearchform.FromWhereTmp := 'Purchases';
      StockSearchForm.ShowModal;
      StockSearchform.Free;
    end
    else
      showmessage('Create new Invoice First!');
end;

procedure TPurchaseForm.JvBitBtn11Click(Sender: TObject);
var
    QuestionString: String;
begin
      If Dataform2.InvoiceTableInvClose.Value = 'PurcC' then
      begin
        showmessage('Purchase Invoice already closed');
        exit;
      end;

      QuestionString := 'Are you sure you want to close this Purchase Invoice?';

      if MessageDlg(QuestionString,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        SaveInvoice;
        SavePurchaseItem;
        ClosePurchaseInv;
      end;
end;

procedure TPurchaseForm.CreateStock();
begin
        Dataform2.StockTable.Append;
        DataForm2.StockTable.FieldByName('DateCreated').asInteger := DatetoIntDate(date);
        DataForm2.StockTable.FieldByName('DateChanged').asInteger := DatetoIntDate(date);
        If Dataform2.InvoiceTableInvClose.Value <> 'GRNO' then
          DataForm2.StockTable.FieldByName('Qty').AsFloat := DataForm2.PurchaseItemTableQty.Value
        else
          DataForm2.StockTable.FieldByName('Qty').AsFloat := Dataform2.PurchaseItemTablePrice2.Value;
        DataForm2.StockTable.FieldByName('AlertQty').AsFloat := 1;
        DataForm2.StockTable.FieldByName('CostPrice').AsFloat := DataForm2.PurchaseItemTableCostPrice.Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value));
        DataForm2.StockTable.FieldByName('SalesPrice').AsFloat := DataForm2.PurchaseItemTablePrice.Value;
        If Dataform2.InvoiceTableInvClose.Value <> 'GRNO' then
          DataForm2.StockTable.FieldByName('SalesPrice2').AsFloat := DataForm2.PurchaseItemTablePrice2.Value;
        DataForm2.StockTableBarcode.Value := DataForm2.PurchaseItemTableBarcode.Value;
        DataForm2.StockTableExtraDescr.Value := dataForm2.PurchaseItemTableExtraDescr.Value;
        Dataform2.StockTableModelNo.Value := dataform2.PurchaseItemTableModelNo.Value;
        Dataform2.StockTableCreditorLink.Value := dataform2.InvoiceTableGLDebNo.Value;
        Dataform2.StockTableStartingQty.Value := 0;
        Dataform2.StockTableDescription.Value := Dataform2.PurchaseItemTableDescription.Value;
        Dataform2.StockTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
        If DataForm2.PurchaseItemTableTCStockNo.Value <> '' then
          DataForm2.StockTable.FieldByName('TCStockNo').AsString := DataForm2.PurchaseItemTableTCStockNo.Value
        else
          DataForm2.StockTable.FieldByName('TCStockNo').AsString := '';
        DataForm2.StockTable.FieldByName('NonStockItem').AsString := 'False';
        DataForm2.StockTable.FieldByName('Changed').AsString := 'N';
        Dataform2.StockTablest_created_by.Value := DataForm2.User_dbUserName.Value;
        Dataform2.StockTablest_changed_by.Value := Dataform2.User_dbUserName.value;
        Dataform2.StockTablest_nontaxitem.Value := 'False';
        DataForm2.StockTable.Post;
        Dataform2.StockTable.Resync([rmExact]);
        Dataform2.PurchaseItemTable.Edit;
        Dataform2.PurchaseItemTableStockNo.Value := DataForm2.StockTableNr.Value;
        if DataForm2.StockTable.FieldByName('TCStockNo').AsString = '' then
        begin
          Dataform2.StockTable.Edit;
          If StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'StockNoFormat2', '0')) = True then
            Dataform2.StockTableTCStockNo.Value := Trimspaces(Uppercase(copy(Dataform2.StockTableDescription.Value,1,2))) + InttoStr(DataForm2.StockTableNr.Value)
          else
            Dataform2.StockTableTCStockNo.Value := InttoStr(DataForm2.StockTableNr.Value);
          Dataform2.PurchaseItemTableTCStockNo.Value := DataForm2.StockTableTCStockNo.Value;
          Dataform2.StockTable.Post;
        end;
        Dataform2.StockTable.Edit;
        Dataform2.StockTableAvgCost.Value := AvgCostCalc(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableCostPrice.Value,Dataform2.PurchaseItemTableNr.Value);
        Dataform2.StockTable.Post;
        SavePurchaseItem;
end;

procedure TPurchaseForm.UpdateStock(Nr:Integer);
var
  Changed: Boolean;
begin
        If Dataform2.StockTable.Locate('Nr',Nr,[]) then
        begin
          Changed := False;
          If Floattostrf(Dataform2.StockTableCostPrice.Value,ffFixed,17,2) <> Floattostrf(Dataform2.PurchaseItemTableCostPrice.Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value)),ffFixed,17,2) then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableCostPrice.Value := Dataform2.PurchaseItemTableCostPrice.Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value));
          end;
          If Floattostrf(Dataform2.StockTableAvgCost.Value,ffFixed,17,2) <> Floattostrf(AvgCostCalc(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableCostPrice.Value,Dataform2.PurchaseItemTableNr.Value),ffFixed,17,2) then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableAvgCost.Value := AvgCostCalc(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableCostPrice.Value,Dataform2.PurchaseItemTableNr.Value);
          end;
          If Floattostrf(Dataform2.StockTableSalesPrice.Value,ffFixed,17,2) <> Floattostrf(Dataform2.PurchaseItemTablePrice.Value,ffFixed,17,2) then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableSalesPrice.Value := Dataform2.PurchaseItemTablePrice.Value;
          end;
          If Dataform2.InvoiceTableInvClose.Value <> 'GRNO' then
          begin
            If Floattostrf(Dataform2.StockTableSalesPrice2.Value,ffFixed,17,2) <> Floattostrf(Dataform2.PurchaseItemTablePrice2.Value,ffFixed,17,2) then
            begin
              Changed := True;
              Dataform2.StockTable.Edit;
              Dataform2.StockTableSalesPrice2.Value := Dataform2.PurchaseItemTablePrice2.Value;
            end;
          end;
          If (Dataform2.StockTableDescription.Value <> Dataform2.PurchaseItemTableDescription.Value) and (Dataform2.PurchaseItemTableDescription.Value <> '') then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableDescription.Value := Dataform2.PurchaseItemTableDescription.Value;
          end;
          If (Dataform2.StockTableExtraDescr.Value <> Dataform2.PurchaseItemTableExtraDescr.Value) and (Dataform2.PurchaseItemTableExtraDescr.Value <> '') then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableExtraDescr.Value := Dataform2.PurchaseItemTableExtraDescr.Value;
          end;
          If (Dataform2.StockTableModelNo.Value <> Dataform2.PurchaseItemTableModelNo.Value) and (Dataform2.PurchaseItemTableModelNo.Value <> '') then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableModelNo.Value := Dataform2.PurchaseItemTableModelNo.Value;
          end;
          If (Dataform2.StockTableCreditorLink.Value <> Dataform2.InvoiceTableGLDebNo.Value) and (Dataform2.InvoiceTableGLDebNo.Value <> '') then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableCreditorLink.Value := Dataform2.InvoiceTableGLDebNo.Value;
          end;
          If (Dataform2.StockTableBarcode.Value <> Dataform2.PurchaseItemTableBarcode.Value) and (Dataform2.PurchaseItemTableBarcode.Value <> '') then
          begin
            Changed := True;
            Dataform2.StockTable.Edit;
            Dataform2.StockTableBarcode.Value := Dataform2.PurchaseItemTableBarcode.Value;
          end;
          If Dataform2.InvoiceTableInvClose.Value <> 'GRNO' then
          begin
            If Dataform2.PurchaseItemTableQty.Value <> 0 then
            begin
              Changed := True;
              Dataform2.StockTable.Edit;
              Dataform2.StockTableQty.Value := Dataform2.StockTableQty.Value + Dataform2.PurchaseItemTableQty.Value;
            end;
          end
          else
          begin
            If (Dataform2.PurchaseItemTableQty.Value + (Dataform2.PurchaseItemTablePrice2.Value - Dataform2.PurchaseItemTableQty.Value)) <> 0 then
            begin
              Changed := True;
              Dataform2.StockTable.Edit;
              Dataform2.StockTableQty.Value := Dataform2.StockTableQty.Value + Dataform2.PurchaseItemTablePrice2.Value;
            end;
          end;
          If Changed = True then
            Dataform2.StockTable.Post;
          If Dataform2.PurchaseItemTableStockNo.Value = 0 then
          begin
            Dataform2.PurchaseItemTable.Edit;
            Dataform2.PurchaseItemTableStockNo.Value := Dataform2.StockTableNr.Value;
            SavePurchaseItem;
          end;
        end
        else
          showmessage('Something went wrong with stock update!');
end;

procedure TPurchaseForm.JvSpeedButton1Click(Sender: TObject);
begin
            Dataform2.PurchaseItemTable.Cancel;
end;

procedure TPurchaseForm.JvSpeedButton2Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
      begin
        if (DataForm2.InvoiceTableInvClose.Value <> 'PurcC') then
        begin
          Application.CreateForm(TLocalAccountSearchForm, LocalAccountSearchForm);
          LocalAccountSearchForm.FromWhere := 'ICreditor';
          LocalAccountSearchForm.Showmodal;
          LocalAccountSearchForm.Free;
        end
        else
          showMessage('Purchase Invoice already closed!');
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TPurchaseForm.JvSpeedButton9Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 2 then
      begin
        if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'PurcC') then
          raise Exception.Create('Close Invoice First');
        Application.CreateForm(TBarcodePrintingForm, BarcodePrintingForm);
        BarCodePrintingForm.Fromwhere := 'PInvItem';
        BarcodePrintingForm.showmodal;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TPurchaseForm.MarkcurrentPurchaseInvoiceasnotEndofShifted1Click(
  Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to Mark Current Purchase invoice as not end of shifted!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          If DataForm2.InvoiceTableShiftSet.Value <> '' then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableShiftSet.Value := '';
            SaveInvoice;
          end
          else
            showmessage('Purchase Invoice are already marked not end of shifted, run end of shift again or call support!');
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TPurchaseForm.Button1Click(Sender: TObject);
begin
      If OpenExcel.Execute then
      begin
        ExcelFileEdit.Text := OpenExcel.InitialDir + OpenExcel.FileName;
        ImportData.ExcelFileConnect.Connected := False;
        Imperror := False;
        If ExtractFileExt(ExcelFileEdit.Text) = '.xls' then
        begin
          ImportData.ExcelFileConnect.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + ExcelFileEdit.Text + ';Extended Properties="Excel 8.0;HDR=YES"';
          try
            ImportData.ExcelFileConnect.Open;
            ImportData.ExcelFileConnect.GetTableNames(ComboBox1.Items,True);
          except
            ShowMessage('Unable to connect to Excel, make sure the workbook ' + ExcelFileEdit.Text + ' exist!');
            raise;
          end;
          Combobox1.Enabled := True;
          Button3.Enabled := True;
        end;
        If ExtractFileExt(ExcelFileEdit.Text) = '.csv' then
        begin
          ImportData.ExcelFileConnect.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + ExtractFilePath(ExcelFileEdit.Text) + ';Extended Properties="text;HDR=YES;FMT=Delimited"';
          try
            ImportData.ExcelFileConnect.Open;
  //          DataFrm.ExcelFileConnect.GetTableNames(ComboBox1.Items,True);
          except
            ShowMessage('Unable to connect to csv, make sure the workbook ' + ExcelFileEdit.Text + ' exist!');
            raise;
          end;
          ImportData.ADOQuery1.SQL.Clear;
          ImportData.ADOQuery1.SQL.Add('select * from [' + ExtractFileName(ExcelFileEdit.Text) + ']');
          ImportData.AdoQuery1.Active := True;
          Combobox1.Enabled := False;
          Button3.Enabled := False;
        end;
      end;
end;

procedure TPurchaseForm.Button3Click(Sender: TObject);
var
      s: String;
      i: Integer;
begin
      If ExtractFileExt(ExcelFileEdit.Text) = '.xls' then
      begin
        s := 'select * from [' + Combobox1.Text + ']';
        for i := 0 to 255 do
        begin
          if copy(s,i,1) = '''' then
          begin
            Delete(s,i,1);
          end;
        end;
        ImportData.ADOQuery1.SQL.Clear;
        ImportData.ADOQuery1.SQL.Add(s);
        ImportData.AdoQuery1.Active := True;
      end;
      If ExtractFileExt(ExcelFileEdit.Text) = '.csv' then
      begin
        s := 'select * from [' + ExtractFileName(ExcelFileEdit.Text) + ']';
        ImportData.ADOQuery1.SQL.Clear;
        ImportData.ADOQuery1.SQL.Add(s);
        ImportData.AdoQuery1.Active := True;
      end;
   //   DataFrm.ADOQuery1.Fieldbyname('ID').SetFieldType(ftInteger);
end;

procedure TPurchaseForm.JvBitBtn12Click(Sender: TObject);
begin
    if (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'PurcC') and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> '') and
       (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'RecqR') and (DataForm2.InvoiceTable.FieldByName('InvClose').asString <> 'RecqC') then
    begin
      ImportData.ADOQuery1.DisableControls;
      ImportData.ADOQuery1.first;
      try
        while not ImportData.ADOQuery1.EOF do
        begin
          if (ImportData.ADOQuery1.Fieldbyname('Description').AsString <> '') then
          begin
            Dataform2.PurchaseItemTable.Append;
            Dataform2.PurchaseItemTableLinkId.Value := Dataform2.InvoiceTableNr.Value;
            DataForm2.PurchaseItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
            Dataform2.PurchaseItemTableDescription.Value := ImportData.ADOQuery1.Fieldbyname('Description').AsString;
            If ImportData.ADOQuery1.FieldByName('Price 1 Incl').asString <> '' then
              Dataform2.PurchaseItemTablePrice.Value := ImportData.ADOQuery1.Fieldbyname('Price 1 Incl').AsFloat
            else
              Dataform2.PurchaseItemTablePrice.Value := 0;
            If ImportData.ADOQuery1.FieldByName('Price 2 Incl').asString <> '' then
              Dataform2.PurchaseItemTablePrice2.Value := ImportData.ADOQuery1.Fieldbyname('Price 2 Incl').AsFloat
            else
              Dataform2.PurchaseItemTablePrice2.Value := 0;
            If ImportData.ADOQuery1.FieldByName('Cost Excl').asString <> '' then
              Dataform2.PurchaseItemTableCostPrice.Value := ImportData.ADOQuery1.Fieldbyname('Cost Excl').AsFloat
            else
              Dataform2.PurchaseItemTableCostPrice.Value := 0;
            Dataform2.PurchaseItemTableModelNo.Value := ImportData.ADOQuery1.Fieldbyname('Model No').AsString;
            Dataform2.PurchaseItemTableQty.Value := ImportData.ADOQuery1.Fieldbyname('Qty').AsFloat;
            Dataform2.PurchaseItemTableExtraDescr.Value := ImportData.ADOQuery1.Fieldbyname('ExtraDescr').AsString;

            if (ImportData.ADOQuery1.Fieldbyname('Stock No').AsString <> '') then
            begin
              DataForm2.Query2.Close;
              with DataForm2.Query2.SQL do begin
                Clear;
                Add('Select Nr from stock_db');
                Add('where TCStockNo = ''' + ImportData.ADOQuery1.Fieldbyname('Stock No').AsString + '''');
                Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
              end;
              Dataform2.Query2.Open;
              If Dataform2.Query2.RecordCount > 0 then
                Dataform2.PurchaseItemTableStockNo.Value := Dataform2.Query2.FieldbyName('Nr').AsInteger
              else
                Dataform2.PurchaseItemTableStockNo.Value := 0;
            end;

            Dataform2.PurchaseItemTableTCStockNo.Value := ImportData.ADOQuery1.Fieldbyname('Stock No').AsString;
            Dataform2.PurchaseItemTableBarcode.Value := ImportData.ADOQuery1.Fieldbyname('Barcode').AsString;
            SavePurchaseItem;
          end;
          ImportData.ADOQuery1.Next;
        end;
      finally
      end;
      ImportData.ADOQuery1.EnableControls;
      ImportData.ADOQuery1.Close;
      DataForm2.Query2.Close;
      ImportData.ExcelFileConnect.Close;
      PageControl1.ActivePage := TabSheet3;
    end
    else
      showmessage('Create new Invoice First!');
end;

procedure TPurchaseForm.JvBitBtn13Click(Sender: TObject);
begin
    if MessageDlg('Are you sure you want to Create a Branch stock transfer for ' + Dataform2.BranchTableName.Value + '!',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      If Dataform2.InvoiceTableInvClose.Value = 'PurcC' then
      begin
        Application.CreateForm(TStockTransferForm, StockTransferForm);
        Dataform2.StockTrnsferTable.Close;
        with Dataform2.StockTrnsferTable.SQL do
        begin
          Clear;
          Add('select * from stocktrnsfer_db');
        end;
        Dataform2.StockTrnsferTable.Open;
        DataForm2.StockTrnsferTable.Insert;
        DataForm2.StockTrnsferTableToBranch.Value := DataForm2.BranchTableNr.Value;
        DataForm2.StockTrnsferTableDate.Value := DatetoIntDate(date);
        Dataform2.StockTrnsferTableClosed.Value := 'False';
        Dataform2.StockTrnsferTableFromBranch.Value := Dataform2.GlobalTableBranchNo.Value;
        Dataform2.StockTrnsferTable.Post;
        StockTransferForm.StocktrnsferItemOpen;
        Dataform2.PurchaseItemTable.DisableControls;
        Dataform2.PurchaseItemTable.first;
        try
          while not Dataform2.PurchaseItemTable.EOF do
          begin
            DataForm2.StocktrnsferItemTable.Append;
            Dataform2.StocktrnsferItemTableLinkID.Value := DataForm2.StockTrnsferTableNr.Value;
            Dataform2.StocktrnsferItemTableStockNo.Value := Dataform2.PurchaseItemTableStockNo.Value;
            Dataform2.StocktrnsferItemTableBeforeQty.Value := Dataform2.PurchaseItemTableQty.Value;
            DataForm2.StocktrnsferItemTableQty.Value := Dataform2.PurchaseItemTableQty.Value;
            DataForm2.StocktrnsferItemTableDescription.Value := Dataform2.PurchaseItemTableDescription.Value;
            Dataform2.StocktrnsferItemTableTCStockNo.Value := Dataform2.PurchaseItemTableTCStockNo.Value;
            DataForm2.StocktrnsferItemTable.Post;
            Dataform2.PurchaseItemTable.Next;
          end;
        finally
        end;
        Dataform2.PurchaseItemTable.EnableControls;
        DataForm2.StocktrnsferItemTable.Close;
        StockTransferForm.Free;
        Dataform2.StockTrnsferTable.Close;
      end
      else
      begin
        showmessage('Close Purchase Inv first!');
      end;
    end;
end;

procedure TPurchaseForm.JvDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        if (Directoryexists(DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''))) and (ImportData.ADOQuery1.Fieldbyname('Tc Stock No').AsString <> '') then
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Select Nr from stock_db');
            Add('where TCStockNo = ''' + ImportData.ADOQuery1.Fieldbyname('Tc Stock No').AsString + '''');
          end;
          Dataform2.Query2.Open;
          If (Dataform2.Query2.RecordCount = 0) then
          begin
            JvDBGrid3.Canvas.Font.Color := clGreen;
            Imperror := True;
          end;
        end
        else
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Select Nr from stock_db');
            Add('where Nr = ''' + ImportData.ADOQuery1.Fieldbyname('Stock No').AsString + '''');
          end;
          Dataform2.Query2.Open;
          If Dataform2.Query2.RecordCount = 0 then
          begin
            JvDBGrid3.Canvas.Font.Color := clGreen;
            Imperror := True;
          end;
        end;

     // Default drawing.
        JvDBGrid3.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TPurchaseForm.ClosePurchaseInv();
var
  i : Integer ;
  TryAgain : Boolean ;
begin
      Dataform2.ADConnection.StartTransaction;
      try
        CreateInvNo;
        If (Dataform2.InvoiceTableInvClose.Value = 'PurcO') then
        begin
          Dataform2.PurchaseItemTable.Refresh;
          DataForm2.PurchaseItemTable.First;
          while not DataForm2.PurchaseItemTable.EOF do
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('select TCStockNo, Nr from stock_db');
              Add('where TCStockNo = "' + Dataform2.PurchaseItemTableTCStockNo.Value + '"');
              Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            end;
            Dataform2.Query4.Open;
            If DataForm2.Query4.RecordCount = 0 then
            begin
              PurchaseForm.CreateStock;
            end
            else
            begin
              if Dataform2.PurchaseItemTableStockNo.Value = 0 then
              begin
                if MessageDlg('Stock No: ' + Dataform2.PurchaseItemTableTCStockNo.Value + ' exist, do you want to add to this stock item?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                begin
                  showmessage('Purchase Invoice not saved. Change Stock No of item');
                  Dataform2.ADConnection.Rollback;
                  Dataform2.InvoiceTable.Refresh;
                  Dataform2.PurchaseItemTable.Refresh;
                  exit;
                end;
              end;
              PurchaseForm.UpdateStock(Dataform2.Query4.FieldByName('Nr').asInteger);
            end;
            Application.ProcessMessages;
            DataForm2.PurchaseItemTable.Next;
          end;
          if Dataform2.InvoiceTableInvClose.Value <> 'PurcC' then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvClose.Value := 'PurcC'
          end;

          if Dataform2.InvoiceTableInvTotal.Value <> TotalStr then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvTotal.Value := TotalStr;
          end;
          SaveInvoice;
          UpdateCredAcc();

          Dataform2.Query4.Close;
        end;
        if (Dataform2.InvoiceTableInvClose.Value = 'RecqO') then
        begin
          if Dataform2.InvoiceTableInvClose.Value <> 'RecqC' then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvClose.Value := 'RecqC'
          end;
          if Dataform2.InvoiceTableInvTotal.Value <> TotalStr then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvTotal.Value := TotalStr;
          end;
          SaveInvoice;
        end;
        Dataform2.ADConnection.Commit;
      finally
        if DataForm2.ADConnection.InTransaction then
        begin
          Dataform2.ADConnection.Rollback;
        end;
      end;
end;

procedure TPurchaseForm.ShowallRecords1Click(Sender: TObject);
begin
          DoButtons();          
end;

procedure TPurchaseForm.Showdates();
begin
        If (DataForm2.InvoiceTable.FieldByName('InvDate').asInteger <> 0) and (not DataForm2.InvoiceTable.FieldByName('InvDate').IsNull) then
          InvoiceDateEdit.Date := StrtoDate(IntDatetoString(DataForm2.InvoiceTable.FieldByName('InvDate').asInteger))
        else
          InvoiceDateEdit.Date := InvoiceDateEdit.NullDate;

        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Round(CostPrice * Qty,2) - if(Discount is null or Discount = 0.00,0,(Round(CostPrice * Qty,2) * (Discount / 100)))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('BranchNo').asInteger));
        end;
        Dataform2.Query3.Open;
        If DataForm2.Query3.Fieldbyname('Total').IsNull then
          TotalStr := 0.00
        else
          TotalStr := DataForm2.Query3.Fieldbyname('Total').Value;
        Label13.Caption := Floattostrf(TotalStr,ffCurrency,17,2);
        Label15.Caption := Floattostrf(Totalstr * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value)),ffCurrency,17,2);
        Dataform2.Query3.Close;
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          If Dataform2.InvoiceTableInvClose.Value = 'RecqO' then
          begin
            Purchaseform.Caption := 'Stock Requisition Status (Open Requisition order)';
            JvDBGrid1.ReadOnly := False;
          end
          else
          begin
            If (Dataform2.InvoiceTableInvClose.Value = 'RecqC') and (Dataform2.InvoiceTableSyncHQ.Value = 0) then
            begin
              Purchaseform.Caption := 'Stock Requisition Status (Closed Requisition order not send to hq.)';
              JvDBGrid1.ReadOnly := True;
            end
            else
            begin
              If (Dataform2.InvoiceTableInvClose.Value = 'RecqC') and (Dataform2.InvoiceTableSyncHQ.Value <> 0) then
              begin
                Purchaseform.Caption := 'Stock Requisition Status (Closed Requisition order was send to hq.)';
                JvDBGrid1.ReadOnly := True;
              end
              else
              begin
                If Dataform2.InvoiceTableInvClose.Value = 'GRNO' then
                begin
                  Purchaseform.Caption := 'Goods Received Notice status (Open GRN)';
                  JvDBGrid1.ReadOnly := False;
                end
                else
                  If Dataform2.InvoiceTableInvClose.Value = 'GRNC' then
                  begin
                    Purchaseform.Caption := 'Goods Received Notice status (Closed GRN)';
                    JvDBGrid1.ReadOnly := True;
                  end
                  else
                    Purchaseform.Caption := 'Purchase Inv, Requisitions or Orders';
              end;
            end;
          end;
        end
        else
        begin
          If (Dataform2.InvoiceTableInvClose.Value = 'PurcO') then
          begin
            Purchaseform.Caption := 'Purchase Inv Status (Purchase inv Open)';
            JvDBGrid1.ReadOnly := False;
          end
          else
          begin
            If (Dataform2.InvoiceTableInvClose.Value = 'PurcC') then
            begin
              Purchaseform.Caption := 'Purchase Inv Status (Purchase inv Closed)';
              JvDBGrid1.ReadOnly := True;
            end
            else
            begin
              If (Dataform2.InvoiceTableInvClose.Value = 'RecqC') then
              begin
                Purchaseform.Caption := 'Stock Requisition Status (Closed Requisition)';
                JvDBGrid1.ReadOnly := True;
              end
              else
              begin
                If (Dataform2.InvoiceTableInvClose.Value = 'OrdrO') then
                begin
                  Purchaseform.Caption := 'Order Status (Open Order)';
                  JvDBGrid1.ReadOnly := False;
                end
                else
                begin
                  If (Dataform2.InvoiceTableInvClose.Value = 'OrdrC') then
                  begin
                    Purchaseform.Caption := 'Order Status (Closed Order)';
                    JvDBGrid1.ReadOnly := True;
                  end
                  else
                    Purchaseform.Caption := 'Purchase Inv, Requisitions or Orders';
                end;
              end;
            end;
          end;
        end;
end;

procedure TPurchaseForm.DeleteselectedPurchaseInv1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) or (DataForm2.InvoiceTableInvClose.Value = 'PurcO') then
      begin
        if MessageDlg('Are you sure you want to Delete the Selected Purchase Invoice?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if (Dataform2.InvoiceTableInvClose.Value <> 'PurcO') then
          begin
            AttentionDStr := '0';
            AttentionTStr := '';
            DataForm2.Query1.Close;
            with DataForm2.Query1.SQL do
            begin
              Clear;
              Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
              Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.InvoiceTableNr.Value) + ',"P","Purchase Invoice Deleted (' + InttoStr(DataForm2.InvoiceTableInvNo.Value) + ' / ' + InttoStr(DataForm2.InvoiceTableBranchNo.Value) + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
            end;
            DataForm2.Query1.ExecSQL;
          end;
          InvoiceForm.DeleteInvoiceItems;
          DataForm2.InvoiceTable.Edit;
          DataForm2.InvoiceTable.Delete;
          Showdates;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TPurchaseForm.DeleteSelectedUnpostedTurbocashPurchaseinvoice1Click(
  Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger = 5) then
      begin
        if MessageDlg('Are you sure you want to Delete the Selected Turbocash Purchase Invoice? (The invoice must be unposted)',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          PurchaseDetailclose;
          SaveInvoice;
          ShowDates;
          with TCData.TurbocashDb.Params do
          begin
            clear;
            Add('path=' + DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''));
          end;
          TCData.TurbocashDb.Open;
          TCData.TCQuery.Close;
          with TCData.TCQuery.SQL do
          begin
            Clear;
            Add('select WDocID from DocHead.DB');
            Add('where SDocNo = "' + DataForm2.InvoiceTableShiftSet.asString + '"');
          end;
          TCData.TCQuery.Open;
          if (TCData.TCQuery.RecordCount = 1) and (DataForm2.InvoiceTableShiftSet.asString <> '') then
          begin
            LastDocID := TCData.TCQuery.FieldByName('WDocID').asInteger;
            TCData.TCQuery.Close;
            with TCData.TCQuery.SQL do
            begin
              clear;
              Add('delete from DocLine.DB');
              Add('where WDocID = ' + InttoStr(LastDocID));
            end;
            TCData.TCQuery.ExecSQL;
            with TCData.TCQuery.SQL do
            begin
              clear;
              Add('delete from DocHead.DB');
              Add('where WDocID = ' + InttoStr(LastDocID));
            end;
            TCData.TCQuery.ExecSQL;
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableShiftSet.Value := '';
            Dataform2.InvoiceTable.Post;
          end
          else
            showmessage('Invoice not found in Turbocash!');
          TCData.TurbocashDb.Close;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TPurchaseForm.JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if HiWord(GetKeyState(vk_delete)) <> 0 then
      begin
        If (Dataform2.InvoiceTableInvClose.Value <> 'PurcC') then
        begin
          if MessageDlg('Are you sure you want to delete line ' + DataForm2.PurchaseItemTable.Fieldbyname('Description').asString, mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
//            DataForm2.PurchaseItemTable.Edit;
            DataForm2.PurchaseItemTable.Delete;
          end;
        end
        else
          showmessage('You can''t delete an item on an closed Purchase Invoice!');
      end;
end;

procedure TPurchaseForm.PurchaseDetailclose();
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
        InvoiceDateEdit.enabled := false;
        JvSpeedButton2.Enabled := false;
end;

procedure TPurchaseForm.PurchaseDetailopen();
begin
        DBEdit1.ReadOnly := False;
        DBEdit2.ReadOnly := False;
        DBEdit4.ReadOnly := False;
        DBEdit5.ReadOnly := False;
        DBEdit6.ReadOnly := False;
        DBEdit7.ReadOnly := False;
        DBEdit8.ReadOnly := False;
        DBEdit9.ReadOnly := False;
        DBEdit10.ReadOnly := False;
        DBEdit11.ReadOnly := False;
        DBEdit12.ReadOnly := False;
        InvoiceDateEdit.enabled := true;
        JvSpeedButton2.Enabled := true;
end;

procedure TPurchaseForm.FormCloseQuery(Sender: TObject;
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

procedure TPurchaseForm.FormCreate(Sender: TObject);
begin
        FormResizer1.InitializeForm;
end;

procedure TPurchaseForm.FormResize(Sender: TObject);
begin
        FormResizer1.ResizeAll;
end;

procedure TPurchaseForm.Purchaseinvoicesfromturbocah1Click(
  Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) or (DataForm2.InvoiceTableInvClose.Value = 'PurcO') then
      begin
        Application.CreateForm(TPeriodForm, PeriodForm);
        with TCData.TurbocashDb.Params do
        begin
          clear;
          Add('path=' + DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''));
        end;
        TCData.TurbocashDb.Open;
        TCData.TCPeriod.Open;
        TCData.tblUser.Open;
        TCData.tblDocHeader.Open;
        TCData.tblAccount.Open;
        TCData.tblMessage.Open;
        TCData.TCStockTable.Open;
        TCData.creditordetail.Open;
        PeriodForm.showmodal;
        if MessageDlg('Are you sure you want to Import Turbocash purchase invoices for period ' + InttoStr(TCData.TCPeriodWPeriodID.Value) + '?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          TCData.TCQuery.Close;
          with TCData.TCQuery.SQL do
          begin
            Clear;
            Add('select SDocNo, DDate from DocHead.DB');
//            Add('where DDate > ' + DateTimetoStr(DataForm2.TCPeriodDStartDate.Value) + ' and DDate < ' + DateTimetoStr(Dataform2.TCPeriodDEndDate.Value));
            Add('where WTypeId = 12');
          end;
          TCData.TCQuery.Open;
          TCData.TCQuery.DisableControls;
          TCData.TCQuery.first;
          try
            while not TCData.TCQuery.Eof do
            begin
              if (DatetoIntDate(TCData.TCQuery.FieldByName('DDate').AsDateTime) < DatetoIntDate(TCData.TCPeriodDStartDate.Value)) or (DatetoIntDate(TCData.TCQuery.FieldByName('DDate').AsDateTime) > DatetoIntDate(TCData.TCPeriodDEndDate.Value)) then
              begin
                TCData.TCQuery.Next;
                Continue;
              end;
              if not TCData.tblDocHeader.Locate('SDocNo', TCData.TCQuery.FieldbyName('SDocNo').asString, []) then
              begin
                showmessage('Something went wrong with import, inv ' + TCData.TCQuery.FieldByName('SDocNo').asString + ' were skipped');
                TCData.TCQuery.Next;
                Continue;
              end;
              Dataform2.InvoiceTable.Insert;
              Dataform2.InvoiceTableInvDate.Value := DatetoIntDate(TCData.tblDocHeaderDDate.Value);
              TCData.tblUser.Locate('WUserID', TCData.tblDocHeaderWUserID.Value, []);
              Dataform2.InvoiceTableInvBy.Value := TCData.tblUserSUserName.Value;
              Dataform2.InvoiceTableInvNo.Value := strtoInt(copy(TCData.tblDocHeaderSDocNo.Value,3,6));
              Dataform2.InvoiceTableInvClose.Value := 'PurcC';
              TCData.tblAccount.Locate('WAccountID', TCData.tblDocHeaderWAccountID.Value, []);
              Dataform2.InvoiceTableGLDebNo.Value := TCData.tblAccountSAccountCode.Value;
              Dataform2.InvoiceTableBranchNo.Value := 0;
              Dataform2.InvoiceTableRefNo.Value := TCData.tblDocHeaderSReference.Value;
              TCData.creditordetail.Locate('WAccountID', TCData.tblDocHeaderWAccountID.Value,[]);
              Dataform2.InvoiceTableClientName.Value := TCData.tblAccountSDescription.Value;
              Dataform2.InvoiceTableClientTelW.Value := TCData.creditordetailSTelephone1.Value;
              Dataform2.InvoiceTableClientTelC.Value := TCData.creditordetailSTelephone2.Value;
              Dataform2.InvoiceTableClientAdr1.Value := TCData.creditordetailSPostal1.Value;
              Dataform2.InvoiceTableClientAdr2.Value := TCData.creditordetailSPostal2.Value;
              Dataform2.InvoiceTableClientAdr3.Value := TCData.creditordetailSPostal3.Value;
              Dataform2.InvoiceTableClientPCode.Value := TCData.creditordetailSPostalCode.Value;
              Dataform2.InvoiceTableClientVatNo.Value := TCData.creditordetailSReference.Value;
              Dataform2.InvoiceTableClientEMail.Value := TCData.creditordetailSEmail.Value;
              Dataform2.InvoiceTableShiftSet.Value := TCData.tblDocHeaderSDocNo.Value;
              SaveInvoice;
              TCData.TCQuery2.Close;
              with TCData.TCQuery2.SQL do
              begin
                clear;
                Add('select * from DocLine.DB');
                Add('where WDocID = ' + InttoStr(TCData.tblDocHeaderWDocID.Value));
              end;
              TCData.TCQuery2.Open;
              TCData.TCQuery2.DisableControls;
              TCData.TCQuery2.first;
              try
                while not TCData.TCQuery2.Eof do
                begin
                  Dataform2.PurchaseItemTable.Insert;
                  TCData.tblMessage.Locate('WMessageID',TCData.TCQuery2.FieldByName('WdescriptionID').AsInteger,[]);
                  Dataform2.PurchaseItemTableDescription.Value := TCData.tblMessageSDescription.Value;
                  TCData.TCStockTable.Locate('WStockID',TCData.TCQuery2.FieldByName('WStockID').asInteger,[]);
                  Dataform2.PurchaseItemTablePrice.Value := MyRoundTo(TCData.TCStockTableFSellingPrice1.Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value)), -2);
                  Dataform2.PurchaseItemTablePrice2.Value := MyRoundTo(TCData.TCStockTableFSellingPrice2.Value * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value)), -2);
                  Dataform2.PurchaseItemTableQty.Value := MyRoundTo(TCData.TCQuery2.FieldByName('FQtyShipped').asFloat, -2);
                  Dataform2.PurchaseItemTableLinkId.Value := Dataform2.InvoiceTableNr.Value;
                  DataForm2.PurchaseItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
                  Dataform2.PurchaseItemTableCostPrice.Value := MyRoundTo(TCData.TCQuery2.FieldbyName('FSellingPrice').asFloat, -2);
                  Dataform2.PurchaseItemTableBarcode.Value := TCData.TCStockTableSBarCodeNumber.Value;
                  Dataform2.PurchaseItemTableTCStockNo.Value := TCData.TCStockTableSStockCode.Value;
                  Dataform2.PurchaseItemTableExtraDescr.Value := TCData.TCStockTableSExtraDesc.Value;
                  Dataform2.PurchaseItemTableDiscount.Value := TCData.TCQuery2.FieldByName('FItemDiscount').AsFloat;
                  SavePurchaseItem;
                    TCData.TCQuery2.Next;
                end;
              finally
              end;
              TCData.TCQuery2.EnableControls;

              TCData.TCQuery.Next;
            end;
          finally
          end;
        end;
        TCData.TCQuery.EnableControls;
        TCData.TCPeriod.Close;
        TCData.tblUser.Close;
        TCData.tblDocHeader.Close;
        TCData.tblAccount.Close;
        TCData.tblMessage.Close;
        TCData.TCStockTable.Close;
        TCData.creditordetail.Close;
        TCData.TurbocashDb.Close;
        Periodform.freeonrelease;
      end;
end;

procedure TPurchaseForm.ReceiptPrintingPrint(Sender: TObject);
begin
      PrintA4(ReceiptPrinting.BaseReport);
end;

procedure TPurchaseForm.TabSheet3Exit(Sender: TObject);
begin
       SavePurchaseItem;
end;

procedure TPurchaseForm.JvDBGrid1CellClick(Column: TColumn);
begin
      ShowDates;
end;

procedure TPurchaseForm.JvDBGrid1Exit(Sender: TObject);
begin
      SavePurchaseItem;
      ShowDates;
end;

procedure TPurchaseForm.JvBitBtn17Click(Sender: TObject);
begin
        ReceiptPrinting.Execute;
end;

procedure TPurchaseForm.JvBitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TPurchaseForm.DoButtons();
var
      thirtyDays, Purchasetypestr: String;
      PreviousMonth:Integer;
      Datestore:TDateTime;
begin
        If ShowallRecords1.Checked = False then
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
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          Purchasetypestr := 'where (InvClose=''RecqO'' or InvClose=''RecqC'')';
        end
        else
        begin
          Purchasetypestr := 'where (InvClose=''PurcO'' or InvClose=''PurcC'')';
        end;

        Dataform2.InvoiceTable.Close;
        with Dataform2.InvoiceTable.SQL do
        begin
          Clear;
          Add('select * from invoice_db');
          Add(Purchasetypestr);
          Add(thirtyDays);
        end;
        DataForm2.InvoiceTable.Open;
        TabSheet2.Caption := 'Purchase Inv Details';
        Tabsheet1.TabVisible := True;
        JvBitBtn11.Caption := 'Close Purchase Inv';
        JvBitBtn4.Caption := 'Save Pruchase Inv Changes';
        JvSpeedButton2.Visible := True;
        JvBitBtn17.Caption := 'Print Purchase Inv';
        DBEdit10.Enabled := True;
        JvDBGrid1.ReadOnly := False;
        JvDBGrid1.Columns.Items[6].Visible := True;

end;

procedure TPurchaseForm.WriteHQInvItem(StockLink, LinkID: String);
var
          Query1: TADQuery;

begin
          Query1 := TADQuery.Create(Self);   //Dataform.Query1
          Query1.Connection := Dataform.HQADConnection;

          Query1.Close;
          with Query1.SQL do begin
            Clear;
            Add('insert into invoiceitem_db (Description, CostPrice, Price, Price2, Qty, ExtraDescr, StockNo, TCStockNo, Barcode, ModelNo, LinkID, Discount, BranchNo) Values');
            Add('(''' + FixSQLString(Dataform2.PurchaseItemTableDescription.Value) + ''',' + FloattoStr(Dataform2.PurchaseItemTableCostPrice.Value) + ',' + FloattoStr(DataForm2.PurchaseItemTablePrice.Value) + ',' + FloattoStr(DataForm2.PurchaseItemTablePrice2.Value) + ',' + FloattoStr(Dataform2.PurchaseItemTableQty.Value) + ',''' + FixSQLString(DataForm2.PurchaseItemTableExtraDescr.Value) + ''',' + StockLink + ',''' + DataForm2.PurchaseItemTableTCStockNo.Value + ''',''' + Dataform2.PurchaseItemTableBarcode.Value + ''',''' + Dataform2.PurchaseItemTableModelNo.Value + ''',' + LinkID + ',' + FloattoStr(Dataform2.PurchaseItemTableDiscount.Value) + ',' + InttoStr(Dataform2.PurchaseItemTableBranchNo.Value) + ')');
          end;
          Query1.ExecSQL;
          Query1.Free;
end;

procedure TPurchaseForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

procedure TPurchaseForm.SavePurchaseItem();
begin
      if (DataForm2.PurchaseItemTablestrState = 'Edit') or (DataForm2.PurchaseItemTablestrState = 'Insert') then
      begin
        try
          DataForm2.PurchaseItemTable.Post;
        except
          on E : Exception do
            showmessage(E.Message);
        end;
      end;
end;

procedure TPurchaseForm.SaveInvoice();
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
end;


procedure TPurchaseForm.PrintA4(Report:TBaseReport);
var
    count: Integer;
begin
      with report do
      begin
          NewA4Page(Report);

          DataForm2.PurchaseItemTable.first;
          try
            while not DataForm2.PurchaseItemTable.EOF do
            begin
              NewLine;
              If linecount > DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27) then
              begin
                NewPage;
                NewA4Page(Report);
              end
              else
                Inc(linecount);
              PrintTab(DataForm2.PurchaseItemTable.Fieldbyname('Description').asString);
              PrintTab(DataForm2.PurchaseItemTableTCStockNo.Value);
              PrintTab(Floattostrf(Dataform2.PurchaseItemTable.Fieldbyname('Qty').asFloat,ffFixed,17,2));
              PrintTab(floattostrf(Dataform2.PurchaseItemTable.Fieldbyname('CostPrice').asFloat,ffFixed,17,2));
              PrintTab(Floattostrf((Dataform2.PurchaseItemTable.Fieldbyname('CostPrice').asFloat * Dataform2.PurchaseItemTable.Fieldbyname('Qty').asFloat),ffFixed,17,2));
              PrintTab(Floattostrf((Dataform2.PurchaseItemTable.Fieldbyname('CostPrice').asFloat * Dataform2.PurchaseItemTable.Fieldbyname('Qty').asFloat) * Dataform2.GlobalTableVat.Value / 100,ffFixed,17,2));
              PrintTab(Floattostrf((Dataform2.PurchaseItemTable.Fieldbyname('CostPrice').asFloat * Dataform2.PurchaseItemTable.Fieldbyname('Qty').asFloat) * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value)),ffFixed,17,2));
              DataForm2.PurchaseItemTable.Next;
            end;
          finally
          end;

        SetFont('Arial',10);

        Dataform2.Query3.Close;
        with DataForm2.Query3.SQL do begin
          Clear;
          Add('SELECT SUM(Round(CostPrice * Qty,2) - if(Discount is null or Discount = 0.00,0,(Round(CostPrice * Qty,2) * (Discount / 100)))) as Total FROM invoiceitem_db');
          Add('where LinkId = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('Nr').asInteger));
          Add('and BranchNo = ' + inttostr(Dataform2.InvoiceTable.Fieldbyname('BranchNo').asInteger));
        end;
        Dataform2.Query3.Prepare;
        Dataform2.Query3.Open;
        NewLine;
        NewLine;
        Bold := True;
        printXY(0.250,DataForm2.IniFile.ReadFloat ('Settings', 'A4InvBottomStart', 8.5),'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;
        if (FromWhere <> 'orders') then
        begin
          if (Dataform2.GlobalTableBranchNo.Value <> 0) or (FromWhere = 'hqrecq') then
            printLeft('Request Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + '   VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * Dataform2.GlobalTableVat.Value / 100 ,ffCurrency,17,2), 0.5)
          else
            printLeft('Purchase Inv Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + '   VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * Dataform2.GlobalTableVat.Value / 100 ,ffCurrency,17,2), 0.5);
        end
        else
            printLeft('Order Total: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat,ffCurrency,17,2) + '   VAT: ' + Floattostrf(DataForm2.Query3.Fieldbyname('Total').asFloat * Dataform2.GlobalTableVat.Value / 100 ,ffCurrency,17,2), 0.5);
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
        Dataform2.Query3.Unprepare;
      end;
end;

procedure TPurchaseForm.NewA4Page(Report:TBaseReport);
var
    logo: TBitmap;
    count: Integer;
begin
      with report do
      begin
        logo := TBitmap.Create;
        try
          logo.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
//          PrintBitmapRect(0.75,0.50,4,3.25,logo);
          PrintBitmapRect(0.75,0.50,CalcGraphicWidth(3.0,logo),CalcGraphicHeight(3.0,logo),logo);
        finally
        logo.Free;
        end;

        MarginLeft := 0.250;
        MarginTop := 0.5;
        SetFont('Arial',14);
        Bold := True;
        Italic := True;
        if (FromWhere <> 'orders') then
        begin
          if (Dataform2.GlobalTableBranchNo.Value <> 0) or (FromWhere = 'hqrecq') then
            printLeft('REQUISITION', 4.75)
          else
            printLeft('PURCHASE INVOICE', 4.75);
        end
        else
        begin
          printLeft('ORDER', 4.75);
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
        NewLine;
        if (FromWhere <> 'orders') then
        begin
          if (Dataform2.GlobalTableBranchNo.Value <> 0) or (FromWhere = 'hqrecq') then
            printTab('Request By:')
          else
            printTab('Purchase Inv By:');
        end
        else
          printTab('Order By:');
        printTab(DataForm2.InvoiceTable.FieldByName('InvBy').asString);
        NewLine;
        if (FromWhere <> 'orders') then
        begin
          if (Dataform2.GlobalTableBranchNo.Value <> 0) or (FromWhere = 'hqrecq') then
            printTab('Request Date:')
          else
            printTab('Purchase Inv Date:');
        end
        else
          printTab('Order Date:');
        printTab(IntDatetoString(DataForm2.InvoiceTable.Fieldbyname('InvDate').asInteger));
        NewLine;
        if (FromWhere <> 'orders') then
        begin
          if (Dataform2.GlobalTableBranchNo.Value <> 0) or (FromWhere = 'hqrecq') then
            printTab('Request No:')
          else
            printTab('Purchase Inv No:');
        end
        else
          printTab('Order No:');
        printTab(InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ' / ' + InttoStr(DataForm2.InvoiceTable.Fieldbyname('InvNo').asInteger));
        SetFont('Arial',10);
        NewLine;
        Bold := True;
        printXY(0.250,3.4,'');
        NewLine;
        printCenter('-----------------------------------------------------------------------------------', 4.25);
        NewLine;

        SetFont('Arial',8);

          ClearTabs;
          SetTab(0.30, pjCenter,2,0,0,0);
          SetTab(NA, pjCenter,1,0,0,0);
          SetTab(NA, pjCenter,0.7,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);
          SetTab(NA, pjCenter,0.78,0,0,0);
          SetTab(NA, pjCenter,0.8,0,0,0);

          NewLine;
          PrintTab('Description');
          PrintTab('Stock No');
          PrintTab('Qty');
          PrintTab('Unit Cost');
          if Dataform2.GlobalTableVat.Value <> 0 then
          begin
            PrintTab('Cost Excl');
            PrintTab('VAT');
            PrintTab('Cost Incl');
          end
          else
          begin
            PrintTab('Cost');
          end;
          Bold := false;
          ClearTabs;
          SetTab(0.30, pjCenter,2,0,BOXLINEALL,0);
          SetTab(NA, pjCenter,1,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.7,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.78,0,BOXLINEALL,0);
          SetTab(NA, pjRight,0.8,0,BOXLINEALL,0);
      end;
end;

procedure TPurchaseForm.CreateInvNo();
begin
        If Dataform2.InvoiceTableInvNo.Value = 0 then
        begin
          Dataform2.InvoiceTable.Edit;
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('SELECT MAX(InvNo) FROM invoice_db');
            Add('where (InvClose = "PurcC" or InvClose = "PurcO" or InvClose = "RecqO" or InvClose = "RecqC" or InvClose = "OrdrO" or InvClose = "OrdrC")');
            Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          end;
          Dataform2.Query2.UpdateOptions.ReadOnly := True;
          DataForm2.Query2.Open;
          Dataform2.GlobalTable.Refresh;
          Dataform2.GlobalTable.Edit;
          If DataForm2.GlobalTablePurchaseInvNo.Value < DataForm2.Query2.FieldByName('MAX(InvNo)').asInteger then
            DataForm2.GlobalTablePurchaseInvNo.Value := DataForm2.Query2.FieldByName('MAX(InvNo)').asInteger;
          Dataform2.InvoiceTable.FieldByName('InvNo').asInteger := DataForm2.GlobalTablePurchaseInvNo.Value + 1;
          DataForm2.GlobalTablePurchaseInvNo.Value := Dataform2.InvoiceTable.FieldByName('InvNo').asInteger;
          Dataform2.GlobalTable.Post;
          Dataform2.Query2.Close;
          Dataform2.Query2.UpdateOptions.ReadOnly := False;
          SaveInvoice;
        end;
end;

procedure TPurchaseForm.OpenInvoiceItems();
begin
        Dataform2.PurchaseItemTable.Close;
        with Dataform2.PurchaseItemTable.SQL do
        begin
          Clear;
          Add('select * from invoiceitem_db');
          Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
        end;
        Dataform2.PurchaseItemTable.Open;
end;


procedure TPurchaseForm.InsertProduct(TCStockNoStr:String);
begin
        Dataform2.StockTable.Locate('TCStockNo', TCStockNoStr,[]);
        DataForm2.PurchaseItemTable.Append;
        DataForm2.PurchaseItemTableLinkID.Value := Dataform2.InvoiceTableNr.Value;
        DataForm2.PurchaseItemTableBranchNo.Value := Dataform2.InvoiceTableBranchNo.Value;
        DataForm2.PurchaseItemTableDescription.Value := Dataform2.StockTableDescription.Value;
        DataForm2.PurchaseItemTablePrice.Value := DataForm2.StockTableSalesPrice.Value;
        Dataform2.PurchaseItemTableStockNo.Value := Dataform2.StockTableNr.Value;
        DataForm2.PurchaseItemTableCostPrice.Value := MyRoundTo((DataForm2.StockTableCostPrice.Value * 100 / 114),-2);
        DataForm2.PurchaseItemTablePrice2.Value := DataForm2.StockTableSalesPrice2.Value;
        DataForm2.PurchaseItemTableBarcode.Value := DataForm2.StockTableBarcode.Value;
        dataForm2.PurchaseItemTableTCStockNo.Value := DataForm2.StockTableTCStockNo.Value;
        Dataform2.PurchaseItemTableExtraDescr.Value := DataForm2.StockTableExtraDescr.Value;
        Dataform2.PurchaseItemTableModelNo.Value := DataForm2.StockTableModelNo.Value;
end;

procedure TPurchaseForm.UpdateCredAcc();
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
            Add('and AccType = 2');
          end;
          Dataform2.Query4.Prepare;
          Dataform2.Query4.Open;
          if Dataform2.Query4.RecordCount = 1 then
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
            e := Dataform2.InvoiceTableInvTotal.Value * -1;
            Dataform2.Query1.Close;
            s := '("Purchase Inv",' + FloattoStr(e) + ',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger) + ',"Purchase Inv",' + YearStr + ',' + MonthStr + ',"A",' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ',' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ',"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + '")';
            with DataForm2.Query1.SQL do begin
              Clear;
              Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,IInvNo,IBranchNo,RefNo) values ');
              Add(s);
            end;
            DataForm2.Query1.ExecSQL;
//            e := Dataform2.InvoiceTableAmmTendered.Value + Dataform2.InvoiceTablePremium.Value;
//            if e <> 0 then
//            begin
//              s := '("Payment",' + FloattoStr(e * -1) + ',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger) + ',"' + Dataform2.InvoiceTableInvoiceType.Value + '",' + YearStr + ',' + MonthStr + ',"A",' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ',' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ',"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + '")';
//              with DataForm2.Query1.SQL do begin
//                Clear;
//                Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,IInvNo,IBranchNo,RefNo) values ');
//                Add(s);
//              end;
//              DataForm2.Query1.ExecSQL;
//            end;
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

function TPurchaseForm.AvgCostCalc(TCStockNo:String;NoValueCost:Currency;PurchItemNr:Integer):Currency;
var
  Query1: TADQuery;
  s:String;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        s:= '1.' + FloattoStr(Dataform2.GlobalTableVat.Value);
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT Sum(invoiceitem_db.CostPrice) * ' + s + ' as TotalCost, Count(invoiceitem_db.Nr) as TotalItems');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where invoiceitem_db.TCStockNo = "' + TCStockNo + '"');
          Add('and invoice_db.InvClose = "PurcC"');
          Add('Order By invoiceitem_db.Nr');
        end;
        Query1.Prepare;
        Query1.Open;
        Query1.Last;
//        Showmessage(InttoStr(Query1.Fieldbyname('TotalItems').asInteger));
        if Query1.Fieldbyname('TotalItems').asInteger <> 0 then
          AvgCostCalc := (Query1.Fieldbyname('TotalCost').asCurrency + NoValueCost) / (Query1.Fieldbyname('TotalItems').asInteger + 1)
        else
          AvgCostCalc := NoValueCost;
        Query1.Close;
        Query1.Free;
end;

end.
