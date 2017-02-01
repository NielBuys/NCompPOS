unit StockSearchFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, db,
  Mask, Math, UtilsUnit, Menus, JvExButtons, JvBitBtn, JvExStdCtrls, JvEdit,
  JvExDBGrids, JvDBGrid, Registry;

type
  TStockSearchForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    DescriptionSearch: TJvEdit;
    Label1: TLabel;
    Label2: TLabel;
    Barcodesearch: TJvEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label3: TLabel;
    ExtDSearch: TJvEdit;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    JvBitBtn3: TJvBitBtn;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Shortcuts1: TMenuItem;
    DescSearch1: TMenuItem;
    FirstDesc1: TMenuItem;
    Nextdesc1: TMenuItem;
    BarcSearch1: TMenuItem;
    BarcSearch2: TMenuItem;
    FirstBarc1: TMenuItem;
    NextBarc1: TMenuItem;
    ExtraDSearch1: TMenuItem;
    FirstExtD1: TMenuItem;
    NextExtD1: TMenuItem;
    Label5: TLabel;
    CloseForm1: TMenuItem;
    FilterOutOfStockCheck: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure JvDBFindEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SearchBarcode;
    procedure SearchDescription;
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure DescriptionSearchKeyPress(Sender: TObject; var Key: Char);
    procedure BarcodesearchKeyPress(Sender: TObject; var Key: Char);
    procedure ExtDSearchKeyPress(Sender: TObject; var Key: Char);
    procedure DescSearch1Click(Sender: TObject);
    procedure FirstDesc1Click(Sender: TObject);
    procedure Nextdesc1Click(Sender: TObject);
    procedure BarcSearch1Click(Sender: TObject);
    procedure BarcSearch2Click(Sender: TObject);
    procedure FirstBarc1Click(Sender: TObject);
    procedure NextBarc1Click(Sender: TObject);
    procedure ExtraDSearch1Click(Sender: TObject);
    procedure FirstExtD1Click(Sender: TObject);
    procedure NextExtD1Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure CloseForm1Click(Sender: TObject);
    procedure FilterOutOfStockCheckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure SearchExtD;
    procedure StockOpen;
    procedure ResetColor;
    procedure AddInvoiceProduct;
    procedure KeyAction;
    { Private declarations }
  public
    { Public declarations }
    fromwheretmp: String;
    StopStr: String;
    StockOrder: String;
  end;

var
  StockSearchForm: TStockSearchForm;
  Order: String;
  PreviousACol: Integer;
  DoNotClick: Boolean;

implementation
    uses DataFrm2, InvoiceFrm, PurchaseFrm, StockFrm, StockTakeDetailFrm;

{$R *.dfm}

procedure TStockSearchForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//        If fromWhereTmp <> 'Stock' then
//          DataForm2.StockTable.Filtered := False;
end;

