unit StockUtils;

interface
  uses SysUtils, DateUtils, Dialogs, Windows, Math, Registry, ShlObj, ActiveX
  ,db,Classes,UtilsUnit,uADCompClient;

procedure AdjustLocalStockQty(AdjustmentType:String;PreviousQty,NewQty:Extended);
function CurrentBranchSoldQTY(TCStockNoStr: String): extended;


implementation
      uses Datafrm2;

procedure AdjustLocalStockQty(AdjustmentType:String;PreviousQty,NewQty:Extended);
var
      ex:extended;
      Query1: TADQuery;
begin
              ex := NewQty - PreviousQty;
              Query1 := TADQuery.Create(nil);   //Dataform.Query1
              Query1.Connection := Dataform2.ADConnection;
              Dataform2.StockTable.Edit;
              Dataform2.StockTableQty.Value := Dataform2.StockTableQty.Value + ex;
              Dataform2.StockTable.Post;
              with Query1.SQL do
              begin
                Clear;
                Add('insert into stockadjust_db (TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type,BranchNo) Values');
                Add('("' + Dataform2.StockTableTCStockNo.Value + '","' + Dataform2.User_dbUserName.Value + '",' + InttoStr(DatetoIntDate(date)) + ',' + floattostr(ex) + ',"' + AdjustmentType + '",' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ')');
              end;
              Query1.ExecSQL;
              Query1.Close;
              Query1.Free;
end;

function CurrentBranchSoldQTY(TCStockNoStr: String): extended;
var
  Query1: TADQuery;
begin
        Query1 := TADQuery.Create(nil);
        Query1.Connection := Dataform2.ADConnection;
        Query1.Close;
        with Query1.SQL do begin
          Clear;
          Add('SELECT invoiceitem_db.TCStockNo, Sum(invoiceitem_db.Qty) as TotalQTy');
          Add('FROM invoiceitem_db left join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
          Add('where ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC"))');
          Add('and invoiceitem_db.TCStockNo = "' + TCStockNoStr + '"');
          Add('and invoice_db.BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          Add('Group By invoiceitem_db.TCStockNo');
        end;
        Query1.Prepare;
        Query1.Open;
        CurrentBranchSoldQTY := Query1.Fieldbyname('TotalQty').asFloat;
        Query1.Close;
        Query1.Free;
end;


end.
