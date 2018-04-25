unit AboutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, InvokeRegistry, Rio, SOAPHTTPClient,
  JvExButtons, JvBitBtn, JvExControls, JvSpeedButton, ExtCtrls, JvExExtCtrls,
  JvImage, UtilsUnit, DateUtils, server, ShellAPI;


type
  TAboutForm = class(TForm)
    BitBtn1: TBitBtn;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    JvImage2: TJvImage;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure JvImage2Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses MainFrm, DataFrm2, DataFrm;

{$R *.dfm}


procedure TAboutForm.BitBtn1Click(Sender: TObject);
begin
//        if not DataForm2.Regware41.Registered or (date > CheckCodeExpiration(DataForm2.Regware41.RegCode)) then
//          MenuRisk.BitBtn1.Click
//        else
          close;
end;

procedure TAboutForm.JvImage2Click(Sender: TObject);
begin
    If ShellExecute (0, '', pchar('http://www.ncomp.co.za'), '', '', SW_NORMAL) <= 32 then
      showmessage('The Link Failed to open');
end;

procedure TAboutForm.Label1Click(Sender: TObject);
begin
    If ShellExecute (0, '', pchar('http://www.ncomp.co.za/'), '', '', SW_NORMAL) <= 32 then
      showmessage('The Link Failed to open');
end;



procedure TAboutForm.Label2Click(Sender: TObject);
begin
    If ShellExecute (0, '', pchar('http://www.ncomp.co.za/index.php/about-us/contact-us'), '', '', SW_NORMAL) <= 32 then
      showmessage('The Link Failed to open');
end;

end.
