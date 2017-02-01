unit grnfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, JvExButtons, JvBitBtn,
  JvExDBGrids, JvDBGrid, JvExControls, JvSpeedButton;

type
  TGrnForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    JvSpeedButton1: TJvSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBGrid1Exit(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GrnForm: TGrnForm;

implementation
   uses Datafrm2;

{$R *.dfm}

procedure TGrnForm.FormShow(Sender: TObject);
begin
        Dataform2.GRNTable.Close;
        with Dataform2.GRNTable.SQL do
        begin
          Clear;
          Add('select Nr, TCStockNo, Description, Qty, Price2, CostPrice from invoiceitem_db');
          Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
          Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
        end;
        Dataform2.GRNTable.Open;
        JvDBGrid1.Columns.Items[0].Visible := False;
        JvDBGrid1.Columns.Items[1].ReadOnly := True;
        JvDBGrid1.Columns.Items[2].ReadOnly := True;
        JvDBGrid1.Columns.Items[3].ReadOnly := True;
end;

procedure TGrnForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Dataform2.GRNTable.Close;
//        Dataform2.PurchaseItemTable.Refresh;
end;

procedure TGrnForm.JvDBGrid1Exit(Sender: TObject);
begin
        if (DataForm2.GRNTablestrState = 'Edit') or (DataForm2.GRNTablestrState = 'Insert') then
        begin
          try
            DataForm2.GRNTable.Post;
          except
            on E : Exception do
              showmessage(E.Message);
          end;
        end;
end;

procedure TGrnForm.JvSpeedButton1Click(Sender: TObject);
begin
        DataForm2.GRNTable.Cancel;
end;

end.
