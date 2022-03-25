unit StockTransferFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, Easysize, RpDefine, RpBase,
  RpSystem, DBCtrls, JvExButtons, JvBitBtn, JvExStdCtrls, JvEdit, JvExDBGrids,
  JvDBGrid, JvExControls, JvSpeedButton, UtilsUnit, db, Registry;

type
  TStockTransferForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    GroupBox1: TGroupBox;
    FromGrid: TJvDBGrid;
    GroupBox2: TGroupBox;
    JvDBGrid3: TJvDBGrid;
    Label1: TLabel;
    DescriptionSearch: TJvEdit;
    Button5: TButton;
    Button7: TButton;
    Label2: TLabel;
    Barcodesearch: TJvEdit;
    Button6: TButton;
    Button8: TButton;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    JvBitBtn7: TJvBitBtn;
    CreateTransferBtn: TJvBitBtn;
    DeleteOpenTransferBtn: TJvBitBtn;
    SaveTransferBtn: TJvBitBtn;
    JvBitBtn11: TJvBitBtn;
    Reporttr: TRvSystem;
    JvBitBtn12: TJvBitBtn;
    JvBitBtn13: TJvBitBtn;
    JvBitBtn14: TJvBitBtn;
    JvSpeedButton1: TJvSpeedButton;
    CloseTransferBtn: TButton;
    MainMenu1: TMainMenu;
    Edit1: TMenuItem;
    Viewonlyopentransfers1: TMenuItem;
    FormResizer1: TFormResizer;
    Markcurrenttransferasalreadysendtobranch1: TMenuItem;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ReturnStockItem1: TMenuItem;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FromGridKeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CreateTransferBtnClick(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure FromGridDblClick(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure DeleteOpenTransferBtnClick(Sender: TObject);
    procedure JvDBGrid3Enter(Sender: TObject);
    procedure JvDBGrid3Exit(Sender: TObject);
    procedure SaveTransferBtnClick(Sender: TObject);
    procedure ReporttrPrint(Sender: TObject);
    procedure JvBitBtn11Click(Sender: TObject);
    procedure JvBitBtn12Click(Sender: TObject);
    procedure JvBitBtn13Click(Sender: TObject);
    procedure JvBitBtn14Click(Sender: TObject);
    procedure FromGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure CloseTransferBtnClick(Sender: TObject);
    procedure Viewonlyopentransfers1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure JvDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure JvDBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure Markcurrenttransferasalreadysendtobranch1Click(Sender: TObject);
    procedure FromGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ReturnStockItem1Click(Sender: TObject);
    procedure JvBitBtn7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure DeleteStockItems;
    procedure CloseTransfer;
    procedure Print(Report: TBaseReport);
    procedure StockOpen;
    procedure StockTrnsferOpen;
    procedure CreateStockItem;
    procedure CreateReturnItem;
    procedure SearchBarcode;
    procedure SearchDescription;
    { Private declarations }
  public
    procedure StockTrnsferItemOpen;
    { Public declarations }
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  StockTransferForm: TStockTransferForm;
  Qtytest: extended;
  StockOrder: String;
  DoNotClick: Boolean;
  StopStr: String;

implementation
    uses Datafrm2, StockSearchFrm, UserFrm, BarcodePrintingFrm, InvoiceFrm,
  StockFrm;

{$R *.dfm}

procedure TStockTransferForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Dataform2.StockTable.Close;
        dataform2.StockTrnsferTable.Close;
        Dataform2.StocktrnsferItemTable.Close;
        StockSearchForm.Free;
end;

procedure TStockTransferForm.FormCreate(Sender: TObject);
begin
        FormResizer1.InitializeForm;
        DoNotClick := True;
        try
          CheckBox1.Checked := StrtoBool(GetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS', 'StockTransferHideOutofStock'));
        except
          CheckBox1.Checked := False;
        end;
        DoNotClick := False;
end;

procedure TStockTransferForm.FormDestroy(Sender: TObject);
begin
        SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','StockTransferHideOutofStock', rdString, BooltoStr(CheckBox1.Checked));
end;

procedure TStockTransferForm.FormResize(Sender: TObject);
begin
        FormResizer1.ResizeAll;
end;

procedure TStockTransferForm.FromGridKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
      JvBitBtn5.Click;
    end
    else
    begin
      If Key <> #00 then
        DataForm2.StockTable.Locate(Order, Key, [loPartialKey, loCaseInsensitive]);
    end;
end;

procedure TStockTransferForm.Button5Click(Sender: TObject);
begin
  StockOrder := 'Description';
  StockOpen;
  Dataform2.StockTable.First;
  SearchDescription();
end;

procedure TStockTransferForm.Button7Click(Sender: TObject);
begin
  DataForm2.StockTable.Next;
  SearchDescription();
end;

procedure TStockTransferForm.Button6Click(Sender: TObject);
begin
  If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
  begin
    If StockOrder <> 'BarCode' then
    begin
      StockOrder := 'Barcode';
      StockOpen;
    end;
  end
  else
  begin
    If StockOrder <> 'TCStockNo' then
    begin
      StockOrder := 'TCStockNo';
      StockOpen;
    end;
  end;
    Dataform2.StockTable.First;
    SearchBarcode();
end;

procedure TStockTransferForm.Button8Click(Sender: TObject);
begin
  DataForm2.StockTable.Next;
  SearchBarcode();
end;

procedure TStockTransferForm.FormShow(Sender: TObject);
begin
      Width := Screen.Width;
      StockOrder := 'Description';
      StockOpen;
      StockTrnsferOpen;
//      DataForm2.StockTrnsferTable.Filtered := False;
//      dataForm2.StockTrnsferTable.Filter := 'ToBranch = ' + InttoStr(DataForm2.BranchTableNr.Value);
//      DataForm2.StockTrnsferTable.Filtered := True;
      StockTrnsferItemOpen();
//      Dataform2.StockTrnsferTable.Last;
      Application.CreateForm(TStockSearchForm, StockSearchForm);
      StockTransferForm.Caption := StockTransferForm.Caption + ' of ' + Dataform2.BranchTableName.Value;
//      if (Directoryexists(DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''))) then
//        JvDBGrid3.Columns[1].Visible := False
//      else
//        JvDBGrid3.Columns[0].Visible := False;
        If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
        begin
          Label2.Caption := 'Barc. search:';
          Button6.Caption := 'First Barc';
          Button8.Caption := 'Next Barc';
        end
        else
        begin
          Label2.Caption := 'Stck No search';
          Button6.Caption := '1st Stck No';
          Button8.Caption := 'Nxt Stck No';
        end;

end;

procedure TStockTransferForm.CreateTransferBtnClick(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to create a new Transfer for Branch ' + Dataform2.BranchTableName.Value + '!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DataForm2.StockTrnsferTable.Insert;
        DataForm2.StockTrnsferTableToBranch.Value := DataForm2.BranchTableNr.Value;
        DataForm2.StockTrnsferTableDate.Value := DatetoIntDate(date);
        Dataform2.StockTrnsferTableClosed.Value := 'False';
        Dataform2.StockTrnsferTableFromBranch.Value := Dataform2.GlobalTableBranchNo.Value;
        Dataform2.StockTrnsferTable.Post;
        StockTrnsferItemOpen();
      end;
end;

procedure TStockTransferForm.JvBitBtn5Click(Sender: TObject);
var
      e,e2:Extended;
begin
       if Dataform2.StockTrnsferTableClosed.Value = 'False' then
       begin
         if (StrtoBool(Dataform2.GlobalTableNegQty.Value) = true) then
         begin
           e2 := InvoiceForm.OpenLayBuyQty(DataForm2.InvoiceItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
           If (DataForm2.StockTableQty.Value - e2 > 0) or (Dataform2.StockTableNonStockItem.Value = 'True')  then
           begin
             CreateStockItem();
           end
           else
             showmessage('No stock on Stock item!');
         end
         else
         begin
           CreateStockItem();
         end;
       end
       else
         showmessage('Transfer already closed (Create new Transfer)!');
end;

procedure TStockTransferForm.JvDBGrid1CellClick(Column: TColumn);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1DblClick(Sender: TObject);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.JvDBGrid1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
        StockTrnsferItemOpen();
end;

procedure TStockTransferForm.FromGridDblClick(Sender: TObject);
begin
       JvBitBtn5.Click;
end;

procedure TStockTransferForm.FromGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
      e:Extended;
begin
        if StrtoBool(Dataform2.GlobalTableNegQty.Value) = true then
        begin
          If (DataForm2.StockTableQty.Value < 0.01) and (Dataform2.StockTableNonStockItem.Value <> 'True') then
          begin
            FromGrid.Canvas.Font.Color := clLime;
          end;
        end;
        If StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value) = True then
        begin
          e := Invoiceform.OpenLayBuyQty(Dataform2.StockTableTCStockNo.Value,Dataform2.GlobalTableBranchNo.Value);
          If (e >= DataForm2.StockTableQty.Value) and (e <> 0) then
          begin
            FromGrid.Canvas.Font.Color := clFuchsia;
          end;
        end;
     // Default drawing.
        FromGrid.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TStockTransferForm.JvBitBtn6Click(Sender: TObject);
begin
    if (Dataform2.StockTrnsferTableClosed.Value = 'False') then
    begin
      if MessageDlg('Are you sure you want to remove Stock Item ' + DataForm2.StocktrnsferItemTableDescription.Value + '!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DataForm2.StocktrnsferItemTable.Delete;
      end;
    end
    else
      showmessage('Transfer already closed (Create new Transfer)!');
end;

procedure TStockTransferForm.JvBitBtn7Click(Sender: TObject);
begin
        Close;
end;

procedure TStockTransferForm.DeleteOpenTransferBtnClick(Sender: TObject);
begin
    if (Dataform2.StockTrnsferTableClosed.Value = 'False') then
    begin
      if MessageDlg('Are you sure you want to remove Transfer for ' + DataForm2.BranchTableName.Value + '!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DeleteStockItems;
        DataForm2.StockTrnsferTable.Delete;
      end;
    end
    else
      showmessage('Transfer already closed (Create new Transfer)!');
end;

procedure TStockTransferForm.DeleteStockItems();
begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
                Clear;
                Add('Delete FROM stocktrnsferitem_db');
                Add('WHERE LinkId = ' + inttostr(DataForm2.StockTrnsferTableNr.Value));
        end;
        DataForm2.Query2.ExecSQL;
end;

procedure TStockTransferForm.JvDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
      e,e2: extended;
begin
      if (StrtoBool(Dataform2.GlobalTableNegQty.Value) = true) and (Dataform2.StockTrnsferTableClosed.Value = 'False') then
      begin
        DataForm2.Query2.Close;
        with DataForm2.Query2.SQL do begin
          Clear;
          Add('Select Qty,NonStockItem from stock_db');
          Add('where TCStockNo = "' + DataForm2.StocktrnsferItemTableTCStockNo.asString + '"');
          Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        end;
        Dataform2.Query2.Prepared := True;
        Dataform2.Query2.Open;
        e2 := InvoiceForm.OpenLayBuyQty(DataForm2.StocktrnsferItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
        If (DataForm2.StocktrnsferItemTableQty.Value > DataForm2.Query2.FieldByName('Qty').asInteger - e2) and (Dataform2.Query2.FieldByName('NonStockItem').Value <> 'True')  then
        begin
          JvDBGrid3.Canvas.Font.Color := clLime;
        end;
        Dataform2.Query2.Close;
        Dataform2.Query2.Prepared := False;
      end;

     // Default drawing.
      JvDBGrid3.DefaultDrawDataCell(Rect, Column.Field,State);
end;

procedure TStockTransferForm.JvDBGrid3Enter(Sender: TObject);
begin
        QtyTest := DataForm2.StocktrnsferItemTableQty.Value;
        JvDBGrid3.Columns.Items[1];
end;

procedure TStockTransferForm.JvDBGrid3Exit(Sender: TObject);
begin
          if (DataForm2.StocktrnsferItemTablestrState = 'Edit') or (DataForm2.StocktrnsferItemTablestrState = 'Insert') then
          begin
            DataForm2.StocktrnsferItemTable.Post;
          end;
end;

procedure TStockTransferForm.JvDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if HiWord(GetKeyState(vk_delete)) <> 0 then
      begin
       if Dataform2.StockTrnsferTableClosed.Value = 'False' then
       begin
          if MessageDlg('Are you sure you want to delete line ' + DataForm2.StockTrnsferItemTable.Fieldbyname('Description').asString, mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
            DataForm2.StockTrnsferItemTable.Delete;
          end;
        end
        else
          showmessage('You can''t delete an item on an closed Transfer!');
      end;
end;

procedure TStockTransferForm.CheckBox1Click(Sender: TObject);
begin
      if Donotclick = False then
        StockOpen;
end;

procedure TStockTransferForm.CloseTransfer();
begin
      DataForm2.StockTable.DisableControls;
      DataForm2.StocktrnsferItemTable.DisableControls;
      Dataform2.ADConnection.StartTransaction;
      try
        DataForm2.StocktrnsferItemTable.First;
        while not DataForm2.StocktrnsferItemTable.EOF do
        begin
          if not Dataform2.StockTable.Locate('TCStockNo', DataForm2.StocktrnsferItemTableTCStockNo.Value,[]) then
          begin
            if not Dataform2.StockTable.Locate('Nr', DataForm2.StocktrnsferItemTableStockNo.Value,[]) then
            begin
              showmessage('Run exits with error!');
              break;
            end;
          end;
          DataForm2.Query2.Close;
          with Dataform2.Query2.SQL do begin
            Clear;
            Add('select Nr, BranchNo, BranchMainStockNo from stock_db');
            Add('where BranchNo = ' + InttoStr(DataForm2.StockTrnsferTableToBranch.Value));
            Add('and TCStockNo = "' + DataForm2.StocktrnsferItemTableTCStockNo.Value + '"');
          end;
          DataForm2.Query2.Open;

          If DataForm2.Query2.RecordCount = 1 then
          begin
            DataForm2.Query3.Close;
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('update stock_db');
              Add('set Qty = Qty + ' + floattostr(DataForm2.StocktrnsferItemTableQty.Value));
              Add('where TCStockNo = "' + DataForm2.StocktrnsferItemTableTCStockNo.Value + '"');
              Add('and BranchNo = ' + Inttostr(Dataform2.BranchTableNr.Value));
            end;
            DataForm2.Query3.ExecSQL;
          end
          else
          begin
            DataForm2.Query3.Active := False;
            with DataForm2.Query3.SQL do begin
                Clear;
                Add('insert into stock_db(Description,DateCreated,DateChanged,CostPrice,SalesPrice,Barcode,Qty,AlertQty,NonStockItem,StartingQty,TCStockNo,BranchNo,SyncHQ,BranchMainStockNo,st_created_by,st_changed_by,st_nontaxitem,ModelNo) values ');
                Add('(''' + FixSQLString(Dataform2.StockTableDescription.Value) + ''',' + InttoStr(datetoIntDate(Date)) + ',' + InttoStr(DatetoIntDate(Date)) + ',' + Floattostr(DataForm2.StockTableCostPrice.Value) + ',' + FloattoStr(DataForm2.StockTableSalesPrice.Value) + ',''' + DataForm2.StockTableBarcode.Value + ''',' + FloattoStr(Dataform2.StocktrnsferItemTableQty.Value) + ',' + Floattostr(DataForm2.StockTableAlertQty.Value) + ',''' + Dataform2.StockTableNonStockItem.Value + ''',');
                Add(Floattostr(DataForm2.StockTableStartingQty.Value) + ',''' + DataForm2.StockTableTCStockNo.Value + ''',' + InttoStr(DataForm2.BranchTableNr.Value) + ',' + InttoStr(DataForm2.StockTableSyncHQ.Value) + ',' + InttoStr(DataForm2.StockTableNr.Value) + ',''' + Dataform2.User_dbUserName.Value + ''',''' + Dataform2.User_dbUserName.Value + ''',''' + Dataform2.StockTablest_nontaxitem.Value + ''',''' + Dataform2.StockTableModelNo.Value + ''')');
            end;
            DataForm2.Query3.ExecSQL;
          end;
          with DataForm2.Query3.SQL do begin
            Clear;
            Add('update stock_db');
            Add('set Qty = Qty - ' + floattostr(DataForm2.StocktrnsferItemTableQty.Value));
            Add('where TCStockNo = "' + DataForm2.StocktrnsferItemTableTCStockNo.Value + '"');
            Add('and BranchNo = ' + Inttostr(Dataform2.GlobalTableBranchNo.Value));
          end;
          DataForm2.Query3.ExecSQL;

          DataForm2.StocktrnsferItemTable.Next;
        end;
        if (DataForm2.StockTrnsferTablestrState <> 'Edit') and (DataForm2.StockTrnsferTablestrState <> 'Insert') then
          Dataform2.StockTrnsferTable.Edit;
        Dataform2.StockTrnsferTableClosed.Value := 'True';
        Dataform2.StockTrnsferTable.Post;
        Dataform2.ADConnection.Commit;
      finally
        if DataForm2.ADConnection.InTransaction then
        begin
          Dataform2.ADConnection.Rollback;
          showmessage('Something went wrong try again or contact support');
        end
      end;
      DataForm2.StocktrnsferItemTable.EnableControls;
      Dataform2.StockTable.EnableControls;
      DataForm2.Query2.Close;
end;

procedure TStockTransferForm.SaveTransferBtnClick(Sender: TObject);
begin
        if (DataForm2.StockTrnsferTablestrState = 'Edit') or (DataForm2.StockTrnsferTablestrState = 'Insert') then
        begin
          DataForm2.StockTrnsferTable.Post;
        end;
end;

procedure TStockTransferForm.Print(Report:TBaseReport);
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
        linecount := 0;
        printLeft('---------------------------------------------------', 4.75);
        printXY(0.250,3.4,'');

{        MarginLeft := 0.250;
        MarginTop := 0.250;
        SetFont('Arial',9);
        Bold := true;
        UserForm.Memo2.Lines.loadfromfile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        for count := 0 to UserForm.Memo2.Lines.Count - 1 do
        begin
          printLeft(UserForm.Memo2.Lines[count], 0.250);
          NewLine;
        end;        }
        NewLine;
        NewLine;
        PrintLeft('Branch Stock Transmittal sheet', 0.250);
        NewLine;
        NewLine;
        PrintLeft('For Branch ' + DataForm2.BranchTableName.Value + ' on Date ' + inttostr(DataForm2.StockTrnsferTableDate.Value), 0.250);
        Bold := False;
        NewLine;
        NewLine;
        ClearTabs;
        SetTab(0.3, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,1,0,0,0);
        SetTab(NA, pjLeft,3,0,0,0);
        SetTab(NA, pjLeft,1.5,0,0,0);
        PrintTab('No');
        PrintTab('Stock No');
        PrintTab('Description');
        PrintTab('Qty');
        NewLine;
        PageCount := 1;
        DataForm2.StocktrnsferItemTable.DisableControls;
        DataForm2.StocktrnsferItemTable.first;
        try
          while not DataForm2.StocktrnsferItemTable.EOF do
          begin
            Inc(count);
            If (count > 42) and (PageCount = 1) then
            begin
              Inc(PageCount);
              NewPage;
              count := 0;
              PrintTab('No');
              PrintTab('Stock No');
              PrintTab('Description');
              PrintTab('Qty');
              NewLine;
            end;
            If (count > 55) and (PageCount > 1) then
            begin
              Inc(PageCount);
              NewPage;
              count := 0;
              PrintTab('No');
              PrintTab('Stock No');
              PrintTab('Description');
              PrintTab('Qty');
              NewLine;
            end;
            PrintTab(InttoStr(DataForm2.StocktrnsferItemTableStockNo.Value));
//            DataForm2.Query2.Close;
//            with Dataform2.Query2.SQL do begin
//              Clear;
//              Add('select Nr, TcStockNo from stock_db');
//              Add('where Nr = ' + InttoStr(DataForm2.StocktrnsferItemTableStockNo.Value));
//            end;
//            DataForm2.Query2.Open;
//            PrintTab(Dataform2.Query2.FieldByName('TCStockno').asString);
            PrintTab(DataForm2.StocktrnsferItemTableTCStockNo.Value);
            PrintTab(DataForm2.StocktrnsferItemTableDescription.Value);
            PrintTab(Floattostr(DataForm2.StocktrnsferItemTableQty.Value));
            NewLine;
            DataForm2.StocktrnsferItemTable.Next;
          end;
        finally
        end;
        DataForm2.StocktrnsferItemTable.EnableControls;

        NewLine;
        NewLine;
        NewLine;
        PrintLeft('Signed HQ ________________ ',0.250);
        NewLine;
        NewLine;
        NewLine;
        PrintLeft('Received Branch ________________ ',0.250);
      end;
end;

procedure TStockTransferForm.ReporttrPrint(Sender: TObject);
begin
      Print(Reporttr.BaseReport);
end;

procedure TStockTransferForm.ReturnStockItem1Click(Sender: TObject);
begin
       if Dataform2.StockTrnsferTableClosed.Value = 'False' then
       begin
         CreateReturnItem;
       end
       else
         showmessage('Transfer already closed (Create new Transfer)!');
end;

procedure TStockTransferForm.JvBitBtn11Click(Sender: TObject);
begin
      Reporttr.Execute;
end;

procedure TStockTransferForm.JvBitBtn12Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 2 then
      begin
        Application.CreateForm(TBarcodePrintingForm, BarcodePrintingForm);
        BarCodePrintingForm.Fromwhere := 'StockT';
        BarcodePrintingForm.showmodal;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockTransferForm.JvBitBtn13Click(Sender: TObject);
begin
       if Dataform2.StockTrnsferTableClosed.Value = 'False' then
       begin
         DataForm2.StockTable.DisableControls;
         DataForm2.StockTable.first;
         try
           while not DataForm2.StockTable.EOF do
           begin
             DataForm2.StocktrnsferItemTable.Append;
             Dataform2.StocktrnsferItemTableLinkID.Value := DataForm2.StockTrnsferTableNr.Value;
             Dataform2.StocktrnsferItemTableStockNo.Value := Dataform2.StockTableNr.Value;
             Dataform2.StocktrnsferItemTableBeforeQty.Value := Dataform2.StockTableQty.Value;
             DataForm2.StocktrnsferItemTableQty.Value := 0;
             DataForm2.StocktrnsferItemTableDescription.Value := Dataform2.StockTableDescription.Value;
             Dataform2.StocktrnsferItemTableTCStockNo.Value := Dataform2.StockTableTCStockNo.Value;
             DataForm2.StocktrnsferItemTable.Post;
             Dataform2.StockTable.Next;
           end;
         finally
         end;
         DataForm2.StockTable.EnableControls;
         Dataform2.StocktrnsferItemTable.First;
         DataForm2.StockTable.First;
         JvDBGrid3.SetFocus;
         JvDBGrid3.Col := 2;
       end
       else
         showmessage('Transfer already closed (Create new Transfer)!');
end;

procedure TStockTransferForm.JvBitBtn14Click(Sender: TObject);
begin
     if MessageDlg('Are you sure you want to remove All Stock transfer Items?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       if Dataform2.StockTrnsferTableClosed.Value = 'False' then
       begin
         DataForm2.Query2.Active := False;
         with DataForm2.Query2.SQL do begin
                Clear;
                Add('Delete FROM stocktrnsferitem_db');
                Add('WHERE LinkId = ' + inttostr(DataForm2.StockTrnsferTableNr.Value));
         end;
         DataForm2.Query2.ExecSQL;
         DataForm2.StockTable.First;
         FromGrid.SetFocus;
       end
       else
         showmessage('Transfer already closed (Create new Transfer)!');
     end;
end;

procedure TStockTransferForm.FromGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
      If ACol = 0 then
      begin
        If StockOrder = 'TCStockNo' then
          StockOrder := 'TCStockNo DESC'
        else
          StockOrder := 'TCStockNo';
      end;
      If ACol = 1 then
      begin
        If StockOrder = 'Description' then
          StockOrder := 'Description DESC'
        else
          StockOrder := 'Description';
      end;
      If ACol = 2 then
      begin
        If StockOrder = 'Barcode' then
          StockOrder := 'Barcode DESC'
        else
          StockOrder := 'Barcode';
      end;
      StockOpen;
end;

procedure TStockTransferForm.JvSpeedButton1Click(Sender: TObject);
begin
      Dataform2.StocktrnsferItemTable.Cancel;
end;

procedure TStockTransferForm.Markcurrenttransferasalreadysendtobranch1Click(
  Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to Mark Current Transfer as already send to Branch!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          If (Dataform2.StockTrnsferTableClosed.Value = 'True') and (Dataform2.StockTrnsferTableSync.isnull) then
          begin
            Dataform2.ADConnection.StartTransaction;
            try
              Dataform2.StockTrnsferTable.Edit;
              Dataform2.StockTrnsferTableSync.Value := DatetoIntDate(date);
              Dataform2.StockTrnsferTable.Post;
              DataForm2.Query4.Close;
              with DataForm2.Query4.SQL do
              begin
                Clear;
                Add('update stocktrnsferitem_db set Transfered = ' + InttoStr(DatetoIntDate(date)));
                Add('where LinkID = ' + InttoStr(Dataform2.StockTrnsferTableNr.Value));
                Add('and ((Transfered = 0) or (Transfered is null))');
              end;
              DataForm2.Query4.ExecSQL;
              Dataform2.ADConnection.Commit;
            finally
              if DataForm2.ADConnection.InTransaction then
              begin
                Dataform2.ADConnection.Rollback;
                showmessage('Something went wrong contact Support!');
              end;
            end;
          end
          else
            showmessage('Invoice are already marked to be send to hq!');
          CreateTransferBtn.SetFocus;
        end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TStockTransferForm.CloseTransferBtnClick(Sender: TObject);
var
      e,e2:Extended;
      MSContinue: Boolean;
begin
    If (DataForm2.StockTrnsferTableClosed.Value = 'False') then
    begin
      MSContinue := True;
      if StrtoBool(Dataform2.GlobalTableNegQty.Value) = true then
      begin
        DataForm2.StocktrnsferItemTable.DisableControls;
        DataForm2.StocktrnsferItemTable.First;
        while not DataForm2.StocktrnsferItemTable.EOF do
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('select Qty from stock_db');
            Add('where TCStockNo = "' + DataForm2.StocktrnsferItemTable.FieldByName('TCStockNo').asString + '"');
            Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
          end;
          Dataform2.Query2.Prepared := True;
          Dataform2.Query2.Open;
          e2 := InvoiceForm.OpenLayBuyQty(DataForm2.StocktrnsferItemTable.FieldByName('TCStockNo').asString,Dataform2.GlobalTableBranchNo.Value);
          If (DataForm2.StocktrnsferItemTableQty.Value > DataForm2.Query2.FieldByName('Qty').asInteger - e2) and (DataForm2.User_db.FieldByName('Rights').asInteger < 5)  then
          begin
            showmessage('Trying to Transfer Stock that is not Available!');
            MSContinue := False;
            break;
          end;

          DataForm2.StocktrnsferItemTable.Next;
        end;
        Dataform2.StocktrnsferItemTable.EnableControls;
      end;
      if MSContinue = True then
      begin
        CloseTransfer;
        showmessage('Closing of Transfer Completed');
      end;
    end
    else
      showmessage('Transfer already closed!');
end;

procedure TStockTransferForm.StockOpen();
var
   StockPlace: Integer;
   HideOutofStockItems:String;
begin
      if CheckBox1.Checked then
        HideOutofStockItems := 'and ((stock_db.Qty > 0.00) or (stock_db.NonStockItem = "True"))'
      else
        HideOutofStockItems := '';

      If Dataform2.StockTable.Active = True then
        StockPlace := Dataform2.StockTableNr.Value
      else
        StockPlace := 0;
      Dataform2.StockTable.Close;
      with Dataform2.StockTable.SQL do
      begin
        Clear;
        Add('select * from stock_db');
        Add('where BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
        Add(HideOutofStockItems);
        Add('order by ' + StockOrder);
      end;
      Dataform2.StockTable.Open;
      If StockPlace <> 0 then
        Dataform2.StockTable.Locate('Nr', InttoStr(StockPlace),[]);
end;

procedure TStockTransferForm.StockTrnsferOpen();
var
      OnlyOpenStr: String;
begin
      If Viewonlyopentransfers1.Checked = True then
        OnlyOpenStr := 'and Sync is null'
      else
        OnlyOpenStr := '';
      dataform2.StockTrnsferTable.Close;
      with Dataform2.StockTrnsferTable.SQL do
      begin
        Clear;
        Add('select * from stocktrnsfer_db');
        Add('where ToBranch = ' + InttoStr(DataForm2.BranchTableNr.Value));
        Add(OnlyOpenStr);
        Add('order by Date Desc');
      end;
      dataform2.StockTrnsferTable.Open;
end;

procedure TStockTransferForm.Viewonlyopentransfers1Click(Sender: TObject);
begin
       StockTrnsferOpen;
       StockTrnsferItemOpen();
end;

procedure TStockTransferForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

procedure TStockTransferForm.StockTrnsferItemOpen();
begin
      dataform2.StockTrnsferItemTable.Close;
      with Dataform2.StockTrnsferItemTable.SQL do
      begin
        Clear;
        Add('select * from stocktrnsferitem_db');
        Add('where LinkID = ' + InttoStr(Dataform2.StockTrnsferTableNr.Value));
        Add('order by Nr');
      end;
      dataform2.StockTrnsferItemTable.Open;
end;

procedure TStockTransferForm.CreateStockItem();
begin
           DataForm2.StocktrnsferItemTable.Append;
           Dataform2.StocktrnsferItemTableLinkID.Value := DataForm2.StockTrnsferTableNr.Value;
           Dataform2.StocktrnsferItemTableStockNo.Value := Dataform2.StockTableNr.Value;
           Dataform2.StocktrnsferItemTableBeforeQty.Value := Dataform2.StockTableQty.Value;
           DataForm2.StocktrnsferItemTableQty.Value := 1;
           DataForm2.StocktrnsferItemTableDescription.Value := Dataform2.StockTableDescription.Value;
           Dataform2.StocktrnsferItemTableTCStockNo.Value := Dataform2.StockTableTCStockNo.Value;
           DataForm2.StocktrnsferItemTable.Post;
           JvDBGrid3.SetFocus;
           JvDBGrid3.Col := 2;
end;

procedure TStockTransferForm.CreateReturnItem();
begin
           DataForm2.StocktrnsferItemTable.Append;
           Dataform2.StocktrnsferItemTableLinkID.Value := DataForm2.StockTrnsferTableNr.Value;
           Dataform2.StocktrnsferItemTableStockNo.Value := Dataform2.StockTableNr.Value;
           Dataform2.StocktrnsferItemTableBeforeQty.Value := Dataform2.StockTableQty.Value;
           DataForm2.StocktrnsferItemTableQty.Value := -1;
           DataForm2.StocktrnsferItemTableDescription.Value := Dataform2.StockTableDescription.Value;
           Dataform2.StocktrnsferItemTableTCStockNo.Value := Dataform2.StockTableTCStockNo.Value;
           DataForm2.StocktrnsferItemTable.Post;
           JvDBGrid3.SetFocus;
           JvDBGrid3.Col := 2;
end;

procedure TStockTransferForm.SearchBarcode();
var
  i: Integer;
begin
  If StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value) = False then
  begin
    DataForm2.StockTable.DisableControls;
    try
    while not DataForm2.StockTable.EOF do
      begin
        for i := 0 to (DataForm2.StockTable.fieldbyname('Barcode').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockTable.fieldbyname('Barcode').asString),i,BarcodeSearch.GetTextLen) = lowercase(BarcodeSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockTable.Next;
      end;
    finally
    DataForm2.StockTable.EnableControls;
    end;
    StopStr := 'No';
  end
  else
  begin
    DataForm2.StockTable.DisableControls;
    try
    while not DataForm2.StockTable.EOF do
      begin
        for i := 0 to (DataForm2.StockTable.fieldbyname('TCStockNo').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockTable.fieldbyname('TCStockNo').asString),i,BarcodeSearch.GetTextLen) = lowercase(BarcodeSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockTable.Next;
      end;
    finally
    DataForm2.StockTable.EnableControls;
    end;
    StopStr := 'No';
  end;
end;

procedure TStockTransferForm.SearchDescription();
var
  i: Integer;
begin
    DataForm2.StockTable.DisableControls;
    try
    while not DataForm2.StockTable.EOF do
      begin
        for i := 0 to (DataForm2.StockTable.fieldbyname('Description').Size - 1) do
        begin
          if copy(lowercase(DataForm2.StockTable.fieldbyname('Description').asString),i,DescriptionSearch.GetTextLen) = lowercase(DescriptionSearch.Text) then
          begin
            StopStr := 'Stop';
            break;
          end;
        end;
        if StopStr = 'Stop' then
          break;
        DataForm2.StockTable.Next;
      end;
    finally
    DataForm2.StockTable.EnableControls;
    end;
    StopStr := 'No';
end;

end.