procedure TStockSearchForm.FormCreate(Sender: TObject);
begin
      if FileExists(Dataform2.UserDataPath + '\NCompPOS\InvoiceStockSearch') then
        StockSearchForm.JvDBGrid1.Columns.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\InvoiceStockSearch');
      DoNotClick := True;
      try
        FilterOutOfStockCheck.Checked := StrtoBool(GetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS', 'StockSearchHideOutofStock'));
      except
        FilterOutOfStockCheck.Checked := False;
      end;
      DoNotClick := False;
end;

procedure TStockSearchForm.FormDestroy(Sender: TObject);
begin
        if not DirectoryExists(Dataform2.UserDataPath + '\NCompPOS') then
          CreateDir(Dataform2.UserDataPath + '\NCompPOS');
        StockSearchform.JvDBGrid1.Columns.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\InvoiceStockSearch');
        SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','StockSearchHideOutofStock', rdString, BooltoStr(FilterOutOfStockCheck.Checked));
end;

procedure TStockSearchForm.FormShow(Sender: TObject);
begin
        StockSearchForm.Left := 10;
        StockSearchForm.Top := Screen.Height - 520;
        ResetColor();
        If (Order = 'Barcode') or (Order = 'TCStockNo') then
        begin
          If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
          begin
            Order := 'BarCode';
            StockOrder := 'Barcode';
            JvDBGrid1.Columns.Items[1].Color := clInfoBk;
            PreviousACol := 1;
          end
          else
          begin
            Order := 'TCStockNo';
            StockOrder := 'TCStockNo';
            JvDBGrid1.Columns.Items[2].Color := clInfoBk;
            PreviousACol := 2;
          end;
          Barcodesearch.SetFocus;
        end
        else
        begin
          if Order = 'ExtraDescr' then
          begin
            Order := 'ExtraDescr';
            StockOrder := 'ExtraDescr';
            ExtDSearch.SetFocus;
            JvDBGrid1.Columns.Items[3].Color := clInfoBk;
            PreviousACol := 3;
          end
          else
          begin
            Order := 'Description';
            StockOrder := 'Description';
            DescriptionSearch.SetFocus;
            JvDBGrid1.Columns.Items[0].Color := clInfoBk;
            PreviousACol := 0;
          end;
        end;
        StockOpen;
        If (StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = True)
           and (fromwheretmp = 'Invoice')
           and (InvoiceForm.Edit1.Text <> '') then
        begin
          Dataform2.StockSearchQuery.Locate('TCStockNo',InvoiceForm.Edit1.Text,[loPartialKey, loCaseInsensitive])
        end;
        If StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value) = True then
          Label4.Visible := True
        else
          Label4.Visible := False;
        if StrtoBool(Dataform2.GlobalTableNegQty.Value) = true then
          Label5.Visible := True
        else
          Label5.Visible := False;
        If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
        begin
          Label2.Caption := 'Barc. search (F5):';
          Button6.Caption := 'First Barc(F6)';
          Button8.Caption := 'Next Barc (F7)';
        end
        else
        begin
          Label2.Caption := 'Stck No search(F5)';
          Button6.Caption := '1st Stck No(F6)';
          Button8.Caption := 'Nxt Stck No(F7)';
        end;
end;

procedure TStockSearchForm.JvDBGrid1DblClick(Sender: TObject);
begin
          KeyAction();
end;

procedure TStockSearchForm.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      KeyAction();
    end
    else
    begin
      If Key <> #00 then
        DataForm2.StockSearchQuery.Locate(Order, Key, [loPartialKey, loCaseInsensitive]);
    end;
end;

procedure TStockSearchForm.BarcSearch1Click(Sender: TObject);
begin
        JVDbGrid1.SetFocus;
end;

procedure TStockSearchForm.BarcSearch2Click(Sender: TObject);
begin
        BarcodeSearch.SetFocus;
        BarcodeSearch.SelectAll;
end;

procedure TStockSearchForm.Button5Click(Sender: TObject);
begin
      If Order <> 'Description' then
      begin
        Order := 'Description';
        StockOrder := 'Description';
        StockOpen;
        ResetColor;
        JvDBGrid1.Columns.Items[0].Color := clInfoBk;
        PreviousACol := 0;
      end;
      Dataform2.StockSearchQuery.First;
      SearchDescription();
      JvDBGrid1.SetFocus;
end;

procedure TStockSearchForm.JvDBFindEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      JvDBGrid1.SetFocus;
    end;
end;

procedure TStockSearchForm.SearchDescription();
var
  i: Integer;
