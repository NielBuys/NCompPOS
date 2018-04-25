unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Registry, IniFiles, Menus, db, ImgList, JvDialogs,
  ComCtrls, JvExComCtrls, JvStatusBar, JvExControls, JvLookOut, ToolWin,
  JvExForms, JvScrollPanel, UtilsUnit, DateUtils, shellapi, ShlObj,
  JvMenus;

type
  TMainForm = class(TForm)
    Login: TGroupBox;
    Label1: TLabel;
    LoginEdit: TEdit;
    Label2: TLabel;
    PasswordEdit: TEdit;
    Label3: TLabel;
    IpEdit: TEdit;
    Button8: TButton;
    MainMenu1: TMainMenu;
    Edit1: TMenuItem;
    UserSetup1: TMenuItem;
    UserLogin: TGroupBox;
    Label4: TLabel;
    ULoginEdit: TEdit;
    Label5: TLabel;
    UPasswordEdit: TEdit;
    Button10: TButton;
    CheckBox1: TCheckBox;
    Help1: TMenuItem;
    About1: TMenuItem;
    Backup1: TMenuItem;
    JvOpenDialog1: TJvOpenDialog;
    JvSaveDialog1: TJvSaveDialog;
    restore1: TMenuItem;
    ClearProgram1: TMenuItem;
    JvScrollingWindow1: TJvScrollingWindow;
    JvExpressButton1: TJvExpressButton;
    ImageList1: TImageList;
    JvExpressButton2: TJvExpressButton;
    JvExpressButton3: TJvExpressButton;
    JvExpressButton4: TJvExpressButton;
    JvExpressButton5: TJvExpressButton;
    JvExpressButton6: TJvExpressButton;
    JvExpressButton7: TJvExpressButton;
    JvExpressButton8: TJvExpressButton;
    JvStatusBar1: TJvStatusBar;
    DebtorsButton: TJvExpressButton;
    CreditorsButton: TJvExpressButton;
    N1: TMenuItem;
    N2: TMenuItem;
    Shortcuts1: TMenuItem;
    OpenInvoices1: TMenuItem;
    OpenPurchaseInvoices1: TMenuItem;
    OpenLayBuy1: TMenuItem;
    PortEdit: TEdit;
    InvPopupMenu: TJvPopupMenu;
    PointofSaleInvoice1: TMenuItem;
    FindInvoice1: TMenuItem;
    Label6: TLabel;
    DBEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserSetup1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UPasswordEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Backup1Click(Sender: TObject);
    procedure restore1Click(Sender: TObject);
    procedure ClearProgram1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvExpressButton1Click(Sender: TObject);
    procedure JvExpressButton2Click(Sender: TObject);
    procedure JvExpressButton3Click(Sender: TObject);
    procedure JvExpressButton4Click(Sender: TObject);
    procedure JvExpressButton5Click(Sender: TObject);
    procedure JvExpressButton6Click(Sender: TObject);
    procedure JvExpressButton7Click(Sender: TObject);
    procedure JvExpressButton8Click(Sender: TObject);
    procedure DebtorsButtonClick(Sender: TObject);
    procedure CreditorsButtonClick(Sender: TObject);
    procedure OpenInvoices1Click(Sender: TObject);
    procedure OpenLayBuy1Click(Sender: TObject);
    procedure OpenPurchaseInvoices1Click(Sender: TObject);
    procedure PointofSaleInvoice1Click(Sender: TObject);
    procedure FindInvoice1Click(Sender: TObject);
  private
    procedure BackupMySql(s:String);
    procedure RestoreMySql(s: string);
    procedure TestingINI;
    procedure CleanEmptyInv;
    procedure ConnecttoMySQL();
    { Private declarations }
  public
    VisibleStore, UVisibleStore: String;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  DataBaseStr: String;

implementation
        uses DataFrm2, Listsmnu, UserFrm, AboutFrm, StockFrm, InvoiceFrm, StockSearchFrm,
  BranchFrm, PurchaseFrm, LayBuyFrm, ExtractFrm, LocalAccountSearchFrm, InvAdvFindFrm;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
var
       UsesReportBool: Boolean;
begin
        Dataform2.UserDataPath := GetSpecialFolder(CSIDL_APPDATA);
        Dataform2.ProgramPath := GetCurrentDir;
        Dataform2.AllUsersDataPath := GetSpecialFolder(CSIDL_COMMON_APPDATA);
//        DataForm2.IniFile := TIniFile.Create (ChangeFileExt (Application.ExeName, '.ini'));
        if Fileexists(Dataform2.UserDataPath + '\NCompPOS\' + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini'))) then
        begin
          DataForm2.IniFile := TIniFile.Create (Dataform2.UserDataPath + '\NCompPOS\' + ExtractFileName(ChangeFileExt (Application.ExeName, '.ini')))
        end
        else
        begin
          DataForm2.IniFile := TIniFile.Create (ChangeFileExt (Application.ExeName, '.ini'));
        end;

        Dataform2.accessstr := 0;
        ShortDateFormat := 'yyyy/MM/dd';
        DateSeparator := '/';
        LongTimeFormat := 'HH:mm:ss';

        VisibleStore := 'No';
        UVisibleStore := 'No';

        LoginEdit.Text := DataForm2.IniFile.ReadString('Login', 'UserName', '');
        PasswordEdit.Text := Decrypt(DataForm2.IniFile.ReadString('Login', 'Password', ''));
        IpEdit.Text := DataForm2.IniFile.ReadString('Login', 'Ip', '');
        PortEdit.Text := DataForm2.IniFile.ReadString('Login', 'Port', '3306');
        DBEdit.Text := DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp');
        try
          ULoginEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS', 'LastLogin');
        except
          ULoginEdit.Text := '';
        end;
        UPasswordEdit.Text := '';

        if LoginEdit.Text = '' then
        begin
          VisibleStore := 'Yes';
        end
        else
        begin
          ConnecttoMySQL();
          UVisibleStore := 'Yes';
          JvExpressButton4.Enabled := StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value);
        end;
        MainForm.Caption := Mainform.Caption + ': Version ' + GetFileInfo(Application.ExeName, 'FileVersion');
