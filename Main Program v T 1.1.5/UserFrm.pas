unit UserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, IdRawBase, IdRawClient, IdIcmpClient, JvBaseDlg,
  JvSelectDirectory, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage, JvExStdCtrls, JvCheckBox, JvEdit, JvExControls,
  JvSpeedButton, Mask, JvExMask, JvSpin, JvExButtons, JvBitBtn, JvExDBGrids,
  JvDBGrid, ComCtrls, UtilsUnit, JvExExtCtrls, JvImage, ExtDlgs;

type
  TUserForm = class(TForm)
    BitBtn1: TBitBtn;
    MailMessage: TIdMessage;
    SMTP: TIdSMTP;
    SelectPath: TJvSelectDirectory;
    ICMP: TIdIcmpClient;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    Memo1: TMemo;
    JvBitBtn3: TJvBitBtn;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button1: TButton;
    Label1: TLabel;
    Password1: TEdit;
    Password2: TEdit;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Memo2: TMemo;
    Label3: TLabel;
    ComportSelect: TComboBox;
    Label4: TLabel;
    PrinterSelect: TComboBox;
    Label12: TLabel;
    ComboBox1: TComboBox;
    Button8: TButton;
    SaveFooterBtn: TJvBitBtn;
    SaveHeaderBtn: TJvBitBtn;
    Memo3: TMemo;
    ComboBox2: TComboBox;
    Label8: TLabel;
    Label32: TLabel;
    JvSpinEdit3: TJvSpinEdit;
    JvSpinEdit2: TJvSpinEdit;
    Label31: TLabel;
    Label30: TLabel;
    JvSpinEdit1: TJvSpinEdit;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    CheckBox3: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    JvSpinEdit4: TJvSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    CheckBox8: TCheckBox;
    DBEdit10: TDBEdit;
    CheckBox10: TCheckBox;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    JvSpeedButton13: TJvSpeedButton;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    JvEdit1: TJvEdit;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox6: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    JvCheckBox1: TJvCheckBox;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    SmtpEdit: TEdit;
    FromEdit: TEdit;
    StatusMemo: TMemo;
    CheckBox9: TCheckBox;
    CheckBox11: TCheckBox;
    PrintLogoImg: TJvImage;
    LoadLogoBtn: TJvBitBtn;
    LogoSelectDialog: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComportSelectClick(Sender: TObject);
    procedure PrinterSelectClick(Sender: TObject);
    procedure SmtpEditChange(Sender: TObject);
    procedure FromEditChange(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SaveFooterBtnClick(Sender: TObject);
    procedure SaveHeaderBtnClick(Sender: TObject);
    procedure JvEdit1Change(Sender: TObject);
    procedure JvBitBtn3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure JvCheckBox1Click(Sender: TObject);
    procedure JvSpinEdit1Change(Sender: TObject);
    procedure JvSpinEdit2Change(Sender: TObject);
    procedure JvSpinEdit3Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvSpeedButton13Click(Sender: TObject);
    procedure ICMPReply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure CheckBox7Click(Sender: TObject);
    procedure JvSpinEdit4Change(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure LoadLogoBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AccFromWhere: String;
    AccTypeID, AccNo, PingReturn: Integer;
  end;

var
  UserForm: TUserForm;
  UserStr: String;

implementation
  uses DataFrm2, InvoiceFrm, DataFrm;

{$R *.dfm}

procedure TUserForm.BitBtn1Click(Sender: TObject);
begin
              Close;
end;

procedure TUserForm.Button1Click(Sender: TObject);
var
    beforepass: String;
begin
        If Password1.Text = Password2.Text then
        begin
          if (DataForm2.user_dbstrState <> 'Edit') and (DataForm2.user_dbstrState <> 'Insert') then
            Dataform2.User_db.Edit;
          beforepass := decrypt(Dataform2.User_db.FieldByName('Password').asString);
          Dataform2.User_db.FieldByName('Password').asString := encrypt(Password1.Text);
          if decrypt(Dataform2.User_db.FieldByName('Password').asString) <> beforepass then
            Dataform2.User_db.Post
          else
            DataForm2.User_db.Cancel;
          showmessage('Password set!');
        end
        else
        begin
          showmessage('Passwords don''t match');
          Password1.SetFocus;
        end;
end;

procedure TUserForm.JvDBGrid1CellClick(Column: TColumn);
begin
        Password1.Text := Decrypt(DataForm2.User_db.FieldbyName('Password').AsString);
        Password2.Text := Decrypt(Dataform2.User_db.FieldbyName('Password').AsString);
end;

procedure TUserForm.Button2Click(Sender: TObject);
begin
        if (DataForm2.User_dbstrState = 'Edit') or (DataForm2.User_dbstrState = 'Insert') then
        begin
          Dataform2.User_db.Post;
//          Dataform2.User_db.Refresh;
          showmessage('Set the password!');
        end;
end;

procedure TUserForm.Button3Click(Sender: TObject);
begin
        Dataform2.User_db.Insert;
        Dataform2.User_db.FieldByName('Rights').AsInteger := 1;
        JVDBGrid1.SetFocus;
end;

procedure TUserForm.FormShow(Sender: TObject);
begin
        SmtpEdit.Text := DataForm2.IniFile.ReadString('EMailSetup', 'smtpserver', SmtpEdit.text);
        FromEdit.Text := DataForm2.IniFile.ReadString('EMailSetup', 'fromemail', FromEdit.text);
        CheckBox3.Checked := StrtoBool(Dataform2.GlobalTableShowAdditions.Value);
        CheckBox8.Checked := StrtoBool(Dataform2.GlobalTableTCStockNoBarcode.Value);
        CheckBox9.Checked := StrtoBool(Dataform2.GlobalTableUsr3AllowItemAmmChange.Value);
        CheckBox10.Checked := StrtoBool(Dataform2.GlobalTableDefaultRecPrintChoice.Value);
        CheckBox11.Checked := StrtoBool(Dataform2.GlobalTableUsr3AllowVisibleCashup.Value);
        JvEdit1.Text := DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '');
        Edit1.Text := DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', ''));
        Edit2.Text := Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', '')));
        Edit3.Text := InttoStr(DataForm2.IniFile.ReadInteger('BranchSetup', 'HQPort', 3306));
        Edit4.Text := DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp');
//        JvEdit2.Text := DataForm2.IniFile.ReadString('BranchSetup', 'BranchNo', '0');
        CheckBox4.Checked := StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodetype', '-1'));
        CheckBox5.Checked := StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'Barcodeprice', '0'));
        CheckBox6.Checked := StrtoBool(Dataform2.GlobalTableNegQty.Value);
        JvCheckBox1.Checked := StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value);
        JvSpinEdit1.Value := DataForm2.IniFile.ReadInteger ('Settings', 'FooterFontSize', 10);
        JvSpinEdit2.Value := DataForm2.IniFile.ReadInteger ('Settings', 'A4InvLineCount', 27);
        JvSpinEdit3.Value := DataForm2.IniFile.ReadFloat ('Settings', 'A4InvBottomStart', 8.5);
        JvSpinEdit4.Value := Dataform2.GlobalTableVat.Value;
        CheckBox7.Checked := StrtoBool(Dataform2.GlobalTableCurrentUser.Value);
        CheckBox1.Checked := StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'StockNoFormat2', '0'));
        CheckBox2.Checked := StrtoBool(DataForm2.IniFile.ReadString ('Settings', 'A4andCom', '0'));
        UserStr := Dataform2.User_dbUserName.Value;
        Memo2.Lines.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        Memo3.Lines.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        if DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0') <> '0' then
          ComportSelect.Text := DataForm2.IniFile.ReadString ('ComportSection', 'Comport', '0');
        if DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0') <> '0' then
          PrinterSelect.Text := DataForm2.IniFile.ReadString ('ComportSection', 'Printer', '0');
        if DataForm2.IniFile.ReadString ('ComportSection', 'SerialCom', '0') <> '0' then
          ComboBox1.Text := DataForm2.IniFile.ReadString ('ComportSection', 'SerialCom', '0');
        Combobox2.Text := DataForm2.IniFile.ReadString ('Settings', 'InvoiceItems', 'Standard');