begin
    DataForm2.StockSearchQuery.DisableControls;
    try
    while not DataForm2.StockSearchQuery.EOF do
      begin
        for i := 0 to (DataForm2.StockSearchQuery.fieldbyname('Description').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockSearchQuery.fieldbyname('Description').asString),i,DescriptionSearch.GetTextLen) = lowercase(DescriptionSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockSearchQuery.Next;
      end;
    finally
    DataForm2.StockSearchQuery.EnableControls;
    end;
    StopStr := 'No';
end;

procedure TStockSearchForm.SearchBarcode();
var
  i: Integer;
begin
  If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
  begin
    DataForm2.StockSearchQuery.DisableControls;
    try
    while not DataForm2.StockSearchQuery.EOF do
      begin
        for i := 0 to (DataForm2.StockSearchQuery.fieldbyname('Barcode').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockSearchQuery.fieldbyname('Barcode').asString),i,BarcodeSearch.GetTextLen) = lowercase(BarcodeSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockSearchQuery.Next;
      end;
    finally
    DataForm2.StockSearchQuery.EnableControls;
    end;
    StopStr := 'No';
  end
  else
  begin
    DataForm2.StockSearchQuery.DisableControls;
    try
    while not DataForm2.StockSearchQuery.EOF do
      begin
        for i := 0 to (DataForm2.StockSearchQuery.fieldbyname('TCStockNo').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockSearchQuery.fieldbyname('TCStockNo').asString),i,BarcodeSearch.GetTextLen) = lowercase(BarcodeSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockSearchQuery.Next;
      end;
    finally
    DataForm2.StockSearchQuery.EnableControls;
    end;
    StopStr := 'No';
  end;
end;

procedure TStockSearchForm.Button6Click(Sender: TObject);
begin
  If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
  begin
    If Order <> 'BarCode' then
    begin
      Order := 'BarCode';
      StockOrder := 'Barcode';
      StockOpen;
      ResetColor;
      JvDBGrid1.Columns.Items[1].Color := clInfoBk;
      PreviousACol := 1;
    end;
  end
  else
  begin
    If Order <> 'TCStockNo' then
    begin
      Order := 'TCStockNo';
      StockOrder := 'TCStockNo';
      StockOpen;
      ResetColor;
      JvDBGrid1.Columns.Items[2].Color := clInfoBk;
      PreviousACol := 2;
    end;
  end;

  Dataform2.StockSearchQuery.First;
  SearchBarcode();
  JvDBGrid1.SetFocus;
end;

procedure TStockSearchForm.Button7Click(Sender: TObject);
begin
    If StockOrder = 'Description' then
    begin
      DataForm2.StockSearchQuery.Next;
      SearchDescription();
      JvDBGrid1.SetFocus;
    end
    else
      Button5.Click;
end;

procedure TStockSearchForm.Button8Click(Sender: TObject);
begin
    If (StockOrder = 'Barcode') or (StockOrder = 'TCStockNo') then
    begin
      DataForm2.StockSearchQuery.Next;
      SearchBarcode();
      JvDBGrid1.SetFocus;
    end
    else
      Button6.Click;
end;

procedure TStockSearchForm.FilterOutOfStockCheckClick(Sender: TObject);
begin
      if Donotclick = False then
        StockOpen;
end;

procedure TStockSearchForm.CloseForm1Click(Sender: TObject);
begin
        Close;
end;

procedure TStockSearchForm.FirstBarc1Click(Sender: TObject);
begin
        Button6.Click;
end;

procedure TStockSearchForm.FirstDesc1Click(Sender: TObject);
begin
        Button5.Click;
end;

procedure TStockSearchForm.FirstExtD1Click(Sender: TObject);
begin
        JvBitBtn1.Click;
end;

procedure TStockSearchForm.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      Order := FieldStore;
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
      JvDBGrid1.Columns.Items[PreviousACol].Color := clWindow;
      JvDBGrid1.Columns.Items[ACol].Color := clInfoBk;
      PreviousACol := ACol;
end;

{begin
      If ACol = 0 then
      begin
        Order := 'Description';
        If StockOrder = 'Description' then
          StockOrder := 'Description DESC'
        else
          StockOrder := 'Description';
//        Button5.Click;
      end;
      If ACol = 1 then
      begin
        Order := 'Barcode';
        If StockOrder = 'Barcode' then
          StockOrder := 'Barcode DESC'
        else
          StockOrder := 'Barcode';
//        Button5.Click;
      end;
//      if (Directoryexists(DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''))) then
//      begin
        If ACol = 2 then
        begin
          Order := 'TcStockNo';
          If StockOrder = 'TCStockNo' then
            StockOrder := 'TCStockNo DESC'
          else
            StockOrder := 'TCStockNo';
//          Button5.Click;
        end;
//      end
//      else
//      begin
//        If ACol = 3 then
//        begin
//          Order := 'Nr';
//          If StockOrder = 'Nr' then
//            StockOrder := 'Nr DESC'
//          else
//            StockOrder := 'Nr';
//          Button5.Click;
//        end;
//      end;
      If ACol = 3 then
      begin
        Order := 'ExtraDescr';
        If StockOrder = 'ExtraDescr' then
          StockOrder := 'ExtraDescr DESC'
        else
          StockOrder := 'ExtraDescr';
//        Button5.Click;
      end;
      StockOpen;

//      showmessage(order);
end;    }

procedure TStockSearchForm.NextBarc1Click(Sender: TObject);
begin
        Button8.Click;
end;

procedure TStockSearchForm.Nextdesc1Click(Sender: TObject);
begin
        Button7.Click;
end;

procedure TStockSearchForm.NextExtD1Click(Sender: TObject);
begin
        JvBitBtn2.Click;
end;

procedure TStockSearchForm.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    e: extended;
begin
        if StrtoBool(Dataform2.GlobalTableNegQty.Value) = true then
        begin
          If (DataForm2.StockSearchQueryQty.Value < 0.01) and (Dataform2.StockSearchQueryNonStockItem.Value <> 'True') then
          begin
            JvDBGrid1.Canvas.Font.Color := clLime;
          end;
        end;
        If StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value) = True then
        begin
          e := Invoiceform.OpenLayBuyQty(Dataform2.StockSearchQueryTCStockNo.Value,Dataform2.GlobalTableBranchNo.Value);
          If (e >= DataForm2.StockSearchQueryQty.Value) and (e <> 0) then
          begin
            JvDBGrid1.Canvas.Font.Color := clFuchsia;
          end;
        end;
     // Default drawing.
        JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TStockSearchForm.SearchExtD();