end;

procedure TMainForm.ConnecttoMySQL();
var
          UsesReportBool:Boolean;
begin
          if IpEdit.Text <> DataForm2.IniFile.ReadString('Login', 'Ip', '') then
          begin
            DataForm2.IniFile.WriteString ('Login', 'Username', LoginEdit.Text);
            DataForm2.IniFile.WriteString ('Login', 'Password', Encrypt(PasswordEdit.Text));
            DataForm2.IniFile.WriteString ('Login', 'Ip', IpEdit.Text);
            DataForm2.IniFile.WriteString ('Login', 'Port', PortEdit.Text);
            DataForm2.IniFile.WriteString ('Login', 'DataBase', DBEdit.Text);
          end;
          DataBaseStr := DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp');
          try
            Dataform2.ADConnection.Params.Clear;
            Dataform2.ADConnection.Params.Add('DriverID=MySQL');
            Dataform2.ADConnection.Params.Add('Database='+DataBaseStr);
            Dataform2.ADConnection.Params.Add('User_Name='+LoginEdit.Text);
            Dataform2.ADConnection.Params.Add('Password='+PasswordEdit.Text);
            Dataform2.ADConnection.Params.Add('Server='+IpEdit.Text);
            Dataform2.ADConnection.Params.Add('Port='+PortEdit.Text);
            Dataform2.ADConnection.Open;
          except
          begin
            ShowMessage('Unable to connect to MySQL Server, make sure the Database exist');
            Application.Terminate;
          end;
          raise;
          end;

          DataForm2.User_db.Open;

   //********* used count added to globaltable*********//
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ DataBaseStr +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''ReportedUsedCount''');
          end;
          Dataform2.Query4.Open;

          If Dataform2.Query4.RecordCount = 0 then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`global_db` ADD COLUMN `UsedCount` INTEGER UNSIGNED AFTER `SQLScriptsNo`,');
              Add('ADD COLUMN `ReportedUsedCount` INTEGER UNSIGNED AFTER `UsedCount`');
            end;
            Dataform2.Query4.ExecSQL;
          end;
          Dataform2.Query4.Close;
   //********* Add Stocktake feature *********//
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ DataBaseStr +'''');
            Add('and TABLE_NAME=''StockTake''');
            Add('and COLUMN_NAME=''StockTakeID''');
          end;
          Dataform2.Query4.Open;

          If Dataform2.Query4.RecordCount = 0 then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('CREATE TABLE `' + DataBaseStr + '`.`StockTake` (');
              Add('`StockTakeID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`StockTakeDescription` VARCHAR(45),');
              Add('`StockTakeStatus` VARCHAR(10) NOT NULL,');
              Add('`StockTakeDate` INTEGER UNSIGNED,');
              Add('PRIMARY KEY (`StockTakeID`)');
              Add(') ENGINE = InnoDB;');
            end;
            Dataform2.Query4.ExecSQL;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('CREATE TABLE `' + DataBaseStr + '`.`StockTakeDetail` (');
              Add('`StockTakeDetailID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`StockTakeID` INTEGER UNSIGNED NOT NULL,');
              Add('`TCStockNo` VARCHAR(20) NOT NULL,');
              Add('`Qty` FLOAT,');
              Add('PRIMARY KEY (`StockTakeDetailID`),');
              Add('INDEX `StockTakeID`(`StockTakeID`),');
              Add('CONSTRAINT `FK_StockTakeDetail_1` FOREIGN KEY `FK_StockTakeDetail_1` (`StockTakeID`)');
              Add('REFERENCES `stocktake` (`StockTakeID`)');
              Add('ON DELETE RESTRICT');
              Add('ON UPDATE NO ACTION');
              Add(') ENGINE = InnoDB;');
            end;
            Dataform2.Query4.ExecSQL;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktakedetail` ADD COLUMN `BeforeQty` FLOAT AFTER `Qty`;');
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktakedetail` ADD UNIQUE INDEX `TCStockNo`(`StockTakeID`, `TCStockNo`);');
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktake` ADD INDEX `DescriptionInd`(`StockTakeDescription`);');
            end;
            Dataform2.Query4.ExecSQL;
          end;
          Dataform2.Query4.Close;

      //********* SQL count added to globaltable*********//
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ DataBaseStr +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''SQLCount''');
          end;
          Dataform2.Query4.Open;

          If Dataform2.Query4.RecordCount = 0 then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`global_db` ADD COLUMN `SQLCount` INTEGER UNSIGNED AFTER `ReportedUsedCount`');
            end;
            Dataform2.Query4.ExecSQL;
          end;
          Dataform2.Query4.Close;

      //********* logo and Headers added to globaltable*********//
          Dataform2.Query4.Close;
          with Dataform2.Query4.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ DataBaseStr +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''Logo''');
          end;
          Dataform2.Query4.Open;

          If Dataform2.Query4.RecordCount = 0 then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`global_db`');
              Add('ADD COLUMN `Logo` LONGBLOB NULL AFTER `SQLCount`,');
              Add('ADD COLUMN `Header` LONGTEXT NULL AFTER `Logo`,');
              Add('ADD COLUMN `Footer` LONGTEXT NULL AFTER `Header`;');
            end;
            Dataform2.Query4.ExecSQL;
          end;
          Dataform2.Query4.Close;
   //******************//

          Dataform2.GlobalTable.Open;

    //***Fix Description Lenght***//
          if Dataform2.GlobalTableSQLCount.isnull then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsferitem_db` MODIFY COLUMN `Description` VARCHAR(45)');
            end;
            Dataform2.Query4.ExecSQL;
            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableSQLCount.Value := 1;
            Dataform2.GlobalTable.Post;
          end;
    //***Add Foreign Keys***//
          if (Dataform2.GlobalTableSQLCount.Value <= 3) or (Dataform2.GlobalTableSQLCount.IsNull) then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `stock_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `invoice_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `invoiceitem_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `stocktrnsfer_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `stocktrnsferitem_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `trans_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `trans_db` MODIFY COLUMN `BranchNo` INT(11) NOT NULL DEFAULT 0;');
              Add('ALTER TABLE `stockadjust_db` MODIFY COLUMN `BranchNo` INT(11);');
              Add('ALTER TABLE `stockadjust_db` MODIFY COLUMN `TCStockNoLink` VARCHAR(20);');
              Add('ALTER TABLE `stockadjust_db` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `stocktrnsferitem_db` MODIFY COLUMN `LinkID` INT(10) UNSIGNED NOT NULL DEFAULT 0;');
              Add('ALTER TABLE `stocktrnsfer_db` MODIFY COLUMN `Nr` INT(10) UNSIGNED NOT NULL DEFAULT 0;');
              Add('ALTER TABLE `stocktrnsfer_db` MODIFY COLUMN `Nr` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;');
              Add('ALTER TABLE `stocktrnsferitem_db` ADD COLUMN `BranchNo` INT(11) AFTER `Transfered`;');
              Add('ALTER TABLE `stocktake` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `stocktakedetail` CHARACTER SET latin1 COLLATE latin1_swedish_ci;');
              Add('ALTER TABLE `stocktakedetail` ADD COLUMN `BranchNo` INT(11) AFTER `BeforeQty`;');
              Add('ALTER TABLE `stocktakedetail` MODIFY COLUMN `TCStockNo` VARCHAR(20);');
              Add('delete i.* from invoiceitem_db i where Nr in (select Nr from (select invoiceitem_db.Nr from invoiceitem_db');
              Add('left join invoice_db on invoice_db.Nr = invoiceitem_db.LinkId and invoice_db.BranchNo = invoiceitem_db.BranchNo');
              Add('where invoice_db.Nr is null) r);');
              Add('alter table invoiceitem_db Add Constraint InvoiceLinkRef FOREIGN KEY (`LinkId`,`BranchNo`) REFERENCES `invoice_db` (`Nr`,`BranchNo`);');
              Add('ALTER TABLE `invoice_db` DROP INDEX `InvNoInd`, ADD INDEX `InvNoInd` USING BTREE(`InvNo`, `BranchNo`);');
     //         Add('delete t.* from trans_db t where Nr in (select Nr from (select trans_db.Nr from trans_db');
     //         Add('left join invoice_db on invoice_db.InvNo = trans_db.LinkID and invoice_db.BranchNo = trans_db.BranchNo');
     //         Add('left join accounts_db on accounts_db.Nr = trans_db.LinkID and accounts_db.BranchNo = trans_db.BranchNo');
     //         Add('where ((invoice_db.Nr is null) and (accounts_db.Nr is null))) i);');
     //         Add('alter table trans_db Add Constraint TransLinkRef FOREIGN KEY (`LinkID`,`BranchNo`) REFERENCES `invoice_db` (`InvNo`,`BranchNo`);');
              Add('alter table stockadjust_db Add Constraint StockAdjLinkRef FOREIGN KEY (`TCStockNoLink`,`BranchNo`) REFERENCES `stock_db` (`TCStockNo`,`BranchNo`);');
              Add('ALTER TABLE `stocktrnsfer_db` DROP PRIMARY KEY, ADD PRIMARY KEY  USING BTREE(`Nr`), ADD INDEX `BranchNoInd`(`Nr`, `Branch_no`);');
              Add('alter table stocktrnsferitem_db Add Constraint StockTransferItemLinkRef FOREIGN KEY (`LinkID`) REFERENCES `stocktrnsfer_db` (`Nr`);');
              Add('alter table stocktrnsferitem_db Add Constraint StockLinkRef FOREIGN KEY (`TCStockNo`,`BranchNo`) REFERENCES `stock_db` (`TCStockNo`,`BranchNo`);');
              Add('alter table stocktrnsfer_db Add Constraint BranchNoRef FOREIGN KEY (`Branch_no`) REFERENCES `branch_db` (`Nr`);');
 //             Add('alter table stocktakedetail Add Constraint StockTakeLinkRef FOREIGN KEY (`TCStockNo`,`BranchNo`) REFERENCES `stock_db` (`TCStockNo`,`BranchNo`);');
              Add('ALTER TABLE `stocktrnsferitem_db` DROP INDEX `TCStockNo`;');
              Add('delete from invoiceitem_db where StockNo is null;');
              Add('ALTER TABLE `invoiceitem_db` MODIFY COLUMN `StockNo` INT(10) UNSIGNED NOT NULL DEFAULT 0;');
              Add('delete i.* from invoiceitem_db i where Nr in (select Nr from (select invoiceitem_db.Nr from invoiceitem_db');
              Add('left join stock_db on stock_db.Nr = invoiceitem_db.StockNo');
              Add('where stock_db.Nr is null) r);');
              Add('alter table invoiceitem_db Add Constraint InvoiceItemLinkRef FOREIGN KEY (`StockNo`) REFERENCES `stock_db` (`Nr`);');
            end;
            Dataform2.Query4.ExecSQL;
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('alter table invoiceitem_db Drop foreign key InvoiceItemLinkRef;');
            end;
            Dataform2.Query4.ExecSQL;
            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableSQLCount.Value := 4;
            Dataform2.GlobalTable.Post;
          end;
          if (Dataform2.GlobalTableSQLCount.Value <= 4) then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('update stock_db set BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ' where BranchNo is null');
            end;
            Dataform2.Query4.ExecSQL;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('update stock_db');
              Add('left join (SELECT TCStockNo, Sum(stock_db.Qty) as StAtBrQty from stock_db where BranchNo <> ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ' Group By TCStockNo)');
              Add('as StockAtBranch on stock_db.TCStockNo = StockAtBranch.TCStockNo');
              Add('set Qty = Qty - ifnull(StAtBrQty,0)');
              Add('where stock_db.BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
            end;
            Dataform2.Query4.ExecSQL;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('update stockadjust_db set BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ' where BranchNo is null');
            end;
            Dataform2.Query4.ExecSQL;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('update stocktakedetail set BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value) + ' where BranchNo is null');
            end;
            Dataform2.Query4.ExecSQL;

            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableSQLCount.Value := 5;
            Dataform2.GlobalTable.Post;
          end;
          if (Dataform2.GlobalTableSQLCount.Value <= 5) then
          begin
            Dataform2.Query4.Close;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `stocktrnsferitem_db`');
              Add('DROP FOREIGN KEY `StockLinkRef`;');
            end;
            try
              Dataform2.Query4.ExecSQL;
            except
            end;

            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('update stocktrnsferitem_db set BranchNo = (Select Branch_no from stocktrnsfer_db where stocktrnsfer_db.Nr = stocktrnsferitem_db.LinkID);');
              Add('delete t.* from stocktrnsferitem_db t where Nr in (select Nr from (select stocktrnsferitem_db.Nr from stocktrnsferitem_db');
              Add('left join stock_db on stock_db.TCStockNo = stocktrnsferitem_db.TCStockNo and stock_db.BranchNo = stocktrnsferitem_db.BranchNo');
              Add('where stock_db.Nr is null) r);');
              Add('alter table stocktrnsferitem_db Add Constraint StockLinkRef FOREIGN KEY (`TCStockNo`,`BranchNo`) REFERENCES `stock_db` (`TCStockNo`,`BranchNo`);');
            end;
            Dataform2.Query4.ExecSQL;

            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsfer_db`');
              Add('DROP FOREIGN KEY `BranchNoRef`;');
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsfer_db`');
              Add('CHANGE COLUMN `Branch_no` `ToBranch` INT(10) UNSIGNED NOT NULL DEFAULT ''0'' ,');
              Add('ADD COLUMN `FromBranch` INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `Closed`;');
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsfer_db`');
              Add('ADD CONSTRAINT `BranchNoRef`');
              Add('FOREIGN KEY (`ToBranch`)');
              Add('REFERENCES `' + DataBaseStr + '`.`branch_db` (`Nr`)');
              Add('ON DELETE RESTRICT');
              Add('ON UPDATE RESTRICT;');
            end;
            Dataform2.Query4.ExecSQL;

            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsferitem_db`');
              Add('DROP FOREIGN KEY `StockTransferItemLinkRef`;');
            end;
            try
              Dataform2.Query4.ExecSQL;
            except
            end;
            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stocktrnsfer_db`');
              Add('CHANGE COLUMN `Nr` `Nr` INT(10) UNSIGNED NOT NULL ,');
              Add('DROP PRIMARY KEY,');
              Add('ADD PRIMARY KEY USING BTREE (`Nr`, `FromBranch`);');
              Add('alter table stocktrnsferitem_db Add Constraint StockTransferItemLinkRef FOREIGN KEY (`LinkID`) REFERENCES `stocktrnsfer_db` (`Nr`);');
            end;
            Dataform2.Query4.ExecSQL;

            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('delete from stocktrnsferitem_db where stocktrnsferitem_db.Qty is null;');
              Add('insert into stockadjust_db (BranchNo,TCStockNoLink,st_adj_by,st_adj_date,st_adj_value,st_adj_type)');
              Add('select stocktrnsfer_db.ToBranch,TCStockNo, ''root'', stocktrnsferitem_db.Transfered, stocktrnsferitem_db.Qty,''Sync''');
              Add('from stocktrnsferitem_db');
              Add('inner join stocktrnsfer_db on stocktrnsfer_db.Nr = stocktrnsferitem_db.LinkID');
              Add('where not stocktrnsferitem_db.Transfered is null');
            end;
            Dataform2.Query4.ExecSQL;

            with Dataform2.Query4.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + DataBaseStr + '`.`stockadjust_db`');
              Add('ADD COLUMN `st_adj_fromref` VARCHAR(45) NULL AFTER `st_adj_type`;');
            end;
            Dataform2.Query4.ExecSQL;

            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableSQLCount.Value := 6;
            Dataform2.GlobalTable.Post;
          end;

    //********//

          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableUsedCount.Value := Dataform2.GlobalTableUsedCount.Value + 1;
          Dataform2.GlobalTable.Post;

          if Dataform2.GlobalTableDActiveMonth.Value = 0 then
          begin
            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableDActiveMonth.Value := StrtoInt(InttoStr(YearOf(date)) + FormatFloat('00',MonthOf(date)));
            Dataform2.GlobalTable.Post;
          end;
          if Dataform2.GlobalTableCActiveMonth.Value = 0 then
          begin
            Dataform2.GlobalTable.Edit;
            Dataform2.GlobalTableCActiveMonth.Value := StrtoInt(InttoStr(YearOf(date)) + FormatFloat('00',MonthOf(date)));
            Dataform2.GlobalTable.Post;
          end;
          TestingINI();
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
        ConnecttoMySQL();
        if Checkbox1.Checked = True then
        begin
          DataForm2.User_db.Locate('UserName', LoginEdit.Text, [loPartialKey, loCaseInsensitive]);
          if DataForm2.User_db.FieldByName('UserName').asString <> LoginEdit.Text then
          begin
            Dataform2.User_db.Insert;
            Dataform2.User_db.FieldByName('UserName').asString := LoginEdit.Text;
            Dataform2.User_db.FieldByName('Password').asString := encrypt(PasswordEdit.Text);
            DataForm2.User_db.FieldByName('Rights').asInteger := 5;
            DataForm2.User_db.Post;
          end;
        end;
        Login.Visible := False;
        UserLogin.Visible := True;
        ULoginEdit.SetFocus;
        VisibleStore := 'No';
        UVisibleStore := 'Yes';
        JvExpressButton4.Enabled := StrtoBool(Dataform2.GlobalTableLayBuyEnable.Value);
end;

procedure TMainForm.FindInvoice1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) and (DataForm2.accessstr <> 0) then
      begin
          InvAdvFindForm.FromWhere := 'MainFormInvoice';
          InvAdvFindForm.show;
          MainForm.Hide;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        if Dataform2.accessstr <> 0 then
          CleanEmptyInv();
        Dataform2.GlobalTable.Close;
        Dataform2.User_db.Close;
        SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','LoggedIn', rdString, '');
        DataForm2.IniFile.Free;
end;


procedure TMainForm.UserSetup1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) and (DataForm2.accessstr <> 0) then
      begin
        Dataform2.User_db.Open;
        UserForm.showmodal;
      end
      else
        showmessage('You don''t have permission to go in here!');
end;

procedure TMainForm.Button10Click(Sender: TObject);
begin
        DataForm2.User_db.Locate('UserName', ULoginEdit.Text, [loPartialKey, loCaseInsensitive]);
        if DataForm2.User_db.FieldByName('UserName').asString <> ULoginEdit.Text then
          showmessage('User Name not correct!')
        else
        begin
          If decrypt(DataForm2.User_db.FieldByName('Password').asString) <> UPasswordEdit.Text then
          begin
            showmessage('Password not Correct!');
            UPasswordEdit.SetFocus;
            UPasswordEdit.SelectAll;
          end
          else
          begin
            Dataform2.accessstr := DataForm2.User_db.FieldByName('Rights').asInteger;
            SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','LastLogin', rdString, ULoginEdit.Text);
            SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','LoggedIn', rdString, ULoginEdit.Text);
            DataForm2.IniFile.WriteString('Login', 'ULogin', ULoginEdit.Text);
            DataForm2.UserNameStr := ULoginEdit.Text;
            Dataform2.UserRights := Dataform2.User_dbRights.Value;
            JvStatusBar1.Panels[0].Text := ULoginEdit.Text + ' Logged In';
            UVisibleStore := 'No';
            UserLogin.Visible := False;
          end;
        end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
      Application.CreateForm(TAboutForm, AboutForm);
      AboutForm.showmodal;
      AboutForm.Free;
end;

procedure TMainForm.UPasswordEditKeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
        Button10.Click;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
      if MessageDlg('Close the Application?', mtConfirmation,
        [mbOk, mbCancel], 0) = mrCancel then
        CanClose := False;
end;

procedure TMainForm.Backup1Click(Sender: TObject);
var
    s: String;
begin
      if MessageDlg('Are you sure you want to do a backup?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) and (DataForm2.accessstr <> 0) then
        begin
          s := '';
{          if FileExists('C:\Program Files\MySQL\MySQL Server 4.1\bin\mysqldump.exe') then
          begin
            s := 'C:\Program Files\MySQL\MySQL Server 4.1\bin\mysqldump.exe';
          end
          else
          begin
            if FileExists('C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqldump.exe') then
            begin
              s := 'C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqldump.exe';
            end
            else
            begin
              if FileExists('c:\Program Files\MySQL\MySQL Server 5.1\bin\mysqldump.exe') then
              begin
                s := 'c:\Program Files\MySQL\MySQL Server 5.1\bin\mysqldump.exe';
              end
              else
              begin
                if FileExists('c:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe') then
                begin
                  s := 'c:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe';
                end;
              end;
            end;
          end; }
          s := Dataform2.ProgramPath + '\mysqldump.exe';
 {         If s = '' then
          begin
            JvOpenDialog1.Title := 'Select File "Mysqldump.exe" in Mysql bin directory';
            If JvOpenDialog1.Execute then
            begin
              s := JvOpenDialog1.FileName;
              BackupMySql(s);
            end;
          end
          else
          begin    }
            BackupMySql(s);
   //       end;
        end
        else
          showMessage('You don''t have permision to go in here!');
      end;
end;

procedure TMainForm.BackupMySql(s: string);
var
  s2 : String;
begin
     JvSaveDialog1.FileName := 'POS Backup ' + inttostr(datetointdate(date));
     if JvSavedialog1.Execute then
     begin
 //      s2 := ' --opt ' + DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp') + ' --user=' + DataForm2.IniFile.ReadString('Login', 'UserName', '') + ' --password=' + Decrypt(DataForm2.IniFile.ReadString('Login', 'Password', '')) + ' --result-file="' + JvSaveDialog1.FileName + '"';
       s2 := ' --opt ' + DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp') + ' --user=' + DataForm2.IniFile.ReadString('Login', 'UserName', '') + ' --password=' + Decrypt(DataForm2.IniFile.ReadString('Login', 'Password', '')) + ' --host=' + DataForm2.IniFile.ReadString('Login', 'Ip', '') + ' --port=' + DataForm2.IniFile.ReadString('Login', 'Port', '3306') + ' --result-file="' + JvSaveDialog1.FileName + '"';
       s := '"' + s + '"';
       ExtractForm.Memo1.Clear;

       if ShellExecute (handle, 'open', PChar(s), PChar(s2), nil, SW_SHOWNORMAL) <= 32 then
         showmessage('Backup Failed, Only run on Mysql server!')
       else
       begin
         Showmessage('Backup Finished!');
       end;
     end;
end;

procedure TMainForm.restore1Click(Sender: TObject);
var
    s: String;
begin
      if MessageDlg('Are you sure you want to do a restore?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) and (DataForm2.accessstr <> 0) then
        begin
          s := '';
   {       if FileExists('C:\Program Files\MySQL\MySQL Server 4.1\bin\mysql.exe') then
          begin
            s := 'C:\Program Files\MySQL\MySQL Server 4.1\bin\mysql.exe';
          end
          else
          begin
            if FileExists('C:\Program Files\MySQL\MySQL Server 5.0\bin\mysql.exe') then
            begin
              s := 'C:\Program Files\MySQL\MySQL Server 5.0\bin\mysql.exe';
            end
            else
            begin
              if FileExists('C:\Program Files\MySQL\MySQL Server 5.1\bin\mysql.exe') then
              begin
                s := 'C:\Program Files\MySQL\MySQL Server 5.1\bin\mysql.exe';
              end
              else
              begin
                if FileExists('C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql.exe') then
                begin
                  s := 'C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql.exe';
                end;
              end;
            end;
          end;
          If s = '' then
          begin
            JvOpenDialog1.Title := 'Select File "Mysql.exe" in Mysql bin directory';
            If JvOpenDialog1.Execute then
            begin
              s := JvOpenDialog1.FileName;
              RestoreMySql(s);
            end;
          end
          else
          begin            }
            s := Dataform2.ProgramPath + '\mysql.exe';
            RestoreMySql(s);
 //         end;
        end
        else
          showMessage('You don''t have permision to go in here!');
      end;
end;

procedure TMainForm.RestoreMySql(s: string);
var
  s2 : String;
begin
     JvOpendialog1.Title := 'Select Restore File';
     JvOpenDialog1.DefaultExt := 'sql';
     JvOpenDialog1.FilterIndex := 2;
 //    showmessage(DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp'));
     if JvOpendialog1.Execute then
     begin
       s2 := ' --user=' + DataForm2.IniFile.ReadString('Login', 'UserName', '') + ' --password=' + Decrypt(DataForm2.IniFile.ReadString('Login', 'Password', '')) + ' --host=' + DataForm2.IniFile.ReadString('Login', 'Ip', '') + ' --port=' + DataForm2.IniFile.ReadString('Login', 'Port', '3306') + ' < "' + JvOpenDialog1.FileName + '"';
       ExtractForm.Memo1.Clear;
       Extractform.Memo1.Lines.LoadFromFile(JvOpendialog1.FileName);
       If copy(ExtractForm.Memo1.Lines[2],1,3) <> 'USE' then
       begin
         ExtractForm.Memo1.Lines[1] := 'CREATE DATABASE /*!32312 IF NOT EXISTS*/ ' + DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp') + ';';
         ExtractForm.Memo1.Lines[2] := 'USE ' + DataForm2.IniFile.ReadString('Login', 'DataBase', 'ncomp') + ';';
         ExtractForm.Memo1.Lines.SaveToFile(JvOpenDialog1.FileName);
       end;
       ExtractForm.Memo1.Clear;
       ExtractForm.Memo1.Lines.Add('"' + s + '"' + ' ' + s2);
       ExtractForm.Memo1.Lines.SaveToFile(GetTempDirectory + 'tempbat.bat');
       ExtractForm.Memo1.Clear;
       if WinExecAndWait32(GetTempDirectory + 'tempbat.bat', '', SW_HIDE) = -1 then
         showmessage('Restore Failed, Only run on Mysql server!')
       else
       begin
         DeleteFile(GetTempDirectory + 'tempbat.bat');
         Showmessage('Restore Finished program will exit!');
         Application.Terminate;
       end;

     end;
end;

procedure TMainForm.ClearProgram1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 4) and (DataForm2.accessstr <> 0) then
      begin
        if MessageDlg('Are you sure you want to CLEAR PROGRAM, EVERYTHING WILL BE GONE!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          DataForm2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM trans_db;');
            Add('Delete FROM invoiceitem_db;');
            Add('Delete FROM invoice_db;');
            Add('Delete FROM cashup_db;');
            Add('Delete FROM notes_db;');
            Add('Delete FROM stockadjust_db;');
            Add('Delete FROM stocktakedetail;');
            Add('Delete FROM stocktake;');
            Add('Delete FROM stock_db;');
            Add('Delete FROM stocktrnsferitem_db;');
            Add('Delete FROM stocktrnsfer_db;');
            Add('Delete FROM accounts_db;');
          end;
          DataForm2.Query2.ExecSQL;
          showmessage('Finished');
  {        with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM invoice_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM cashup_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM notes_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM stock_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM stocktrnsfer_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM stocktrnsferitem_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM trans_db');
          end;
          DataForm2.Query2.ExecSQL;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Delete FROM accounts_db');
          end;
          DataForm2.Query2.ExecSQL;  }
        end;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.CreditorsButtonClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) and (DataForm2.accessstr <> 0) then
      begin
        Application.CreateForm(TLocalAccountSearchForm, LocalAccountSearchForm);
        LocalAccountSearchForm.FromWhere := 'Creditor';
        LocalAccountSearchForm.Showmodal;
        LocalAccountSearchForm.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.DebtorsButtonClick(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) and (DataForm2.accessstr <> 0) then
      begin
        Application.CreateForm(TLocalAccountSearchForm, LocalAccountSearchForm);
        LocalAccountSearchForm.FromWhere := 'Debtor';
        LocalAccountSearchForm.Showmodal;
        LocalAccountSearchForm.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
        JvStatusBar1.Panels[1].Text := DataForm2.IniFile.ReadString('Login', 'Ip', '');

        If VisibleStore = 'Yes' then
        begin
          Login.Visible := True;
          LoginEdit.SetFocus;
        end
        else
        begin
          Login.SendToBack;
          Login.Visible := False;
        end;
        If UVisibleStore = 'Yes' then
        begin
          UserLogin.Visible := True;
          ULoginEdit.SetFocus;
        end
        else
        begin
          UserLogin.Visible := False;
        end;
end;

procedure TMainForm.JvExpressButton1Click(Sender: TObject);
var
        pt:tpoint;

begin
        getcursorpos(pt);
        JvExpressButton1.PopupMenu.Popup(pt.x,pt.y);

end;

procedure TMainForm.JvExpressButton2Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) and (DataForm2.accessstr <> 0) then
      begin
//        Application.CreateForm(TStockForm, StockForm);
        StockForm.Show;
        Mainform.Hide;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.JvExpressButton3Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) and (DataForm2.accessstr <> 0) then
      begin
        Application.CreateForm(TPurchaseForm, PurchaseForm);
        Purchaseform.FromWhere := '';
        PurchaseForm.ShowModal;
      end
      else
        showMessage('You don''t have permision to go in here!');

