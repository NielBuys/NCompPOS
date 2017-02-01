unit YearMonthChooseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DateUtils, JvExButtons, JvBitBtn, JvExMask,
  JvSpin;

type
  TYearMonthChooseForm = class(TForm)
    YearEdit: TJvSpinEdit;
    MonthEdit: TJvSpinEdit;
    JvBitBtn1: TJvBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YearMonthChooseForm: TYearMonthChooseForm;

implementation

{$R *.dfm}

procedure TYearMonthChooseForm.FormShow(Sender: TObject);
begin
          YearEdit.Text := inttostr(yearof(date));
          MonthEdit.Text := inttostr(monthof(date));
end;

procedure TYearMonthChooseForm.JvBitBtn1Click(Sender: TObject);
begin
            Close;
end;

end.
