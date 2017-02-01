unit Listsmnu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Menus, JvBaseDlg, JvProgressDialog, JvExButtons, JvBitBtn,
  UtilsUnit, DateUtils, uADCompClient, StockUtils;


type
  TListsMenu = class(TForm)
    BitBtn1: TBitBtn;
    SyncStockwithHQ: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    SyncTransactionswithHQButton: TJvBitBtn;
    JvProgressDialog1: TJvProgressDialog;
    MainMenu1: TMainMenu;
    ExtraRuns1: TMenuItem;
    estWhichInvoicesdidntgotoHQ1: TMenuItem;
    FixBranchStockQtys: TMenuItem;
    RemoveallopenInvoices: TMenuItem;
    MarkallBranchtransfersasnottransfered1: TMenuItem;
    SpecialLayBuyFix1: TMenuItem;
    OneTimeFixes1: TMenuItem;
    JvBitBtn3: TJvBitBtn;
    RemoveallopenPurchaseInvoices1: TMenuItem;
    OpenallpurchaseInvoices1: TMenuItem;
    SpecialRequisitionFix1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    LaybVFix1: TMenuItem;
    JvBitBtn9: TJvBitBtn;
    MakeHQBranchstockthesameasLocalstock1: TMenuItem;
    JvBitBtn10: TJvBitBtn;
    StockTakeBtn: TJvBitBtn;
    SpecialcreateHQpurcinvwithlocalstockqty1: TMenuItem;
    SpecialcreateHQStockPurchinvandStockTransferwithStocktake1: TMenuItem;
    DeleteOldBranch21: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure estWhichInvoicesdidntgotoHQ1Click(Sender: TObject);
    procedure FixBranchStockQtysClick(Sender: TObject);
    procedure MarkallBranchtransfersasnottransfered1Click(Sender: TObject);
    procedure SpecialLayBuyFix1Click(Sender: TObject);
    procedure SyncStockwithHQClick(Sender: TObject);
    procedure SyncTransactionswithHQButtonClick(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure RemoveallopenInvoicesClick(Sender: TObject);
    procedure RemoveallopenPurchaseInvoices1Click(Sender: TObject);
    procedure OpenallpurchaseInvoices1Click(Sender: TObject);
    procedure SpecialRequisitionFix1Click(Sender: TObject);
    procedure LaybVFix1Click(Sender: TObject);
    procedure JvBitBtn9Click(Sender: TObject);
    procedure MakeHQBranchstockthesameasLocalstock1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvBitBtn10Click(Sender: TObject);
    procedure StockTakeBtnClick(Sender: TObject);
    procedure SpecialcreateHQpurcinvwithlocalstockqty1Click(Sender: TObject);
    procedure SpecialcreateHQStockPurchinvandStockTransferwithStocktake1Click(
      Sender: TObject);
    procedure DeleteOldBranch21Click(Sender: TObject);
  private
    function FindTransferedStockfromBranch(TCStockNoStr,StockNoStr: String): Extended;
    procedure TestforHQInvReturning;
    procedure WriteLocalInv;
    procedure TestLocalStockandCreate;
    procedure UpdatetoHQGRN;
    procedure FixSyncStockAdjustments(TCStockNoStr: String);
    function TestHQStockandCreatePurcInv(TCStockNoStr: String): Integer;
    function TestHQStockandCreatePurcInvFromStockTake(
      TCStockNoStr: String): Integer;
    { Private declarations }
  public
    function TestHQStockandCreate(TCStockNoStr: String): Integer;
    procedure WriteHQInv;
    { Public declarations }
  end;

var
  ListsMenu: TListsMenu;
  s: String;
  BranchMainStockNo, PurchInvNo, TransfrNo:Integer;

implementation

uses DataFrm2, ExtractFrm, InvoiceListsFrm,
  CashUpFrm, CashupListFrm, StockFrm, DataFrm, StockReportsFrm, UserFrm, NotesFrm, YearMonthChooseFrm, StockTakeFrm, StockTakeDetailFrm;

{$R *.DFM}

procedure TListsMenu.FormShow(Sender: TObject);
begin
      if DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') = '' then
      begin
        SyncStockwithHQ.Enabled := False;
        SyncTransactionswithHQButton.Enabled := False;
      end;
end;

procedure TListsMenu.JvBitBtn4Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
         Application.CreateForm(TInvoiceListsForm, InvoiceListsForm);
         InvoiceListsForm.showmodal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.JvBitBtn5Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
      begin
        Application.CreateForm(TCashUpForm, CashUpForm);
        CashUpForm.showmodal;
        CashUpForm.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.JvBitBtn6Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
        Application.CreateForm(TCashupListForm, CashupListForm);
        CashupListForm.showmodal;
        CashupListForm.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

function TListsMenu.TestHQStockandCreate(TCStockNoStr: String): Integer;
var
   i: Integer;
   Query1, Query3, LocalQuery1: TADQuery;

Label ReturnHere;
begin
       Query3 := TADQuery.Create(Self);   //Dataform.Query3
       Query3.Connection := Dataform.HQADConnection;
       Query1 := TADQuery.Create(Self);   //Dataform.Query1
       Query1.Connection := Dataform.HQADConnection;
       LocalQuery1 := TADQuery.Create(Self);   //Dataform.Query1
       LocalQuery1.Connection := Dataform2.ADConnection;

       ReturnHere:
       Query3.Close;
       with Query3.SQL do begin
         Clear;
         Add('select Nr, Qty, BranchMainStockNo from stock_db');
         Add('where (TCStockNo = "' + TCStockNoStr + '")');
         Add('and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
       end;
       Query3.Prepare;
       Query3.Open;

       If Query3.recordcount > 1 then
       begin
         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('Delete FROM stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '") and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
         end;
         Query1.ExecSQL;
         goto ReturnHere;
       end;

       If Query3.recordcount = 0 then
       begin
         LocalQuery1.Close;
         with LocalQuery1.SQL do
         begin
           Clear;
           Add('select Description, CostPrice, SalesPrice, Barcode, NonStockItem, Changed, TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr, ModelNo, st_created_by, st_changed_by, st_nontaxitem');
           Add(', DateCreated from stock_db');
           Add('where TCStockNo = "' + TCStockNoStr + '"');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         LocalQuery1.UpdateOptions.ReadOnly := True;
         LocalQuery1.Prepared := True;
         LocalQuery1.Open;

         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('select Nr from stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '")');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         Query1.Open;
         If Query1.Recordcount = 1 then
         begin
           i := Query1.Fieldbyname('Nr').asInteger;
         end
         else
         begin
           i := LocalQuery1.Fieldbyname('BranchMainStockNo').asInteger;
         end;

         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed,');
           Add('TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr,ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
           Add('(''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('Barcode').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('NonStockItem').AsString + ''',''' + LocalQuery1.FieldByName('Changed').AsString + ''',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',' + InttoStr(i));
           Add(',0,' + FloattoStr(LocalQuery1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('StartingQty').AsFloat) + ',''' + LocalQuery1.FieldByName('Group').AsString + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(LocalQuery1.FieldByName('ExtraDescr').AsString) + ''',''' + LocalQuery1.FieldByName('ModelNo').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('st_created_by').AsString + ''',''' + LocalQuery1.FieldByName('st_changed_by').AsString + ''',''' + LocalQuery1.FieldByName('st_nontaxitem').AsString + ''')');
         end;
         Query1.ExecSQL;

         LocalQuery1.Close;
         LocalQuery1.UpdateOptions.ReadOnly := False;
         LocalQuery1.Prepared := False;
         goto ReturnHere;
       end;
       TestHQStockandCreate := Query3.FieldByName('Nr').AsInteger;
       BranchMainStockNo := Query3.FieldByName('BranchMainStockNo').AsInteger;
       Query3.Close;
       Query3.Free;
       Query1.Close;
       Query1.Free;
       LocalQuery1.Close;
       LocalQuery1.Free;
end;

function TListsMenu.TestHQStockandCreatePurcInv(TCStockNoStr: String): Integer;
var
   i: Integer;
   Query1, Query3, LocalQuery1, LocalQuery2: TADQuery;
   CreatedBool: Boolean;

Label ReturnHere;
begin
       Query3 := TADQuery.Create(Self);   //Dataform.Query3
       Query3.Connection := Dataform.HQADConnection;
       Query1 := TADQuery.Create(Self);   //Dataform.Query1
       Query1.Connection := Dataform.HQADConnection;
       LocalQuery1 := TADQuery.Create(Self);   //Dataform.Query1
       LocalQuery1.Connection := Dataform2.ADConnection;
       LocalQuery2 := TADQuery.Create(Self);   //Dataform.Query1
       LocalQuery2.Connection := Dataform2.ADConnection;
       CreatedBool := False;
       ReturnHere:
       Query3.Close;
       with Query3.SQL do begin
         Clear;
         Add('select Nr, Qty, BranchMainStockNo from stock_db');
         Add('where (TCStockNo = "' + TCStockNoStr + '")');
         Add('and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
       end;
       Query3.Prepare;
       Query3.Open;

       If Query3.recordcount > 1 then
       begin
         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('Delete FROM stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '") and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
         end;
         Query1.ExecSQL;
         goto ReturnHere;
       end;

       If Query3.recordcount = 0 then
       begin
         LocalQuery1.Close;
         with LocalQuery1.SQL do
         begin
           Clear;
           Add('select Description, CostPrice, SalesPrice, Barcode, NonStockItem, Changed, TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr, ModelNo,st_created_by,st_changed_by,st_nontaxitem from stock_db');
           Add('where TCStockNo = "' + TCStockNoStr + '"');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         LocalQuery1.UpdateOptions.ReadOnly := True;
         LocalQuery1.Prepared := True;
         LocalQuery1.Open;

         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('select Nr from stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '")');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         Query1.Open;
         If Query1.Recordcount = 1 then
         begin
           i := Query1.Fieldbyname('Nr').asInteger;
           if CreatedBool <> True then
           begin
             Query1.Close;
             with Query1.SQL do
             begin
               Clear;
               Add('update stock_db set Qty = Qty + ' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat));
               Add('WHERE (TCStockNo = "' + TCStockNoStr + '")');
               Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
             end;
             Query1.execsql;
           end;
         end
         else
         begin
           Query1.Close;
           with Query1.SQL do begin
             Clear;
             Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed,');
             Add('TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr,ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
             Add('(''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('Barcode').AsString + '''');
             Add(',''' + LocalQuery1.FieldByName('NonStockItem').AsString + ''',''' + LocalQuery1.FieldByName('Changed').AsString + ''',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',null');
             Add(',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('StartingQty').AsFloat) + ',''' + LocalQuery1.FieldByName('Group').AsString + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(LocalQuery1.FieldByName('ExtraDescr').AsString) + ''',''' + LocalQuery1.FieldByName('ModelNo').AsString + '''');
             Add(',''' + LocalQuery1.FieldByName('st_created_by').AsString + ''',''' + LocalQuery1.FieldByName('st_changed_by').AsString + ''',''' + LocalQuery1.FieldByName('st_nontaxitem').AsString + ''')');
           end;
           Query1.ExecSQL;
           CreatedBool := True;
           goto ReturnHere;
         end;
         Query1.Close;
         with Query1.SQL do
         begin
           Clear;
           Add('insert into invoiceitem_db (Description,Price,Qty,StockNo,LinkID,CostPrice,TCStockNo)');
           Add('Values (''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',' + InttoStr(i) + ',' + InttoStr(PurchInvNo) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''')');
         end;
         Query1.ExecSQL;
         with Query1.SQL do
         begin
           Clear;
           Add('insert into stocktrnsferitem_db (StockNo,Qty,BeforeQty,Description,LinkID,TCStockNo,Transfered)');
           Add('Values (' + inttostr(i) + ',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + InttoStr(TransfrNo) + ',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + inttostr(datetointdate(now)) + ')');
         end;
         Query1.ExecSQL;
         with Query1.SQL do begin
           Clear;
           Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed,');
           Add('TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr,ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
           Add('(''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('Barcode').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('NonStockItem').AsString + ''',''' + LocalQuery1.FieldByName('Changed').AsString + ''',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',' + InttoStr(i));
           Add(',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('StartingQty').AsFloat) + ',''' + LocalQuery1.FieldByName('Group').AsString + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(LocalQuery1.FieldByName('ExtraDescr').AsString) + ''',''' + LocalQuery1.FieldByName('ModelNo').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('st_created_by').AsString + ''',''' + LocalQuery1.FieldByName('st_changed_by').AsString + ''',''' + LocalQuery1.FieldByName('st_nontaxitem').AsString + ''')');
         end;
         Query1.ExecSQL;
         LocalQuery2.Close;
         with LocalQuery2.SQL do
         begin
           Clear;
           Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,BranchNo) Values');
           Add('("' + TCStockNoStr + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',"Sync",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
         end;
         LocalQuery2.ExecSQL;
         LocalQuery1.Close;
         LocalQuery1.UpdateOptions.ReadOnly := False;
         LocalQuery1.Prepared := False;
         goto ReturnHere;
       end;
       TestHQStockandCreatePurcInv := Query3.FieldByName('Nr').AsInteger;
       BranchMainStockNo := Query3.FieldByName('BranchMainStockNo').AsInteger;
       Query3.Close;
       Query3.Free;
       Query1.Close;
       Query1.Free;
       LocalQuery1.Close;
       LocalQuery1.Free;
       LocalQuery2.Close;
       LocalQuery2.Free;
end;

function TListsMenu.TestHQStockandCreatePurcInvFromStockTake(TCStockNoStr: String): Integer;
var
   i: Integer;
   Query1, Query3, LocalQuery1, LocalQuery2: TADQuery;
   CreatedBool: Boolean;

Label ReturnHere;
begin
       Query3 := TADQuery.Create(Self);   //Dataform.Query3
       Query3.Connection := Dataform.HQADConnection;
       Query1 := TADQuery.Create(Self);   //Dataform.Query1
       Query1.Connection := Dataform.HQADConnection;
       LocalQuery1 := TADQuery.Create(Self);   //Dataform.Query1
       LocalQuery1.Connection := Dataform2.ADConnection;
       LocalQuery2 := TADQuery.Create(Self);   //Dataform.Query1
       LocalQuery2.Connection := Dataform2.ADConnection;
       CreatedBool := False;
       ReturnHere:
       Query3.Close;
       with Query3.SQL do begin
         Clear;
         Add('select Nr, Qty, BranchMainStockNo from stock_db');
         Add('where (TCStockNo = "' + TCStockNoStr + '")');
         Add('and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
       end;
       Query3.Prepare;
       Query3.Open;

       If Query3.recordcount > 1 then
       begin
         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('Delete FROM stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '") and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
         end;
         Query1.ExecSQL;
         goto ReturnHere;
       end;

       If Query3.recordcount = 0 then
       begin
         LocalQuery1.Close;
         with LocalQuery1.SQL do
         begin
           Clear;
           Add('select Description, CostPrice, SalesPrice, Barcode, NonStockItem, Changed, TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr, ModelNo,st_created_by,st_changed_by,st_nontaxitem from stock_db');
           Add('where TCStockNo = "' + TCStockNoStr + '"');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         LocalQuery1.UpdateOptions.ReadOnly := True;
         LocalQuery1.Prepared := True;
         LocalQuery1.Open;

         Query1.Close;
         with Query1.SQL do begin
           Clear;
           Add('select Nr from stock_db');
           Add('WHERE (TCStockNo = "' + TCStockNoStr + '")');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         Query1.Open;
         If Query1.Recordcount = 1 then
         begin
           i := Query1.Fieldbyname('Nr').asInteger;
           if CreatedBool <> True then
           begin
             Query1.Close;
             with Query1.SQL do
             begin
               Clear;
               Add('update stock_db set Qty = Qty + ' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat));
               Add('WHERE (TCStockNo = "' + TCStockNoStr + '")');
               Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
             end;
             Query1.execsql;
           end;
         end
         else
         begin
           Query1.Close;
           with Query1.SQL do begin
             Clear;
             Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed,');
             Add('TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr,ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
             Add('(''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('Barcode').AsString + '''');
             Add(',''' + LocalQuery1.FieldByName('NonStockItem').AsString + ''',''' + LocalQuery1.FieldByName('Changed').AsString + ''',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',null');
             Add(',' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('StartingQty').AsFloat) + ',''' + LocalQuery1.FieldByName('Group').AsString + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(LocalQuery1.FieldByName('ExtraDescr').AsString) + ''',''' + LocalQuery1.FieldByName('ModelNo').AsString + '''');
             Add(',''' + LocalQuery1.FieldByName('st_created_by').AsString + ''',''' + LocalQuery1.FieldByName('st_changed_by').AsString + ''',''' + LocalQuery1.FieldByName('st_nontaxitem').AsString + ''')');
           end;
           Query1.ExecSQL;
           CreatedBool := True;
           goto ReturnHere;
         end;
         Query1.Close;
         with Query1.SQL do
         begin
           Clear;
           Add('insert into invoiceitem_db (Description,Price,Qty,StockNo,LinkID,CostPrice,TCStockNo)');
           Add('Values (''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',' + InttoStr(i) + ',' + InttoStr(PurchInvNo) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''')');
         end;
         Query1.ExecSQL;
         with Query1.SQL do
         begin
           Clear;
           Add('insert into stocktrnsferitem_db (StockNo,Qty,BeforeQty,Description,LinkID,TCStockNo)');
           Add('Values (' + inttostr(i) + ',' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat + CurrentBranchSoldQTY(TCStockNoStr)) + ',''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + InttoStr(TransfrNo) + ',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''')');
         end;
         Query1.ExecSQL;
         with Query1.SQL do begin
           Clear;
           Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, Changed,');
           Add('TCStockNo, BranchNo, BranchMainStockNo, Qty, AlertQty, StartingQty, `Group`, SalesPrice2, ExtraDescr,ModelNo,st_created_by,st_changed_by,st_nontaxitem) Values');
           Add('(''' + FixSQLString(LocalQuery1.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(LocalQuery1.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice').AsFloat) + ',''' + LocalQuery1.FieldByName('Barcode').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('NonStockItem').AsString + ''',''' + LocalQuery1.FieldByName('Changed').AsString + ''',''' + LocalQuery1.FieldByName('TCStockNo').AsString + ''',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',' + InttoStr(i));
           Add(',' + FloattoStr(Dataform2.Query4.FieldByName('Qty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(LocalQuery1.FieldByName('StartingQty').AsFloat) + ',''' + LocalQuery1.FieldByName('Group').AsString + ''',' + FloattoStr(LocalQuery1.FieldByName('SalesPrice2').asFloat) + ',''' + FixSQLString(LocalQuery1.FieldByName('ExtraDescr').AsString) + ''',''' + LocalQuery1.FieldByName('ModelNo').AsString + '''');
           Add(',''' + LocalQuery1.FieldByName('st_created_by').AsString + ''',''' + LocalQuery1.FieldByName('st_changed_by').AsString + ''',''' + LocalQuery1.FieldByName('st_nontaxitem').AsString + ''')');
         end;
         Query1.ExecSQL;
         LocalQuery1.Close;
         LocalQuery1.UpdateOptions.ReadOnly := False;
         LocalQuery1.Prepared := False;
         goto ReturnHere;
       end;
       TestHQStockandCreatePurcInvFromStockTake := Query3.FieldByName('Nr').AsInteger;
       BranchMainStockNo := Query3.FieldByName('BranchMainStockNo').AsInteger;
       Query3.Close;
       Query3.Free;
       Query1.Close;
       Query1.Free;
       LocalQuery1.Close;
       LocalQuery1.Free;
       LocalQuery2.Close;
       LocalQuery2.Free;
end;

procedure TListsMenu.estWhichInvoicesdidntgotoHQ1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          try
            ExtractForm.Memo1.clear;
            s := '"Inv No","Description"';
            SendMessage(ExtractForm.Handle,
              FOUT_MESSAGE,
              MY_INDEX,
              Integer(PChar(s)));
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            Dataform.HQADConnection.Open;
            Dataform2.InvoiceTable.Close;
            with Dataform2.InvoiceTable.SQL do
            begin
              Clear;
              Add('select * from invoice_db');
            end;
            Dataform2.InvoiceTable.Open;
            Dataform2.InvoiceTable.DisableControls;
            DataForm2.InvoiceTable.First;
            while not DataForm2.InvoiceTable.EOF do
            begin
              If Dataform2.InvoiceTableSyncHQ.Value <> 0 then
              begin
                Dataform.Query2.Close;
                with DataForm.Query2.SQL do begin
                  Clear;
                  Add('select Nr, SyncHQ, InvNo, BranchNo from invoice_db');
                  Add('where InvNo = ' + InttoStr(Dataform2.InvoiceTableInvNo.Value));
                end;
                Dataform.Query2.Open;
                If Dataform.Query2.RecordCount = 0 then
                begin
                  s := Inttostr(Dataform2.InvoiceTableInvNo.Value) + ',"Invoice not at HQ marked as send!"';
                  SendMessage(ExtractForm.Handle,
                    FOUT_MESSAGE,
                    MY_INDEX,
                    Integer(PChar(s)));
                end
                else
                begin
                  If Dataform.Query2.RecordCount > 1 then
                  begin
                    s := Inttostr(Dataform2.InvoiceTableInvNo.Value) + ',"Multiple Invoices found at HQ!"';
                    SendMessage(ExtractForm.Handle,
                      FOUT_MESSAGE,
                      MY_INDEX,
                      Integer(PChar(s)));
                  end
                  else
                  begin
                    Dataform.Query1.Close;
                    with DataForm.Query1.SQL do begin
                      Clear;
                      Add('select Nr from invoiceitem_db');
                      Add('where LinkID = ' + InttoStr(Dataform.Query2.FieldByName('Nr').AsInteger));
                      Add('and BranchNo = ' + InttoStr(Dataform.Query2.FieldByName('BranchNo').AsInteger));
                    end;
                    Dataform.Query1.Open;
                    Dataform2.Query1.Close;
                    with DataForm2.Query1.SQL do begin
                      Clear;
                      Add('select Nr from invoiceitem_db');
                      Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('Nr').AsInteger));
                      Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').AsInteger));
                    end;
                    Dataform2.Query1.Open;
                    If Dataform.Query1.RecordCount <> Dataform2.Query1.RecordCount then
                    begin
                      s := Inttostr(Dataform2.InvoiceTableInvNo.Value) + ',"Items Count doesn''t match on Invoice HQ!"';
                      SendMessage(ExtractForm.Handle,
                        FOUT_MESSAGE,
                        MY_INDEX,
                        Integer(PChar(s)));
                    end;
                  end;
                end;
              end;
              DataForm2.InvoiceTable.Next;
            end;
            Dataform2.InvoiceTable.EnableControls;
            ExtractForm.SaveDialog.FileName := 'FaultsHQInv.csv';
            if ExtractForm.SaveDialog.Execute then
              ExtractForm.Memo1.Lines.SaveToFile(ExtractForm.SaveDialog.FileName);
            ExtractForm.Memo1.clear;
          except
          begin
            ShowMessage('Fault list didn''t connect try again!');
            Dataform2.InvoiceTable.Close;
            Dataform.Query2.Close;
            Dataform.Query1.Close;
            Dataform2.Query1.Close;
//            DataForm.Connection.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform2.InvoiceTable.Close;
          Dataform.Query2.Close;
          Dataform.Query1.Close;
          Dataform2.Query1.Close;
//          DataForm.Connection.Close;
          Dataform.HQADConnection.Close;
        end
        else
          showmessage('Add Branch Detail in setup!');
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.BitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TListsMenu.FixBranchStockQtysClick(Sender: TObject);
var
      QtyStr: Extended;
      i:Integer;
      Fault:Boolean;
begin
    if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
    begin
      if MessageDlg('Are you sure you want to fix the Branch Stock Qty''s, ARE YOUR INTERNET CONNECTION ACTIVE!', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          try
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            try
              Dataform.HQADConnection.Open;
            except
            begin
              ShowMessage('Unable to connect to HQ, make sure Address is correct');
              Dataform.HQADConnection.Close;
            end;
            raise;
            end;
            Dataform2.StockTable.Close;
            with Dataform2.StockTable.SQL do
            begin
              Clear;
              Add('select * from stock_db');
              Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            end;
            Dataform2.StockTable.Open;
            Dataform2.StockTable.DisableControls;
            DataForm2.StockTable.First;
            JvProgressDialog1.Caption := 'Fix Branch Stock';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.StockTable.RecordCount;
            i := 0;
            JvProgressDialog1.Position := 0;
            Fault := False;
            try
              while not DataForm2.StockTable.EOF do
              begin
                Dataform.HQADConnection.StartTransaction;
                Dataform2.ADConnection.StartTransaction;
                try
                  TestHQStockandCreate(Dataform2.StockTableTCStockNo.Value);
                  FixSyncStockAdjustments(Dataform2.StockTableTCStockNo.Value);
                  QtyStr := StockForm.LocalAdjustments(Dataform2.StockTableTCStockNo.Value);
                  QtyStr := QtyStr - CurrentBranchSoldQTY(Dataform2.StockTableTCStockNo.Value);
                  QtyStr := QtyStr + StockForm.PerBranchPurchasedQTY(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
                  DataForm.Query1.Close;
                  with DataForm.Query1.SQL do begin
                    Clear;
                    Add('Update stock_db set Qty = ' + FloattoStr(QtyStr));
                    Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
                    Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                  end;
                  DataForm.Query1.ExecSQL;
                  DataForm2.Query1.Close;
                  with DataForm2.Query1.SQL do begin
                    Clear;
                    Add('Update stock_db set Qty = ' + FloattoStr(QtyStr));
                    Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
                  end;
                  DataForm2.Query1.ExecSQL;

                  Inc(i);
                  JvProgressDialog1.Position := i;
                  JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                  Application.ProcessMessages;
                  Dataform.HQADConnection.Commit;
                finally
                  if DataForm.HQADConnection.InTransaction then
                  begin
                    Dataform.HQADConnection.Rollback;
                    Dataform2.ADConnection.Rollback;
                    Fault := True;
                  end
                  else
                  begin
                    Dataform2.ADConnection.Commit;
                  end;
                end;
                if Fault = True then
                begin
                  showmessage('Something went wrong try again or contact Support!');
                  break;
                end;
                DataForm2.StockTable.Next;
              end;
              JvProgressDialog1.Hide;
            finally
            end;

            Dataform2.StockTable.EnableControls;
          except
          begin
            ShowMessage('Can''t connect to hq try again!');
            Dataform2.StockTable.Close;
//            DataForm.Connection.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform2.StockTable.Close;
//          DataForm.Connection.Close;
          Dataform.HQADConnection.Close;
        end
        else
          showmessage('You must be a Branch to run this!');
      end;
    end
    else
      showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.DeleteOldBranch21Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Delete all Branch Stock?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('delete from stock_db where not BranchNo is null');
          end;
          Dataform2.Query1.execSQL;
        end;

      end;

end;

procedure TListsMenu.FixSyncStockAdjustments(TCStockNoStr:String);
var
    Query1,Query2,LocalQuery1: TADQuery;
begin
      Query1 := TADQuery.Create(Self);
      Query1.Connection := Dataform.HQADConnection;
      Query2 := TADQuery.Create(Self);
      Query2.Connection := Dataform.HQADConnection;
      LocalQuery1 := TADQuery.Create(Self);
      LocalQuery1.Connection := Dataform2.ADConnection;
      with LocalQuery1.SQL do
      begin
        Clear;
        add('delete from stockadjust_db where TCStockNoLink = "' + TCStockNoStr + '"');
        add('and st_adj_type = "Sync"');
        Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
      end;
      LocalQuery1.ExecSQL;
      with Query1.SQL do
      begin
        Clear;
        add('delete from stockadjust_db where TCStockNoLink = "' + TCStockNoStr + '"');
        add('and st_adj_type = "Sync"');
        Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
      end;
      Query1.ExecSQL;
      with Query1.SQL do begin
        Clear;
        Add('SELECT stocktrnsfer_db.`Date` ,stocktrnsferitem_db.Qty');
        Add('FROM stocktrnsferitem_db');
        Add('left join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
        Add('where stocktrnsfer_db.ToBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        Add('and stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '"');
        Add('and not stocktrnsferitem_db.Transfered is null');
      end;
      Query1.Open;
      if Query1.RecordCount > 0 then
      begin
        try
          while not Query1.EOF do
          begin
            with LocalQuery1.SQL do
            begin
              Clear;
              Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,BranchNo) Values');
              Add('("' + TCStockNoStr + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(Query1.FieldByName('Date').asInteger) + ',' + floattostr(Query1.FieldByName('Qty').asFloat) + ',"Sync",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
            end;
            LocalQuery1.ExecSQL;
            Application.Processmessages;
            Query1.Next;
          end;
        finally
        end;
      end;

      Query1.Close;
      Query1.Free;
      Query2.Close;
      Query2.Free;
      LocalQuery1.Close;
      LocalQuery1.Free;
end;

function TListsMenu.FindTransferedStockfromBranch(TCStockNoStr,StockNoStr:String): Extended;
var
    Query1: TADQuery;
begin
      Query1 := TADQuery.Create(Self);
      Query1.Connection := Dataform.HQADConnection;
      with Query1.SQL do begin
        Clear;
        Add('SELECT Sum(stocktrnsferitem_db.Qty) as TotalQTy');
        Add('FROM stocktrnsferitem_db left join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
        Add('where stocktrnsfer_db.ToBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        Add('and stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '"');
        Add('and not stocktrnsfer_db.Sync is null');
        Add('group by stocktrnsferitem_db.TCStockNo');
      end;
      Query1.Prepare;
      Query1.Open;
      FindTransferedStockfromBranch := Query1.Fieldbyname('TotalQty').asFloat;
      Query1.Close;
      Query1.Free;
end;

procedure TListsMenu.MakeHQBranchstockthesameasLocalstock1Click(
  Sender: TObject);
var
      QtyStr: Extended;
      i:Integer;
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          try
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            Dataform.HQADConnection.Open;
            Dataform2.StockTable.Close;
            with Dataform2.StockTable.SQL do
            begin
              Clear;
              Add('select * from stock_db');
            end;
            Dataform2.StockTable.Open;
            Dataform2.StockTable.DisableControls;
            DataForm2.StockTable.First;
            JvProgressDialog1.Caption := 'Fix Branch Stock at HQ';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.StockTable.RecordCount;
            i := 0;
            JvProgressDialog1.Position := 0;
            Dataform.HQADConnection.StartTransaction;
            Dataform2.ADConnection.StartTransaction;
            try
              while not DataForm2.StockTable.EOF do
              begin
                TestHQStockandCreate(Dataform2.StockTableTCStockNo.Value);

                DataForm.Query1.Close;
                with DataForm.Query1.SQL do begin
                  Clear;
                  Add('Update stock_db set Qty = ' + FloattoStr(Dataform2.StockTableQty.Value));
                  Add('where TCStockNo = "' + Dataform2.StockTableTCStockNo.Value + '"');
                  Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                end;
                DataForm.Query1.ExecSQL;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;
                DataForm2.StockTable.Next;
              end;
              JvProgressDialog1.Hide;
              Dataform.HQADConnection.Commit;
            finally
              if DataForm.HQADConnection.InTransaction then
              begin
                Dataform.HQADConnection.Rollback;
                Dataform2.ADConnection.Rollback;
                showmessage('Something went wrong contact Support!');
              end
              else
              begin
                Dataform2.ADConnection.Commit;
              end;
            end;

            Dataform2.StockTable.EnableControls;
          except
          begin
            ShowMessage('Fix didn''t connect try again!');
            Dataform2.StockTable.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform2.StockTable.Close;
          Dataform.HQADConnection.Close;
        end
        else
          showmessage('Add Branch Detail in setup!');
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.MarkallBranchtransfersasnottransfered1Click(
  Sender: TObject);
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Mark all Branch stock transfers as not transfered! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.Query1.Close;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update stocktrnsfer_db set Sync = null');
      end;
      Dataform2.Query1.ExecSQL;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update stocktrnsfer_db set Closed = "False"');
      end;
      Dataform2.Query1.ExecSQL;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update stocktrnsferitem_db set Transfered = null');
      end;
      Dataform2.Query1.ExecSQL;
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

Procedure TListsMenu.WriteHQInv();
var
           Query1: TADQuery;
begin
           Query1 := TADQuery.Create(Self);   //Dataform.Query1
           Query1.Connection := Dataform.HQADConnection;
           Query1.Close;
           with Query1.SQL do begin
             Clear;
             Add('insert into invoice_db (ClientName, ClientTelW, ClientTelC, ClientAdr1, ClientAdr2, ClientAdr3, ClientEMail, ClientPCode,');
             Add('ClientVatNo, InvDate, InvBy, InvClose, AmmTendered, InvoiceType, GLDebNo, CUSet, InvTotal, ShiftSet, InvNo, SyncHQ,');
             Add('BranchNo, Days30, Days60, Days90, Days120, TermMonths, Premium, RefNo) Values');
             Add('(''' + FixSQLString(DataForm2.InvoiceTableClientName.Value) + ''',''' + DataForm2.InvoiceTableClientTelW.Value + ''',''' + DataForm2.InvoiceTableClientTelC.Value + ''',''' + FixSQLString(DataForm2.InvoiceTableClientAdr1.Value) + ''',''' + FixSQLString(DataForm2.InvoiceTableClientAdr2.Value) + ''',''' + FixSQLString(DataForm2.InvoiceTableClientAdr3.Value) + ''',''' + DataForm2.InvoiceTableClientEMail.Value + ''',''' + DataForm2.InvoiceTableClientPCode.Value + ''',');
             Add('''' + FixSQLString(DataForm2.InvoiceTableClientVatNo.Value) + ''',' + InttoStr(DataForm2.InvoiceTableInvDate.Value) + ',''' + DataForm2.InvoiceTableInvBy.Value + ''',''' + DataForm2.InvoiceTableInvClose.Value + ''',' + FloattoStr(DataForm2.InvoiceTableAmmTendered.Value) + ',''' + DataForm2.InvoiceTableInvoiceType.Value + ''',''' + DataForm2.InvoiceTableGLDebNo.Value + ''',' + InttoStr(DataForm2.InvoiceTableCUSet.Value) + ',' + Floattostr(DataForm2.InvoiceTableInvTotal.Value) + ','''',' + InttoStr(DataForm2.InvoiceTableInvNo.Value) + ',' + InttoStr(DatetoIntDate(Date)) + ',');
             Add(InttoStr(Dataform2.InvoiceTableBranchNo.Value) + ',' + FloattoStr(DataForm2.InvoiceTableDays30.Value) + ',' + FloattoStr(DataForm2.InvoiceTableDays60.Value) + ',' + FloattoStr(DataForm2.InvoiceTableDays90.Value) + ',' + FloattoStr(DataForm2.InvoiceTableDays120.Value) + ',' + InttoStr(DataForm2.InvoiceTableTermMonths.Value) + ',' + FloattoStr(DataForm2.InvoiceTablePremium.Value) + ',''' + DataForm2.InvoiceTableRefNo.Value + ''')');
           end;
           Query1.ExecSQL;
           Query1.Free;
end;

procedure TListsMenu.OpenallpurchaseInvoices1Click(Sender: TObject);
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Are you sure you want to open all Purchase invoices! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.Query1.Close;
//      with DataForm2.Query1.SQL do begin
//        Clear;
//        Add('Update invoice_db set InvNo = 0');
//        Add('where Invclose = ''PurcC''');
//      end;
//      Dataform2.Query1.ExecSQL;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update invoiceitem_db set StockNo = 0');
//        Add('where Invclose = ''PurcC''');
      end;
      Dataform2.Query1.ExecSQL;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update invoice_db set Invclose = ''PurcO''');
        Add('where Invclose = ''PurcC''');
      end;
      Dataform2.Query1.ExecSQL;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Update invoice_db set ShiftSet = ''''');
        Add('where Invclose = ''PurcO''');
      end;
      Dataform2.Query1.ExecSQL;
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.SpecialcreateHQpurcinvwithlocalstockqty1Click(
  Sender: TObject);
var
      QtyStr: Extended;
      i:Integer;
begin
      if MessageDlg('Are you sure you want to Create Stock Items, Purchase order and Closed Stock Transfer for all local stock at HQ! (NOT REVERSABLE)', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then
      begin
        exit;
      end;

      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          try
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            Dataform.HQADConnection.Open;
            Dataform2.StockTable.Close;
            with Dataform2.StockTable.SQL do
            begin
              Clear;
              Add('select * from stock_db');
            end;
            Dataform2.StockTable.Open;
            Dataform2.StockTable.DisableControls;
            DataForm2.StockTable.First;
            JvProgressDialog1.Caption := 'Fix Stock at HQ, Branch and Create Purchase Invoice';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.StockTable.RecordCount;
            i := 0;
            JvProgressDialog1.Position := 0;
            Dataform.HQADConnection.StartTransaction;
            Dataform2.ADConnection.StartTransaction;
            try
              Dataform2.Query1.Close;
              with Dataform2.Query1.SQL do
              begin
                Clear;
                Add('Delete from stockadjust_db');
              end;
              Dataform2.Query1.execSQL;
              with Dataform2.Query1.SQL do
              begin
                Clear;
                Add('update invoice_db set SyncHQ = ' + InttoStr(DatetoIntDate(now)));
                Add('where SyncHQ is null');
                Add('and InvClose in (''Close'',''LaybC'',''LaybO'');');
                Add('update cashup_db set SyncHQ = ' + InttoStr(DatetoIntDate(now)));
                Add('where SyncHQ is null;');
              end;
              Dataform2.Query1.execSQL;
              Dataform.Query1.Close;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('insert into invoice_db (ClientName,InvDate,InvBy,InvClose,InvNo,BranchNo)');
                Add('Values (''' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ''',' + InttoStr(DatetoIntDate(now)) + ',''root'',''PurcC'',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',0)');
              end;
              Dataform.Query1.ExecSQL;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('select Nr from invoice_db');
                Add('where InvNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                add('and BranchNo = 0');
                Add('and InvClose = ''PurcC''');
              end;
              Dataform.Query1.Open;
              PurchInvNo := Dataform.Query1.FieldByName('Nr').asInteger;
              Dataform.Query1.Close;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('insert into stocktrnsfer_db (ToBranch,Date,Sync,Closed)');
                Add('Values (' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',' + InttoStr(DatetoIntDate(now)) + ',' + InttoStr(DatetoIntDate(now)) + ',''True'')');
              end;
              Dataform.Query1.ExecSQL;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('select Nr from stocktrnsfer_db');
                Add('where ToBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                Add('and Date = ' + InttoStr(DatetoIntDate(now)));
              end;
              Dataform.Query1.Open;
              TransfrNo := Dataform.Query1.FieldByName('Nr').asInteger;
              Dataform.Query1.Close;
              while not DataForm2.StockTable.EOF do
              begin
                if Dataform2.StockTableQty.Value > 0 then
                begin
                  TestHQStockandCreatePurcInv(Dataform2.StockTableTCStockNo.Value);
                end
                else
                begin
                  Dataform2.Query1.Close;
                  with Dataform2.Query1.SQL do
                  begin
                    Clear;
                    Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,SyncHQ,BranchNo) Values');
                    Add('("' + Dataform2.StockTableTCStockNo.Value + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(DatetoIntDate(date)) + ',' + FloattoStr(CurrentBranchSoldQTY(Dataform2.StockTableTCStockNo.Value)) + ',"Adj",' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(Dataform2.GlobalTableBranchNo.Value) + ')');
                  end;
                  Dataform2.Query1.ExecSQL;
                end;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;
                DataForm2.StockTable.Next;
              end;
              JvProgressDialog1.Hide;
              Dataform.HQADConnection.Commit;
            finally
              if DataForm.HQADConnection.InTransaction then
              begin
                Dataform.HQADConnection.Rollback;
                Dataform2.ADConnection.Rollback;
                showmessage('Something went wrong contact Support!');
              end
              else
              begin
                Dataform2.ADConnection.Commit;
              end;
            end;

            Dataform2.StockTable.EnableControls;
          except
          begin
            ShowMessage('Fault list didn''t connect try again!');
            Dataform2.StockTable.Close;
//            DataForm.Connection.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform2.StockTable.Close;
//          DataForm.Connection.Close;
          Dataform.HQADConnection.Close;
        end
        else
          showmessage('You must be a Branch to run this!');
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.SpecialcreateHQStockPurchinvandStockTransferwithStocktake1Click(
  Sender: TObject);
var
      QtyStr: Extended;
      i:Integer;
      DateStore: TDatetime;
begin
      if MessageDlg('Are you sure you want to Create Stock Items, Purchase order and Open Stock Transfer for Stocktake at HQ! (NOT REVERSABLE)', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then
      begin
        exit;
      end;

      Application.CreateForm(TStockTakeForm, StockTakeForm);
      StockTakeForm.showmodal;

      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          try
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            Dataform.HQADConnection.Open;
            Dataform.HQADConnection.StartTransaction;
            Dataform2.ADConnection.StartTransaction;
            try
              Dataform2.Query4.Close;
              with Dataform2.Query4.SQL do
              begin
                Clear;
                Add('select * from stocktakedetail');
                Add('where StockTakeID = ' + InttoStr(StockTakeForm.SelectedStockTake));
              end;
              Dataform2.Query4.Open;
              Dataform2.Query4.First;
              JvProgressDialog1.Caption := 'Fix Stock at HQ, Branch and Create Purchase Invoice';
              JvProgressDialog1.Show;
              JvProgressDialog1.Max := Dataform2.Query4.RecordCount;
              i := 0;
              JvProgressDialog1.Position := 0;
              Dataform2.Query4.DisableControls;
              Dataform.Query1.Close;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('insert into invoice_db (ClientName,InvDate,InvBy,InvClose,InvNo,BranchNo)');
                Add('Values (''' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ''',' + InttoStr(DatetoIntDate(now)) + ',''root'',''PurcC'',' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',0)');
              end;
              Dataform.Query1.ExecSQL;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('select Nr from invoice_db');
                Add('where InvNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                add('and BranchNo = 0');
                Add('and InvClose = ''PurcC''');
              end;
              Dataform.Query1.Open;
              PurchInvNo := Dataform.Query1.FieldByName('Nr').asInteger;
              DateStore := now;
              Dataform.Query1.Close;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('insert into stocktrnsfer_db (ToBranch,Date,Closed)');
                Add('Values (' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',' + InttoStr(DatetoIntDate(DateStore)) + ',''True'')');
              end;
              Dataform.Query1.ExecSQL;
              with Dataform.Query1.SQL do
              begin
                Clear;
                Add('select Nr from stocktrnsfer_db');
                Add('where ToBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                Add('and Date = ' + InttoStr(DatetoIntDate(DateStore)));
              end;
              Dataform.Query1.Open;
              TransfrNo := Dataform.Query1.FieldByName('Nr').asInteger;
              Dataform.Query1.Close;
              while not DataForm2.Query4.EOF do
              begin
                if Dataform2.Query4.FieldByName('Qty').Value > 0 then
                begin
                  TestHQStockandCreatePurcInvFromStockTake(Dataform2.Query4.FieldByName('TCStockNo').Value);
                end;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;
                DataForm2.Query4.Next;
              end;
              JvProgressDialog1.Hide;
              Dataform.HQADConnection.Commit;
            finally
              if DataForm.HQADConnection.InTransaction then
              begin
                Dataform.HQADConnection.Rollback;
                Dataform2.ADConnection.Rollback;
                showmessage('Something went wrong contact Support!');
              end
              else
              begin
                Dataform2.ADConnection.Commit;
              end;
            end;

            Dataform2.Query4.EnableControls;
          except
          begin
            ShowMessage('Fault list didn''t connect try again!');
            Dataform2.Query4.Close;
            Dataform2.StockTable.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform2.StockTable.Close;
          Dataform.HQADConnection.Close;
        end
        else
          showmessage('You must be a Branch to run this!');
      end
      else
        showMessage('You don''t have permision to go in here!');
      StockTakeForm.Free;
end;

procedure TListsMenu.SpecialLayBuyFix1Click(Sender: TObject);
var
    i: Integer;
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Are you sure you want to DELETE all open Invoices and Open Purchase orders! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.InvoiceTable.Close;
      with Dataform2.InvoiceTable.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
      end;
      Dataform2.InvoiceTable.Open;
      Dataform2.InvoiceTable.DisableControls;
      Dataform2.InvoiceTable.First;
      JvProgressDialog1.Caption := 'Processing!!';
      JvProgressDialog1.Show;
      JvProgressDialog1.Max := DataForm2.InvoiceTable.RecordCount;
      i := 0;
      JvProgressDialog1.Position := 0;
      while not Dataform2.InvoiceTable.EOF do
      begin
        If (DataForm2.InvoiceTableInvClose.Value = 'LaybC') then
        begin
          Dataform2.Query1.Close;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('select Nr, Date from trans_db');
            Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
            Add('Order by Date');
          end;
          Dataform2.Query1.Open;
          Dataform2.Query1.Last;
          If Dataform2.Query1.FieldByName('Date').asInteger <> Dataform2.InvoiceTableInvDate.Value then
          begin
            Dataform2.InvoiceTable.Edit;
            Dataform2.InvoiceTableInvDate.Value := Dataform2.Query1.FieldByName('Date').asInteger;
            Dataform2.InvoiceTable.Post;
          end;
        end;
        Inc(i);
        JvProgressDialog1.Position := i;
        JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
        Dataform2.InvoiceTable.Next;
      end;
      Dataform2.InvoiceTable.EnableControls;
      Dataform2.InvoiceTable.Close;
      Dataform2.Query1.Close;
      JvProgressDialog1.Hide;
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.SpecialRequisitionFix1Click(Sender: TObject);
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Are you sure you want to Run this fix this is not revursable!', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.Query1.Close;
      with Dataform2.Query1.SQL do
      begin
        Clear;
        Add('update invoice_db set InvClose = "RecqC"');
        Add('where InvClose = "RecqR"');
      end;
      Dataform2.Query1.ExecSQL;
      showmessage('Finished');
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.StockTakeBtnClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
      begin
        Application.CreateForm(TStockTakeForm, StockTakeForm);
        Application.CreateForm(TStockTakeDetailForm, StockTakeDetailForm);
        StockTakeForm.FormFromWhere := 'Normal';
        StockTakeForm.showmodal;
        StockTakeForm.Free;
        StockTakeDetailForm.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.JvBitBtn10Click(Sender: TObject);
var
    i: Integer;
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to do the Debtor Aging run? (This cannot be undone)', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          Application.CreateForm(TYearMonthChooseForm, YearMonthChooseForm);
          YearMonthChooseForm.showmodal;
          Dataform2.ADConnection.StartTransaction;
          try
            Dataform2.TransQuery.Close;
            with Dataform2.TransQuery.SQL do begin
              Clear;
              Add('Select trans_db.* from trans_db');
              Add('left join accounts_db on (trans_db.LinkID = accounts_db.Nr) and (trans_db.BranchNo = accounts_db.BranchNo)');
              Add('where (trans_db.TYear = ' + FloattoStr(YearMonthChooseForm.YearEdit.Value) + ')');
              Add('and (trans_db.TMonth = ' + FloattoStr(YearMonthChooseForm.MonthEdit.Value) + ')');
              Add('and (trans_db.TransType = "A")');
              Add('and (accounts_db.AccType = 1)');
            end;
            DataForm2.TransQuery.Open;
            if DataForm2.TransQuery.RecordCount > 0 then
            begin
              showmessage('There is already statements for this run, choose another year and month!');
              exit;
            end;
            Dataform2.TransQuery.Close;
            Dataform2.AccountsTable.Close;
            with Dataform2.AccountsTable.SQL do
            begin
              Clear;
              Add('select * from accounts_db');
              Add('where AccType = 1');
            end;
            Dataform2.AccountsTable.Open;

            JvProgressDialog1.Caption := 'Aging Debtors';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.AccountsTable.RecordCount;
            i := 0;
            Dataform2.AccountsTable.DisableControls;
            DataForm2.AccountsTable.First;
            while not DataForm2.AccountsTable.EOF do
            begin
              Dataform2.AccountsTable.Edit;
              If Dataform2.AccountsTableDays90.Value <> 0 then
              begin
                Dataform2.AccountsTableDays120.Value := Dataform2.AccountsTableDays90.Value + Dataform2.AccountsTableDays120.Value;
                Dataform2.AccountsTableDays90.Value := 0;
              end;
              If Dataform2.AccountsTableDays60.Value <> 0 then
              begin
                Dataform2.AccountsTableDays90.Value := Dataform2.AccountsTableDays60.Value;
                Dataform2.AccountsTableDays60.Value := 0;
              end;
              If Dataform2.AccountsTableDays30.Value <> 0 then
              begin
                Dataform2.AccountsTableDays60.Value := Dataform2.AccountsTableDays30.Value;
                Dataform2.AccountsTableDays30.Value := 0;
              end;
              If Dataform2.AccountsTableCurrent.Value <> 0 then
              begin
                Dataform2.AccountsTableDays30.Value := Dataform2.AccountsTableCurrent.Value;
                Dataform2.AccountsTableCurrent.Value := 0;
              end;

              if Dataform2.AccountsTableTotal.Value <> 0 then
              begin
                Dataform2.AccountsTableBeginTotal.Value := Dataform2.AccountsTableTotal.Value;
                Dataform2.Query1.Close;
                s := '("Begin Total",' + FloattoStr(Dataform2.AccountsTableTotal.Value) + ',' + InttoStr(DatetoIntDate(Date)) + ',' + InttoStr(Dataform2.AccountsTableNr.Value) + ',"' + DataForm2.User_dbUserName.Value + '",' + InttoStr(Dataform2.AccountsTableBranchNo.Value) + ',"Begin Total",' + FloattoStr(YearMonthChooseForm.YearEdit.Value) + ',' + FloattoStr(YearMonthChooseForm.MonthEdit.Value) + ',"A","' + FloattoStr(YearMonthChooseForm.YearEdit.Value) + '/' + FloattoStr(YearMonthChooseForm.MonthEdit.Value) + '")';
                with DataForm2.Query1.SQL do begin
                  Clear;
                  Add('insert into trans_db(Description,Ammount,Date,LinkID,PaymentBy,BranchNo,PaymentType,TYear,TMonth,TransType,RefNo) values ');
                  Add(s);
                end;
                DataForm2.Query1.ExecSQL;
              end;
              Dataform2.AccountsTable.Post;
              Inc(i);
              JvProgressDialog1.Position := i;
              JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
              Application.ProcessMessages;
              DataForm2.AccountsTable.Next;
            end;
            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableDActiveMonth.Value := StrtoInt(FloattoStr(YearMonthChooseForm.YearEdit.Value) + FloattoStr(YearMonthChooseForm.MonthEdit.Value));
            Dataform2.GlobalTable.Post;
            Dataform2.ADConnection.Commit;
          finally
            if DataForm2.ADConnection.InTransaction then
            begin
              Dataform2.ADConnection.Rollback;
              showmessage('Something went wrong everything is changed back as they was.');
            end;
          end;
          JvProgressDialog1.Hide;
          YearMonthChooseForm.Free;
          DataForm2.AccountsTable.Close;
          showmessage('Finished');
        end;
      end;

end;

procedure TListsMenu.SyncStockwithHQClick(Sender: TObject);
var
    i: Integer;
//    TotalSelled, TotalAdded: Extended;
    Fault, ContinueFault: String;
      ex:extended;
      QtyValue:extended;
    StockNoInt:Integer;
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
  begin
    if MessageDlg('Are you sure you want to get Stock, ARE YOUR INTERNET CONNECTION ACTIVE!', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      if (DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') <> '') then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
          ContinueFault := 'True';
          Userform.JvSpeedButton13.Click;
          If UserForm.PingReturn < 5 then
          begin
            if MessageDlg('You have a very slow connection do you want to continue?', mtConfirmation,
               [mbYes, mbNo], 0) = mrNo then
              ContinueFault := 'False';
          end;
          If ContinueFault <> 'False' then
          begin
            try
              Dataform.HQADConnection.Params.Clear;
              Dataform.HQADConnection.Params.Add('DriverID=MySQL');
              Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
              Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
              Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
              Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
              Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
              Dataform.HQADConnection.Open;
            except
            begin
              ShowMessage('Unable to connect to HQ, make sure Address is correct');
              Dataform.HQADConnection.Close;
            end;
            raise;
            end;

            DataForm.StockTable.Close;

            Dataform2.StockTable.Close;
            with Dataform2.StockTable.SQL do
            begin
              Clear;
              Add('select * from stock_db');
              Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            end;
            Dataform2.StockTable.Open;
            Dataform.StockTrnsferTable.Close;
            with Dataform.StockTrnsferTable.SQL do
            begin
              Clear;
              Add('select * from stocktrnsfer_db');
              Add('where ToBranch = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
              Add('and Closed = "True"');
              Add('and Sync is null');
            end;
            Dataform.StockTrnsferTable.Open;

            JvProgressDialog1.Caption := 'Stock from HQ';
            JvProgressDialog1.Show;

            DataForm.StocktrnsferItemTable.DisableControls;
            DataForm.StockTrnsferTable.DisableControls;
            try
              DataForm.StockTrnsferTable.First;
              while not DataForm.StockTrnsferTable.EOF do
              begin
                if Dataform.StockTrnsferTableSync.IsNull then
                begin
                  DataForm.StocktrnsferItemTable.Close;
                  with Dataform.StocktrnsferItemTable.SQL do
                  begin
                    Clear;
                    Add('select * from stocktrnsferitem_db');
                    Add('where LinkID = ' + InttoStr(Dataform.StockTrnsferTableNr.Value));
                  end;
                  DataForm.StocktrnsferItemTable.Open;
                  JvProgressDialog1.Max := Dataform.StockTrnsferItemTable.RecordCount;
                  i := 0;
                  JvProgressDialog1.Position := 0;
                  Fault := 'False';
                  DataForm.StocktrnsferItemTable.First;
                  while not DataForm.StocktrnsferItemTable.EOF do
                  begin
                    if (DataForm.StocktrnsferItemTableTransfered.Value = 0) or (DataForm.StocktrnsferItemTableTransfered.IsNull) then
                    begin
                      Dataform2.ADConnection.StartTransaction;
                      try
                        DataForm.StockTable.Close;
                        Dataform.StockTable.Prepared := False;
                        with Dataform.StockTable.SQL do
                        begin
                          Clear;
                          Add('select * from stock_db');
                          Add('where TCStockNo = "' + DataForm.StocktrnsferItemTable.Fieldbyname('TCStockNo').asString + '"');
                          Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                        end;
                        Dataform.StockTable.Prepared := True;
                        Dataform.StockTable.Open;
                        If Dataform.StockTable.RecordCount = 0 then
                        begin
                            showmessage('Can''t find HQ Stock item, this transfer skipped');
                            Fault := 'True';
                            break;
                        end;
                        if (not Dataform2.StockTable.Locate('TCStockNo', DataForm.StocktrnsferItemTable.Fieldbyname('TCStockNo').asString,[])) and (Fault = 'False') then
                        begin
                          Dataform2.StockTable.Append;
                          DataForm2.StockTable.FieldByName('DateCreated').asInteger := DatetoIntDate(date);
                          DataForm2.StockTable.FieldByName('DateChanged').asInteger := DatetoIntDate(date);
                          DataForm2.StockTable.FieldByName('Qty').Assign(Dataform.StocktrnsferItemTableQty);
                          DataForm2.StockTable.FieldByName('AlertQty').Assign(Dataform.StockTableAlertQty);
                          DataForm2.StockTable.FieldByName('CostPrice').Assign(Dataform.StockTableCostPrice);
                          DataForm2.StockTable.FieldByName('SalesPrice').Assign(Dataform.StockTableSalesPrice);
                          DataForm2.StockTable.FieldByName('SalesPrice2').Assign(Dataform.StockTableSalesPrice2);
                          DataForm2.StockTable.FieldByName('StartingQty').Assign(Dataform.StocktrnsferItemTableQty);
                          DataForm2.StockTable.FieldByName('TCStockNo').Assign(DataForm.StockTableTCStockNo);
                          DataForm2.StockTable.FieldByName('Barcode').Assign(DataForm.StockTableBarcode);
                          DataForm2.StockTable.FieldByName('Description').Assign(DataForm.StockTableDescription);
                          DataForm2.StockTable.FieldByName('ExtraDescr').Assign(DataForm.StockTableExtraDescr);
                          DataForm2.StockTable.FieldByName('AvgCost').Assign(DataForm.StockTableAvgCost);
                          Dataform2.StockTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
                          DataForm2.StockTable.FieldByName('ModelNo').Assign(DataForm.StockTableModelNo);
                          DataForm2.StockTable.FieldByName('NonStockItem').Assign(DataForm.StockTableNonStockItem);
                          DataForm2.StockTable.FieldByName('Changed').AsString := 'N';
                          Dataform2.StockTablest_created_by.Value := Dataform2.User_dbUserName.Value;
                          Dataform2.StockTablest_changed_by.Value := Dataform2.User_dbUserName.Value;
                          Dataform2.StockTablest_nontaxitem.Assign(Dataform.StockTablest_nontaxitem);
                          DataForm2.StockTable.Post;
                          Dataform2.Query1.Close;
                          with Dataform2.Query1.SQL do
                          begin
                            Clear;
                            Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,BranchNo) Values');
                            Add('("' + Dataform2.StockTableTCStockNo.Value + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(DatetoIntDate(date)) + ',' + floattostr(Dataform2.StockTableQty.Value) + ',"Sync",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
                          end;
                          DataForm2.Query1.ExecSQL;
                        end
                        else
                        begin
                          If Fault = 'False' then
                          begin
                            if DataForm2.StockTable.FieldByName('Description').asString <> DataForm.StockTable.FieldByName('Description').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('Description').Assign(DataForm.StockTable.FieldByName('Description'));
                            end;
                            if DataForm2.StockTable.FieldByName('ExtraDescr').asString <> DataForm.StockTable.FieldByName('ExtraDescr').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('ExtraDescr').Assign(DataForm.StockTable.FieldByName('ExtraDescr'));
                            end;
                            if DataForm2.StockTable.FieldByName('ModelNo').asString <> DataForm.StockTable.FieldByName('ModelNo').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('ModelNo').Assign(DataForm.StockTable.FieldByName('ModelNo'));
                            end;

                            if DataForm2.StockTable.FieldByName('Barcode').asString <> DataForm.StockTable.FieldByName('Barcode').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('Barcode').Assign(DataForm.StockTable.FieldByName('Barcode'));
                            end;

                            if Floattostrf(DataForm2.StockTable.FieldByName('CostPrice').asFloat,ffNumber,17,2) <> Floattostrf(DataForm.StockTable.FieldByName('CostPrice').asFloat,ffNumber,17,2) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('CostPrice').Assign(DataForm.StockTable.FieldByName('CostPrice'));
                            end;

                            if Floattostrf(DataForm2.StockTable.FieldByName('AvgCost').asFloat,ffNumber,17,2) <> Floattostrf(DataForm.StockTable.FieldByName('AvgCost').asFloat,ffNumber,17,2) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('AvgCost').Assign(DataForm.StockTable.FieldByName('AvgCost'));
                            end;

                            if Floattostrf(DataForm2.StockTable.FieldByName('SalesPrice').asFloat,ffFixed,17,2) <> Floattostrf(DataForm.StockTable.FieldByName('SalesPrice').asFloat,ffFixed,17,2) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('SalesPrice').Assign(DataForm.StockTable.FieldByName('SalesPrice'));
                            end;
                            if Floattostrf(DataForm2.StockTable.FieldByName('SalesPrice2').asFloat,ffFixed,17,2) <> Floattostrf(DataForm.StockTable.FieldByName('SalesPrice2').asFloat,ffFixed,17,2) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('SalesPrice2').Assign(DataForm.StockTable.FieldByName('SalesPrice2'));
                            end;

                            if Floattostrf(DataForm2.StockTable.FieldByName('AlertQty').asFloat,ffNumber,17,2) <> Floattostrf(DataForm.StockTable.FieldByName('AlertQty').asFloat,ffNumber,17,2) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('AlertQty').Assign(DataForm.StockTable.FieldByName('AlertQty'));
                            end;

                            if (Dataform.StocktrnsferItemTableQty.Value <> 0) then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              QtyValue := DataForm2.StockTable.FieldByName('Qty').asFloat;
                              DataForm2.StockTable.FieldByName('Qty').asFloat := DataForm2.StockTable.FieldByName('Qty').asFloat + Dataform.StocktrnsferItemTableQty.Value;
                              ex := Dataform2.StockTableQty.Value - QtyValue;
                              Dataform2.Query1.Close;
                              with Dataform2.Query1.SQL do
                              begin
                                Clear;
                                Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,BranchNo) Values');
                                Add('("' + Dataform2.StockTableTCStockNo.Value + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(DatetoIntDate(date)) + ',' + floattostr(ex) + ',"Sync",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
                              end;
                              DataForm2.Query1.ExecSQL;
                            end;

                            if DataForm2.StockTable.FieldByName('NonStockItem').asString <> Dataform.StockTable.FieldByName('NonStockItem').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('NonStockItem').asString := DataForm.StockTable.FieldByName('NonStockItem').asString;
                            end;

                            if DataForm2.StockTable.FieldByName('st_nontaxitem').asString <> Dataform.StockTable.FieldByName('st_nontaxitem').asString then
                            begin
                              if (DataForm2.StockTablestrState <> 'Edit') and (DataForm2.StockTablestrState <> 'Insert') then
                                Dataform2.StockTable.Edit;
                              DataForm2.StockTable.FieldByName('st_nontaxitem').asString := DataForm.StockTable.FieldByName('st_nontaxitem').asString;
                            end;

                            if (DataForm2.StockTablestrState = 'Edit') then
                            begin
                              Dataform2.StockTablest_changed_by.Value := Dataform2.User_dbUserName.Value;
                              DataForm2.StockTable.FieldByName('DateChanged').asInteger := DatetoIntDate(date);
                              Dataform2.StockTable.Post;
                            end;
                          end;
                        end;
                        Dataform2.ADConnection.Commit;
                      finally
                        if DataForm2.ADConnection.InTransaction then
                        begin
                          Dataform2.ADConnection.Rollback;
                          Fault := 'True';
                        end
                        else
                        begin
                          Fault := 'False';
                          Dataform.Query3.Close;
                          with DataForm.Query3.SQL do begin
                            Clear;
                            Add('update stocktrnsferitem_db set Transfered = ' + InttoStr(datetoIntDate(date)));
                            Add('where Nr = ' + InttoStr(Dataform.StocktrnsferItemTableNr.Value));
                          end;
                          DataForm.Query3.ExecSQL;
                        end;
                      end;
                    end;

                    If Fault = 'True' then
                      Break;

                    Inc(i);
                    JvProgressDialog1.Position := i;
                    JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                    Application.ProcessMessages;

                    DataForm.StocktrnsferItemTable.Next;
                  end;
                end;

                If Fault = 'False' then
                begin
                  DataForm.StockTrnsferTable.Edit;
                  DataForm.StockTrnsferTableSync.Value := DatetoIntDate(date);
                  DataForm.StockTrnsferTable.Post;
                end
                else
                  showmessage('A stock transfer did not finish, reconnect to internet and run again!');

                DataForm.StockTrnsferTable.Next;
              end;
            finally
            end;
            DataForm.StockTrnsferTable.EnableControls;
            DataForm.StocktrnsferItemTable.EnableControls;
            Dataform.StockTable.Close;
            Dataform.StockTable.Prepared := False;
            Dataform.StockTrnsferTable.Close;
            Dataform.StocktrnsferItemTable.Close;
            DataForm2.StockTable.Close;

            Dataform2.StockAdjustTable.Close;
            with Dataform2.StockAdjustTable.SQL do
            begin
              Clear;
              Add('select * from stockadjust_db');
              Add('where SyncHQ is null');
            end;
            Dataform2.StockAdjustTable.Open;
            JvProgressDialog1.Caption := 'Stock adjustments to HQ';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.StockAdjustTable.RecordCount;
            i := 0;
            JvProgressDialog1.Position := 0;
            Fault := 'False';
            Dataform.query1.Close;
            Dataform2.Query1.Close;
            try
              Dataform2.StockAdjustTable.First;
              while not Dataform2.StockAdjustTable.EOF do
              begin
                Dataform.HQADConnection.StartTransaction;
                try
                  StockNoInt := TestHQStockandCreate(Dataform2.StockAdjustTableTCStockNoLink.Value);
                  if Dataform2.StockAdjustTablest_adj_type.Value <> 'Sync' then
                  begin
                    with DataForm.Query1.SQL do
                    begin
                      Clear;
                      Add('Update stock_db set Qty = Qty + ' + FloattoStr(Dataform2.StockAdjustTablest_adj_value.Value));
                      Add('where Nr = ' + InttoStr(StockNoInt));
                    end;
                    DataForm.Query1.ExecSQL;
                  end;
//                  with DataForm.Query1.SQL do
//                  begin
//                    Clear;
//                    Add('Update stock_db set Qty = Qty + ' + FloattoStr(Dataform2.StockAdjustTablest_adj_value.Value));
//                    Add('where Nr = ' + InttoStr(BranchMainStockNo));
//                  end;
//                  DataForm.Query1.ExecSQL;
                  with Dataform.Query1.SQL do
                  begin
                    Clear;
                    Add('insert into stockadjust_db (TCStockNoLink,BranchNo,st_adj_by,st_adj_date,st_adj_value,st_adj_type) Values');
                    Add('("' + Dataform2.StockAdjustTableTCStockNoLink.Value + '",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ',"' + Dataform2.StockAdjustTablest_adj_by.Value + '",' + InttoStr(Dataform2.StockAdjustTablest_adj_date.Value) + ',' + floattostr(Dataform2.StockAdjustTablest_adj_value.Value) + ',"' + Dataform2.StockAdjustTablest_adj_type.Value + '")');
                  end;
                  DataForm.Query1.ExecSQL;

                  Dataform.HQADConnection.Commit;
                finally
                  if Dataform.HQADConnection.InTransaction then
                  begin
                    Fault := 'True';
                    Dataform.HQADConnection.Rollback;
                  end
                  else
                  begin
                    with DataForm2.Query1.SQL do begin
                      Clear;
                      Add('update stockadjust_db set SyncHQ = ' + InttoStr(datetoIntDate(date)));
                      Add('where st_adj_id = ' + InttoStr(Dataform2.StockAdjustTablest_adj_id.Value));
                    end;
                    DataForm2.Query1.ExecSQL;
                  end;
                end;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;
                Dataform2.StockAdjustTable.Next;
              end;
            finally
            end;

            If Fault = 'True' then
              showmessage('Some Adjustments were not successfully sent to HQ! - rerun to try again');

            Dataform.HQADConnection.Close;
            JvProgressDialog1.Hide;
            showmessage('Finished with Sync');
          end;
        end
        else
          showmessage('No Branch no in setup!');
      end
      else
        showmessage('No HQ Address in setup!');
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.SyncTransactionswithHQButtonClick(Sender: TObject);
var
   ContinueFault: String;
   i, NewCuNo: Integer;
   Fault: Boolean;
begin
  DataForm2.Query3.Close;
  with DataForm2.Query3.SQL do begin
    Clear;
    Add('select CUSet from invoice_db');
    Add('where Invclose = "Close" and CUSet is null');
    Add('and InvTotal <> 0');
    Add('Order by InvNo');
  end;
  DataForm2.Query3.Open;
  If (Dataform2.Query3.RecordCount = 0) then
  begin
    if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
    begin
      if Dataform2.GlobalTableBranchNo.Value <> 0 then
      begin
        ContinueFault := 'True';
        Userform.JvSpeedButton13.Click;
        If UserForm.PingReturn < 5 then
        begin
          if MessageDlg('You have a very slow connection do you want to continue?', mtConfirmation,
             [mbYes, mbNo], 0) = mrNo then
            ContinueFault := 'False';
        end;
        If ContinueFault <> 'False' then
        begin
          if MessageDlg('Are you sure you want to send Invoices, ARE YOUR INTERNET CONNECTION ACTIVE!', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
            Dataform.Query1.Close;
            DataForm2.Query3.Close;
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('select Nr from invoice_db');
              Add('where SyncHQ is null');
              Add('and ((Invclose = "Close") or (Invclose = "LaybC") or (Invclose = "LaybO") or (InvClose = "RecqC") or (InvClose = "GRNC"))');
              Add('Order by InvNo');
            end;
            Dataform2.Query3.Prepared := True;
            DataForm2.Query3.Open;

            try
              Dataform.HQADConnection.Params.Clear;
              Dataform.HQADConnection.Params.Add('DriverID=MySQL');
              Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
              Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
              Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
              Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
              Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
              Dataform.HQADConnection.Open;
            except
            begin
              ShowMessage('Can''t connect to HQ, Please try again later!');
              Dataform.HQADConnection.Close;
            end;
            raise;
            end;

            Dataform2.InvoiceTable.Close;
            with Dataform2.InvoiceTable.SQL do
            begin
              Clear;
              Add('select * from invoice_db');
              Add('where SyncHQ is null');
            end;
            Dataform2.InvoiceTable.Prepared := True;
            Dataform2.InvoiceTable.Open;

            JvProgressDialog1.Caption := 'Invoices';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.Query3.RecordCount;
            i := 0;

            If Dataform2.Query3.RecordCount <> 0 then
            begin
              Dataform2.Query3.DisableControls;
              DataForm2.Query3.First;
              while not DataForm2.Query3.EOF do
              begin
                Dataform.HQADConnection.StartTransaction;
                try
                  Fault := False;
                  if not dataform2.InvoiceTable.Locate('Nr', Inttostr(Dataform2.Query3.Fieldbyname('Nr').asInteger),[]) then
                  begin
                    showmessage('Invoice not found, RUN STOPPED!');
                    Dataform.HQAdConnection.Rollback;
                    Fault := True;
                    break;
                  end;
                  DataForm.Query3.Close;
                  Dataform.Query3.Prepared := False;
                  with DataForm.Query3.SQL do
                  begin
                    Clear;
                    Add('select Nr, BranchNo, InvNo from invoice_db');
                    Add('where InvNo = ' + Inttostr(DataForm2.InvoiceTableInvNo.Value));
                    Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                  end;
                  Dataform.Query3.UpdateOptions.ReadOnly := True;
                  Dataform.Query3.Prepared := True;
                  DataForm.Query3.Open;
                  if DataForm.Query3.RecordCount <> 0 then
                  begin
                    with Dataform.Query1.SQL do
                    begin
                      Clear;
                      Add('Delete FROM invoiceitem_db');
                      Add('where LinkId = ' + InttoStr(Dataform.Query3.FieldByName('Nr').AsInteger));
                      Add('and BranchNo = ' + InttoStr(Dataform.Query3.FieldByName('BranchNo').AsInteger));
                    end;
                    DataForm.Query1.ExecSql;
                    with Dataform.Query1.SQL do begin
                      Clear;
                      Add('Delete FROM invoice_db');
                      Add('where InvNo = ' + InttoStr(Dataform.Query3.FieldByName('InvNo').AsInteger));
                      Add('and BranchNo = ' + InttoStr(Dataform.Query3.FieldByName('BranchNo').AsInteger));
                    end;
                    DataForm.Query1.ExecSql;
                  end;
                  WriteHQInv;

                  Dataform2.InvoiceItemTable.Close;
                  with Dataform2.InvoiceItemTable.SQL do
                  begin
                    Clear;
                    Add('select * from invoiceitem_db');
                    Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
                    Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
                  end;
                  Dataform2.InvoiceItemTable.Open;
                  DataForm2.InvoiceItemTable.First;
                  Dataform.Query2.Close;
                  with DataForm.Query2.SQL do
                  begin
                    Clear;
                    Add('select Nr from invoice_db');
                    Add('where (InvNo = ' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ')');
                    Add('and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
                  end;
                  Dataform.Query2.Prepared := True;
                  Dataform.Query2.UpdateOptions.Readonly := True;
                  Dataform.Query2.Open;
                  If Dataform.Query2.RecordCount = 0 then
                  begin
                    showmessage('Invoice skipped something went wrong ' + InttoStr(Dataform2.InvoiceTableInvNo.Value));
                    Dataform.HQADConnection.Rollback;
                    Dataform2.Query3.Next;
                    Inc(i);
                    JvProgressDialog1.Position := i;
                    JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                    Fault := True;
                    Continue;
                  end;

                  while not DataForm2.InvoiceItemTable.EOF do
                  begin
                    with DataForm.Query1.SQL do
                    begin
                      Clear;
                      Add('insert into invoiceitem_db (Description, Price, Qty, StockNo, LinkId, Discount, CostPrice, TCStockNo, Comment, BranchNo) Values');
                      Add('(''' + FixSQLString(Dataform2.InvoiceItemTableDescription.Value) + ''',' + FloattoStr(Dataform2.InvoiceItemTablePrice.Value) + ',' + FloattoStr(DataForm2.InvoiceItemTableQty.Value) + ',' + InttoStr(TestHQStockandCreate(Dataform2.InvoiceItemTableTCStockNo.Value)) + ',' + InttoStr(DataForm.Query2.FieldByName('Nr').asInteger) + ',' + FloattoStr(Dataform2.InvoiceItemTableDiscount.Value) + ',' + FloattoStr(Dataform2.InvoiceItemTableCostPrice.Value) + ',''' + DataForm2.InvoiceItemTableTCStockNo.Value + ''',''' + DataForm2.InvoiceItemTableComment.Value + ''',' + InttoStr(DataForm2.InvoiceItemTable.FieldByName('BranchNo').asInteger) + ')');
                    end;
                    DataForm.Query1.ExecSQL;

                    with DataForm.Query1.SQL do
                    begin
                      Clear;
                      Add('Update stock_db set Qty = Qty - ' + FloattoStr(Dataform2.InvoiceItemTable.FieldByName('Qty').asFloat));
                      Add('where Nr = ' + InttoStr(TestHQStockandCreate(Dataform2.InvoiceItemTableTCStockNo.Value)));
                    end;
                    DataForm.Query1.ExecSQL;
//                    with DataForm.Query1.SQL do
//                    begin
//                      Clear;
//                      Add('Update stock_db set Qty = Qty - ' + FloattoStr(Dataform2.InvoiceItemTable.FieldByName('Qty').asFloat));
//                      Add('where Nr = ' + InttoStr(BranchMainStockNo));
//                    end;
//                    DataForm.Query1.ExecSQL;

                    Application.ProcessMessages;
                    DataForm2.InvoiceItemTable.Next;
                  end;
                  Dataform.HQADConnection.Commit;
                finally
                  if DataForm.HQADConnection.InTransaction then
                  begin
                    Dataform.HQADConnection.Rollback;
                    showmessage('Inv no: ' + InttoStr(Dataform2.InvoiceTableInvNo.Value) + ' Rerun ''Send to hq'' later or call support');
                  end
                  else
                  begin
                    if Fault = False then
                    begin
                      Dataform2.InvoiceTable.Edit;
                      DataForm2.InvoiceTableSyncHQ.Value := DatetoIntDate(date);
                      DataForm2.InvoiceTable.Post;
                    end;
                  end;
                end;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;

                DataForm2.Query3.Next;
              end;
              Dataform2.Query3.EnableControls;
            end;
            Dataform.Query3.Close;
            Dataform.Query3.Prepared := False;
            Dataform.Query3.UpdateOptions.Readonly := False;
            Dataform.Query2.Close;
            Dataform.Query2.Prepared := False;
            Dataform.Query2.UpdateOptions.Readonly := False;
            Dataform2.InvoiceTable.Close;
            Dataform2.InvoiceTable.Prepared := False;
            Dataform2.InvoiceItemTable.Close;

            DataForm2.Query3.Close;
            Dataform2.Query3.Prepared := False;
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('select Nr from cashup_db');
              Add('where SyncHQ is null');
              Add('and not TimeStamp is null');
            end;
            Dataform2.Query3.Prepared := True;
            DataForm2.Query3.Open;

            If DataForm2.Query3.RecordCount <> 0 then
            begin
              JvProgressDialog1.Caption := 'Cash Up';
              JvProgressDialog1.Position := 0;
              JvProgressDialog1.Max := Dataform2.Query3.RecordCount;
              i := 0;
              DataForm2.CashUpTable.Open;
              Dataform2.Query3.DisableControls;
              DataForm2.Query3.First;
              while not DataForm2.Query3.EOF do
              begin
                Dataform.HQADConnection.StartTransaction;
                try
                  Fault := False;
                  if not Dataform2.CashupTable.Locate('Nr', InttoStr(DataForm2.Query3.FieldbyName('Nr').asInteger),[]) then
                  begin
                    showmessage('Cash up not found, run stopped!');
                    Dataform.HQADConnection.Rollback;
                    Fault := True;
                    break;
                  end;
                  Dataform.Query1.Close;
                  with Dataform.Query1.SQL do
                  begin
                    Clear;
                    Add('insert into cashup_db (Date,User,RealCashtotal,RealChequesTotal,RealCreditCardTotal,RealOtherTotal,CountCashtotal,CountChequesTotal,CountCreditCardTotal,CountOtherTotal,TotalInvoices,TimeStamp,CUClosed) Values');
                    Add('(' + InttoStr(Dataform2.CashUpTableDate.AsInteger) + ',"' + DataForm2.CashUpTableUser.AsString + '",' + floattostr(DataForm2.CashUpTableRealCashTotal.AsFloat) + ',' +
                        floattostr(DataForm2.CashUpTableRealChequesTotal.AsFloat) + ',' + floattostr(Dataform2.CashUpTableRealCreditCardTotal.AsFloat) + ',' + floattostr(Dataform2.CashUpTableRealOtherTotal.AsFloat) + ',' +
                        floattostr(DataForm2.CashUpTableCountCashTotal.AsFloat) + ',' + floattostr(Dataform2.CashUpTableCountChequesTotal.AsFloat) + ',' + floattostr(Dataform2.CashUpTableCountCreditCardTotal.AsFloat) + ',' +
                        floattostr(Dataform2.CashUpTableCountOtherTotal.AsFloat) + ',' + Inttostr(Dataform2.CashUpTableTotalInvoices.AsInteger) + ',"' + Dataform2.CashUpTableTimeStamp.AsString + '","' + Dataform2.CashUpTableCUClosed.AsString + '")');
                  end;
                  Dataform.Query1.ExecSQL;

                  with Dataform.Query1.SQL do
                  begin
                    Clear;
                    Add('select Nr from cashup_db');
                    Add('where User = "' + DataForm2.CashUpTableUser.AsString + '"');
                    Add('and TimeStamp = "' + Dataform2.CashUpTableTimeStamp.AsString + '"');
                    Add('and TotalInvoices = ' + InttoStr(Dataform2.CashUpTableTotalInvoices.AsInteger));
                  end;
                  Dataform.Query1.Open;
                  If Dataform.Query1.RecordCount = 1 then
                    NewCuNo := Dataform.Query1.Fieldbyname('Nr').AsInteger
                  else
                  begin
          //          showmessage(InttoStr(Dataform.Query1.RecordCount));
                    Dataform.HQADConnection.Rollback;
                    Dataform2.Query3.Next;
                    Inc(i);
                    JvProgressDialog1.Position := i;
                    JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                    Fault := True;
                    Continue;
                  end;
                  Dataform.Query1.Close;
                  with DataForm.Query1.SQL do begin
                    Clear;
                    Add('Update invoice_db set CUSet = ' + InttoStr(NewCuNo));
                    Add('where CUSet = ' + InttoStr(Dataform2.CashUptable.FieldByName('Nr').asInteger));
                    Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                  end;
                  DataForm.Query1.ExecSQL;
                  Dataform.HQADConnection.Commit;
                finally
                  if DataForm.HQADConnection.InTransaction then
                  begin
                    Dataform.HQADConnection.Rollback;
                  end
                  else
                  begin
                    if Fault = False then
                    begin
                      DataForm2.CashUpTable.Edit;
                      Dataform2.CashUpTableSyncHQ.Value := DatetoIntDate(date);
                      Dataform2.CashUpTable.Post;
                    end;
                  end;
                end;

                Inc(i);
                JvProgressDialog1.Position := i;
                JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                Application.ProcessMessages;

                DataForm2.Query3.Next;
              end;
              Dataform2.Query3.EnableControls;
              DataForm2.Query3.Close;
              Dataform2.Query3.Prepared := False;
   //             DataForm.CashUpTable.Close;
              DataForm2.CashUpTable.Close;
            end;

              If StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value) = True then
              begin
                DataForm2.TransQuery.Close;
                with DataForm2.TransQuery.SQL do begin
                  Clear;
                  Add('select * from trans_db');
                  Add('where SyncHQ is null');
                end;
                Dataform2.TransQuery.Prepared := True;
                DataForm2.TransQuery.Open;

                If DataForm2.TransQuery.RecordCount <> 0 then
                begin

                  JvProgressDialog1.Caption := 'Lay buy Payments';
                  JvProgressDialog1.Position := 0;
                  JvProgressDialog1.Max := Dataform2.TransQuery.RecordCount;
                  i := 0;

                  Dataform.Query1.Close;
                  DataForm.TransTable.Open;
                  Dataform2.TransQuery.DisableControls;
                  DataForm2.TransQuery.First;
                  while not DataForm2.TransQuery.EOF do
                  begin
                    Dataform.HQADConnection.StartTransaction;
                    try
                      with Dataform.Query1.SQL do
                      begin
                        Clear;
                        Add('insert into trans_db (Description,Ammount,Date,LinkID,PaymentType,PaymentBy,SyncHQ,BranchNo) Values');
                        Add('("' + Dataform2.TransQueryDescription.AsString + '",' + floattostr(Dataform2.TransQueryAmmount.AsFloat) + ',' + inttostr(Dataform2.TransQueryDate.Value) + ',' +
                            InttoStr(Dataform2.TransQueryLinkID.AsInteger) + ',"' + DataForm2.TransQueryPaymentType.AsString + '","' + Dataform2.TransQueryPaymentBy.asString + '",' +
                            InttoStr(DatetoIntDate(date)) + ',' + InttoStr(Dataform2.TransQueryBranchNo.asInteger) + ')');
                      end;
                      Dataform.Query1.ExecSQL;
                      DataForm.Query2.Close;
                      with DataForm.Query2.SQL do begin
                        Clear;
                        Add('SELECT Sum(Ammount) as Total FROM trans_db');
                        Add('where LinkID = ' + InttoStr(Dataform2.TransQueryLinkID.AsInteger));
                        Add('and BranchNo = ' + InttoStr(Dataform2.TransQueryBranchNo.asInteger));
                      end;
                      Dataform.Query2.Open;
                      Dataform2.Query4.Close;
                      with Dataform2.Query4.SQL do
                      begin
                        Clear;
                        Add('select Nr, InvTotal, BranchNo, InvDate from invoice_db');
                        Add('where InvNo = ' + InttoStr(Dataform2.TransQueryLinkID.AsInteger));
                        Add('and BranchNo = ' + InttoStr(Dataform2.TransQueryBranchNo.asInteger));
                      end;
                      Dataform2.Query4.Open;
                      if Dataform.Query2.FieldByName('Total').AsFloat = 0.00 then
                      begin
                        with Dataform.Query1.SQL do
                        begin
                          Clear;
                          Add('Update invoice_db set InvClose = "LaybV"');
                          Add('where InvNo = ' + InttoStr(Dataform2.TransQueryLinkID.AsInteger));
                          Add('and BranchNo = ' + InttoStr(Dataform2.TransQueryBranchNo.asInteger));
                        end;
                        Dataform.Query1.ExecSQL;

                        Dataform2.InvoiceItemTable.Close;
                        with Dataform2.InvoiceItemTable.SQL do
                        begin
                          Clear;
                          Add('select * from invoiceitem_db');
                          Add('where LinkID = ' + InttoStr(Dataform2.Query4.FieldByName('Nr').Value));
                          Add('and BranchNo = ' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').Value));
                        end;
                        Dataform2.InvoiceItemTable.Open;
                        Dataform2.InvoiceItemTable.First;
                        while not DataForm2.InvoiceItemTable.EOF do
                        begin
                          with DataForm.Query1.SQL do
                          begin
                            Clear;
                            Add('Update stock_db set Qty = Qty + ' + FloattoStr(Dataform2.InvoiceItemTable.FieldByName('Qty').asFloat));
                            Add('where Nr = ' + InttoStr(TestHQStockandCreate(Dataform2.InvoiceItemTableTCStockNo.Value)));
                          end;
                          DataForm.Query1.ExecSQL;
                          Dataform2.InvoiceItemTable.Next;
                        end;
                      end;
                      if Dataform2.Query4.FieldByName('InvTotal').AsFloat = Dataform.Query2.FieldByName('Total').AsFloat then
                      begin
                        with Dataform.Query1.SQL do
                        begin
                          Clear;
                          Add('Update invoice_db set InvClose = "LaybC"');
                          Add('where InvNo = ' + InttoStr(Dataform2.TransQueryLinkID.AsInteger));
                          Add('and BranchNo = ' + InttoStr(Dataform2.TransQueryBranchNo.asInteger));
                        end;
                        Dataform.Query1.ExecSQL;
                        with Dataform.Query1.SQL do
                        begin
                          Clear;
                          Add('Update invoice_db set InvDate = ' + InttoStr(Dataform2.Query4.FieldByName('InvDate').asInteger));
                          Add('where InvNo = ' + InttoStr(Dataform2.TransQueryLinkID.AsInteger));
                          Add('and BranchNo = ' + InttoStr(Dataform2.TransQueryBranchNo.asInteger));
                        end;
                        Dataform.Query1.ExecSQL;
                      end;


                      Dataform.HQADConnection.Commit;
                    finally
                      if DataForm.HQADConnection.InTransaction then
                      begin
                        Dataform.HQADConnection.Rollback;
                      end
                      else
                      begin
                        with DataForm2.Query1.SQL do begin
                          Clear;
                          Add('update trans_db set SyncHQ = ' + InttoStr(datetoIntDate(date)));
                          Add('where Nr = ' + InttoStr(Dataform2.TransQueryNr.Value));
                        end;
                        DataForm2.Query1.ExecSQL;
                      end;
                    end;

                    Inc(i);
                    JvProgressDialog1.Position := i;
                    JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                    Application.ProcessMessages;

                    DataForm2.TransQuery.Next;
                  end;
                  Dataform2.TransQuery.EnableControls;
                  Dataform2.TransQuery.Close;
                  Dataform2.TransQuery.Prepared := False;
                  Dataform.Query2.Close;
                  Dataform2.Query4.Close;
                  Dataform2.InvoiceItemTable.Close;
                end;
              end;
              TestforHQInvReturning;
              JvProgressDialog1.Hide;
              Dataform.HQADConnection.Close;
              showmessage('Finished sending Invoices / Transactions!');
          end;
        end;
      end
      else
        showmessage('Add Branch Detail in setup!');
    end
    else
      showMessage('You don''t have permision to go in here!');
  end
  else
    showmessage('Cash up first!');
end;

procedure TListsMenu.JvBitBtn9Click(Sender: TObject);
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    Application.CreateForm(TNotesForm, NotesForm);
    NotesForm.Showmodal;
    NotesForm.Free;
  end;
end;

procedure TListsMenu.LaybVFix1Click(Sender: TObject);
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) then
  begin
    if MessageDlg('Are you sure you want to get Stock, ARE YOUR INTERNET CONNECTION ACTIVE!', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
          Dataform2.InvoiceTable.Close;
          with Dataform2.InvoiceTable.SQL do
          begin
            Clear;
            Add('select * from invoice_db');
            Add('where InvClose=''LaybO''');
          end;
          Dataform2.InvoiceTable.Open;
          Dataform2.InvoiceTable.DisableControls;
          DataForm2.InvoiceTable.First;
          while not DataForm2.InvoiceTable.EOF do
          begin
            DataForm2.Query2.Close;
            with DataForm2.Query2.SQL do begin
              Clear;
              Add('SELECT Sum(Ammount) as Total FROM trans_db');
              Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
              Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
            end;
            Dataform2.Query2.Open;
            if Dataform2.Query2.FieldByName('Total').asFloat = 0.00 then
            begin
              Dataform2.InvoiceTable.Edit;
              Dataform2.InvoiceTableInvClose.Value := 'LaybV';
              Dataform2.InvoiceTable.Post;
            end;
            Dataform2.InvoiceTable.Next;
          end;
          Dataform2.InvoiceTable.EnableConstraints;
          Dataform2.InvoiceTable.Close;
    end;
  end;
end;

procedure TListsMenu.JvBitBtn2Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
         Application.CreateForm(TStockReportsForm, StockReportsForm);
         Dataform2.BranchTable.Open;
         StockReportsForm.showmodal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.TestforHQInvReturning();
var
    i: Integer;
begin
          Dataform.Query3.Close;
          with Dataform.Query3.SQL do
          begin
            Clear;
            Add('select Nr, ClientName, ClientTelW, ClientTelC, ClientAdr1, ClientAdr2, ClientAdr3, ClientEMail, ClientPCode,');
            Add('ClientVatNo, InvDate, InvBy, InvClose, AmmTendered, InvoiceType, GLDebNo, CUSet, InvTotal, ShiftSet, InvNo, SyncHQ,');
            Add('BranchNo, TermMonths, Premium, TestField');
            Add('from invoice_db');
            Add('where (InvClose = "OrdrC")');
            Add('and SyncHQ is null');
            Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
//            Add('and GLDebNo <> ""');
          end;
          Dataform.Query3.Prepared := True;
          Dataform.Query3.Open;

          JvProgressDialog1.Caption := 'Requisitions';
          JvProgressDialog1.Show;
          JvProgressDialog1.Max := Dataform.Query3.RecordCount;
          i := 0;

          If Dataform.Query3.RecordCount <> 0 then
          begin
            Dataform.Query3.DisableControls;
            DataForm.Query3.First;
            while not DataForm.Query3.EOF do
            begin
              Dataform2.ADConnection.StartTransaction;
              try
                DataForm2.Query3.Close;
                with DataForm2.Query3.SQL do
                begin
                  Clear;
                  Add('select Nr from invoice_db');
                  Add('where InvNo = ' + Inttostr(DataForm.Query3.FieldByName('InvNo').Value));
                  Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                  Add('and InvClose = "GRNO"');
                  Add('and TestField = "' + DataForm.Query3.FieldByName('TestField').AsString + '"');
                end;
                DataForm2.Query3.Open;
                if DataForm2.Query3.RecordCount <> 0 then
                begin
                  Dataform2.Query1.Close;
                  with Dataform2.Query1.SQL do
                  begin
                    Clear;
                    Add('Delete FROM invoiceitem_db');
                    Add('where LinkId = ' + InttoStr(Dataform.Query3.FieldByName('Nr').AsInteger));
                    Add('and BranchNo = ' + InttoStr(Dataform.Query3.FieldByName('BranchNo').AsInteger));
                  end;
                  DataForm2.Query1.ExecSql;
                  with Dataform2.Query1.SQL do begin
                    Clear;
                    Add('Delete FROM invoice_db');
                    Add('where InvNo = ' + InttoStr(Dataform.Query3.FieldByName('InvNo').AsInteger));
                    Add('and BranchNo = ' + InttoStr(Dataform.Query3.FieldByName('BranchNo').AsInteger));
                  end;
                  DataForm2.Query1.ExecSql;
                end;

                WriteLocalInv;

                Dataform.Query1.Close;
                with Dataform.Query1.SQL do
                begin
                  Clear;
                  Add('select Nr, Description, Price, Qty, StockNo, LinkId, Discount, CostPrice, TCStockNo, Comment from invoiceitem_db');
                  Add('where LinkID = ' + InttoStr(Dataform.Query3.FieldByName('Nr').asInteger));
                  Add('and BranchNo = ' + InttoStr(Dataform.Query3.FieldByName('BranchNo').asInteger));
                end;
                Dataform.Query1.UpdateOptions.Readonly := True;
                Dataform.Query1.Prepared := True;
                Dataform.Query1.Open;

                DataForm.Query1.First;
                Dataform2.Query4.Close;
                with DataForm2.Query4.SQL do begin
                  Clear;
                  Add('select Nr from invoice_db');
                  Add('where (InvNo = ' + InttoStr(DataForm.Query3.FieldByName('InvNo').Value) + ')');
                  Add('and (BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
                  Add('and InvClose = "GRNO"');
                  Add('and TestField = "' + DataForm.Query3.FieldByName('TestField').asString + '"');
                end;
                Dataform2.Query4.Open;
                If Dataform2.Query4.RecordCount = 0 then
                begin
                  showmessage('Invoice skipped something went wrong ' + InttoStr(Dataform.Query3.FieldByName('InvNo').Value));
                  Dataform2.ADConnection.Rollback;
                  Dataform.Query3.Next;
                  Inc(i);
                  JvProgressDialog1.Position := i;
                  JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
                  Continue;
                end;
                while not DataForm.Query1.EOF do
                begin
                  If (not Dataform.Query1.FieldByName('StockNo').IsNull) and (Dataform.Query1.FieldByName('StockNo').AsInteger <> 0) then
                  begin
                    TestLocalStockandCreate;
                    DataForm2.Query2.Close;
                    with DataForm2.Query2.SQL do begin
                      Clear;
                      Add('insert into invoiceitem_db (Description, Price, Qty, StockNo, LinkId, Discount, CostPrice, TCStockNo, Comment, BranchNo) Values');
                      Add('(''' + FixSQLString(Dataform.Query1.FieldByName('Description').AsString) + ''',' + FloattoStr(Dataform.Query1.FieldByName('Price').AsFloat) + ',' + FloattoStr(DataForm.Query1.FieldByName('Qty').AsFloat) + ',' + InttoStr(Dataform2.Query3.Fieldbyname('Nr').asInteger) + ',' + InttoStr(DataForm2.Query4.FieldByName('Nr').asInteger) + ',' + FloattoStr(Dataform.Query1.FieldByName('Discount').AsFloat) + ',' + FloattoStr(Dataform.Query1.FieldByName('CostPrice').AsFloat) + ',''' + DataForm.Query1.FieldByName('TCStockNo').AsString + ''',''' + DataForm.Query1.FieldByName('Comment').AsString + ''',' + InttoStr(Dataform.Query1.FieldByName('BranchNo').asInteger) + ')');
                    end;
                    DataForm2.Query2.ExecSQL;
                  end
                  else
                  begin
                    DataForm2.Query2.Close;
                    with DataForm2.Query2.SQL do begin
                      Clear;
                      Add('insert into invoiceitem_db (Description, Price, Qty, LinkId, Discount, CostPrice, TCStockNo, Comment, BranchNo) Values');
                      Add('(''' + FixSQLString(Dataform.Query1.FieldByName('Description').AsString) + ''',' + FloattoStr(Dataform.Query1.FieldByName('Price').AsFloat) + ',' + FloattoStr(DataForm.Query1.FieldByName('Qty').AsFloat) + ',' + InttoStr(DataForm2.Query4.FieldByName('Nr').asInteger) + ',' + FloattoStr(Dataform.Query1.FieldByName('Discount').AsFloat) + ',' + FloattoStr(Dataform.Query1.FieldByName('CostPrice').AsFloat) + ',''' + DataForm.Query1.FieldByName('TCStockNo').AsString + ''',''' + DataForm.Query1.FieldByName('Comment').AsString + ''',' + InttoStr(Dataform.Query1.FieldByName('BranchNo').asInteger) + ')');
                    end;
                    DataForm2.Query2.ExecSQL;
                  end;

                  Application.ProcessMessages;
                  DataForm.Query1.Next;
                end;
                Dataform2.ADConnection.Commit;
              finally
                if DataForm2.ADConnection.InTransaction then
                begin
                  Dataform2.ADConnection.Rollback;
                  showmessage('Inv no: ' + InttoStr(Dataform.Query3.FieldbyName('InvNo').AsInteger) + ' Rerun ''Send to hq'' later or call support');
                end
                else
                begin
                  Dataform.Query3.Edit;
                  DataForm.Query3.FieldByName('SyncHQ').Value := DatetoIntDate(date);
                  DataForm.Query3.Post;
                end;
              end;

              Inc(i);
              JvProgressDialog1.Position := i;
              JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
              Application.ProcessMessages;

              DataForm.Query3.Next;
            end;
            Dataform.Query3.EnableControls;

            Dataform.Query1.Close;
            Dataform.Query1.UpdateOptions.Readonly := False;
            Dataform.Query3.Close;
            Dataform2.Query4.Close;
            DataForm2.Query3.Close;
          end;
end;

Procedure TListsMenu.WriteLocalInv();
begin
           DataForm2.Query3.Close;
           with DataForm2.Query3.SQL do begin
             Clear;
             Add('insert into invoice_db (ClientName, ClientTelW, ClientTelC, ClientAdr1, ClientAdr2, ClientAdr3, ClientEMail, ClientPCode,');
             Add('ClientVatNo, InvDate, InvBy, InvClose, AmmTendered, InvoiceType, GLDebNo, CUSet, InvTotal, ShiftSet, InvNo,');
             Add('BranchNo, TermMonths, Premium, TestField) Values');
             Add('(''' + FixSQLString(DataForm.Query3.FieldByName('ClientName').AsString) + ''',''' + DataForm.Query3.FieldByName('ClientTelW').AsString + ''',''' + DataForm.Query3.FieldByName('ClientTelC').AsString + ''',''' + FixSQLString(DataForm.Query3.FieldByName('ClientAdr1').AsString) + ''',''' + FixSQLString(DataForm.Query3.FieldByName('ClientAdr2').AsString) + ''',''' + FixSQLString(DataForm.Query3.FieldByName('ClientAdr3').AsString) + ''',''' + DataForm.Query3.FieldByName('ClientEMail').AsString + ''',''' + DataForm.Query3.FieldByName('ClientPCode').AsString + ''',');
             Add('''' + DataForm.Query3.FieldByName('ClientVatNo').AsString + ''',' + InttoStr(DataForm.Query3.FieldByName('InvDate').AsInteger) + ',''' + DataForm.Query3.FieldByName('InvBy').AsString + ''',''GRNO'',' + FloattoStr(DataForm.Query3.FieldByName('AmmTendered').AsFloat) + ',''' + DataForm.Query3.FieldByName('InvoiceType').AsString + ''',''' + DataForm.Query3.FieldByName('GLDebNo').AsString + ''',' + InttoStr(DataForm.Query3.FieldByName('CUSet').asInteger) + ',' + Floattostr(DataForm.Query3.FieldByName('InvTotal').AsFloat) + ','''',' + InttoStr(DataForm.Query3.FieldByName('InvNo').AsInteger) + ',');
             Add(InttoStr(Dataform.Query3.FieldByName('BranchNo').AsInteger) + ',' + InttoStr(DataForm.Query3.FieldByName('TermMonths').asInteger) + ',' + FloattoStr(DataForm.Query3.FieldByName('Premium').asFloat) + ',''' + DataForm.Query3.FieldByName('TestField').AsString + ''')');
           end;
           DataForm2.Query3.ExecSQL;
end;

procedure TListsMenu.TestLocalStockandCreate();
Label ReturnHere;
begin
       ReturnHere:

       DataForm2.Query3.Close;
       with DataForm2.Query3.SQL do begin
         Clear;
         Add('select Nr, Qty from stock_db');
         Add('where (TCStockNo = "' + Dataform.Query1.FieldByName('TCStockNo').Value + '")');
         Add('and (BranchNo = ' + InttoStr(Dataform2.globalTableBranchNo.Value)  + ')');
       end;
       DataForm2.Query3.Open;

       If Dataform2.Query3.recordcount > 1 then
       begin
         DataForm2.Query1.Close;
         with DataForm2.Query1.SQL do begin
           Clear;
           Add('Delete FROM stock_db');
           Add('WHERE (TCStockNo = ''' + Dataform.Query1.FieldByName('TCStockNo').Value + ''') and (BranchNo = ' + InttoStr(Dataform2.globalTableBranchNo.Value)  + ')');
         end;
         DataForm2.Query1.ExecSQL;
         goto ReturnHere;
       end;

       If dataform2.Query3.recordcount = 0 then
       begin
         Dataform.Query2.Close;
         with Dataform.Query2.SQL do
         begin
           Clear;
           Add('select Description, CostPrice, SalesPrice, Barcode, NonStockItem, TCStockNo, AlertQty, StartingQty, `Group`, ExtraDescr, ModelNo from stock_db');
           Add('where TCStockNo = "' + DataForm.Query1.FieldByName('TCStockNo').Value + '"');
           Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
         end;
         Dataform.Query2.UpdateOptions.Readonly := True;
         Dataform.Query2.Prepared := True;
         Dataform.Query2.Open;
         If Dataform.Query2.RecordCount > 0 then
         begin
           DataForm2.Query1.Close;
           with DataForm2.Query1.SQL do begin
             Clear;
             Add('insert into stock_db (Description, DateCreated, DateChanged, CostPrice, SalesPrice, Barcode, NonStockItem, TCStockNo, Qty, AlertQty, StartingQty, `Group`, ExtraDescr, ModelNo,st_created_by,st_changed_by,st_nontaxitem,BranchNo) Values');
             Add('(''' + FixSQLString(Dataform.Query2.FieldByName('Description').AsString) + ''',' + inttoStr(DatetoIntDate(date)) + ',' + inttoStr(DatetoIntDate(date)) + ',' + FloattoStr(Dataform.Query2.FieldByName('CostPrice').AsFloat) + ',' + FloattoStr(DataForm.Query2.FieldByName('SalesPrice').AsFloat) + ',''' + Dataform.Query2.FieldByName('Barcode').AsString + ''',''' + Dataform.Query2.FieldByName('NonStockItem').AsString + ''',''' + Dataform.Query2.FieldByName('TCStockNo').AsString + ''',0,' + FloattoStr(Dataform.Query2.FieldByName('AlertQty').AsFloat) + ',' + FloattoStr(Dataform.Query2.FieldByName('StartingQty').AsFloat));
             Add(',''' + Dataform.Query2.FieldByName('Group').AsString + ''',''' + FixSQLString(Dataform.Query2.FieldByName('ExtraDescr').AsString) + ''',''' + Dataform.Query2.FieldByName('ModelNo').AsString + ''',''' + Dataform.Query2.FieldByName('st_created_by').AsString + ''',''' + Dataform.Query2.FieldByName('st_changed_by').AsString + ''',''' + Dataform.Query2.FieldByName('st_nontaxitem').AsString + ''',' + InttoStr(Dataform2.globaltableBranchNo.Value) + ')');
           end;
           DataForm2.Query1.ExecSQL;
         end;
         Dataform.Query2.Close;
         Dataform.Query2.Prepared := False;
         Dataform.Query2.UpdateOptions.Readonly := False;
         goto ReturnHere;
       end;
end;

procedure TListsMenu.UpdatetoHQGRN();
var
      Query1, Query2: TADQuery;
begin
       Query1 := TADQuery.Create(Self);
       Query1.Connection := Dataform.HQADConnection;
       Query2 := TADQuery.Create(Self);
       Query2.Connection := Dataform.HQADConnection;
       DataForm.Query3.Close;
       Dataform.Query3.Prepared := False;
       with DataForm.Query3.SQL do
       begin
         Clear;
         Add('select Nr from invoice_db');
         Add('where InvNo = ' + Inttostr(DataForm2.InvoiceTableInvNo.Value));
         Add('and BranchNo = ' + InttoStr(DataForm2.InvoiceTableBranchNo.Value));
         Add('and InvClose = "OrdrC"');
         Add('and TestField = "' + DataForm2.InvoiceTableTestField.Value + '"');
       end;
       Dataform.Query3.UpdateOptions.Readonly := True;
       Dataform.Query3.Prepared := True;
       DataForm.Query3.Open;
       if Dataform.Query3.RecordCount = 1 then
       begin

//  Create Purchase invoice from GRN

         with Query1.SQL do
         begin
           Clear;
           Add('insert into invoice_db (ClientName, InvDate, InvBy, InvClose, BranchNo, GLDebNo, InvNo, TestField)');
           Add('Values (''' + FixSQLString(DataForm2.InvoiceTable.FieldByName('ClientName').Value) + ''',' + InttoStr(DataForm2.InvoiceTable.FieldByName('InvDate').Value) + ',''' + Dataform2.User_dbUserName.Value + ''',''PurcO'',' + InttoStr(DataForm2.InvoiceTable.FieldByName('BranchNo').Value) + ',''' + DataForm2.InvoiceTable.FieldByName('GLDebNo').Value + ''',' + InttoStr(DataForm2.InvoiceTable.FieldByName('InvNo').Value) + ',''' + DataForm2.InvoiceTable.FieldByName('TestField').Value + ''')');
         end;
         Query1.ExecSQL;
         with Query1.SQL do
         begin
           Clear;
           Add('select Nr, BranchNo from invoice_db');
           Add('where InvNo = ' + InttoStr(Dataform2.InvoiceTableInvNo.Value));
           Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
           Add('and InvClose = ''PurcO''');
           Add('and TestField = ''' + DataForm2.InvoiceTable.FieldByName('TestField').Value + '''');
         end;
         Query1.Open;
         If Query1.RecordCount = 1 then
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
           DataForm2.PurchaseItemTable.First;
           while not DataForm2.PurchaseItemTable.EOF do
           begin
             Query2.Close;
             with Query2.SQL do
             begin
               Clear;
               Add('insert into invoiceitem_db (Description, CostPrice, Price, Price2, Qty, ExtraDescr, StockNo, TCStockNo, Barcode, ModelNo, LinkID, Discount, BranchNo)');
               Add('Values (''' + FixSQLString(Dataform2.PurchaseItemTableDescription.Value) + ''',' + FloattoStr(Dataform2.PurchaseItemTableCostPrice.Value) + ',' + FloattoStr(Dataform2.PurchaseItemTablePrice.Value) + ',' + FloattoStr(Dataform2.PurchaseItemTablePrice2.Value) + ',' + FloattoStr(DataForm2.PurchaseItemTableQty.Value) + ',''' + FixSQLString(Dataform2.PurchaseItemTableExtraDescr.Value) + ''',' + InttoStr(Dataform2.PurchaseItemTableStockNo.Value) + ',''' + Dataform2.PurchaseItemTableTCStockNo.Value + ''',''' + Dataform2.PurchaseItemTableBarcode.Value + ''',''' + Dataform2.PurchaseItemTableModelNo.Value +''',' + InttoStr(Query1.Fieldbyname('Nr').asInteger) + ',' + FloattoStr(Dataform2.PurchaseItemTableDiscount.Value) + ',' + InttoStr(Dataform2.PurchaseItemTableBranchNo.Value) + ')');
             end;
             Query2.ExecSQL;
             Dataform.Query2.Close;
             with Dataform.Query2.SQL do
             begin
               Clear;
               Add('select Nr from invoiceitem_db');
               Add('where TCStockNo = "' + Dataform2.PurchaseItemTableTCStockNo.Value + '"');
               Add('and LinkID = ' + inttostr(Query1.FieldByName('Nr').asInteger));
               Add('and BranchNo = ' + inttostr(Query1.FieldByName('BranchNo').asInteger));
             end;
             Dataform.Query2.UpdateOptions.Readonly := True;
             Dataform.Query2.Open;
             If (Dataform.Query2.RecordCount = 0) or (Dataform.Query2.RecordCount > 1) then
             begin
               Dataform.Query2.Close;
               with Dataform.Query2.SQL do
               begin
                 Clear;
                 Add('select Nr from invoiceitem_db');
                 Add('where Description = ''' + FixSQLString(Dataform2.PurchaseItemTableDescription.Value) + '''');
                 Add('and LinkID = ' + inttostr(Query1.FieldByName('Nr').asInteger));
                 Add('and BranchNo = ' + inttostr(Query1.FieldByName('BranchNo').asInteger));
               end;
               Dataform.Query2.UpdateOptions.Readonly := True;
               Dataform.Query2.Open;
             end;
             Dataform.Query1.Close;
             with Dataform.Query1.SQL do
             begin
               Clear;
               Add('Update invoiceitem_db set Qty = ' + floattostr((Dataform2.PurchaseItemTableQty.Value + (Dataform2.PurchaseItemTable.FieldByName('Price2').AsFloat - Dataform2.PurchaseItemTableQty.Value))) + ', CostPrice = ' + floattostr(Dataform2.PurchaseItemTableCostPrice.Value) + ',Price2 = 0');
               Add('where Nr = ' + InttoStr(Dataform.Query2.FieldByName('Nr').asInteger));
             end;
             Dataform.Query1.ExecSQL;
             DataForm2.PurchaseItemTable.Next;
           end;
           Dataform2.PurchaseItemTable.Close;
           Dataform2.Query4.Close;
         end;
       end
       else
         showmessage('Something went wrong contact support!');
     Dataform.Query3.Close;
     Dataform.Query3.UpdateOptions.Readonly := False;
     Dataform.Query2.Close;
     Dataform.Query2.UpdateOptions.Readonly := False;
     Query1.Close;
     Query1.Free;
     Query2.Close;
     Query2.Free;
end;

procedure TListsMenu.JvBitBtn3Click(Sender: TObject);
var
      i: Integer;
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to Age all the Lay Buys!', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
            Dataform2.InvoiceTable.Close;
            with Dataform2.InvoiceTable.SQL do
            begin
              Clear;
              Add('select * from invoice_db');
              Add('where InvClose = "LaybO"');
            end;
            Dataform2.InvoiceTable.Open;
            JvProgressDialog1.Caption := 'Aging Lay Buys';
            JvProgressDialog1.Show;
            JvProgressDialog1.Max := Dataform2.InvoiceTable.RecordCount;
            i := 0;
            Dataform2.InvoiceTable.DisableControls;
            DataForm2.InvoiceTable.First;
            while not DataForm2.InvoiceTable.EOF do
            begin
              Dataform2.InvoiceTable.Edit;
              If Dataform2.InvoiceTableDays90.Value > 0 then
              begin
                Dataform2.InvoiceTableDays120.Value := Dataform2.InvoiceTableDays90.Value;
                Dataform2.InvoiceTableDays90.Value := 0;
              end
              else
              begin
                If Dataform2.InvoiceTableDays60.Value > 0 then
                begin
                  Dataform2.InvoiceTableDays90.Value := Dataform2.InvoiceTableDays60.Value;
                  Dataform2.InvoiceTableDays60.Value := 0;
                end
                else
                begin
                  If Dataform2.InvoiceTableDays30.Value > 0 then
                  begin
                    Dataform2.InvoiceTableDays60.Value := Dataform2.InvoiceTableDays30.Value;
                    Dataform2.InvoiceTableDays30.Value := 0;
                  end
                  else
                  begin
                    DataForm2.Query2.Close;
                    with DataForm2.Query2.SQL do begin
                      Clear;
                      Add('SELECT Ammount FROM trans_db');
                      Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('InvNo').asInteger));
                      Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTable.FieldByName('BranchNo').asInteger));
                      Add('and Description = "Deposit"');
                    end;
                    Dataform2.Query2.Open;
                    Dataform2.InvoiceTableDays30.Value := Dataform2.InvoiceTableDays30.Value + (Dataform2.InvoiceTableInvTotal.Value - Dataform2.Query2.FieldByName('Ammount').AsFloat);
                  end;
                end;
              end;
              Dataform2.InvoiceTable.Post;

              Inc(i);
              JvProgressDialog1.Position := i;
              JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
              Application.ProcessMessages;
              DataForm2.InvoiceTable.Next;
            end;
            Dataform2.InvoiceTable.EnableControls;
            Dataform2.InvoiceTable.Close;
            DataForm2.Query2.Close;
            JvProgressDialog1.Hide;
        end;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.RemoveallopenInvoicesClick(Sender: TObject);
var
    i: Integer;
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Are you sure you want to DELETE all open Invoices! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.InvoiceTable.Close;
      with Dataform2.InvoiceTable.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
        Add('where InvClose = "Open"');
      end;
      Dataform2.InvoiceTable.Open;
      Dataform2.InvoiceTable.DisableControls;
      Dataform2.InvoiceTable.First;
      JvProgressDialog1.Caption := 'Processing!!';
      JvProgressDialog1.Show;
      JvProgressDialog1.Max := DataForm2.InvoiceTable.RecordCount;
      i := 0;
      JvProgressDialog1.Position := 0;
      while not Dataform2.InvoiceTable.EOF do
      begin
        If (DataForm2.InvoiceTableInvClose.Value = 'Open') then
        begin
          Dataform2.Query1.Close;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('Delete from invoiceitem_db');
            Add('where LinkId = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
          end;
          Dataform2.Query1.ExecSQL;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('Update invoice_db set ShiftSet = ''Delete''');
            Add('where Nr = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
          end;
          Dataform2.Query1.ExecSQL;
        end;
        Inc(i);
        JvProgressDialog1.Position := i;
        JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
        Application.ProcessMessages;
        Dataform2.InvoiceTable.Next;
      end;
      Dataform2.InvoiceTable.EnableControls;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Delete from invoice_db');
        Add('where Shiftset = ''Delete''');
      end;
      Dataform2.Query1.ExecSQL;
      Dataform2.InvoiceTable.Close;
      JvProgressDialog1.Hide;
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

procedure TListsMenu.RemoveallopenPurchaseInvoices1Click(Sender: TObject);
var
    i: Integer;
begin
  if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
  begin
    if MessageDlg('Are you sure you want to DELETE all Open Purchase orders! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Dataform2.InvoiceTable.Close;
      with Dataform2.InvoiceTable.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
        Add('where InvClose = "PurcO"');
      end;
      Dataform2.InvoiceTable.Open;
      Dataform2.InvoiceTable.DisableControls;
      Dataform2.InvoiceTable.First;
      JvProgressDialog1.Caption := 'Processing!!';
      JvProgressDialog1.Show;
      JvProgressDialog1.Max := DataForm2.InvoiceTable.RecordCount;
      i := 0;
      JvProgressDialog1.Position := 0;
      while not Dataform2.InvoiceTable.EOF do
      begin
        If (DataForm2.InvoiceTableInvClose.Value = 'PurcO') then
        begin
          Dataform2.Query1.Close;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('Delete from invoiceitem_db');
            Add('where LinkId = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
            Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
          end;
          Dataform2.Query1.ExecSQL;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('Update invoice_db set ShiftSet = ''Delete''');
            Add('where Nr = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          end;
          Dataform2.Query1.ExecSQL;
        end;
        Inc(i);
        JvProgressDialog1.Position := i;
        JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(JvProgressDialog1.Max);
        Application.ProcessMessages;
        Dataform2.InvoiceTable.Next;
      end;
      Dataform2.InvoiceTable.EnableControls;
      with DataForm2.Query1.SQL do begin
        Clear;
        Add('Delete from invoice_db');
        Add('where Shiftset = ''Delete''');
      end;
      Dataform2.Query1.ExecSQL;
      Dataform2.InvoiceTable.Close;
      JvProgressDialog1.Hide;
    end;
  end
  else
    showMessage('You don''t have permision to go in here!');
end;

end.
