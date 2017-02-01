unit GridExportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, JvComponentBase, JvDBGridExport,
  JvDialogs, JvExButtons, JvBitBtn, JvExDBGrids, JvDBGrid;

type
  TGridExportForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    SaveGrid: TJvSaveDialog;
    JvBitBtn2: TJvBitBtn;
    JvDBGridCSVExport1: TJvDBGridCSVExport;
    procedure JvBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GridExportForm: TGridExportForm;

implementation
    uses DataFrm2;

{$R *.dfm}

procedure TGridExportForm.JvBitBtn2Click(Sender: TObject);
begin
        If SaveGrid.Execute then
        begin
          JvDBGridCSVExport1.FileName := SaveGrid.FileName;
          JvDBGridCSVExport1.ExportGrid;
        end;
end;

end.
