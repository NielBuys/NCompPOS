unit TCsettingsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExButtons, JvBitBtn, Mask, JvExMask, JvToolEdit,
  JvExControls, JvSpeedButton;

type
  TTCSettingsForm = class(TForm)
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    JvSpeedButton1: TJvSpeedButton;
    Label17: TLabel;
    JvSpeedButton2: TJvSpeedButton;
    Label18: TLabel;
    JvSpeedButton3: TJvSpeedButton;
    Label19: TLabel;
    JvSpeedButton4: TJvSpeedButton;
    Label20: TLabel;
    JvSpeedButton5: TJvSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    JvSpeedButton7: TJvSpeedButton;
    JvSpeedButton8: TJvSpeedButton;
    JvSpeedButton9: TJvSpeedButton;
    Label26: TLabel;
    JvSpeedButton10: TJvSpeedButton;
    Label27: TLabel;
    JvSpeedButton11: TJvSpeedButton;
    Label29: TLabel;
    JvSpeedButton12: TJvSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox2: TCheckBox;
    JvDirectoryEdit1: TJvDirectoryEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    JvBitBtn1: TJvBitBtn;
    procedure JvDirectoryEdit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure JvSpeedButton7Click(Sender: TObject);
    procedure JvSpeedButton8Click(Sender: TObject);
    procedure JvSpeedButton9Click(Sender: TObject);
    procedure JvSpeedButton10Click(Sender: TObject);
    procedure JvSpeedButton11Click(Sender: TObject);
    procedure JvSpeedButton12Click(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure JvSpeedButton3Click(Sender: TObject);
    procedure JvSpeedButton4Click(Sender: TObject);
    procedure JvSpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TCSettingsForm: TTCSettingsForm;

implementation

uses DataFrm2, UserFrm, AccountSearchFrm, TCDataMod, BatchTypeFrm;

{$R *.dfm}

procedure TTCSettingsForm.JvDirectoryEdit1Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCPath', JvDirectoryEdit1.text);
end;

procedure TTCSettingsForm.Edit3Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCBankNo', Edit3.text);
end;

procedure TTCSettingsForm.Edit14Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCLayBuyCredAccNo', Edit14.text);
end;

procedure TTCSettingsForm.Edit15Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCLayBuyDebAccNo', Edit15.text);
end;

procedure TTCSettingsForm.Edit16Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCBatchTypeID', Edit16.text);
end;

procedure TTCSettingsForm.Edit17Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCDebCntrlAccID', Edit17.text);
end;

procedure TTCSettingsForm.Edit19Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCCrdCntrlAccID', Edit19.text);
end;

procedure TTCSettingsForm.Edit2Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCTaxId', Edit2.text);
end;

procedure TTCSettingsForm.Edit7Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCInputTaxId', Edit7.text);
end;

procedure TTCSettingsForm.Edit9Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCCostofSalesId', Edit9.text);
end;

procedure TTCSettingsForm.Edit10Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCStockControlId', Edit10.text);
end;

procedure TTCSettingsForm.Edit4Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCDateFormat', Edit4.text);
end;

procedure TTCSettingsForm.CheckBox2Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCStockEnable', BooltoStr(CheckBox2.Checked));
end;

procedure TTCSettingsForm.JvSpeedButton7Click(Sender: TObject);
begin
      Application.CreateForm(TAccountSearchForm, AccountSearchForm);
      with TCData.TurbocashDb.Params do
      begin
        clear;
        Add('path=' + DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''));
      end;
      TCData.TurbocashDb.Connected := True;
      TCData.tblAccount.Open;
      TCData.tblAccount.Filtered := False;
      TCData.tblAccount.Filter := 'WAccountTypeID=3 or WAccountTypeID=0';
      TCData.tblAccount.Filtered := True;
      If Edit3.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit3.Text);
        TCData.tblAccount.Locate('WAccountID',InttoStr(UserForm.AccNo),[]);
      end;
      AccountSearchForm.FromWhere := 'BankAcc';
      AccountSearchForm.showModal;
      TCData.tblAccount.Filtered := False;
      TCData.tblAccount.Close;
      TCData.TurbocashDb.Connected := False;
end;

procedure TTCSettingsForm.JvSpeedButton8Click(Sender: TObject);
begin
      UserForm.AccTypeID := 2;
      UserForm.AccFromWhere := 'LBCredAcc';
      UserForm.AccNo := 0;
      If Edit14.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit14.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton9Click(Sender: TObject);
