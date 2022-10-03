unit StockEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExButtons, JvBitBtn, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvExStdCtrls, JvEdit, DBCtrls, Mask, JvExControls,
  JvSpeedButton, ComCtrls, JvExComCtrls, JvComCtrls,UtilsUnit, StockUtils;

type
  TStockEditForm = class(TForm)
    JvPageControl1: TJvPageControl;
    TabSheet1: TTabSheet;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    JvSpeedButton2: TJvSpeedButton;
    DBText3: TDBText;
    DBText4: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBText5: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit7: TDBEdit;
    CheckBox1: TCheckBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    CloseAndCancelButton: TJvBitBtn;
    CloseAndSaveButton: TJvBitBtn;
    DBCheckBox2: TDBCheckBox;
    Label27: TLabel;
    Label28: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    TabSheet2: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    JvEdit1: TJvEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBText8: TDBText;
    Label31: TLabel;
    procedure CloseAndCancelButtonClick(Sender: TObject);
    procedure CloseAndSaveButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvEdit1Change(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
  private
    procedure ShowHQQtyLeft;
    procedure NonStockItemdisable;
    procedure ShowHistory;
    procedure SetReadOnly;
    procedure SetWritable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StockEditForm: TStockEditForm;
  AttentionDStr, AttentionTStr: String;
  StartEditQty: Extended;
  DoNotRun:Boolean;

implementation
      uses Datafrm2,StockFrm,InvoiceFrm;

{$R *.dfm}

procedure TStockEditForm.DBCheckBox1Click(Sender: TObject);
begin
       NonStockItemdisable();
end;

procedure TStockEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Dataform2.StockHistoryTable.Close;
end;

procedure TStockEditForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
      if (DataForm2.StockTablestrState = 'Edit') or (DataForm2.StockTablestrState = 'Insert') then
      begin
        if MessageDlg('Do you want to exit without saving?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          DataForm2.StockTable.Cancel;
        end
        else
          CanClose := False;
      end;
end;

procedure TStockEditForm.FormShow(Sender: TObject);
var
  CalculatedItemQty: Extended;
begin
        DoNotRun := True;
        ShowHQQtyLeft();
        NonStockItemdisable();
        CalculatedItemQty := GetStockItemQtyFromHistory(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        if CalculatedItemQty <> Dataform2.StockTableQty.Value then
        begin
          SetStockItemQtyFromHistory(CalculatedItemQty);
        end;
        showhistory();
        if Dataform2.StockTableBranchNo.Value <> Dataform2.GlobalTableBranchNo.Value then
          JvEdit1.Enabled := False;
        if DataForm2.User_db.FieldByName('Rights').asInteger > 4 then
          setWritable
        else
          setReadOnly;
        DoNotRun := False;
end;

procedure TStockEditForm.CloseAndCancelButtonClick(Sender: TObject);
begin
        Close;
end;

procedure TStockEditForm.CloseAndSaveButtonClick(Sender: TObject);
var
      QtyValue:extended;
begin
        try
          QtyValue := strtofloat(JvEdit1.Text);
        except
        begin
          showmessage('Invalid Qty entered!');
          exit;
        end;
        end;
        if (DataForm2.StockTablestrState = 'Edit') or (DataForm2.StockTablestrState = 'Insert') then
        begin
          DataForm2.StockTable.FieldByName('DateChanged').asInteger := DatetoIntDate(date);
          try
            DataForm2.StockTable.Post;
          except
            on E : Exception do
              showmessage(E.Message);
          end;
          If Dataform2.StockTableTCStockNo.Value = '' then
          begin
            Dataform2.StockTable.Edit;
            If StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'StockNoFormat2', '0')) = True then
              Dataform2.StockTableTCStockNo.Value := Trimspaces(Uppercase(copy(Dataform2.StockTableDescription.Value,1,2))) + InttoStr(DataForm2.StockTableNr.Value)
            else
              Dataform2.StockTableTCStockNo.Value := InttoStr(DataForm2.StockTableNr.Value);
            Dataform2.StockTable.Post;
            AdjustLocalStockQty('Adj',0,QtyValue);
          end
          else
          begin
            AttentionDStr := '0';
            AttentionTStr := '';
            DataForm2.Query1.Close;
            with DataForm2.Query1.SQL do
            begin
              Clear;
              Add('insert into notes_db(Date,LinkID,FromWhere,Description,AttentionDate,NoteBy,Completed,AttentionTime) values ');
              Add('(' + InttoStr(DatetoIntDate(date)) + ',' + Inttostr(DataForm2.StockTableNr.Value) + ',"S","Stock Item Edited (' + Dataform2.StockTableTCStockNo.Value + ')",' + AttentionDStr + ',"' + DataForm2.User_db.Fieldbyname('UserName').AsString + '","False","' + AttentionTStr + '")');
            end;
            DataForm2.Query1.ExecSQL;
            if QtyValue <> StartEditQty then
            begin
              AdjustLocalStockQty('Adj',StartEditQty,QtyValue);
            end;
          end;
        end;
        Close;
end;

procedure TStockEditForm.JvEdit1Change(Sender: TObject);
begin
         if Donotrun = False then
           Dataform2.StockTable.Edit;
end;

procedure TStockEditForm.JvSpeedButton2Click(Sender: TObject);
begin
          StockForm.PrintBarcode(CheckBox1.Checked);
end;

procedure TStockEditForm.ShowHQQtyLeft();
var
      PurchasedQtyAmm,SoldQtyAmm,BranchQtyAmm,OpenLayBuyQtyAmm:Extended;
      AdjustedQtyAmm:Extended;
begin
//      if Dataform2.GlobalTableBranchNo.Value = 0 then
//      begin
        PurchasedQtyAmm := StockForm.PerBranchPurchasedQTY(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        Label24.Caption := Floattostr(PurchasedQtyAmm);
        SoldQtyAmm := StockForm.PerBranchSoldQTY(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        Label22.Caption := Floattostr(SoldQtyAmm);
        BranchQtyAmm := StockForm.PerBranchBranchTransferQTY(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        Label18.Caption := Floattostr(BranchQtyAmm);
        OpenLayBuyQtyAmm := InvoiceForm.OpenLayBuyQty(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        Label20.Caption := Floattostr(OpenLayBuyQtyAmm);
        AdjustedQtyAmm := StockForm.PerBranchAdjustments(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
        if AdjustedQtyAmm < 0 then
        begin
          Label29.Caption := '- Adj';
          Label30.Caption := FloattoStr(AdjustedQtyAmm * -1);
        end
        else
        begin
          Label29.Caption := '+ Adj';
          Label30.Caption := FloattoStr(AdjustedQtyAmm);
        end;
        Label16.Caption := Floattostr(PurchasedQtyAmm - SoldQtyAmm - OpenLayBuyQtyAmm - BranchQtyAmm + AdjustedQtyAmm);
        StartEditQty := strtoFloat(Label16.Caption);
        JvEdit1.Text := Label16.Caption;
end;

procedure TStockEditForm.NonStockItemdisable();
begin
        if Dataform2.StockTableNonStockItem.Value = 'True' then
        begin
          Label4.Enabled := False;
          JvEdit1.Enabled := False;
          Label6.Enabled := False;
          DBEdit6.Enabled := False;
          Label7.Enabled := False;
          DBEdit7.Enabled := False;
        end
        else
        begin
          Label4.Enabled := True;
          JvEdit1.Enabled := True;
          Label6.Enabled := True;
          DBEdit6.Enabled := True;
          Label7.Enabled := True;
          DBEdit7.Enabled := True;
        end;
end;

procedure TStockEditForm.ShowHistory();
begin
      OpenStockItemHistory(Dataform2.StockTableTCStockNo.Value,Dataform2.StockTableBranchNo.Value);
end;

procedure TStockEditForm.SetReadOnly();
begin
          DBEdit1.ReadOnly := True;
          DBEdit8.Readonly := True;
          DBEdit2.ReadOnly := True;
          DBEdit3.ReadOnly := True;
          DBEdit9.ReadOnly := True;
          JvEdit1.ReadOnly := True;
          DBEdit6.ReadOnly := True;
          DBEdit7.ReadOnly := True;
          DBCheckbox2.ReadOnly := True;
          DBCheckBox1.ReadOnly := True;
          DBEdit5.ReadOnly := True;
          DBEdit10.ReadOnly := True;
          DBEdit11.ReadOnly := True;
          CloseAndSaveButton.Enabled := False;
end;

procedure TStockEditForm.SetWritable();
begin
          DBEdit1.ReadOnly := False;
          DBEdit8.Readonly := False;
          DBEdit2.ReadOnly := False;
          DBEdit3.ReadOnly := False;
          DBEdit9.ReadOnly := False;
          JvEdit1.ReadOnly := False;
          DBEdit6.ReadOnly := False;
          DBEdit7.ReadOnly := False;
          DBCheckbox2.ReadOnly := False;
          DBCheckBox1.ReadOnly := False;
          DBEdit5.ReadOnly := False;
          DBEdit10.ReadOnly := False;
          DBEdit11.ReadOnly := False;
          CloseAndSaveButton.Enabled := True;
end;

end.