//        Edit5.Text := InttoStr(DataForm2.IniFile.ReadInteger('Invoice', 'InvNo', 0));
//        Edit11.Text := InttoStr(DataForm2.IniFile.ReadInteger('Invoice', 'PurchaseInvNo', 0));
        if DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') = '' then
        begin
          JvBitBtn3.Enabled := False;
        end;
        PrintLogoImg.Picture.Loadfromfile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
end;

procedure TUserForm.Button5Click(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to Delete User ' + Dataform2.User_db.FieldByName('UserName').AsString + '?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Dataform2.User_db.Delete;
      end;
end;

procedure TUserForm.ComportSelectClick(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('ComportSection', 'Comport', ComportSelect.Items[ComportSelect.ItemIndex]);
end;

procedure TUserForm.Edit1Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('BranchSetup', 'HQUserName', Edit1.text);
end;

procedure TUserForm.Edit2Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('BranchSetup', 'HQPassword', Encrypt(Edit2.text));
end;

procedure TUserForm.Edit3Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteInteger ('BranchSetup', 'HQPort', StrtoInt(Edit3.text));
end;

procedure TUserForm.Edit4Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('BranchSetup', 'HQDataBase', Edit4.text);
end;

procedure TUserForm.PrinterSelectClick(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('ComportSection', 'Printer', PrinterSelect.Items[PrinterSelect.ItemIndex]);
end;

procedure TUserForm.SmtpEditChange(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('EMailSetup', 'smtpserver', SmtpEdit.text);
end;

procedure TUserForm.FromEditChange(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('EMailSetup', 'fromemail', FromEdit.text);
end;

procedure TUserForm.ComboBox1Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('ComportSection', 'SerialCom', Combobox1.Items[Combobox1.ItemIndex]);
end;

procedure TUserForm.ComboBox2Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('Settings', 'InvoiceItems', Combobox2.Items[Combobox2.ItemIndex]);
end;

procedure TUserForm.Button8Click(Sender: TObject);
begin
//        Application.CreateForm(TInvoiceForm, InvoiceForm);
        InvoiceForm.KickDrawer();
//        InvoiceForm.FreeOnRelease;
end;

procedure TUserForm.CheckBox10Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableDefaultRecPrintChoice.Value := BooltoStr(CheckBox10.Checked);
end;

procedure TUserForm.CheckBox11Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableUsr3AllowVisibleCashup.Value := BooltoStr(CheckBox11.Checked);
end;

procedure TUserForm.CheckBox1Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('Settings', 'StockNoFormat2', BooltoStr(CheckBox1.Checked));
end;

procedure TUserForm.CheckBox2Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('Settings', 'A4andCom', BooltoStr(CheckBox2.Checked));
end;

procedure TUserForm.CheckBox3Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableShowAdditions.Value := BooltoStr(CheckBox3.Checked);
//      DataForm2.IniFile.WriteString ('Settings', 'ShowAdditions', BooltoStr(CheckBox3.Checked));
end;

procedure TUserForm.SaveFooterBtnClick(Sender: TObject);
begin
        Memo3.Lines.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
          Dataform2.GlobalTable.Edit;
        Dataform2.GlobalTableFooter.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
end;

procedure TUserForm.SaveHeaderBtnClick(Sender: TObject);
begin
        Memo2.Lines.SaveToFile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
          Dataform2.GlobalTable.Edit;
        Dataform2.GlobalTableHeader.LoadFromFile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
end;

procedure TUserForm.JvEdit1Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('BranchSetup', 'HQAddress', JvEdit1.text);
      if DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') <> '' then
      begin
        JvBitBtn3.Enabled := True;
      end;
end;

procedure TUserForm.JvBitBtn3Click(Sender: TObject);
begin
      if (DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') <> '') then
      begin
        if Dataform2.GlobalTableBranchNo.Value <> 0 then
        begin
//          DataForm.Connection.ConnectionString := 'Driver={mySQL ODBC 3.51 Driver};Server=' + DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '') + ';""Port=3306;Option=4;Database=' + DataForm2.IniFile.ReadString('Login', 'DataBase', '') + ';Uid=' + DataForm2.IniFile.ReadString('Login', 'UserName', '') + ';Pwd=' + Decrypt(DataForm2.IniFile.ReadString('Login', 'Password', '')) + ';"';
          try
//            DataForm.Connection.Open;
            Dataform.HQADConnection.Params.Clear;
            Dataform.HQADConnection.Params.Add('DriverID=MySQL');
            Dataform.HQADConnection.Params.Add('Database='+DataForm2.IniFile.ReadString('BranchSetup', 'HQDataBase', 'ncomp'));
            Dataform.HQADConnection.Params.Add('User_Name='+DataForm2.IniFile.ReadString('BranchSetup', 'HQUserName', DataForm2.IniFile.ReadString('Login', 'UserName', '')));
            Dataform.HQADConnection.Params.Add('Password='+Decrypt(DataForm2.IniFile.ReadString('BranchSetup', 'HQPassword', DataForm2.IniFile.ReadString('Login', 'Password', ''))));
            Dataform.HQADConnection.Params.Add('Server='+DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', ''));
            Dataform.HQADConnection.Params.Add('Port='+DataForm2.IniFile.ReadString('BranchSetup', 'HQPort', ''));
            Dataform.HQADConnection.Open;
          except
          begin
            ShowMessage('Unable to connect to HQ, make sure Address is correct');
//            DataForm.Connection.Close;
            Dataform.HQADConnection.Close;
          end;
          raise;
          end;
          Dataform.HQADConnection.StartTransaction;
          try
            DataForm.User_db.Open;
            DataForm.BranchTable.Open;
            Dataform.User_db.DisableControls;
            DataForm.User_db.First;
            while not DataForm.User_db.EOF do
            begin
              If DataForm.User_dbUserName.Value <> 'root' then
              begin
                if not dataform2.User_db.Locate('UserName', DataForm.User_dbUserName.Value,[]) then
                begin
                  Dataform2.User_db.Append;
                  Dataform2.User_dbUserName.Assign(DataForm.User_dbUserName);
                  DataForm2.User_dbPassword.Assign(Dataform.User_dbPassword);
                  Dataform2.User_dbRights.Assign(Dataform.User_dbRights);
                  DataForm2.User_db.Post;
                end
                else
                begin
                  If Dataform2.User_dbRights.Value <> DataForm.User_dbRights.Value then
                  begin
                    Dataform2.User_db.Edit;
                    Dataform2.User_dbRights.Assign(Dataform.User_dbRights);
                    Dataform2.User_db.Post;
                  end;
                end;
              end;
              DataForm.User_db.Next;
            end;
            Dataform.User_db.EnableControls;
            DataForm.User_db.Close;
            if not dataform.BranchTable.Locate('Nr', InttoStr(Dataform2.GlobalTableBranchNo.Value),[]) then
            begin
              showmessage('Branch not found!');
            end
            else
            begin
              If DataForm.BranchTableStartInvNo.Value > DataForm2.IniFile.ReadInteger('Invoice', 'InvNo', 0) then
                DataForm2.IniFile.WriteInteger ('Invoice', 'InvNo', DataForm.BranchTableStartInvNo.Value);
            end;
            Dataform.HQADConnection.Commit;
          finally
            if DataForm.HQADConnection.InTransaction then
            begin
              Dataform.HQADConnection.Rollback;
              showmessage('Receiving failed please try again later or call support');
            end;
          end;
          DataForm.BranchTable.Close;
//          DataForm.Connection.Close;
          Dataform.HQADConnection.Close;
          DataForm2.User_db.Locate('UserName', DataForm2.UserNameStr, []);
        end
        else
          showmessage('No Branch No in setup!');
      end
      else
        showmessage('No HQ Address in setup!');
end;

procedure TUserForm.CheckBox4Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('Settings', 'Barcodetype', BooltoStr(CheckBox4.Checked));
end;

procedure TUserForm.CheckBox5Click(Sender: TObject);
begin
      DataForm2.IniFile.WriteString ('Settings', 'Barcodeprice', BooltoStr(CheckBox5.Checked));
end;

procedure TUserForm.JvCheckBox1Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableLayBuyEnable.Value := BooltoStr(JvCheckBox1.Checked);
//      DataForm2.IniFile.WriteString ('LayBuySetup', 'Enable', BooltoStr(JvCheckBox1.Checked));
end;

procedure TUserForm.JvSpinEdit1Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteFloat('Settings', 'FooterFontSize', JvSpinEdit1.Value);
end;

procedure TUserForm.JvSpinEdit2Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteFloat('Settings', 'A4InvLineCount', JvSpinEdit2.Value);
end;

procedure TUserForm.JvSpinEdit3Change(Sender: TObject);
begin
      DataForm2.IniFile.WriteFloat('Settings', 'A4InvBottomStart', JvSpinEdit3.Value);
end;

procedure TUserForm.JvSpinEdit4Change(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableVat.Value := JvSpinEdit4.Value;
//      DataForm2.IniFile.WriteFloat('Settings', 'Vat', JvSpinEdit4.Value);
end;

procedure TUserForm.LoadLogoBtnClick(Sender: TObject);
begin
            if LogoSelectDialog.execute then
            begin
              PrintLogoImg.Picture.Loadfromfile(LogoSelectDialog.FileName);
              if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
                Dataform2.GlobalTable.Edit;
              Dataform2.GlobalTableLogo.loadfromfile(LogoSelectDialog.FileName);;
              Dataform2.GlobalTableLogo.Savetofile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
            end;
end;

procedure TUserForm.CheckBox6Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableNegQty.Value := BooltoStr(CheckBox6.Checked);
//      DataForm2.IniFile.WriteString ('Settings', 'NegQty', BooltoStr(CheckBox6.Checked));
end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
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
      DataForm2.User_db.Locate('UserName', UserStr, []);
end;

procedure TUserForm.JvSpeedButton13Click(Sender: TObject);
var
    i: Integer;
begin
  ICMP.ReceiveTimeout := 3000;
  PingReturn := 0;
  JvSpeedButton13.Enabled := False;
  try
    try
      ICMP.Host := DataForm2.IniFile.ReadString('BranchSetup', 'HQAddress', '');
      ICMP.Port := DataForm2.IniFile.ReadInteger('BranchSetup', 'HQPort', 3306);
      for i := 1 to 5 do begin
        ICMP.Ping;
        Application.ProcessMessages;
      end;
    except
    end;
  finally JvSpeedButton13.Enabled := True; end;
  showmessage('Hq Ping returned ' + InttoStr(PingReturn) + ' / 5 Packets, each packet of 1044 bytes was waited for 3000 Milliseconds');
end;

procedure TUserForm.ICMPReply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
      If AReplyStatus.BytesReceived <> 0 then
        Inc(PingReturn);
end;

procedure TUserForm.CheckBox7Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableCurrentUser.Value := BooltoStr(CheckBox7.Checked);

//      DataForm2.IniFile.WriteString ('Settings', 'CurrentUser', BooltoStr(CheckBox7.Checked));
end;

procedure TUserForm.CheckBox8Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableTCStockNoBarcode.Value := BooltoStr(CheckBox8.Checked);
end;

procedure TUserForm.CheckBox9Click(Sender: TObject);
begin
      if (DataForm2.GlobalTablestrState <> 'Edit') and (DataForm2.GlobalTablestrState <> 'Insert') then
        Dataform2.GlobalTable.Edit;
      Dataform2.GlobalTableUsr3AllowItemAmmChange.Value := BooltoStr(CheckBox9.Checked);
end;

end.
