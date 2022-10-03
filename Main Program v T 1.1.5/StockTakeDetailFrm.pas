unit StockTakeDetailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpBase, RpSystem, JvBaseDlg,
  JvProgressDialog, Menus, DBCtrls, JvExButtons, JvBitBtn, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Mask, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvExControls, JvSpeedButton, StockUtils,
  UtilsUnit, db;

type
  TStockTakeDetailForm = class(TForm)
    StocktakeDate: TJvDatePickerEdit;
    Label1: TLabel;
    Label2: TLabel;
    StockTakeItems: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    AddStockItem: TJvBitBtn;
    StocktakeDescription: TDBEdit;
    MainMenu1: TMainMenu;
    Shortcuts1: TMenuItem;
    AddStockItem1: TMenuItem;
    AcceptandCloseStocktake: TJvBitBtn;
    ProgressBar: TJvProgressDialog;
    BarcodeEditBox: TEdit;
    Label3: TLabel;
    UseBarcodescannerCounting1: TMenuItem;
    ChoosePrintSetting: TComboBox;
    JvSpeedButton1: TJvSpeedButton;
    Reporttr: TRvSystem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddStockItemClick(Sender: TObject);
    procedure AddStockItem1Click(Sender: TObject);
    procedure AcceptandCloseStocktakeClick(Sender: TObject);
    procedure StockTakeItemsTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BarcodeEditBoxKeyPress(Sender: TObject; var Key: Char);
    procedure UseBarcodescannerCounting1Click(Sender: TObject);
    procedure ReporttrPrint(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
  private
    procedure OpenStockTakeDetail;
    procedure Print(Report: TBaseReport);
    { Private declarations }
  public
    procedure FindStockTakeItem(TCStockNo: String);
    { Public declarations }
  end;

var
  StockTakeDetailForm: TStockTakeDetailForm;
  StockTakeDetailOrder:String;

implementation
        uses Datafrm2, StockSearchFrm, UserFrm;

{$R *.dfm}

procedure TStockTakeDetailForm.AcceptandCloseStocktakeClick(Sender: TObject);
var
      i:Integer;
      CalculatedItemQty: Extended;
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) then
      begin
        if Dataform2.Stocktaketablestocktakestatus.Value <> 'In Process' then
        begin
          showmessage('Stocktake already closed');
          exit;
        end;
        if (Dataform2.Stocktakedetailtable.recordcount = 0) then
        begin
          showmessage('There is nothing to process?');
          exit;
        end;
        if MessageDlg('Are you sure you want to process this stocktake?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Dataform2.ADConnection.StartTransaction;
          try
            Dataform2.Stocktakedetailtable.DisableControls;
            ProgressBar.Caption := 'Closing stocktake and adjusting stock';
            ProgressBar.Max := Dataform2.Stocktakedetailtable.RecordCount;
            i := 0;
            ProgressBar.Position := 0;
            ProgressBar.Show;
            while not Dataform2.Stocktakedetailtable.EOF do
            begin
              if not Dataform2.Stocktable.Locate('TCStockNo',DataForm2.StockTakedetailtableTCStockNo.Value,[]) then
              begin
                showmessage('Can''t Find stock item: ' + DataForm2.StockTakedetailtableTCStockNo.Value);
                Dataform2.ADConnection.Rollback;
                exit;
              end
              else
              begin
                CalculatedItemQty := GetStockItemQtyFromHistory(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
                if CalculatedItemQty <> Dataform2.StockTableQty.Value then
                begin
                  SetStockItemQtyFromHistory(CalculatedItemQty);
                end;
                Dataform2.Stocktakedetailtable.Edit;
                Dataform2.StocktakedetailtableBeforeQty.asFloat := CalculatedItemQty;
                Dataform2.Stocktakedetailtable.Post;
                if Dataform2.StocktakedetailtableLocalQty.asFloat <> Dataform2.StocktakedetailtableQty.asFloat then
                  AdjustLocalStockQty('Adj',CalculatedItemQty,Dataform2.StocktakedetailtableQty.asFloat);
              end;
              Inc(i);
              ProgressBar.Position := i;
              ProgressBar.Text := InttoStr(i) + ' / ' + InttoStr(ProgressBar.Max);
              Application.ProcessMessages;
              Dataform2.Stocktakedetailtable.Next;
            end;
            Dataform2.Stocktakedetailtable.EnableControls;
            Dataform2.Stocktaketable.Edit;
            Dataform2.StockTaketableStocktakeStatus.Value := 'Closed';
            Dataform2.Stocktaketable.Post;
            Dataform2.ADConnection.Commit;
            ProgressBar.Hide;
            StockTakeDate.enabled := False;
            StockTakedescription.readonly := True;
            Stocktakeitems.readonly := True;
          finally
            if Dataform2.ADConnection.InTransaction then
            begin
              Dataform2.ADConnection.Rollback;
              showmessage('Something went wrong contact Support!');
            end;
          end;
        end;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TStockTakeDetailForm.AddStockItem1Click(Sender: TObject);
begin
      AddStockItem.Click;
end;

procedure TStockTakeDetailForm.AddStockItemClick(Sender: TObject);
begin
      if Dataform2.Stocktaketablestocktakestatus.Value <> 'In Process' then
      begin
        showmessage('Stocktake already closed');
        exit;
      end;
      if (Dataform2.StockTakeTablestrState = 'Edit') or (Dataform2.StockTakeTablestrState = 'Insert') then
      begin
        Dataform2.StockTakeTableStocktakeDate.Value := datetointdate(Stocktakedate.date);
        Dataform2.Stocktaketable.post;
      end;
      StockSearchform.FromWhereTmp := 'StockTake';
      StockSearchForm.ShowModal;
end;

procedure TStockTakeDetailForm.BarcodeEditBoxKeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        if Dataform2.Stocktaketablestocktakestatus.Value <> 'In Process' then
        begin
          showmessage('Stocktake already closed');
          exit;
        end;
        if (Dataform2.StockTakeTablestrState = 'Edit') or (Dataform2.StockTakeTablestrState = 'Insert') then
        begin
          Dataform2.StockTakeTableStocktakeDate.Value := datetointdate(Stocktakedate.date);
          Dataform2.Stocktaketable.post;
        end;
        If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = True then
        begin
          if not Dataform2.StockTable.Locate('TCStockNo', BarcodeEditBox.Text,[]) then
          begin
            Beep;
            showmessage('Can''t find product!');
          end
          else
          begin
            FindStockTakeItem(Dataform2.StockTableTCStockNo.Value);
            Dataform2.Stocktakedetailtable.Edit;
            Dataform2.StocktakedetailtableQty.Value := Dataform2.StocktakedetailtableQty.Value + 1;
            Dataform2.Stocktakedetailtable.Post;
          end;
        end
        else
        begin
          if not Dataform2.StockTable.Locate('Barcode', BarcodeEditBox.Text,[]) then
          begin
            Beep;
            showmessage('Can''t find product!');
          end
          else
          begin
            FindStockTakeItem(Dataform2.StockTableTCStockNo.Value);
            Dataform2.Stocktakedetailtable.Edit;
            Dataform2.StocktakedetailtableQty.Value := Dataform2.StocktakedetailtableQty.Value + 1;
            Dataform2.Stocktakedetailtable.Post;
          end;
        end;
        BarcodeEditBox.Text := '';
      end;
end;

procedure TStockTakeDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if (Dataform2.StockTakeTablestrState = 'Insert') and (Dataform2.Stocktakedetailtable.recordcount = 0) then
      begin
          Dataform2.Stocktaketable.cancel;
      end
      else
      begin
        if (Dataform2.StockTakeTablestrState = 'Edit') or (Dataform2.StockTakeTablestrState = 'Insert') then
        begin
          Dataform2.StockTakeTableStocktakeDate.Value := datetointdate(Stocktakedate.date);
          Dataform2.StockTaketable.post;
        end;
        if (Dataform2.StockTakeDetailTablestrState = 'Edit') or (Dataform2.StockTakeDetailTablestrState = 'Insert') then
        begin
          Dataform2.Stocktakedetailtable.Post;
        end;
      end;
      Dataform2.StockTable.Close;
      Dataform2.StockTakeDetailTable.Close;
      StockSearchform.Free;
end;

procedure TStockTakeDetailForm.FormShow(Sender: TObject);
begin
      Dataform2.StockTable.Close;
      with Dataform2.StockTable.SQL do
      begin
        Clear;
        Add('select * from stock_db');
        Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
      end;
      Dataform2.StockTable.Open;
      StockTakeDetailOrder := 'StockTakeDetailID';
      OpenStockTakeDetail();
      Application.CreateForm(TStockSearchForm, StockSearchForm);
      if Dataform2.StocktaketableStocktakestatus.Value = 'Closed' then
      begin
        StockTakeDate.enabled := False;
        StockTakedescription.readonly := True;
        Stocktakeitems.readonly := True;
      end
      else
      begin
        StockTakeDate.enabled := True;
        StockTakedescription.readonly := False;
        Stocktakeitems.readonly := False;
      end;
      ChoosePrintSetting.ItemIndex := 0;
end;

procedure TStockTakeDetailForm.JvSpeedButton1Click(Sender: TObject);
begin
          Reporttr.execute;
end;

procedure TStockTakeDetailForm.FindStockTakeItem(TCStockNo:String);
begin
      if not Dataform2.Stocktakedetailtable.Locate('TCStockNo',TCStockNo,[]) then
      begin
        Dataform2.Stocktakedetailtable.Insert;
        Dataform2.StocktakedetailtableStocktakeid.value := Dataform2.Stocktaketablestocktakeid.value;
        Dataform2.StocktakedetailtableTCStockNo.Value := TCStockNo;
        Dataform2.StocktakedetailtableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
        Dataform2.Stocktakedetailtable.Post;
        OpenStockTakeDetail();
        Dataform2.Stocktakedetailtable.Locate('TCStockNo',TCStockNo,[]);
      end;
end;

procedure TStockTakeDetailForm.OpenStockTakeDetail();
begin
          Dataform2.StockTakeDetailTable.Close;
          with Dataform2.StockTakeDetailTable.SQL do
          begin
            Clear;
            Add('select cast(stocktakedetail.StockTakeDetailID as UNSIGNED) as StockTakeDetailID,stocktakedetail.StockTakeID,stocktakedetail.TCStockNo,stocktakedetail.Qty,');
            Add('stocktakedetail.BeforeQty,stocktakedetail.BranchNo, stock_db.Description, stock_db.Qty as LocalQty from stocktakedetail');
            Add('left join stock_db on stock_db.TCStockNo = stocktakedetail.TCStockNo and stock_db.BranchNo = stocktakedetail.BranchNo');
  //          Add('left join (SELECT TCStockNo, Sum(stock_db.Qty) as StAtBrQty from stock_db where not BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ' Group By TCStockNo)');
  //          Add('as StockAtBranch on stock_db.TCStockNo = StockAtBranch.TCStockNo');
            Add('left join (SELECT invoiceitem_db.TCStockNo, SUM(invoiceitem_db.Qty) as OpenLayBQty from invoiceitem_db inner join invoice_db on (invoice_db.Nr = invoiceitem_db.LinkID) and (invoice_db.BranchNo = invoiceitem_db.BranchNo)');
            Add('where (invoice_db.InvClose = "LaybO") and (invoiceitem_db.CommentSwi = "False") and (invoiceitem_db.BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ') group by invoiceitem_db.TCStockNo) as OpenLayBuy on stock_db.TCStockNo = OpenLayBuy.TCStockNo');
            Add('where StockTakeID = ' + InttoStr(Dataform2.Stocktaketablestocktakeid.value));
            Add('order by ' + StockTakeDetailOrder);
          end;
          Dataform2.StockTakeDetailTable.Open;
end;

procedure TStockTakeDetailForm.StockTakeItemsTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if StockTakeDetailOrder <> FieldStore then
      begin
        StockTakeDetailOrder := FieldStore;
        OpenStockTakeDetail();
      end
      else
      begin
        StockTakeDetailOrder := FieldStore + ' Desc';
        OpenStockTakeDetail();
      end;
end;

procedure TStockTakeDetailForm.UseBarcodescannerCounting1Click(Sender: TObject);
begin
          BarcodeEditBox.setfocus;
end;

procedure TStockTakeDetailForm.Print(Report:TBaseReport);
var
        count: Integer;
        logo: TBitmap;
        PageCount:Integer;
begin
      with report do
      begin
        count := 0;

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
        printLeft('---------------------------------------------------', 4.75);
        printXY(0.250,3.4,'');

        NewLine;
        NewLine;
        PageCount := 1;
        PrintLeft('Stocktake report on Date ' + intdatetostring(Dataform2.Stocktaketablestocktakedate.value), 0.5);
        PrintLeft('Page ' + InttoStr(PageCount),5);
        NewLine;
        NewLine;
        ClearTabs;
        SetTab(0.5, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,3,0,0,0);
        SetTab(NA, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,1,0,0,0);
        PrintTab('Stock No');
        PrintTab('Description');
        PrintTab('Counted Qty');
        PrintTab('Stock Qty');
        Bold := False;
        NewLine;
        DataForm2.StocktakeDetailTable.DisableControls;
        DataForm2.StocktakeDetailTable.first;
        try
          while not DataForm2.StocktakeDetailTable.EOF do
          begin
            If (ChoosePrintSetting.ItemIndex = 1) and (Dataform2.StocktakedetailtableQty.asFloat = Dataform2.StocktakedetailtableLocalQty.asFloat) then
            begin
              Dataform2.Stocktakedetailtable.Next;
              Continue;
            end;
            Inc(count);
            If (count > 42) and (PageCount = 1) then
            begin
              Inc(PageCount);
              NewPage;
              count := 0;
              Bold := True;
              PrintLeft('Page ' + InttoStr(PageCount),5);
              NewLine;
              PrintTab('Stock No');
              PrintTab('Description');
              PrintTab('Counted Qty');
              PrintTab('Stock Qty');
              Bold := False;
              NewLine;
            end;
            If (count > 55) and (PageCount > 1) then
            begin
              Inc(PageCount);
              NewPage;
              count := 0;
              Bold := True;
              PrintLeft('Page ' + InttoStr(PageCount),5);
              NewLine;
              PrintTab('Stock No');
              PrintTab('Description');
              PrintTab('Counted Qty');
              PrintTab('Stock Qty');
              Bold := False;
              NewLine;
            end;
            PrintTab(Dataform2.StocktakedetailtableTCStockNo.Value);
            PrintTab(Dataform2.StocktakedetailtableDescription.Value);
            PrintTab(Floattostr(Dataform2.StocktakedetailtableQty.asFloat));
            PrintTab(Floattostr(Dataform2.StocktakedetailtableLocalQty.asFloat));
            NewLine;
            Dataform2.Stocktakedetailtable.Next;
          end;
        finally
        end;
        Dataform2.Stocktakedetailtable.EnableControls;
      end;
end;

procedure TStockTakeDetailForm.ReporttrPrint(Sender: TObject);
begin
      Print(Reporttr.BaseReport);
end;

end.
