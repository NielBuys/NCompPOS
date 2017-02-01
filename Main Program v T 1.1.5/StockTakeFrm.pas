unit StockTakeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, JvExButtons, JvBitBtn, DBGrids,
  JvExDBGrids, JvDBGrid, UtilsUnit, db;

type
  TStockTakeForm = class(TForm)
    StockTakeGrid: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    NewStockTakeBtn: TJvBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NewStockTakeBtnClick(Sender: TObject);
    procedure StockTakeGridDblClick(Sender: TObject);
    procedure StockTakeGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
  private
    procedure OpenStockTake;
    { Private declarations }
  public
    FormFromWhere: String;
    SelectedStockTake: Integer;
    { Public declarations }
  end;

var
  StockTakeForm: TStockTakeForm;
  StockTakeOrder: String;

implementation
        uses Datafrm2, StockTakeDetailFrm;

{$R *.dfm}

procedure TStockTakeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
          Dataform2.Stocktaketable.Close;
end;

procedure TStockTakeForm.FormShow(Sender: TObject);
begin
          StockTakeOrder := 'StockTakeDate desc';
          OpenStockTake();
          if FormFromWhere = 'Normal' then
          begin
            NewStockTakeBtn.Visible := True;
          end
          else
          begin
            NewStockTakeBtn.Visible := False;
          end;
end;

procedure TStockTakeForm.NewStockTakeBtnClick(Sender: TObject);
begin
          Dataform2.Stocktaketable.Insert;
          Dataform2.StocktaketableStockTakeDate.Value := DatetoIntdate(now);
          Dataform2.StocktaketableStockTakeStatus.value := 'In Process';
          StockTakeDetailForm.Stocktakedate.date := now;
          StockTakeDetailForm.showmodal;
end;

procedure TStockTakeForm.StockTakeGridDblClick(Sender: TObject);
begin
        if FormFromWhere = 'Normal' then
        begin
          if Dataform2.StockTakeTable.RecordCount = 0 then
          begin
            showmessage('Nothing to open');
            exit;
          end;
          StockTakeDetailForm.Stocktakedate.date := StrtoDate(IntDatetoString(Dataform2.StocktaketableStockTakeDate.Value));
          StockTakeDetailForm.showmodal;
        end
        else
        begin
          SelectedStockTake := Dataform2.StocktaketableStockTakeID.Value;
          Close;
        end;
end;

procedure TStockTakeForm.StockTakeGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if StockTakeOrder <> FieldStore then
      begin
        StockTakeOrder := FieldStore;
        OpenStockTake();
      end
      else
      begin
        StockTakeOrder := FieldStore + ' Desc';
        OpenStockTake();
      end;
end;

procedure TStockTakeForm.OpenStockTake();
begin
          Dataform2.StockTakeTable.Close;
          with Dataform2.StockTakeTable.SQL do
          begin
            Clear;
            Add('select * from stocktake');
            Add('order by ' + StockTakeOrder);
          end;
          Dataform2.StockTakeTable.Open;
end;

end.
