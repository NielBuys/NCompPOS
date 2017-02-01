unit StockListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QRCtrls, QuickRpt;

type
  TStockListForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StockListForm: TStockListForm;

implementation
      uses DataFrm2, StockFrm,InvoiceFrm;

{$R *.dfm}

procedure TStockListForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        If (Dataform2.Query3.FieldByName('BranchNo').asInteger = 0) then
        begin
          QRLabel6.Caption := Floattostrf(StockForm.PurchasedQty(Dataform2.Query3.FieldByName('TCStockNo').asString) - StockForm.SoldHqQty(Dataform2.Query3.FieldByName('TCStockNo').asString) - (StockForm.BranchQty(Dataform2.Query3.FieldByName('TCStockNo').asString) + StockForm.BranchAdjustments(Dataform2.Query3.FieldByName('TCStockNo').asString)) - InvoiceForm.OpenLayBuyQty(Dataform2.Query3.FieldByName('TCStockNo').asString,Dataform2.Query3.FieldByName('BranchNo').asInteger) + StockForm.Adjustments(Dataform2.Query3.FieldByName('TCStockNo').asString),ffFixed,17,0);
        end;
end;

end.
