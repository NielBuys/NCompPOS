unit InvAdvFindFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UtilsUnit, StdCtrls, Buttons, JvExButtons, JvBitBtn,
  ComCtrls, JvExComCtrls, JvDateTimePicker, JvExDBGrids, JvDBGrid, DateUtils,
  JvExControls, JvSpeedButton, JvComponentBase, JvDBGridExport, db,
  JvExStdCtrls, JvCheckBox;

type
  TInvAdvFindForm = class(TForm)
    JvBitBtn2: TJvBitBtn;
    SearchData: TEdit;
    JvBitBtn3: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    JvBitBtn5: TJvBitBtn;
    JvBitBtn6: TJvBitBtn;
    Label3: TLabel;
    Fromdate: TJvDateTimePicker;
    Label4: TLabel;
    ToDate: TJvDateTimePicker;
    JvBitBtn1: TJvBitBtn;
    JvSpeedButton1: TJvSpeedButton;
    CSVExport: TJvDBGridCSVExport;
    SaveDialog1: TSaveDialog;
    PageControl1: TPageControl;
    InvoiceSearchPage: TTabSheet;
    InvoiceListGrid: TJvDBGrid;
    InvoiceItemSearchPage: TTabSheet;
    InvoiceItemListGrid: TJvDBGrid;
    HideOpenInvoicesTick: TJvCheckBox;
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure JvBitBtn5Click(Sender: TObject);
    procedure JvBitBtn6Click(Sender: TObject);
    procedure InvoiceListGridDblClick(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure InvoiceListGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure InvoiceItemListGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure InvoiceItemListGridDblClick(Sender: TObject);
  private
    procedure SearchInvoiceOpen;
    { Private declarations }
  public
    { Public declarations }
    FromWhere:String;
  protected
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  InvAdvFindForm: TInvAdvFindForm;
  FromWhereLine:String;
  DateLine:String;
  SearchLine:String;
  InvOrder, InvItemOrder:String;

implementation
        uses Datafrm2, InvoiceFrm, MainFrm;

{$R *.dfm}

procedure TInvAdvFindForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE)
    then SendMessage(Application.Handle,
                     Message.Msg,
                     TMessage(Message).WParam,
                     TMessage(Message).WParam)
    else inherited;
end;

procedure TInvAdvFindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        if (InvoiceForm.Visible <> True) and (FromWhere = 'MainFormInvoice') then
          MainForm.Show;
end;

procedure TInvAdvFindForm.FormCreate(Sender: TObject);
begin
        InvAdvFindForm.WindowState := wsMaximized;
        InvOrder := 'InvDate desc';
        InvItemOrder := 'InvDate desc';
end;

procedure TInvAdvFindForm.FormShow(Sender: TObject);
begin
        Fromdate.Date := Startofthemonth(date);
        ToDate.Date := Endofthemonth(date);
end;

procedure TInvAdvFindForm.JvBitBtn1Click(Sender: TObject);
begin
        DateLine := 'and (InvDate >= ' + InttoStr(DatetoIntDate(FromDate.Date)) + ') and (InvDate <= ' + InttoStr(DatetoIntDate(ToDate.Date)) + ')';
        SearchInvoiceOpen();
end;

procedure TInvAdvFindForm.JvBitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TInvAdvFindForm.JvBitBtn3Click(Sender: TObject);
begin
      DateLine := '';
      SearchLine := 'and (InvNo = ' + SearchData.Text + ')';
      SearchInvoiceOpen();
end;

procedure TInvAdvFindForm.JvBitBtn4Click(Sender: TObject);
begin
      DateLine := '';
      SearchLine := 'and (ClientName LIKE "%' + SearchData.Text + '%")';
      SearchInvoiceOpen();
end;

procedure TInvAdvFindForm.JvBitBtn5Click(Sender: TObject);
begin
      DateLine := '';
      SearchLine := 'and (ClientTelC LIKE "%' + SearchData.Text + '%")';
      SearchInvoiceOpen();
end;

procedure TInvAdvFindForm.JvBitBtn6Click(Sender: TObject);
begin
      DateLine := '';
      SearchLine := 'and (ClientEMail LIKE "%' + SearchData.Text + '%")';
      SearchInvoiceOpen();
end;

procedure TInvAdvFindForm.InvoiceItemListGridDblClick(Sender: TObject);
begin
    if (Fromwhere = 'Invoice') or (FromWhere = 'MainFormInvoice') then
    begin
      InvoiceForm.FindInvEdit.Text := InttoStr(Dataform2.InvItemAdvFindQueryInvNo.asInteger);
      InvoiceForm.JvSpinEdit1.Text := InttoStr(Dataform2.InvItemAdvFindQueryBranchNo.AsInteger);
      InvoiceForm.ShowmoreInvoicesthan30days1.Checked := True;
      InvoiceForm.OpenInvoices();
      InvoiceForm.JvBitBtn3.Click;
      If (FromWhere <> 'MainFormInvoice') then
        InvoiceForm.JvSpeedButton10.Click
      else
      begin
        InvoiceForm.FromWhereFormOpen := 'InvFind';
        InvoiceForm.Show;
        InvAdvFindForm.Hide;
      end;
      Close;
    end;
