unit PeriodFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, JvExButtons, JvBitBtn,
  JvExDBGrids, JvDBGrid;

type
  TPeriodForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodForm: TPeriodForm;

implementation
        uses TCDataMod;

{$R *.dfm}

end.
