unit StockUtils;

interface
  uses SysUtils, DateUtils, Dialogs, Windows, Math, Registry, ShlObj, ActiveX
  ,db,Classes,UtilsUnit,uADCompClient;

procedure AdjustLocalStockQty(AdjustmentType:String;PreviousQty,NewQty:Extended);
function CurrentBranchSoldQTY(TCStockNoStr: String): extended;
procedure OpenStockItemHistory(TCStockNoStr:String;BranchNo:Integer);
Function GetStockItemQtyFromHistory(TCStockNoStr:String;BranchNo:Integer): Extended;
Function SetStockItemQtyFromHistory(Qty:Extended): String;

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

procedure OpenStockItemHistory(TCStockNoStr:String;BranchNo:Integer);
begin
    try
      Dataform2.StockHistoryTable.Close;
      with Dataform2.StockHistoryTable.SQL do
      begin
        Clear;
        Add('select * from');
        Add('(select 1 as orderint, TCStockNoLink as TCStockNo,BranchNo,st_adj_date as ItemDate,st_adj_value as ItemValue,0 as ItemRef,');
        Add('Case st_adj_type when "Adj" then "Adjustment" when "Sync" then "Received from HQ" end as ItemType, cast(SyncHQ as unsigned) as SyncHQ from stockadjust_db');
        Add('where TCStockNoLink = "' + TCStockNoStr + '"');
        Add('and BranchNo = ' + InttoStr(BranchNo));
        Add('union all');
        Add('select 0 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.BranchNo,invoice_db.InvDate as ItemDate,invoiceitem_db.Qty as ItemValue,invoice_db.InvNo as ItemRef,"Purchase Inv" as ItemType, cast(invoice_db.SyncHQ as unsigned) as SyncHQ from invoiceitem_db');
        Add('inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
        Add('where invoiceitem_db.TCStockNo = "' + TCStockNoStr + '" and invoice_db.InvClose = "PurcC"');
        Add('and invoiceitem_db.BranchNo = ' + InttoStr(BranchNo));
        Add('union all');
        Add('select 2 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.BranchNo,invoice_db.InvDate as ItemDate,(invoiceitem_db.Qty*-1) as ItemValue,invoice_db.InvNo as ItemRef,"Invoice" as ItemType, cast(invoice_db.SyncHQ as unsigned) as SyncHQ from invoiceitem_db');
        Add('inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
        Add('where invoiceitem_db.TCStockNo = "' + TCStockNoStr + '" and ((invoice_db.InvClose = "Close") or (invoice_db.InvClose = "LaybC"))');
        Add('and invoiceitem_db.BranchNo = ' + InttoStr(BranchNo));
        Add('union all');
        Add('select 2 as orderint, invoiceitem_db.TCStockNo,invoiceitem_db.BranchNo,invoice_db.InvDate as ItemDate,(invoiceitem_db.Qty*-1) as ItemValue,invoice_db.InvNo as ItemRef,"Open Lay Buy" as ItemType, cast(invoice_db.SyncHQ as unsigned) as SyncHQ');
        Add('from invoiceitem_db');
        Add('inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
        Add('where invoiceitem_db.TCStockNo = "' + TCStockNoStr + '" and (invoice_db.InvClose = "LaybO")');
        Add('and invoiceitem_db.BranchNo = ' + InttoStr(BranchNo));
        Add('union all');
        Add('SELECT 2 as orderint, stocktrnsferitem_db.TCStockNo, stocktrnsfer_db.ToBranch as BranchNo, stocktrnsfer_db.Date as ItemDate, (stocktrnsferitem_db.Qty*-1) as ItemValue,');
        Add('stocktrnsfer_db.Nr as ItemRef,"Branch Transfer" as ItemType, cast(Transfered as unsigned) as SyncHQ FROM stocktrnsferitem_db');
        Add('inner join stocktrnsfer_db on (stocktrnsferitem_db.LinkID = stocktrnsfer_db.Nr)');
        Add('where stocktrnsfer_db.Closed = "True"');
        Add('and stocktrnsferitem_db.TCStockNo = "' + TCStockNoStr + '"');
        Add('and stocktrnsfer_db.FromBranch = ' + InttoStr(BranchNo));
        Add(') a');
        Add('order by ItemDate,OrderInt');
      end;
      Dataform2.StockHistoryTable.Open;
    except
      on E : Exception do
         showmessage(E.Message);
    end;
end;

Function GetStockItemQtyFromHistory(TCStockNoStr:String;BranchNo:Integer): Extended;
var
      CalculatedItemQty: Extended;
begin
      OpenStockItemHistory(TCStockNoStr,BranchNo);
      try
        Dataform2.StockHistoryTable.First;
        CalculatedItemQty := 0;
        while not Dataform2.StockHistoryTable.EOF do
        begin
          if Dataform2.StockHistoryTable.FieldByName('ItemType').AsString <> 'Open Lay Buy' then
          begin
            CalculatedItemQty := CalculatedItemQty + Dataform2.StockHistoryTable.FieldByName('ItemValue').AsExtended;
          end;
          Dataform2.StockHistoryTable.Next;
        end;
        GetStockItemQtyFromHistory := CalculatedItemQty;
        Dataform2.StockHistoryTable.Close;
      finally
      end;
end;

Function SetStockItemQtyFromHistory(Qty:Extended): String;
begin
     if DataForm2.StockTable.Active then
     begin
       DataForm2.StockTable.Edit;
       DataForm2.StockTable.FieldByName('Qty').asFloat := Qty;
       DataForm2.StockTable.Post;
     end
     else
     begin
       SetStockItemQtyFromHistory := 'Stock table not active';
     end;
end;

end.
