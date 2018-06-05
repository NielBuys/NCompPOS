program SQLInstall;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  UtilsUnit in '..\Main Program v T 1.1.5\UtilsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NCompPOS SQL Install / Link';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
