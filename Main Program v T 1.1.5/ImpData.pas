unit ImpData;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TImportData = class(TDataModule)
    ExcelFileConnect: TADOConnection;
    ADOQuery1: TADOQuery;
    ExcelSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportData: TImportData;

implementation

{$R *.dfm}

end.
