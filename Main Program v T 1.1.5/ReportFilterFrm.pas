unit ReportFilterFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExButtons, JvBitBtn, CheckLst, JvExCheckLst,
  JvCheckListBox, ComCtrls, JvExComCtrls, JvDateTimePicker,DateUtils;

type
  TReportFilterForm = class(TForm)
    PageControl: TPageControl;
    TabSheetFilter1: TTabSheet;
    FilterList1: TJvCheckListBox;
    SelectAllCheckList1: TCheckBox;
    JvBitBtn1: TJvBitBtn;
    TabSheetFilter2: TTabSheet;
    FilterList2: TJvCheckListBox;
    SelectAllCheckList2: TCheckBox;
    TabSheetFilter3: TTabSheet;
    FilterList3: TJvCheckListBox;
    SelectAllCheckList3: TCheckBox;
    DateRangebox: TGroupBox;
    FromDate: TJvDateTimePicker;
    ToDate: TJvDateTimePicker;
    procedure SelectAllCheckList1Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure SelectAllCheckList2Click(Sender: TObject);
    procedure SelectAllCheckList3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PopulateStockFilter1;
    procedure PopulateBranchFilter2;
    procedure PopulateContactCategoriesFilter3;
    function CreateBranchList2: String;
    function CreateContactRolesList2: String;
    function CreateStockList1: String;
    { Public declarations }
  end;

var
  ReportFilterForm: TReportFilterForm;

implementation
    uses Datafrm2;

{$R *.dfm}

procedure TReportFilterForm.SelectAllCheckList1Click(Sender: TObject);
begin
          if SelectAllCheckList1.Checked then
            Filterlist1.CheckAll
          else
            FilterList1.UnCheckAll;
end;

procedure TReportFilterForm.SelectAllCheckList2Click(Sender: TObject);
begin
          if SelectAllCheckList2.Checked then
            Filterlist2.CheckAll
          else
            FilterList2.UnCheckAll;
end;

procedure TReportFilterForm.SelectAllCheckList3Click(Sender: TObject);
begin
          if SelectAllCheckList3.Checked then
            Filterlist3.CheckAll
          else
            FilterList3.UnCheckAll;
end;

procedure TReportFilterForm.JvBitBtn1Click(Sender: TObject);
begin
          Close;
end;

procedure TReportFilterForm.PopulateStockFilter1();
begin
          TabsheetFilter1.Enabled := True;
          TabsheetFilter1.Caption := 'Choose Stock Item';
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('SELECT DISTINCT Description, TCStockNo FROM stock_db');
            Add('order by Description, BranchNo, TCStockNo');
          end;
          Dataform2.Query1.Open;
          try
            DataForm2.Query1.First;
            FilterList1.Items.Clear;
            while not DataForm2.Query1.EOF do
            begin
              FilterList1.Items.Add(Dataform2.Query1.FieldByName('Description').asString + ' [' + Dataform2.Query1.FieldByName('TCStockNo').asString + ']');
              DataForm2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.Close;
          SelectAllCheckList1.Checked := False;
end;

procedure TReportFilterForm.PopulateBranchFilter2();
begin
          TabsheetFilter2.Enabled := True;
          TabsheetFilter2.Caption := 'Choose Branch';
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select * from (');
            Add('select Nr, Name from branch_db');
            Add('union');
            Add('select 0,''HQ'' from branch_db) as Branch');
            Add('order by Name');
          end;
          Dataform2.Query1.Open;
          try
            DataForm2.Query1.First;
            FilterList2.Items.Clear;
            while not DataForm2.Query1.EOF do
            begin
              FilterList2.Items.Add(Dataform2.Query1.FieldByName('Name').asString + ' [' + InttoStr(Dataform2.Query1.FieldByName('Nr').asInteger) + ']');
              DataForm2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.Close;
          SelectAllCheckList2.Checked := False;
end;

procedure TReportFilterForm.PopulateContactCategoriesFilter3();
begin
          TabsheetFilter3.Enabled := True;
          TabsheetFilter3.Caption := 'Choose Category';
          Dataform2.Query1.Close;
          with Dataform2.Query1.SQL do
          begin
            Clear;
            Add('select cat_name, cat_id from egw_categories');
            Add('where cat_appname = ''addressbook''');
            Add('order by cat_name');
          end;
          Dataform2.Query1.Open;
          try
            DataForm2.Query1.First;
            FilterList3.Items.Clear;
            while not DataForm2.Query1.EOF do
            begin
              FilterList3.Items.Add(Dataform2.Query1.FieldByName('cat_name').asString + ' [' + InttoStr(Dataform2.Query1.FieldByName('cat_id').AsInteger) + ']');
              DataForm2.Query1.Next;
            end;
          finally
          end;
          Dataform2.Query1.Close;
          SelectAllCheckList3.Checked := True;
end;

function TReportFilterForm.CreateStockList1():String;
var
        I, pos1, pos2: Integer;
        S: String;
begin
          s := '';
          for I := 0 to FilterList1.Count - 1 do
          begin
            if FilterList1.Checked[I] then
            begin
              pos1 := pos('[',FilterList1.Items[I]);
              pos2 := pos(']',FilterList1.Items[I]);
              if s = '' then
                  s := '''' + copy(FilterList1.Items[I],pos1+1,pos2-pos1-1) + ''''
                else
                  s := s + ',''' + copy(FilterList1.Items[I],pos1+1,pos2-pos1-1) + '''';
            end;
          end;
          if s = '' then
          begin
            s := 'select distinct TCStockNo from stock_db';
          end;
          CreateStockList1 := s;
end;

function TReportFilterForm.CreateBranchList2():String;
var
        I, pos1, pos2: Integer;
        S: String;
begin
          s := '';
          for I := 0 to FilterList2.Count - 1 do
          begin
            if FilterList2.Checked[I] then
            begin
              pos1 := pos('[',FilterList2.Items[I]);
              pos2 := pos(']',FilterList2.Items[I]);
              if s = '' then
                  s := copy(FilterList2.Items[I],pos1+1,pos2-pos1-1)
                else
                  s := s + ',' + copy(FilterList2.Items[I],pos1+1,pos2-pos1-1);
            end;
          end;
          if s = '' then
          begin
            s := 'select * from (select Nr from branch_db union select 0 from branch_db) as Branch';
          end;
          CreateBranchList2 := s;
end;

function TReportFilterForm.CreateContactRolesList2():String;
var
        I: Integer;
        S: String;
begin
          s := '';
          for I := 0 to FilterList2.Count - 1 do
          begin
            if FilterList2.Checked[I] then
            begin
              if s = '' then
                  s := s + '"' + FilterList2.Items[I] + '"'
                else
                  s := s + ',"' + FilterList2.Items[I] + '"';
            end;
          end;
          CreateContactRolesList2 := s;
end;

procedure TReportFilterForm.FormShow(Sender: TObject);
begin
          if TabsheetFilter1.Caption = 'Filter1' then
            ReportFilterForm.PageControl.Pages[0].TabVisible := False;
          if TabsheetFilter2.Caption = 'Filter2' then
            ReportFilterForm.PageControl.Pages[1].TabVisible := False;
          if TabsheetFilter3.Caption = 'Filter3' then
            ReportFilterForm.PageControl.Pages[2].TabVisible := False;
          FromDate.Date := StartoftheMonth(date);
          ToDate.Date := endofthemonth(date);
end;

end.