end;

procedure TInvAdvFindForm.InvoiceItemListGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if InvItemOrder <> FieldStore then
      begin
        InvItemOrder := FieldStore;
        SearchInvoiceOpen();
      end
      else
      begin
        InvItemOrder := FieldStore + ' Desc';
        SearchInvoiceOpen();
      end;
end;

procedure TInvAdvFindForm.JvSpeedButton1Click(Sender: TObject);
begin
      if PageControl1.TabIndex = 0 then
      begin
        if SaveDialog1.Execute then
        begin
          CSVExport.Grid := InvoiceListGrid;
          CSVExport.Filename := SaveDialog1.Filename;
          CSVExport.ExportGrid;
        end;
      end;
      if PageControl1.TabIndex = 1 then
      begin
        if SaveDialog1.Execute then
        begin
          CSVExport.Grid := InvoiceItemListGrid;
          CSVExport.Filename := SaveDialog1.Filename;
          CSVExport.ExportGrid;
        end;
      end;
end;

procedure TInvAdvFindForm.InvoiceListGridDblClick(Sender: TObject);
begin
    if (Fromwhere = 'Invoice') or (FromWhere = 'MainFormInvoice') then
    begin
      InvoiceForm.FindInvEdit.Text := InttoStr(Dataform2.InvAdvFindQueryInvNo.asInteger);
      InvoiceForm.JvSpinEdit1.Text := InttoStr(Dataform2.InvAdvFindQueryBranchNo.AsInteger);
      InvoiceForm.ShowmoreInvoicesthan30days1.Checked := True;
      InvoiceForm.OpenInvoices();
      InvoiceForm.JvBitBtn3.Click;
      If (FromWhere <> 'MainFormInvoice') then
        InvoiceForm.JvSpeedButton10.Click
      else
      begin
        InvoiceForm.FromWhereFormOpen := 'InvFind';
        InvoiceForm.Show;
        InvAdvFindForm.Hide;
      end;
      Close;
    end;
end;

procedure TInvAdvFindForm.InvoiceListGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
      FieldStore:String;
begin
      FieldStore := Field.FieldName;
      if InvOrder <> FieldStore then
      begin
        InvOrder := FieldStore;
        SearchInvoiceOpen();
      end
      else
      begin
        InvOrder := FieldStore + ' Desc';
        SearchInvoiceOpen();
      end;
end;

procedure TInvAdvFindForm.SearchInvoiceOpen();
begin
      if (FromWhere = 'Invoice') or (FromWhere = 'MainFormInvoice') then
      begin
        if HideOpenInvoicesTick.Checked = False then
          FromWhereLine := 'where ((InvClose="Open") or (InvClose="Close") or (InvClose="LaybO") or (InvClose="LaybC"))'
        else
          FromWhereLine := 'where ((InvClose="Close") or (InvClose="LaybO") or (InvClose="LaybC"))';
      end
      else
      begin
        if HideOpenInvoicesTick.Checked = False then
          FromWhereLine := 'where (InvClose="PurcC")'
        else
          FromWhereLine := 'where (InvClose="PurcO" or InvClose="PurcC")';
      end;
      Dataform2.InvAdvFindQuery.Close;
      with Dataform2.InvAdvFindQuery.SQL do
      begin
        Clear;
        Add('select * from invoice_db');
        Add(FromWhereLine);
        Add(DateLine);
        Add(SearchLine);
        Add('order by ' + InvOrder);
      end;
      Dataform2.InvAdvFindQuery.Open;
      Dataform2.InvItemAdvFindQuery.Close;
      with Dataform2.InvItemAdvFindQuery.SQL do
      begin
        Clear;
        Add('select invoice_db.InvNo, invoice_db.BranchNo, invoice_db.InvDate, invoice_db.ClientName, invoiceitem_db.TCStockNo, invoiceitem_db.Description, invoiceitem_db.Price as SellingPrice, invoiceitem_db.Discount, invoiceitem_db.Qty as QtySold,');
        Add('invoiceitem_db.CostPrice from invoiceitem_db');
        Add('inner join invoice_db on invoice_db.Nr = invoiceitem_db.LinkId and invoice_db.BranchNo = invoiceitem_db.BranchNo');
        Add(FromWhereLine);
        Add(DateLine);
        Add(SearchLine);
        Add('order by ' + InvItemOrder);
      end;
      Dataform2.InvItemAdvFindQuery.Open;
end;

end.
