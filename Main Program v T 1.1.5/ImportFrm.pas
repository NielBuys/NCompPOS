unit ImportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvDialogs, DB, JvCsvData, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvExButtons, JvBitBtn, UtilsUnit;

type
  TImportForm = class(TForm)
    ImportSource: TJvDataSource;
    JvBitBtn1: TJvBitBtn;
    Import: TJvCsvDataSet;
    JvDBGrid1: TJvDBGrid;
    JvBitBtn2: TJvBitBtn;
    JvOpenDialog1: TJvOpenDialog;
    JvBitBtn3: TJvBitBtn;
    procedure JvBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportForm: TImportForm;

implementation

uses DataFrm2, PurchaseFrm;

{$R *.dfm}

procedure TImportForm.JvBitBtn2Click(Sender: TObject);
begin

        if JvOpenDialog1.Execute then
        begin
          If Import.Active = True then
            Import.Active := false;
          Import.FileName := JvOpenDialog1.FileName;
          Import.Active := True;
        end;
end;

procedure TImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Import.Close;
        ImportForm.freeonRelease;
end;

procedure TImportForm.JvBitBtn3Click(Sender: TObject);
var
      SuppCodeStr: String;
      CountInt: Integer;
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) then
      begin
        if MessageDlg('Are you sure you want to import the Stock?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Import.DisableControls;
          Import.Sort('"SuppCode"',True);
          SuppCodeStr := '';
          Import.first;
          try
            while not Import.EOF do
            begin
              If (SuppCodeStr <> Import.FieldByName('"SuppCode"').AsString) and (SuppCodeStr <> '') then
              begin
                DataForm2.InvoiceTable.Insert;
                DataForm2.InvoiceTableClientName.Value := 'Creditor Name';
                DataForm2.InvoiceTable.FieldByName('InvDate').AsInteger := datetoIntDate(date);
                DataForm2.InvoiceTable.FieldByName('GLDebNo').asString := '';
                DataForm2.InvoiceTable.FieldByName('InvBy').asString := Dataform2.User_db.Fieldbyname('UserName').asString;
                Dataform2.InvoiceTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
                DataForm2.InvoiceTable.FieldByName('InvClose').asString := 'PurcO';
                DataForm2.InvoiceTableShiftSet.Value := '';
                PurchaseForm.SaveInvoice;
                DataForm2.InvoiceTable.Post;
              end;
              Dataform2.StockTable.Append;
              Dataform2.StockTableDescription.Value := Import.FieldbyName('"Description"').asString;
              Dataform2.StockTableDateCreated.Value := datetointdate(date);
              Dataform2.StockTableGroup.Value := Import.FieldbyName('"MatlCat"').AsString;
              Dataform2.StockTableBarcode.Value := Import.FieldbyName('"MatID"').AsString;
              Dataform2.StockTableCostPrice.Value := Import.FieldbyName('"CostPrice1"').AsFloat;
              Dataform2.StockTableAlertQty.Value := Import.FieldbyName('"ReorderLevel"').AsFloat;
              Dataform2.StockTableNonStockItem.Value := 'False';
              Dataform2.StockTablest_created_by.Value := DataForm2.User_dbUserName.Value;
              Dataform2.StockTablest_changed_by.Value := Dataform2.User_dbUserName.value;
              Dataform2.StockTableBranchNo.Value := Dataform2.GlobalTableBranchNo.Value;
              Dataform2.StockTablest_nontaxitem.Value := 'False';
              Dataform2.StockTable.Post;
//              Dataform2.StockTable.Refresh;
              Dataform2.StockTable.Edit;
              Dataform2.StockTableTCStockNo.Value := TrimSpaces(Uppercase(copy(Dataform2.StockTableDescription.asString,1,2))) + InttoStr(Dataform2.StockTableNr.Value);
              Dataform2.StockTable.Post;
              Import.Next;
            end;
          finally
          end;
          Import.EnableControls;
        end;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

end.