var
  i: Integer;
begin
    DataForm2.StockSearchQuery.DisableControls;
    try
    while not DataForm2.StockSearchQuery.EOF do
      begin
        for i := 0 to (DataForm2.StockSearchQuery.fieldbyname('ExtraDescr').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockSearchQuery.fieldbyname('ExtraDescr').asString),i,ExtDSearch.GetTextLen) = lowercase(ExtDSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockSearchQuery.Next;
      end;
    finally
    DataForm2.StockSearchQuery.EnableControls;
    end;
    StopStr := 'No';
end;

procedure TStockSearchForm.JvBitBtn1Click(Sender: TObject);
begin
      If Order <> 'ExtraDescr' then
      begin
        Order := 'ExtraDescr';
        StockOrder := 'ExtraDescr';
        StockOpen;
        ResetColor;
        JvDBGrid1.Columns.Items[3].Color := clInfoBk;
        PreviousACol := 3;
      end;
      Dataform2.StockSearchQuery.First;
      SearchExtD();
      JvDBGrid1.SetFocus;
end;

procedure TStockSearchForm.JvBitBtn2Click(Sender: TObject);
begin
   If StockOrder = 'ExtraDescr' then
   begin
     DataForm2.StockSearchQuery.Next;
     SearchExtD();
     JvDBGrid1.SetFocus;
   end
   else
     JvBitBtn1.Click;
end;

procedure TStockSearchForm.JvBitBtn3Click(Sender: TObject);
begin
            Close;
end;

procedure TStockSearchForm.DescriptionSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      JvDBGrid1.SetFocus;
    end
    else
    begin
      If Order <> 'Description' then
      begin
        Order := 'Description';
        StockOrder := 'Description';
        StockOpen;
        ResetColor;
        JvDBGrid1.Columns.Items[0].Color := clInfoBk;
        PreviousACol := 0;
      end;
      DataForm2.StockSearchQuery.Locate('Description', DescriptionSearch.Text, [loPartialKey, loCaseInsensitive]);
    end;
end;

procedure TStockSearchForm.DescSearch1Click(Sender: TObject);
begin
        DescriptionSearch.SetFocus;
        DescriptionSearch.SelectAll;
end;

procedure TStockSearchForm.BarcodesearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      JvDBGrid1.SetFocus;
    end
    else
    begin
      If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
      begin
        If Order <> 'BarCode' then
        begin
          Order := 'BarCode';
          StockOrder := 'Barcode';
          StockOpen;
          ResetColor;
          JvDBGrid1.Columns.Items[1].Color := clInfoBk;
          PreviousACol := 1;
        end;
        DataForm2.StockSearchQuery.Locate('Barcode', BarcodeSearch.Text, [loPartialKey, loCaseInsensitive]);
      end
      else
      begin
        If Order <> 'TCStockNo' then
        begin
          Order := 'TCStockNo';
          StockOrder := 'TCStockNo';
          StockOpen;
          ResetColor;
          JvDBGrid1.Columns.Items[2].Color := clInfoBk;
          PreviousACol := 2;
        end;
        DataForm2.StockSearchQuery.Locate('TCStockNo', BarcodeSearch.Text, [loPartialKey, loCaseInsensitive]);
      end;
    end;
end;

procedure TStockSearchForm.ExtDSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      JvDBGrid1.SetFocus;
    end
    else
    begin
      If Order <> 'ExtraDescr' then
      begin
        Order := 'ExtraDescr';
        StockOrder := 'ExtraDescr';
        StockOpen;
        ResetColor;
        JvDBGrid1.Columns.Items[3].Color := clInfoBk;
        PreviousACol := 3;
      end;
      DataForm2.StockSearchQuery.Locate('ExtraDescr', ExtDSearch.Text, [loPartialKey, loCaseInsensitive]);
    end;
end;

procedure TStockSearchForm.ExtraDSearch1Click(Sender: TObject);
begin
        ExtDSearch.SetFocus;
        ExtDSearch.SelectAll;
end;

procedure TStockSearchForm.StockOpen();
var
   StockPlace: String;
   HideOutofStockItems:String;
begin
      if FilterOutOfStockCheck.Checked then
        HideOutofStockItems := 'and ((stock_db.Qty > 0.00) or (stock_db.NonStockItem = "True"))'
      else
        HideOutofStockItems := '';

      StockPlace := Dataform2.StockSearchQueryTCStockNo.Value;
      Dataform2.StockSearchQuery.Close;
      with Dataform2.StockSearchQuery.SQL do
      begin
        Clear;
        Add('select stock_db.Description,stock_db.Barcode,stock_db.TCStockNo,stock_db.ExtraDescr,stock_db.Qty,stock_db.NonStockItem from stock_db');
 //       Add(',IFNULL(StockAtBranch.StAtBrQty,0) as StAtBrQty,IFNULL(OpenLayBuy.OpenLayBQty,0) as OpenLayBQty,stock_db.Qty - StAtBrQty as RealQty,stock_db.NonStockItem from stock_db');
//        Add('left join (SELECT TCStockNo, Sum(stock_db.Qty) as StAtBrQty from stock_db where not BranchNo = 0 Group By TCStockNo)');
//        Add('as StockAtBranch on stock_db.TCStockNo = StockAtBranch.TCStockNo');
//        Add('left join (SELECT invoiceitem_db.TCStockNo, SUM(invoiceitem_db.Qty) as OpenLayBQty from invoiceitem_db inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
//        Add('where (invoice_db.InvClose = "LaybO") and (invoiceitem_db.CommentSwi = "False") and (invoiceitem_db.BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ') group by invoiceitem_db.TCStockNo) as OpenLayBuy on stock_db.TCStockNo = OpenLayBuy.TCStockNo');
        Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        Add(HideOutofStockItems);
        Add('order by ' + StockOrder);
      end;
      Dataform2.StockSearchQuery.Open;
      Dataform2.StockSearchQuery.Locate('TCStockNo', StockPlace,[]);
end;

procedure TStockSearchForm.ResetColor();
begin
      JvDBGrid1.Columns.Items[0].Color := clWindow;
      JvDBGrid1.Columns.Items[1].Color := clWindow;
      JvDBGrid1.Columns.Items[2].Color := clWindow;
      JvDBGrid1.Columns.Items[3].Color := clWindow;
end;

procedure TStockSearchForm.AddInvoiceProduct();
var
          e: extended;
begin
        if (StrtoBool(Dataform2.GlobalTableNegQty.Value) = true) and (InvoiceForm.su = 'False') then
        begin
          If ((DataForm2.StockSearchQueryQty.Value) > 0) or (Dataform2.StockSearchQueryNonStockItem.Value = 'True')  then
          begin
            fromwheretmp := '';
            InvoiceForm.InsertProduct(DataForm2.StockSearchQueryTCStockNo.Value);
            close;
          end
          else
            showmessage('No stock on Stock item!');
        end
        else
        begin
          fromwheretmp := '';
          InvoiceForm.InsertProduct(DataForm2.StockSearchQueryTCStockNo.Value);
          close;
        end;
end;

procedure TStockSearchForm.KeyAction();
begin
      If fromwheretmp = 'Invoice' then
      begin
        AddInvoiceProduct();
      end;
      If fromwheretmp = 'Purchases' then
      begin
        fromwheretmp := '';
        Purchaseform.InsertProduct(Dataform2.StockSearchQueryTCStockNo.Value);
        Purchaseform.JvdbGrid1.Col := 1;
        Purchaseform.JvdbGrid1.SetFocus;
        close;
      end;
      If fromwheretmp = 'Stock' then
      begin
        Dataform2.StockTable.Locate('TCStockNo', Dataform2.StockSearchQueryTCStockNo.Value,[]);
        close;
      end;
      If fromwheretmp = 'StockTake' then
      begin
        Stocktakedetailform.FindStockTakeItem(Dataform2.StockSearchQueryTCStockNo.Value);
        Close;
      end;
end;

end.
