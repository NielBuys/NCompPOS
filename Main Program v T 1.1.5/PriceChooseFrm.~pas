unit PriceChooseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExButtons, JvBitBtn;

type
  TPriceChooseForm = class(TForm)
    Price1: TJvBitBtn;
    Price2: TJvBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure Price1Click(Sender: TObject);
    procedure Price2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PriceChooseForm: TPriceChooseForm;

implementation
    uses Datafrm2, InvoiceFrm;

{$R *.dfm}

procedure TPriceChooseForm.Price1Click(Sender: TObject);
begin
    InvoiceForm.ItemSalesPrice := DataForm2.StockTableSalesPrice.Value;
    Close;
end;

procedure TPriceChooseForm.Price2Click(Sender: TObject);
begin
    InvoiceForm.ItemSalesPrice := DataForm2.StockTableSalesPrice2.Value;
    Close;
end;

end.
