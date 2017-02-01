unit MemberAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ComCtrls, JvExComCtrls, DateUtils,
  JvDateTimePicker, IniFiles, RpDefine, RpBase, RpSystem, Menus,
  JvExControls, JvComponent, JvDBLookup, db, ShellAPI, JvSpeedButton;

type
  TMainMemberAdd = class(TForm)
    function IntDatetoString(i: integer): string;
    function DatetoIntDate(d: TDateTime): integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMemberAdd: TMainMemberAdd;
  s: String;

implementation
        uses DataFrm2, NotesFrm;
{$R *.DFM}

function TMainMemberAdd.IntDatetoString(i: integer): string;
var
  yy, mm, dd: String;
begin
  if i = 0 then
    IntDatetostring := ''
  else
  begin
    yy := copy(inttostr(i),1,4);
    mm := copy(inttostr(i),5,2);
    dd := copy(inttostr(i),7,2);
    If ShortDateFormat = 'dd/MM/yyyy' then
    begin
      IntDatetostring := dd + '/' + mm + '/' + yy;
    end
    else
    begin
      IntDatetostring := yy + '/' + mm + '/' + dd;
    end;
  end;
end;

function TMainMemberAdd.DatetoIntDate(d: TDateTime): integer;
var
  yy, mm, dd, s: String;
begin
  If ShortDateFormat = 'dd/MM/yyyy' then
  begin
    dd := copy(datetostr(d),1,2);
    mm := copy(datetostr(d),4,2);
    yy := copy(datetostr(d),7,4);
  end
  else
  begin
    yy := copy(datetostr(d),1,4);
    mm := copy(datetostr(d),6,2);
    dd := copy(datetostr(d),9,2);
  end;
  s := yy + mm + dd;
  DatetoIntDate := strtoint(s);
end;


end.
