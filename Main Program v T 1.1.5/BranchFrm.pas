unit BranchFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Menus, Buttons, JvExButtons, JvBitBtn, DBCtrls,
  JvExStdCtrls, JvEdit, JvExControls, JvSpeedButton, UtilsUnit, db;

type
  TBranchForm = class(TForm)
    GroupBox1: TGroupBox;
    JvEdit1: TJvEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label5: TLabel;
    DBText1: TDBText;
    Button6: TButton;
    JvBitBtn1: TJvBitBtn;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    MainMenu1: TMainMenu;
    Edit1: TMenuItem;
    DeleteAllinvoicesandlaybuysforthisbranch1: TMenuItem;
    ExtraRuns1: TMenuItem;
    FixDuplicateBranchStockatHQ1: TMenuItem;
    JvSpeedButton3: TJvSpeedButton;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure DeleteAllinvoicesandlaybuysforthisbranch1Click(
      Sender: TObject);
    procedure FixDuplicateBranchStockatHQ1Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure JvSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BranchForm: TBranchForm;

implementation
    uses datafrm2, StockSearchFrm, StockTransferFrm, Listsmnu;

{$R *.dfm}

procedure TBranchForm.Button3Click(Sender: TObject);
begin
        if (DataForm2.BranchTablestrState = 'Edit') or (DataForm2.BranchTablestrState = 'Insert') then
        begin
          DataForm2.BranchTable.Post;
//          DataForm2.BranchTable.Refresh;
        end;
        DBEdit1.ReadOnly := True;
        DBEdit2.ReadOnly := True;
        DBEdit3.ReadOnly := True;
        DBEdit4.ReadOnly := True;
        DBEdit5.ReadOnly := True;
        DBEdit6.ReadOnly := True;
        DBEdit7.ReadOnly := True;
end;

procedure TBranchForm.Button4Click(Sender: TObject);
begin
        DBEdit1.ReadOnly := False;
        DBEdit2.ReadOnly := False;
        DBEdit3.ReadOnly := False;
        DBEdit4.ReadOnly := False;
        DBEdit5.ReadOnly := False;
        DBEdit6.ReadOnly := False;
        DBEdit7.ReadOnly := False;
        DBEdit1.SetFocus;
end;

procedure TBranchForm.Button5Click(Sender: TObject);
begin
        Dataform2.BranchTable.Insert;
        DataForm2.BranchTable.FieldByName('Created').asInteger := DatetoIntDate(date);
        DataForm2.BranchTable.FieldByName('LastSync').AsFloat := 0;
        Dataform2.BranchTableStartInvNo.Value := 1;
        DBEdit1.ReadOnly := False;
        DBEdit2.ReadOnly := False;
        DBEdit3.ReadOnly := False;
        DBEdit4.ReadOnly := False;
        DBEdit5.ReadOnly := False;
        DBEdit6.ReadOnly := False;
        DBEdit7.ReadOnly := False;
        DBEdit1.SetFocus;
end;

procedure TBranchForm.FormShow(Sender: TObject);
begin
//        BranchForm.Left := 10;
//        BranchForm.Top := 10;
        DataForm2.BranchTable.Open;
end;

procedure TBranchForm.FixDuplicateBranchStockatHQ1Click(Sender: TObject);
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
            Add('where BranchNo = ' + IntToStr(Dataform2.BranchTableNr.Value));
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

procedure TBranchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        DataForm2.BranchTable.Close;
        BranchForm.FreeOnRelease;
end;

procedure TBranchForm.Button6Click(Sender: TObject);
begin
      Dataform2.Query4.Close;
      with Dataform2.Query4.Sql do
      begin
        Clear;
        Add('select Nr from branch_db');
      end;
      Dataform2.Query4.Open;
      if Dataform2.Query4.RecordCount <> 0 then
      begin
        Application.CreateForm(TStockTransferForm, StockTransferForm);
        StockTransferForm.showmodal;
        StockTransferForm.Free;
      end
      else
        showmessage('There is no branch to do a transfer too!');
      Dataform2.Query4.Close;
end;

procedure TBranchForm.Button1Click(Sender: TObject);
begin
      if not DataForm2.BranchTable.Locate('Name', JvEdit1.Text, [loPartialKey, loCaseInsensitive]) then
        showmessage('Can''t find Branch');
end;

procedure TBranchForm.Button2Click(Sender: TObject);
begin
      if not DataForm2.BranchTable.Locate('Nr', JvEdit1.Text, [loPartialKey, loCaseInsensitive]) then
        showmessage('Can''t find Branch');
end;

procedure TBranchForm.JvBitBtn1Click(Sender: TObject);
begin
            Close;
end;

procedure TBranchForm.JvSpeedButton1Click(Sender: TObject);
begin
      Dataform2.BranchTable.Prior;
end;

procedure TBranchForm.JvSpeedButton2Click(Sender: TObject);
begin
      Dataform2.BranchTable.Next;
end;

procedure TBranchForm.JvSpeedButton3Click(Sender: TObject);
begin
      if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
      begin
          if MessageDlg('Are you sure you want to DELETE this Branch? (NOT REVERSABLE)', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
            Dataform2.Query1.Close;
            with Dataform2.Query1.SQL do
            begin
              Clear;
              Add('select * from stocktrnsfer_db');
              Add('where ToBranch = ' + InttoStr(DataForm2.BranchTableNr.Value));
            end;
            Dataform2.Query1.Open;
            if Dataform2.Query1.RecordCount = 0 then
            begin
              Dataform2.BranchTable.Delete;
            end
            else
              showmessage('Branch already have transfers, can''t delete branch!');
            Dataform2.Query1.Close;
          end;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TBranchForm.DeleteAllinvoicesandlaybuysforthisbranch1Click(
  Sender: TObject);
var
    i: Integer;
begin
  if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
  begin
    if MessageDlg('Are you sure you want to DELETE all Branch Invoices and Purchase orders! (NOT REVERSABLE)', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Application.CreateForm(TListsMenu, ListsMenu);
      Dataform2.InvoiceTable.Close;
      with Dataform2.InvoiceTable.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
      end;
      Dataform2.InvoiceTable.Open;
      Dataform2.InvoiceTable.DisableControls;
      Dataform2.InvoiceTable.First;
      ListsMenu.JvProgressDialog1.Caption := 'Processing!!';
      ListsMenu.JvProgressDialog1.Show;
      ListsMenu.JvProgressDialog1.Max := DataForm2.InvoiceTable.RecordCount;
      i := 0;
      ListsMenu.JvProgressDialog1.Position := 0;
      while not Dataform2.InvoiceTable.EOF do
      begin
        If (DataForm2.InvoiceTableBranchNo.Value = Dataform2.BranchTableNr.Value) then
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
            Add('Delete FROM trans_db');
            Add('WHERE LinkId = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('InvNo').asInteger));
            Add('and BranchNo = ' + inttostr(DataForm2.InvoiceTable.fieldbyname('BranchNo').asInteger));
            Add('and TransType = ''L''');
          end;
          DataForm2.Query1.ExecSQL;
          with DataForm2.Query1.SQL do begin
            Clear;
            Add('Update invoice_db set ShiftSet = ''Delete''');
            Add('where Nr = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          end;
          Dataform2.Query1.ExecSQL;
        end;
        Inc(i);
        ListsMenu.JvProgressDialog1.Position := i;
        ListsMenu.JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(ListsMenu.JvProgressDialog1.Max);
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
      ListsMenu.JvProgressDialog1.Hide;
      ListsMenu.FreeOnRelease;
    end;
  end
  else
    showmessage('You don''t have permission to go in here!');
end;

end.
