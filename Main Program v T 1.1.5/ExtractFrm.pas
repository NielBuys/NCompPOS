unit ExtractFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, JvExStdCtrls, JvMemo;

const
  FOUT_MESSAGE = WM_USER + 1;
  MY_INDEX = 1;

type
  TExtractForm = class(TForm)
    Memo1: TJvMemo;
    SaveDialog: TSaveDialog;
  private
    procedure MyMessage(var Msg: TMessage); message FOUT_MESSAGE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExtractForm: TExtractForm;

implementation

{$R *.DFM}

procedure TExtractForm.MyMessage(var Msg: TMessage);
var
    s: String;
begin
  if (Msg.WParam = MY_INDEX) then
  begin
    if (Msg.LParam <> 0) then
    begin
      Memo1.Lines.Add(string(Msg.LParam));
    end;
  end;
end;


end.
