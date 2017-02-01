unit TempGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, JvExButtons, JvBitBtn, DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TTempGridForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TempGridForm: TTempGridForm;

implementation
      uses DataFrm2;

{$R *.dfm}

end.
