program SQLInstall;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  UtilsUnit in '..\..\NielUniversalUtils\UtilsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NCompPOS SQL Install / Link';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