begin
      UserForm.AccTypeID := 1;
      UserForm.AccFromWhere := 'LBdebAcc';
      UserForm.AccNo := 0;
      If Edit15.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit15.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton10Click(Sender: TObject);
begin
      Application.CreateForm(TBatchTypeForm, BatchTypeForm);
      with TCData.TurbocashDb.Params do
      begin
        clear;
        Add('path=' + DataForm2.IniFile.ReadString('TCSetup', 'TCPath', ''));
      end;
      TCData.TurbocashDb.Connected := True;
      TCData.TCBatTypes.Open;
      TCData.TCBatTypes.Locate('WBatchTypeId',Edit16.Text,[]);
      BatchTypeForm.FromWhere := 'BatchType';
      BatchTypeForm.Showmodal;
      TCData.TCBatTypes.Close;
      TCData.TurbocashDb.Connected := False;
end;

procedure TTCSettingsForm.JvSpeedButton11Click(Sender: TObject);
begin
      UserForm.AccTypeID := 0;
      UserForm.AccFromWhere := 'DebCntrlAcc';
      UserForm.AccNo := 0;
      If Edit17.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit17.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton12Click(Sender: TObject);
begin
      UserForm.AccTypeID := 0;
      UserForm.AccFromWhere := 'CrdCntrlAcc';
      UserForm.AccNo := 0;
      If Edit19.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit19.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton1Click(Sender: TObject);
begin
      UserForm.AccTypeID := 4;
      UserForm.AccFromWhere := 'OutputTax';
      UserForm.AccNo := 0;
      If Edit2.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit2.Text);
      end;
end;

procedure TTCSettingsForm.JvSpeedButton2Click(Sender: TObject);
begin
      UserForm.AccTypeID := 4;
      UserForm.AccFromWhere := 'InputTax';
      UserForm.AccNo := 0;
      If Edit7.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit7.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton3Click(Sender: TObject);
begin
      UserForm.AccTypeID := 0;
      UserForm.AccFromWhere := 'SalesAccount';
      UserForm.AccNo := 0;
      If Edit8.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit8.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton4Click(Sender: TObject);
begin
      UserForm.AccTypeID := 0;
      UserForm.AccFromWhere := 'CostofSales';
      UserForm.AccNo := 0;
      If Edit9.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit9.Text);
      end;

end;

procedure TTCSettingsForm.JvSpeedButton5Click(Sender: TObject);
begin
      UserForm.AccTypeID := 0;
      UserForm.AccFromWhere := 'StockControl';
      UserForm.AccNo := 0;
      If Edit10.Text <> '' then
      begin
        UserForm.AccNo := StrtoInt(Edit10.Text);
      end;

end;

procedure TTCSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if (DataForm2.GlobalTablestrState = 'Edit') or (DataForm2.GlobalTablestrState = 'Insert') then
      begin
        try
          Dataform2.GlobalTable.Post;
        except
          on E : Exception do
            showmessage(E.Message);
        end;
      end;
end;

procedure TTCSettingsForm.FormShow(Sender: TObject);
begin
        CheckBox2.Checked := StrtoBool(DataForm2.IniFile.ReadString ('TCSetup', 'TCStockEnable', '0'));
        JvDirectoryEdit1.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCPath', '');
        Edit2.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCTaxId', '');
        Edit7.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCInputTaxId', '');
        Edit8.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCSalesAccountId', '');
        Edit9.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCCostofSalesId', '');
        Edit10.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCStockControlId', '');
        Edit16.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCBatchTypeId', '');
        Edit14.Text := Dataform2.IniFile.ReadString ('TCSetup', 'TCLayBuyCredAccNo', '');
        Edit15.Text := Dataform2.IniFile.ReadString ('TCSetup', 'TCLayBuyDebAccNo', '');
        Edit17.Text := Dataform2.IniFile.ReadString ('TCSetup', 'TCDebCntrlAccID', '');
        Edit19.Text := Dataform2.IniFile.ReadString ('TCSetup', 'TCCrdCntrlAccID', '');
        Edit3.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCBankNo', '');
        Edit4.Text := DataForm2.IniFile.ReadString('TCSetup', 'TCDateFormat', '');
end;

procedure TTCSettingsForm.Edit8Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('TCSetup', 'TCSalesAccountID', Edit8.Text);
end;

end.
