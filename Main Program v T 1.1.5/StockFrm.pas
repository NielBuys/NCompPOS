unit StockFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, Graphics, Controls,
  Dialogs, UtilsUnit, db, Menus,
  StdCtrls, Buttons, JvExButtons, JvBitBtn, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, JvExControls, JvSpeedButton, uADCompClient, JvComponentBase,
  JvDBGridExport, RpBase, RpSystem, RpDefine, RpRave, JvDBLookup, JvExStdCtrls,
  JvCombobox;

type
  TStockForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    StockGrid: TJvDBGrid;
    SearchStockBtn: TButton;
    DeleteStockItem1: TMenuItem;
    ClearAllStock1: TMenuItem;
    FullBarcodeList1: TMenuItem;
    ClearallHQStock1: TMenuItem;
    JvBitBtn1: TJvBitBtn;
    ImportStock1: TMenuItem;
    ImportStock2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ListallInvoicesthathasaselectedStockItem1: TMenuItem;
    ListallTransfersthathasaselectedStockItem1: TMenuItem;
    ExtraRuns1: TMenuItem;
    FixDuplicatelocalstockitems1: TMenuItem;
    FixHQStockQtys: TMenuItem;
    ShowallInvoicesthathasselectedStockItem1: TMenuItem;
    ShowallTransfersthathasaselectedStockItem1: TMenuItem;
    estandfixBranchstockwithoutHQStock1: TMenuItem;
    FixDuplicateBarcodeitems1: TMenuItem;
    FixDuplicatemodelnoitems1: TMenuItem;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    Shortcuts1: TMenuItem;
    SearchforStock1: TMenuItem;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    JvSpeedButton2: TJvSpeedButton;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
    CSVExport: TJvDBGridCSVExport;
    JvSpeedButton1: TJvSpeedButton;
    Label2: TLabel;
    SearchEditBox: TEdit;
    Label3: TLabel;
    SearchByCombo: TJvComboBox;
    SearchBtn: TJvBitBtn;
    CheckBox2: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SearchStockBtnClick(Sender: TObject);
    procedure DeleteStockItem1Click(Sender: TObject);
    procedure ClearAllStock1Click(Sender: TObject);
    procedure FullBarcodeList1Click(Sender: TObject);
    procedure StockGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure ClearallHQStock1Click(Sender: TObject);
    procedure ImportStock2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListallInvoicesthathasaselectedStockItem1Click(Sender: TObject);
    procedure ListallTransfersthathasaselectedStockItem1Click(Sender: TObject);
    procedure FixDuplicatelocalstockitems1Click(Sender: TObject);
    procedure FixHQStockQtysClick(Sender: TObject);
    procedure ShowallInvoicesthathasselectedStockItem1Click(Sender: TObject);
    procedure ShowallTransfersthathasaselectedStockItem1Click(Sender: TObject);
    procedure StockGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure estandfixBranchstockwithoutHQStock1Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure FixDuplicateBarcodeitems1Click(Sender: TObject);
    procedure FixDuplicatemodelnoitems1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure StockGridDblClick(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure SearchforStock1Click(Sender: TObject);
    procedure StockGridKeyPress(Sender: TObject; var Key: Char);
    procedure RvSystem1BeforePrint(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure BranchSelectComboChange(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
  private
    function ConvertBarChar(S:String): Integer;
    function BarCodeCheck(i: integer): String;
    procedure StockOpen;
    function PerBranchQTY(BranchNo: Integer; TCStockNoStr: String): extended;
    procedure EditStockItem;
    procedure CreateStockItem(NonStockItem: Boolean);
    { Private declarations }
  public
    { Public declarations }
    StockOrder: String;
    function LocalBranchTransferQTY(TCStockNoStr: String): extended;
    function PerBranchBranchTransferQTY(TCStockNoStr: String;
      BranchNoInt: integer): extended;
    function LocalPurchasedQTY(TCStockNoStr: String): extended;
    function PerBranchPurchasedQTY(TCStockNoStr: String;
      BranchNoInt: integer): extended;
    function SoldHqQTY(TCStockNoStr: String): extended;
    function TotalBranchSoldQTY(TCStockNoStr: String): extended;
    function StockAtBranch(TCStockNo:String): extended;
    function GlobalAdjustments(TCStockNoStr: String): extended;
    function TotalBranchAdjustments(TCStockNoStr: String): extended;
    function LocalAdjustments(TCStockNoStr: String): extended;
    function PerBranchAdjustments(TCStockNoStr: String;
      BranchNoInt: Integer): extended;
    function InvoiceCostTotal(Nr,BranchNo: Integer): Currency;
    function AvgCostCalc(TCStockNo: String;NoValueCost:Currency): Currency;
    function PerBranchSoldQTY(TCStockNoStr: String;
       BranchNoInt: Integer): extended;
    procedure PrintBarcode(PrintQty:Boolean);
    function QtyStockNotLocalStock(TCStockNo: String): extended;
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  StockForm: TStockForm;

implementation
    uses DataFrm2, StockSearchFrm, UserFrm, BarcodePrintingFrm, TCDataMod,
  ImportFrm, ExtractFrm, MainFrm, InvoiceFrm, TempGrid, StockEditFrm;

{$R *.dfm}

procedure TStockForm.FixDuplicateBarcodeitems1Click(Sender: TObject);
var
      PreviousBarcode: String;
      PreviousStockNo: Integer;
      PreviousQty: Extended;
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Fix local Duplicate Stock items!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          PreviousBarcode := '';
          PreviousStockNo := 0;
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from stock_db');
            Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            Add('and not Barcode is null');
            Add('order by Barcode,DateCreated');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query2.Close;
          Dataform2.Query1.DisableControls;
          try
            Dataform2.Query1.First;
            while not Dataform2.Query1.EOF do
            begin
              if Dataform2.Query1.FieldByName('Barcode').asString = PreviousBarcode then
              begin
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update invoiceitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update stocktrnsferitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('Delete from stock_db');
                  Add('where Nr = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                if PreviousQty <> 0 then
                begin
                  Dataform2.Query1.Edit;
                  Dataform2.Query1.FieldByName('Qty').asFloat := Dataform2.Query1.FieldByName('Qty').asFloat + PreviousQty;
                  Dataform2.Query1.Post;
                end;
                PreviousBarcode := Dataform2.Query1.FieldByName('Barcode').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end
              else
              begin
                PreviousBarcode := Dataform2.Query1.FieldByName('Barcode').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end;

              Dataform2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.EnableControls;
          showmessage('Finished!');
        end;
      end;
end;

procedure TStockForm.FixDuplicatelocalstockitems1Click(Sender: TObject);
var
      PreviousTCStockNo: String;
      PreviousStockNo: Integer;
      PreviousQty: Extended;
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Fix local Duplicate Stock items!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          PreviousTCStockNo := '';
          PreviousStockNo := 0;
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from stock_db');
            Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            Add('order by TCStockNo,DateCreated');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query2.Close;
          Dataform2.Query1.DisableControls;
          try
            Dataform2.Query1.First;
            while not Dataform2.Query1.EOF do
            begin
              if Dataform2.Query1.FieldByName('TCStockNo').asString = PreviousTCStockNo then
              begin
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update invoiceitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update stocktrnsferitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('Delete from stock_db');
                  Add('where Nr = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                if PreviousQty <> 0 then
                begin
                  Dataform2.Query1.Edit;
                  Dataform2.Query1.FieldByName('Qty').asFloat := Dataform2.Query1.FieldByName('Qty').asFloat + PreviousQty;
                  Dataform2.Query1.Post;
                end;
                PreviousTCStockNo := Dataform2.Query1.FieldByName('TCStockNo').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end
              else
              begin
                PreviousTCStockNo := Dataform2.Query1.FieldByName('TCStockNo').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end;

              Dataform2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.EnableControls;
          showmessage('Finished!');
        end;
      end;
end;

procedure TStockForm.FixDuplicatemodelnoitems1Click(Sender: TObject);
var
      PreviousModelNo: String;
      PreviousStockNo: Integer;
      PreviousQty: Extended;
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Fix local Duplicate Stock items!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          PreviousModelNo := '';
          PreviousStockNo := 0;
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from stock_db');
            Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            Add('and not ModelNo is null');
            Add('order by ModelNo,DateCreated');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query2.Close;
          Dataform2.Query1.DisableControls;
          try
            Dataform2.Query1.First;
            while not Dataform2.Query1.EOF do
            begin
              if Dataform2.Query1.FieldByName('ModelNo').asString = PreviousModelNo then
              begin
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update invoiceitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('update stocktrnsferitem_db set StockNo = ' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger));
                  Add('where StockNo = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                with Dataform2.Query2.SQL do
                begin
                  Clear;
                  Add('Delete from stock_db');
                  Add('where Nr = ' + inttostr(PreviousStockNo));
                end;
                Dataform2.Query2.execsql;
                if PreviousQty <> 0 then
                begin
                  Dataform2.Query1.Edit;
                  Dataform2.Query1.FieldByName('Qty').asFloat := Dataform2.Query1.FieldByName('Qty').asFloat + PreviousQty;
                  Dataform2.Query1.Post;
                end;
                PreviousModelNo := Dataform2.Query1.FieldByName('ModelNo').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end
              else
              begin
                PreviousModelNo := Dataform2.Query1.FieldByName('ModelNo').asString;
                PreviousStockNo := Dataform2.Query1.FieldByName('Nr').asInteger;
                PreviousQty := Dataform2.Query1.FieldByName('Qty').asFloat;
              end;

              Dataform2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.EnableControls;
          showmessage('Finished!');
        end;
      end;
end;

procedure TStockForm.FixHQStockQtysClick(Sender: TObject);
var
      PurchasedQtyAmm,SoldQtyAmm,BranchQtyAmm,OpenLayBuyQtyAmm,AdjAmm:Extended;
      i:integer;
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Fix HQ Stock Qty?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from stock_db');
            Add('where BranchNo = 0');
            Add('order by TCStockNo,DateCreated');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query1.DisableControls;
          try
            Dataform2.Query1.First;
            while not Dataform2.Query1.EOF do
            begin
              PurchasedQtyAmm := StockForm.PerBranchPurchasedQTY(Dataform2.Query1.FieldByName('TCStockNo').asString,Dataform2.Query1.FieldByName('BranchNo').asInteger);
              SoldQtyAmm := StockForm.PerBranchSoldQTY(Dataform2.Query1.FieldByName('TCStockNo').asString,Dataform2.Query1.FieldByName('BranchNo').asInteger);
              BranchQtyAmm := StockForm.PerBranchBranchTransferQTY(Dataform2.Query1.FieldByName('TCStockNo').asString,Dataform2.Query1.FieldByName('BranchNo').asInteger);
  //            OpenLayBuyQtyAmm := InvoiceForm.OpenLayBuyQty(Dataform2.Query1.FieldByName('TCStockNo').asString,Dataform2.Query1.FieldByName('BranchNo').asInteger);
              AdjAmm := StockForm.PerBranchAdjustments(Dataform2.Query1.FieldByName('TCStockNo').asString,Dataform2.Query1.FieldByName('BranchNo').asInteger);

{              PurchasedQtyAmm := LocalPurchasedQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
              SoldQtyAmm := SoldHqQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
              BranchQtyAmm := TotalBranchSoldQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
              AdjAmm := GlobalAdjustments(Dataform2.StockTableTCStockNo.Value); }
              Dataform2.Query1.Edit;
              Dataform2.Query1.FieldByName('Qty').AsFloat := PurchasedQtyAmm - SoldQtyAmm - BranchQtyAmm + AdjAmm;
              Dataform2.Query1.Post;

              Dataform2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.EnableControls;
          Dataform2.Query1.Close;
          Dataform2.StockTable.Refresh;
          showmessage('Finished!');
        end;
      end;
end;

procedure TStockForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if not DirectoryExists(Dataform2.UserDataPath + '\NCompPOS') then
        CreateDir(Dataform2.UserDataPath + '\NCompPOS');
      StockGrid.Columns.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\StockAdmin');
      Dataform2.StockTable.Close;
  //    Dataform2.BranchListQuery.Close;
      MainForm.show;
end;

procedure TStockForm.FormCreate(Sender: TObject);
begin
        StockForm.Width := Screen.Width;
end;

procedure TStockForm.FormShow(Sender: TObject);
begin
//      Dataform2.BranchListQuery.Open;
 //     Dataform2.BranchListQuery.Locate('Nr', InttoStr(Dataform2.GlobalTableBranchNo.Value),[]);
  //    BranchSelectCombo.Locate(Dataform2.BranchListQueryNr, InttoStr(Dataform2.GlobalTableBranchNo.Value),False);
      StockOrder := 'Description';
      StockOpen;
      if FileExists(Dataform2.UserDataPath + '\NCompPOS\StockAdmin') then
        StockGrid.Columns.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\StockAdmin');
end;

procedure TStockForm.SearchStockBtnClick(Sender: TObject);
begin
      Application.CreateForm(TStockSearchForm, StockSearchForm);
      StockSearchForm.fromwheretmp := 'Stock';
      StockSearchForm.ShowModal;
      StockSearchform.Free;
end;

procedure TStockForm.estandfixBranchstockwithoutHQStock1Click(Sender: TObject);
var
      PurchasedQtyAmm,SoldQtyAmm,BranchQtyAmm:Extended;
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Fix Branch Stock with no HQ stock!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from stock_db');
            Add('where not BranchNo = 0');
            Add('order by TCStockNo,DateCreated');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query2.Close;
          ExtractForm.Memo1.Clear;
          Dataform2.Query1.DisableControls;
          try
            Dataform2.Query1.First;
            while not Dataform2.Query1.EOF do
            begin
              Dataform2.Query2.Close;
              with Dataform2.Query2.SQL do
              begin
                Clear;
                Add('select * from stock_db');
                Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                Add('and TCStockNo = "' + Dataform2.Query1.FieldByName('TCStockNo').asString + '"');
                Add('order by TCStockNo,DateCreated');
              end;
              Dataform2.Query2.Open;

              if Dataform2.Query2.RecordCount = 0 then
              begin
                PurchasedQtyAmm := LocalPurchasedQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
                SoldQtyAmm := SoldHqQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
                BranchQtyAmm := TotalBranchSoldQty(Dataform2.Query1.FieldByName('TCStockNo').asString);
                Dataform2.Query2.Close;
                with Dataform2.Query2.SQL do begin
                  Clear;
                  Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed, TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr');
                  Add(', ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
                  Add('(''' + FixSQLString(Dataform2.Query1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(Dataform2.Query1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(DataForm2.Query1.FieldByName('SalesPrice').AsFloat) + ',''' + Dataform2.Query1.FieldByName('Barcode').AsString + ''',''' + Dataform2.Query1.FieldByName('NonStockItem').AsString + ''',''' + DataForm2.Query1.FieldByName('Changed').AsString + ''',''' + Dataform2.Query1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',null' +
                      ',' + FloattoStr(PurchasedQtyAmm - SoldQtyAmm - BranchQtyAmm) + ',' + FloattoStr(Dataform2.Query1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(Dataform2.Query1.FieldByName('StartingQty').AsFloat) + ',''' + Dataform2.Query1.FieldByName('Group').AsString + ''',' + FloattoStr(DataForm2.Query1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(Dataform2.Query1.FieldByName('ExtraDescr').AsString) + ''',''' + Dataform2.Query1.FieldByName('ModelNo').AsString + ''',''' + Dataform2.Query1.FieldByName('st_created_by').AsString + ''',''' + Dataform2.Query1.FieldByName('st_changed_by').AsString + ''',''' + Dataform2.Query1.FieldByName('st_nontaxitem').AsString + ''')');
                end;
                Dataform2.Query2.ExecSQL;
                if PurchasedQtyAmm <> 0 then
                  ExtractForm.Memo1.Lines.Add(Dataform2.Query1.FieldByName('TCStockNo').asString)
                else
                  ExtractForm.Memo1.Lines.Add(Dataform2.Query1.FieldByName('TCStockNo').asString + ',"No Purchase Inv"');
              end;

              Dataform2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.EnableControls;
          ExtractForm.SaveDialog.FileName := 'HQ Stock fixed.csv';
          if ExtractForm.SaveDialog.Execute then
            ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
          ExtractForm.Memo1.clear;
          Dataform2.Query1.Close;
          Dataform2.Query2.Close;
          Dataform2.StockTable.Refresh;
          showmessage('Finished!');
        end;
      end;
end;

procedure TStockForm.DeleteStockItem1Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Delete the selected Stock Item!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('SELECT invoiceitem_db.*, invoice_db.InvClose, invoice_db.InvNo');
            Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
            Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
          end;
          Dataform2.Query1.Open;
          if Dataform2.Query1.RecordCount = 0 then
          begin
            AttentionDStr := '0';
            AttentionTStr := '';
            DataForm2.Query1.Active := False;
            with DataForm2.Query1.SQL do
            begin
              Clear;
              Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
              Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.StockTableNr.Value) + ',"S","Stock Deleted (' + Dataform2.StockTableTCStockNo.Value + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
            end;
            DataForm2.Query1.ExecSQL;
            DataForm2.StockTable.Delete;
          end
          else
          begin
            ShowallInvoicesthathasselectedStockItem1.Click;
            if MessageDlg('There are Invoices with this stock item in do you realy want to delete?', mtConfirmation,
            [mbYes, mbNo], 0) = mrYes then
            begin
              AttentionDStr := '0';
              AttentionTStr := '';
              DataForm2.Query1.Active := False;
              with DataForm2.Query1.SQL do
              begin
                Clear;
                Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
                Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.StockTableNr.Value) + ',"S","Stock Deleted (' + Dataform2.StockTableTCStockNo.Value + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
              end;
              DataForm2.Query1.ExecSQL;
              DataForm2.StockTable.Delete
            end;
          end;
          Dataform2.Query1.Close;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockForm.ClearAllStock1Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Delete ALL THE STOCK!!!!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          AttentionDStr := '0';
          AttentionTStr := '';
          DataForm2.Query1.Active := False;
          with DataForm2.Query1.SQL do
          begin
            Clear;
            Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
            Add('(' + InttoStr(DatetoIntDate(date)) + ',0,"S","Clear all Stock was done",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
          end;
          DataForm2.Query1.ExecSQL;
          DataForm2.Query2.Active := False;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM stock_db');
          end;
          DataForm2.Query2.ExecSQL;
          Dataform2.StockTable.Refresh;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockForm.ListallInvoicesthathasaselectedStockItem1Click(
  Sender: TObject);
begin
       Dataform2.Query1.Close;
       with Dataform2.Query1.SQL do
       begin
         Clear;
         Add('SELECT invoiceitem_db.*, invoice_db.InvClose, invoice_db.InvNo, invoice_db.InvDate');
         Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
         Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
       end;
       Dataform2.Query1.Open;
       ExtractForm.Memo1.Clear;
       ExtractForm.Memo1.Lines.Add('"Stock No","Inv No","Branch No","Inv Date","Status","Inv Qty"');
       Dataform2.Query1.DisableControls;
       Dataform2.Query1.First;
       while not DataForm2.Query1.EOF do
       begin
         ExtractForm.Memo1.Lines.Add('"' + Dataform2.Query1.FieldByName('TCStockNo').asString + '",' + InttoStr(Dataform2.Query1.FieldByName('InvNo').asInteger) + ',' + InttoStr(Dataform2.Query1.FieldByName('BranchNo').asInteger) + ',"' + IntDatetoString(Dataform2.Query1.FieldByName('InvDate').asInteger) + '","' + Dataform2.Query1.FieldByName('InvClose').asString + '","' + FloattoStr(Dataform2.Query1.FieldByName('Qty').asFloat) + '"');
         Dataform2.Query1.Next;
       end;
       Dataform2.Query1.EnableControls;
       ExtractForm.SaveDialog.FileName := 'Stock Items in Invoices.csv';
       if ExtractForm.SaveDialog.Execute then
         ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
       ExtractForm.Memo1.clear;
       Dataform2.Query1.Close;
end;

procedure TStockForm.ListallTransfersthathasaselectedStockItem1Click(
  Sender: TObject);
begin
       Dataform2.Query1.Close;
       with Dataform2.Query1.SQL do
       begin
         Clear;
         Add('SELECT stocktrnsferitem_db.*, stocktrnsfer_db.Closed, stocktrnsfer_db.Sync, stocktrnsfer_db.Date, stocktrnsfer_db.ToBranch');
         Add('FROM stocktrnsferitem_db left join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
         Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
       end;
       Dataform2.Query1.Open;
       ExtractForm.Memo1.Clear;
       ExtractForm.Memo1.Lines.Add('"Stock No","Date","Branch No","Closed","Sync","Qty"');
       Dataform2.Query1.DisableControls;
       Dataform2.Query1.First;
       while not DataForm2.Query1.EOF do
       begin
         ExtractForm.Memo1.Lines.Add('"' + Dataform2.Query1.FieldByName('TCStockNo').asString + '",' + IntDatetoString(Dataform2.Query1.FieldByName('Date').asInteger) + ',' + InttoStr(Dataform2.Query1.FieldByName('ToBranch').asInteger) + ',"' + Dataform2.Query1.FieldByName('Closed').asString + '","' + IntDatetoString(Dataform2.Query1.FieldByName('Sync').asInteger) + '","' + FloattoStr(Dataform2.Query1.FieldByName('Qty').asFloat) + '"');
         Dataform2.Query1.Next;
       end;
       Dataform2.Query1.EnableControls;
       ExtractForm.SaveDialog.FileName := 'Stock Items in Transfers.csv';
       if ExtractForm.SaveDialog.Execute then
         ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
       ExtractForm.Memo1.clear;
       Dataform2.Query1.Close;
end;

function TStockForm.ConvertBarChar(S:String): Integer;
begin
    If S = '0' then
      ConvertBarChar := 0;
    If S = '1' then
      ConvertBarChar := 1;
    If S = '2' then
      ConvertBarChar := 2;
    If S = '3' then
      ConvertBarChar := 3;
    If S = '4' then
      ConvertBarChar := 4;
    If S = '5' then
      ConvertBarChar := 5;
    If S = '6' then
      ConvertBarChar := 6;
    If S = '7' then
      ConvertBarChar := 7;
    If S = '8' then
      ConvertBarChar := 8;
    If S = '9' then
      ConvertBarChar := 9;
    If S = 'A' then
      ConvertBarChar := 10;
    If S = 'B' then
      ConvertBarChar := 11;
    If S = 'C' then
      ConvertBarChar := 12;
    If S = 'D' then
      ConvertBarChar := 13;
    If S = 'E' then
      ConvertBarChar := 14;
    If S = 'F' then
      ConvertBarChar := 15;
    If S = 'G' then
      ConvertBarChar := 16;
    If S = 'H' then
      ConvertBarChar := 17;
    If S = 'I' then
      ConvertBarChar := 18;
    If S = 'J' then
      ConvertBarChar := 19;
    If S = 'K' then
      ConvertBarChar := 20;
    If S = 'L' then
      ConvertBarChar := 21;
    If S = 'M' then
      ConvertBarChar := 22;
    If S = 'N' then
      ConvertBarChar := 23;
    If S = 'O' then
      ConvertBarChar := 24;
    If S = 'P' then
      ConvertBarChar := 25;
    If S = 'Q' then
      ConvertBarChar := 26;
    If S = 'R' then
      ConvertBarChar := 27;
    If S = 'S' Then
      ConvertBarChar := 28;
    If S = 'T' then
      ConvertBarChar := 29;
    If S = 'I' then
      ConvertBarChar := 30;
    If S = 'V' then
      ConvertBarChar := 31;
    If S = 'W' then
      ConvertBarChar := 32;
    If S = 'X' then
      ConvertBarChar := 33;
    If S = 'Y' then
      ConvertBarChar := 34;
    If S = 'Z' then
      ConvertBarChar := 35;
    If S = '-' then
      ConvertBarChar := 36;
    If S = '.' then
      ConvertBarChar := 37;
    If S = ' ' then
      ConvertBarChar := 38;
    If S = '$' then
      ConvertBarChar := 39;
    If S = '/' then
      ConvertBarChar := 40;
    If S = '+' then
      ConvertBarChar := 41;
    If S = '%' then
      ConvertBarChar := 42;
end;

function TStockForm.BarCodeCheck(i:integer): String;
begin
  case i of
    0: BarCodeCheck := '0';
    1: BarCodeCheck := '1';
    2: BarCodeCheck := '2';
    3: BarCodeCheck := '3';
    4: BarCodeCheck := '4';
    5: BarCodeCheck := '5';
    6: BarCodeCheck := '6';
    7: BarCodeCheck := '7';
    8: BarCodeCheck := '8';
    9: BarCodeCheck := '9';
    10: BarCodeCheck := 'A';
    11: BarCodeCheck := 'B';
    12: BarCodeCheck := 'C';
    13: BarCodeCheck := 'D';
    14: BarCodeCheck := 'E';
    15: BarCodeCheck := 'F';
    16: BarCodeCheck := 'G';
    17: BarCodeCheck := 'H';
    18: BarCodeCheck := 'I';
    19: BarCodeCheck := 'J';
    20: BarCodeCheck := 'K';
    21: BarCodeCheck := 'L';
    22: BarCodeCheck := 'M';
    23: BarCodeCheck := 'N';
    24: BarCodeCheck := 'O';
    25: BarCodeCheck := 'P';
    26: BarCodeCheck := 'Q';
    27: BarCodeCheck := 'R';
    28: BarCodeCheck := 'S';
    29: BarCodeCheck := 'T';
    30: BarCodeCheck := 'U';
    31: BarCodeCheck := 'V';
    32: BarCodeCheck := 'W';
    33: BarCodeCheck := 'X';
    34: BarCodeCheck := 'Y';
    35: BarCodeCheck := 'Z';
    36: BarCodeCheck := '-';
    37: BarCodeCheck := '.';
    38: BarCodeCheck := ' ';
    39: BarCodeCheck := '$';
    40: BarCodeCheck := '/';
    41: BarCodeCheck := '+';
    42: BarCodeCheck := '%';
  end;
end;

procedure TStockForm.BranchSelectComboChange(Sender: TObject);
begin
        StockOpen;
end;

procedure TStockForm.FullBarcodeList1Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 2 then
      begin
        Application.CreateForm(TBarcodePrintingForm, BarcodePrintingForm);
        BarCodePrintingForm.Fromwhere := 'StockA';
        Dataform2.StockQuery.Close;
        with DataForm2.StockQuery.SQL do begin
          Clear;
          Add('SELECT * FROM stock_db');
          Add('Where NonStockItem = "False"');
          Add('and Qty > 0');
          Add('and Barcode <> ''''');
        end;
        Dataform2.StockQuery.Open;
        BarcodePrintingForm.showmodal;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockForm.StockGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if StockOrder <> FieldStore then
      begin
        StockOrder := FieldStore;
        StockOpen;
      end
      else
      begin
        StockOrder := FieldStore + ' Desc';
        StockOpen;
      end;
end;

procedure TStockForm.JvSpeedButton1Click(Sender: TObject);
begin
        if SaveDialog1.Execute then
        begin
          CSVExport.Filename := SaveDialog1.Filename;
          CSVExport.ExportGrid;
        end;
end;

procedure TStockForm.JvSpeedButton2Click(Sender: TObject);
begin
          PrintBarcode(CheckBox1.Checked);
end;

function TStockForm.LocalBranchTransferQTY(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        with Query1.SQL do begin
          Clear;
          Add('SELECT stocktrnsferitem_db.TCStockNo, Sum(stocktrnsferitem_db.Qty) as TotalQTy');
          Add('FROM stocktrnsferitem_db');
          Add('inner join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
          Add('where stocktrnsfer_db.Closed = "True"');
          Add('and stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('Group By stocktrnsferitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        LocalBranchTransferQTY := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.PerBranchBranchTransferQTY(TCStockNoStr: String;BranchNoInt:integer): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        with Query1.SQL do begin
          Clear;
          Add('SELECT stocktrnsferitem_db.TCStockNo, Sum(stocktrnsferitem_db.Qty) as TotalQTy');
          Add('FROM stocktrnsferitem_db');
          Add('inner join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
          Add('where stocktrnsfer_db.Closed = "True"');
          Add('and stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and stocktrnsfer_db.FromBranch = ' + InttoStr(BranchNoInt));
          Add('Group By stocktrnsferitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        PerBranchBranchTransferQTY := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.LocalPurchasedQTY(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where invoice_db.InvClose = "PurcC"');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and invoice_db.BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        LocalPurchasedQty := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.PerBranchPurchasedQTY(TCStockNoStr: String;BranchNoInt: integer): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where invoice_db.InvClose = "PurcC"');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and invoice_db.BranchNo = ' + InttoStr(BranchNoInt));
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        PerBranchPurchasedQTY := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

procedure TStockForm.RvSystem1BeforePrint(Sender: TObject);
begin
      if StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodetype', '-1')) = True then
      begin
        RvSystem1.BaseReport.SetPaperSize(0,3,1);
      end;
end;

function TStockForm.SoldHqQTY(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC"))');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and invoice_db.BranchNo = 0');
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        SoldHqQty := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.TotalBranchSoldQTY(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC"))');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and not invoice_db.BranchNo = 0');
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        TotalBranchSoldQty := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.GlobalAdjustments(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('select TCStockNoLink as TCStockNo,sum(st_adj_value) as ItemValue from stockadjust_db');
          Add('where TCStockNoLink = "' + TCStockNoStr + '"');
          Add('Group by TCStockNoLink');
        end;
        Query1.Prepare;
        Query1.Open;
        if Query1.Fieldbyname('ItemValue').IsNull then
          GlobalAdjustments := 0
        else
          GlobalAdjustments := Query1.Fieldbyname('ItemValue').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.TotalBranchAdjustments(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('select TCStockNoLink as TCStockNo,sum(st_adj_value) as ItemValue from stockadjust_db');
          Add('where TCStockNoLink = "' + TCStockNoStr + '"');
          Add('and not BranchNo = 0');
          Add('Group by TCStockNoLink');
        end;
        Query1.Prepare;
        Query1.Open;
        if Query1.Fieldbyname('ItemValue').IsNull then
          TotalBranchAdjustments := 0
        else
          TotalBranchAdjustments := Query1.Fieldbyname('ItemValue').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.PerBranchAdjustments(TCStockNoStr: String;BranchNoInt:Integer): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('select TCStockNoLink as TCStockNo,sum(st_adj_value) as ItemValue from stockadjust_db');
          Add('where TCStockNoLink = "' + TCStockNoStr + '"');
          Add('and BranchNo = ' + InttoStr(BranchNoInt));
          Add('Group by TCStockNoLink');
        end;
        Query1.Prepare;
        Query1.Open;
        if Query1.Fieldbyname('ItemValue').IsNull then
          PerBranchAdjustments := 0
        else
          PerBranchAdjustments := Query1.Fieldbyname('ItemValue').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.LocalAdjustments(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('select TCStockNoLink as TCStockNo,sum(st_adj_value) as ItemValue from stockadjust_db');
          Add('where TCStockNoLink = "' + TCStockNoStr + '"');
          Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          Add('Group by TCStockNoLink');
        end;
        Query1.Prepare;
        Query1.Open;
        if Query1.Fieldbyname('ItemValue').IsNull then
          LocalAdjustments := 0
        else
          LocalAdjustments := Query1.Fieldbyname('ItemValue').asFloat;
        Query1.Close;
        Query1.Free;
end;

procedure TStockForm.StockGridDblClick(Sender: TObject);
begin
        EditStockItem();
end;

procedure TStockForm.StockGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
        if not Dataform2.StockTableBranchNo.Value = Dataform2.GlobalTableBranchNo.Value then
        begin
          StockGrid.Canvas.Font.Color := clSkyBlue;
        end;
        StockGrid.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TStockForm.StockGridKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
      EditStockItem();
    end;
end;

procedure TStockForm.CheckBox2Click(Sender: TObject);
begin
      StockOpen;
end;

procedure TStockForm.ClearallHQStock1Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
        if MessageDlg('Are you sure you want to Delete ALL THE STOCK!!!!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          AttentionDStr := '0';
          AttentionTStr := '';
          DataForm2.Query1.Active := False;
          with DataForm2.Query1.SQL do
          begin
            Clear;
            Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
            Add('(' + InttoStr(DatetoIntDate(date)) + ',0,"S","Clear All HQ Stock was Done",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
          end;
          DataForm2.Query1.ExecSQL;
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
                Clear;
                Add('Delete FROM stock_db');
                Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          end;
          DataForm2.Query2.ExecSQL;
          Dataform2.StockTable.Refresh;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockForm.JvBitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TStockForm.JvBitBtn2Click(Sender: TObject);
begin
          CreateStockItem(True);
end;

procedure TStockForm.JvBitBtn3Click(Sender: TObject);
begin
          CreateStockItem(False);
end;

procedure TStockForm.StockOpen();
var
   StockPlace: Integer;
   s: String;
begin
      if Checkbox2.Checked = True then
      begin
        s := '';
      end
      else
      begin
        s := 'where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value);
      end;

      If Dataform2.StockTable.Active = True then
        StockPlace := Dataform2.StockTableNr.Value
      else
        StockPlace := 0;
      Dataform2.StockTable.Close;
      with Dataform2.StockTable.SQL do
      begin
        Clear;
        Add('select * from stock_db');
        Add(s);
        Add('order by ' + StockOrder);
      end;
      Dataform2.StockTable.Open;
      If StockPlace <> 0 then
        Dataform2.StockTable.Locate('Nr', InttoStr(StockPlace),[]);
end;

procedure TStockForm.ImportStock2Click(Sender: TObject);
begin
        Application.CreateForm(TImportForm, ImportForm);
        ImportForm.showmodal;
end;

procedure TStockForm.SearchBtnClick(Sender: TObject);
begin
            if SearchByCombo.ItemIndex = 0 then
            begin
              Dataform2.StockTable.Locate('TCStockNo', SearchEditBox.Text, [loPartialKey, loCaseInsensitive]);
            end;
            if SearchByCombo.ItemIndex = 1 then
            begin
              Dataform2.StockTable.Locate('Description', SearchEditBox.Text, [loPartialKey, loCaseInsensitive]);
            end;
            if SearchByCombo.ItemIndex = 2 then
            begin
              Dataform2.StockTable.Locate('ExtraDescr', SearchEditBox.Text, [loPartialKey, loCaseInsensitive]);
            end;
            if SearchByCombo.ItemIndex = 3 then
            begin
              Dataform2.StockTable.Locate('Barcode', SearchEditBox.Text, [loPartialKey, loCaseInsensitive]);
            end;
            if SearchByCombo.ItemIndex = 4 then
            begin
              Dataform2.StockTable.Locate('ModelNo', SearchEditBox.Text, [loPartialKey, loCaseInsensitive]);
            end;

end;

procedure TStockForm.SearchforStock1Click(Sender: TObject);
begin
          SearchStockBtn.Click;
end;

procedure TStockForm.ShowallInvoicesthathasselectedStockItem1Click(
  Sender: TObject);
begin
        Application.CreateForm(TTempGridForm, TempGridForm);
        Dataform2.Query2.Close;
        with Dataform2.Query2.SQL do
        begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo as `Stock No`, invoice_db.InvNo as `Inv No`, invoiceitem_db.BranchNo as `Branch No`, invoice_db.InvDate as `Inv Date`, invoice_db.InvClose as `Inv Status`,invoiceitem_db.Qty');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
        end;
        Dataform2.Query2.Open;
        Dataform2.Query2Source.Enabled := True;
        TempGridForm.showmodal;
        Dataform2.Query2Source.Enabled := False;
        Dataform2.Query2.Close;
        TempGridForm.Free;
end;

procedure TStockForm.ShowallTransfersthathasaselectedStockItem1Click(
  Sender: TObject);
begin
        Application.CreateForm(TTempGridForm, TempGridForm);
        Dataform2.Query2.Close;
        with Dataform2.Query2.SQL do
        begin
          Clear;
          Add('SELECT stocktrnsferitem_db.TCStockNo as `Stock No`, stocktrnsfer_db.Date, stocktrnsfer_db.ToBranch as `Branch No`, stocktrnsfer_db.Closed, stocktrnsfer_db.Sync,stocktrnsferitem_db.Qty');
          Add('FROM stocktrnsferitem_db left join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
          Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
        end;
        Dataform2.Query2.Open;
        Dataform2.Query2Source.Enabled := True;
        TempGridForm.showmodal;
        Dataform2.Query2Source.Enabled := False;
        Dataform2.Query2.Close;
        TempGridForm.Free;
end;

procedure TStockForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

function TStockForm.StockAtBranch(TCStockNo:String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        with Query1.SQL do begin
          Clear;
          Add('SELECT Sum(stock_db.Qty) as TotalQTy');
          Add('FROM stock_db');
          Add('where not BranchNo = 0');
          Add('and TCStockNo = "' + TCStockNo + '"');
          Add('Group By TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        StockAtBranch := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.QtyStockNotLocalStock(TCStockNo:String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        with Query1.SQL do begin
          Clear;
          Add('SELECT Sum(stock_db.Qty) as TotalQTy');
          Add('FROM stock_db');
          Add('where not BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          Add('and TCStockNo = "' + TCStockNo + '"');
          Add('Group By TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        QtyStockNotLocalStock := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.PerBranchQTY(BranchNo:Integer;TCStockNoStr:String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        with Query1.SQL do begin
          Clear;
          Add('SELECT stocktrnsferitem_db.TCStockNo, Sum(stocktrnsferitem_db.Qty) as TotalQTy');
          Add('FROM stocktrnsferitem_db left join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
          Add('where (stocktrnsfer_db.Closed = "True")');
          Add('and (stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '")');
          Add('and (stocktrnsfer_db.ToBranch = ' + InttoStr(BranchNo) + ')');
          Add('Group By stocktrnsferitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        PerBranchQty := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.PerBranchSoldQTY(TCStockNoStr: String;BranchNoInt:Integer): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC") or (invoice_db.InvClose = "LaybO"))');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and invoice_db.BranchNo = ' + InttoStr(BranchNoInt));
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        PerBranchSoldQty := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.InvoiceCostTotal(Nr,BranchNo:Integer): Currency;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(Self);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT Sum(Round(invoiceitem_db.CostPrice * Qty,2)) as TotalCost');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where invoice_db.Nr = ' + InttoStr(Nr));
          Add('and invoice_db.BranchNo = ' + InttoStr(BranchNo));
          Add('Group By invoice_db.Nr');
        end;
        Query1.Prepare;
        Query1.Open;
        InvoiceCostTotal := Query1.Fieldbyname('TotalCost').asCurrency;
        Query1.Close;
        Query1.Free;
end;

function TStockForm.AvgCostCalc(TCStockNo:String;NoValueCost:Currency):Currency;
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
        end;
        Query1.Prepare;
        Query1.Open;
        if Query1.Fieldbyname('TotalItems').asInteger <> 0 then
          AvgCostCalc := Query1.Fieldbyname('TotalCost').asCurrency / Query1.Fieldbyname('TotalItems').asInteger
        else
          AvgCostCalc := NoValueCost;
        Query1.Close;
        Query1.Free;
end;

procedure TStockForm.EditStockItem();
begin
      Application.CreateForm(TStockEditForm, StockEditForm);
      StockEditForm.showmodal;
      StockEditForm.Free;
end;

procedure TStockForm.CreateStockItem(NonStockItem:Boolean);
begin
        Dataform2.StockTable.Insert;
        DataForm2.StockTable.FieldByName('DateCreated').asInteger := DatetoIntDate(date);
        DataForm2.StockTable.FieldByName('DateChanged').asInteger := DatetoIntDate(date);
        DataForm2.StockTable.FieldByName('Qty').AsFloat := 0;
        DataForm2.StockTable.FieldByName('AlertQty').AsFloat := 1;
        DataForm2.StockTable.FieldByName('CostPrice').AsFloat := 0;
        DataForm2.StockTable.FieldByName('SalesPrice').AsFloat := 0;
        DataForm2.StockTable.FieldByName('TCStockNo').AsString := '';
        Dataform2.StockTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
        Dataform2.StockTablest_created_by.Value := Dataform2.User_dbUserName.Value;
        Dataform2.StockTablest_changed_by.Value := Dataform2.User_dbUserName.Value;
        Dataform2.StockTablest_nontaxitem.Value := 'False';
        if NonStockItem = True then
          DataForm2.StockTable.FieldByName('NonStockItem').AsString := 'True'
        else
          DataForm2.StockTable.FieldByName('NonStockItem').AsString := 'False';
        DataForm2.StockTable.FieldByName('Changed').AsString := 'N';
        Application.CreateForm(TStockEditForm, StockEditForm);
        StockEditForm.showmodal;
        StockEditForm.Free;
end;

procedure TStockForm.PrintBarcode(PrintQty:Boolean);
begin
  if StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodetype', '-1')) = True then
    RvProject1.ProjectFile := Dataform2.ProgramPath + '\Barcode.rav'
  else
    RvProject1.ProjectFile := Dataform2.ProgramPath + '\BarcodeSingle.rav';
  RvProject1.Open;
  RvProject1.SelectReport('Page1',False);
  If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = True then
    RvProject1.SetParam('Barcode1',Uppercase(Dataform2.StockTable.FieldByName('TCStockNo').asString))
  else
    RvProject1.SetParam('Barcode1',Uppercase(Dataform2.StockTable.FieldByName('Barcode').asString));
//  showmessage(RvProject1.GetParam('Barcode1'));
  RvProject1.SetParam('Name',Dataform2.StockTable.FieldByName('Description').asString);
  If StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodeprice', '0')) = True then
    RvProject1.SetParam('Price','')
  else
    RvProject1.SetParam('Price',Floattostrf(DataForm2.StockTable.FieldByName('SalesPrice').asCurrency,ffFixed,17,2));
  If PrintQty = True then
  begin
    if StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodetype', '-1')) = True then
      RvSystem1.SystemPrinter.Copies := StrtoInt(Floattostrf(Dataform2.StockTable.Fieldbyname('Qty').asFloat / 2,ffFixed,17,0))
    else
      RvSystem1.SystemPrinter.Copies := StrtoInt(Floattostrf(Dataform2.StockTable.Fieldbyname('Qty').asFloat,ffFixed,17,0));
  end
  else
    RvSystem1.SystemPrinter.Copies := 1;
  RvProject1.Execute;
  RvProject1.Close;
end;

end.