end;

procedure TMainForm.JvExpressButton4Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) and (DataForm2.accessstr <> 0) then
      begin
          Application.CreateForm(TLayBuyForm, LayBuyForm);
          LayBuyform.FromWhere := 'MAIN';
          LayBuyform.showmodal;
          LayBuyform.Free;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.JvExpressButton5Click(Sender: TObject);
begin
        if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) and (DataForm2.accessstr <> 0) then
        begin
          Application.CreateForm(TListsMenu, ListsMenu);
          ListsMenu.showmodal;
          ListsMenu.Free;
        end
        else
          showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.JvExpressButton6Click(Sender: TObject);
begin
      if Dataform2.GlobalTableBranchNo.Value <> 0 then
      begin
        showmessage('Only HQ can use this function.');
        exit;
      end;
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 3) and (DataForm2.accessstr <> 0) then
      begin
        Application.CreateForm(TBranchForm, BranchForm);
        BranchForm.ShowModal;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.JvExpressButton7Click(Sender: TObject);
begin
      Close;
end;

procedure TMainForm.JvExpressButton8Click(Sender: TObject);
begin
        if Dataform2.accessstr <> 0 then
          CleanEmptyInv();
        try
          ULoginEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS', 'LastLogin');
        except
          ULoginEdit.Text := '';
        end;
        SetRegistryData(HKEY_CURRENT_USER,'\Software\NcompPOS\','LoggedIn', rdString, '');
        UPasswordEdit.Text := '';
        UVisibleStore := 'Yes';
        Dataform2.accessstr := 0;
        JvStatusBar1.Panels[0].Text := 'Logged Out';
        UserLogin.Visible := True;
        UPasswordEdit.SetFocus;
end;

procedure TMainForm.OpenInvoices1Click(Sender: TObject);
begin
      if (DataForm2.User_db.FieldByName('Rights').asInteger > 2) and (DataForm2.accessstr <> 0) then
      begin
        InvoiceForm.FromWhereFormOpen := 'MainForm';
        InvoiceForm.Show;
        MainForm.Hide;
      end
      else
        showMessage('You don''t have permision to go in here!');
end;

procedure TMainForm.OpenLayBuy1Click(Sender: TObject);
begin
            JvExpressButton4.Click;
end;

procedure TMainForm.OpenPurchaseInvoices1Click(Sender: TObject);
begin
        JvExpressButton3.Click;
end;

procedure TMainForm.PointofSaleInvoice1Click(Sender: TObject);
begin
        OpenInvoices1.Click;
end;

procedure TMainForm.TestingINI();
begin
        if (Dataform2.GlobalTableBranchNo.Value = 0) and (DataForm2.IniFile.ReadInteger('BranchSetup', 'BranchNo', 0) <> 0) then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableBranchNo.Value := DataForm2.IniFile.ReadInteger('BranchSetup', 'BranchNo', 0);
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableLayBuyEnable.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableLayBuyEnable.Value := DataForm2.IniFile.ReadString ('LayBuySetup', 'Enable', '0');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableLayBuyTerm.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableLayBuyTerm.Value := DataForm2.IniFile.ReadInteger ('LayBuySetup', 'Term', 0);
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableLayBuyDeposit.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableLayBuyDeposit.Value := DataForm2.IniFile.ReadFloat('LayBuySetup', 'Deposit', 0);
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableOtherDescr.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableOtherDescr.Value := DataForm2.IniFile.ReadString ('Settings', 'OtherDescr', 'Other');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableNegQty.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableNegQty.Value := DataForm2.IniFile.ReadString ('Settings', 'NegQty', '0');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableCommentDescr.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableCommentDescr.Value := DataForm2.IniFile.ReadString('Settings', 'CommentDescr', 'Comment');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableMinimumMarkup.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableMinimumMarkup.Value := DataForm2.IniFile.ReadInteger ('Settings', 'MinimumMarkup', 0);
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableShowAdditions.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableShowAdditions.Value := DataForm2.IniFile.ReadString ('Settings', 'ShowAdditions', '-1');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableCurrentUser.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableCurrentUser.Value := DataForm2.IniFile.ReadString ('Settings', 'CurrentUser', '0');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableTCCashDebNo.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableTCCashDebNo.Value := Dataform2.IniFile.ReadString ('TCSetup', 'TCCashDebNo', '');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableTCStockNoBarcode.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableTCStockNoBarcode.Value := DataForm2.IniFile.ReadString ('TCSetup', 'TCStockNoBarcode', '0');
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableUsr3AllowItemAmmChange.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableUsr3AllowItemAmmChange.Value := '0';
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableDefaultRecPrintChoice.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableDefaultRecPrintChoice.Value := '0';
          Dataform2.GlobalTable.Post;
        end;
        if Dataform2.GlobalTableUsr3AllowVisibleCashup.IsNull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableUsr3AllowVisibleCashup.Value := '0';
          Dataform2.GlobalTable.Post;
        end;
        if not DirectoryExists(Dataform2.UserDataPath + '\NCompPOS') then
          CreateDir(Dataform2.UserDataPath + '\NCompPOS');
        if Dataform2.GlobalTableHeader.isnull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableHeader.loadfromfile(Dataform2.AllUsersDataPath + '\NCompPOS\client.txt');
          Dataform2.GlobalTable.Post;
          Dataform2.GlobalTableHeader.Savetofile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        end
        else
        begin
          Dataform2.GlobalTableHeader.Savetofile(Dataform2.UserDataPath + '\NCompPOS\client.txt');
        end;
        if Dataform2.GlobalTableFooter.isnull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableFooter.loadfromfile(Dataform2.AllUsersDataPath + '\NCompPOS\footer.txt');;
          Dataform2.GlobalTable.Post;
          Dataform2.GlobalTableFooter.Savetofile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        end
        else
        begin
          Dataform2.GlobalTableFooter.Savetofile(Dataform2.UserDataPath + '\NCompPOS\footer.txt');
        end;
        if Dataform2.GlobalTableLogo.isnull then
        begin
          Dataform2.GlobalTable.Edit;
          Dataform2.GlobalTableLogo.loadfromfile(Dataform2.AllUsersDataPath + '\NCompPOS\logo.bmp');;
          Dataform2.GlobalTable.Post;
          Dataform2.GlobalTableLogo.Savetofile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
        end
        else
        begin
          Dataform2.GlobalTableLogo.Savetofile(Dataform2.UserDataPath + '\NCompPOS\logo.bmp');
        end;
end;

procedure TMainForm.CleanEmptyInv();
var
      i: Integer;
begin
      Application.CreateForm(TListsMenu, ListsMenu);
      Dataform2.Query4.Close;
      Dataform2.Query3.Close;
      with Dataform2.Query4.SQL do
      begin
        Clear;
        Add('select Nr, BranchNo,InvClose from invoice_db');
        Add('where InvClose = "Open"');
        Add('and InvBy = "' + Dataform2.User_dbUserName.Value + '"');
      end;
      Dataform2.Query4.Open;
      Dataform2.Query4.DisableControls;
      Dataform2.Query4.First;
      ListsMenu.JvProgressDialog1.Caption := 'Cleaning Empty Invoices!!';
      ListsMenu.JvProgressDialog1.Show;
      ListsMenu.JvProgressDialog1.Max := DataForm2.Query4.RecordCount;
      i := 0;
      ListsMenu.JvProgressDialog1.Position := 0;
      while not Dataform2.Query4.EOF do
      begin
        If (DataForm2.Query4.FieldByName('InvClose').asString = 'Open') then
        begin
          Dataform2.Query2.Close;
          with DataForm2.Query2.SQL do begin
            Clear;
            Add('Select Nr from invoiceitem_db');
            Add('where LinkId = ' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger));
            Add('and BranchNo = ' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger));
          end;
          Dataform2.Query2.Open;
          if Dataform2.Query2.RecordCount = 0 then
          begin
            with DataForm2.Query3.SQL do begin
              Clear;
              Add('Update invoice_db set ShiftSet = ''Delete''');
              Add('where Nr = ' + InttoStr(Dataform2.Query4.FieldByName('Nr').asInteger));
              Add('and BranchNo = ' + InttoStr(Dataform2.Query4.FieldByName('BranchNo').asInteger));
            end;
            Dataform2.Query3.ExecSQL;
          end;
        end;
        Inc(i);
        ListsMenu.JvProgressDialog1.Position := i;
        ListsMenu.JvProgressDialog1.Text := InttoStr(i) + ' / ' + InttoStr(ListsMenu.JvProgressDialog1.Max);
        Application.ProcessMessages;
        Dataform2.Query4.Next;
      end;
      Dataform2.Query4.EnableControls;
      with DataForm2.Query3.SQL do begin
        Clear;
        Add('Delete from invoice_db');
        Add('where Shiftset = ''Delete''');
      end;
      Dataform2.Query3.ExecSQL;
      Dataform2.Query2.Close;
      Dataform2.Query4.Close;
      ListsMenu.JvProgressDialog1.Hide;
      ListsMenu.Free;
end;

end.

