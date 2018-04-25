unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvDialogs, JvBaseDlg, JvSelectDirectory, ShellAPI,
  Buttons, JvExButtons, JvBitBtn, DB, ADODB, IniFiles, UtilsUnit, ShlObj,
  uADStanIntf, uADStanOption, uADStanDef, uADPhysIntf, uADGUIxIntf,
  uADDatSManager, uADStanError, uADStanParam, uADDAptIntf, uADCompDataSet,
  uADCompClient, uADPhysManager, uADPhysMySQL, uADGUIxFormsWait, uADStanPool,
  uADStanAsync, uADDAptManager;

type
  TMainForm = class(TForm)
    login: TEdit;
    Label1: TLabel;
    Password: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Schema: TEdit;
    Label4: TLabel;
    Ip: TEdit;
    JvBitBtn2: TJvBitBtn;
    ADConnection: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    Query: TADQuery;
    Query2: TADQuery;
    PortEdit: TEdit;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    procedure JvBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniFile: TIniFile;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.JvBitBtn2Click(Sender: TObject);
begin
        if CheckBox1.Checked = False then
        begin
          try
            ADConnection.Params.Clear;
            ADConnection.Params.Add('DriverID=MySQL');
            ADConnection.Params.Add('Database=information_schema');
            ADConnection.Params.Add('User_Name='+Login.Text);
            ADConnection.Params.Add('Password='+Password.Text);
            ADConnection.Params.Add('Server='+Ip.Text);
            ADConnection.Params.Add('Port='+PortEdit.Text);
            ADConnection.Open;
          except
            ShowMessage('Unable to connect to MySQL Server');
          raise;
          end;

          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.SCHEMATA');
            Add('where SCHEMA_NAME='''+ Schema.Text +'''');
          end;
          Query.Open;
          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('CREATE DATABASE ' + Schema.Text + ';');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`user_db` (');
              Add('`Nr` int(10) unsigned NOT NULL auto_increment,');
              Add('`UserName` varchar(45) NOT NULL default '''',');
              Add('`Password` varchar(45) default NULL,');
              Add('`Rights` int(10) unsigned default NULL,');
              Add('PRIMARY KEY  (`Nr`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`notes_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Date` INTEGER(10) UNSIGNED,');
              Add('`LinkID` INTEGER UNSIGNED NOT NULL DEFAULT 0,');
              Add('`FromWhere` CHAR NOT NULL DEFAULT '''',');
              Add('`Description` VARCHAR(150),');
              Add('`AttentionDate` INTEGER(10) UNSIGNED,');
              Add('`NoteBy` VARCHAR(45),');
              Add('`Completed` VARCHAR(5) NOT NULL DEFAULT ''False'',');
              Add('`AttentionTime` VARCHAR(10),');
              Add('PRIMARY KEY(`Nr`),');
              Add('UNIQUE `LinkInd`(`LinkID`, `FromWhere`, `Nr`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`stock_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Description` VARCHAR(45),');
              Add('`DateCreated` INTEGER UNSIGNED,');
              Add('`DateChanged` INTEGER UNSIGNED,');
              Add('`CostPrice` DECIMAL(10,2),');
              Add('`SalesPrice` DECIMAL(10,2),');
              Add('`SalesPrice2` DECIMAL(10,2),');
              Add('`Barcode` VARCHAR(30),');
              Add('`Qty` DECIMAL(8,2),');
              Add('`AlertQty` DECIMAL(8,2),');
              Add('`NonStockItem` VARCHAR(5),');
              Add('`StartingQty` DECIMAL(8,2),');
              Add('`TCStockNo` VARCHAR(20),');
              Add('`Changed` CHAR,');
              Add('`BranchNo` INTEGER,');
              Add('`SyncHQ` INTEGER,');
              Add('`BranchMainStockNo` INTEGER UNSIGNED,');
              Add('`Group` VARCHAR(20),');
              Add('`ExtraDescr` VARCHAR(255),');
              Add('`ModelNo` VARCHAR(20),');
              Add('PRIMARY KEY(`Nr`),');
              Add('INDEX `BarcodeInd`(`Barcode`),');
              Add('INDEX `DescriptionInd`(`Description`)');
              Add(') ENGINE = InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`invoice_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL auto_increment,');
              Add('`ClientName` varchar(30) default NULL,');
              Add('`ClientTelW` varchar(20) default NULL,');
              Add('`ClientTelC` varchar(20) default NULL,');
              Add('`ClientAdr1` varchar(30) default NULL,');
              Add('`ClientAdr2` varchar(30) default NULL,');
              Add('`ClientAdr3` varchar(30) default NULL,');
              Add('`ClientPCode` varchar(4) default NULL,');
              Add('`ClientVatNo` varchar(30) default NULL,');
              Add('`InvDate` int(10) unsigned default NULL,');
              Add('`InvBy` varchar(45) default NULL,');
              Add('`MemLink` int(10) unsigned default NULL,');
              Add('`InvClose` varchar(5) default NULL,');
              Add('`AmmTendered` decimal(10,2) default NULL,');
              Add('`InvoiceType` varchar(15) default NULL,');
              Add('`GLDebNo` varchar(20) default NULL,');
              Add('`CUSet` int(11) default NULL,');
              Add('`InvTotal` decimal(10,2) default NULL,');
              Add('`ShiftSet` varchar(20) default NULL,');
              Add('`InvNo` int(10) unsigned NOT NULL default ''0'',');
              Add('`ClientEMail` VARCHAR(30) default NULL,');
              Add('`BranchNo` INTEGER default NULL,');
              Add('`SyncHQ` INTEGER default NULL,');
              Add('`Days30` decimal(10,2) default NULL,');
              Add('`Days60` decimal(10,2) default NULL,');
              Add('`Days90` decimal(10,2) default NULL,');
              Add('`Days120` decimal(10,2) default NULL,');
              Add('`TermMonths` INTEGER UNSIGNED,');
              Add('`Premium` decimal(10,2) default NULL,');
              Add('PRIMARY KEY  (`Nr`),');
              Add('INDEX InvNoInd (`InvNo`, `BranchNo`)');
              Add(') ENGINE = InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`invoiceitem_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Description` VARCHAR(45),');
              Add('`Price` DECIMAL(10,2),');
              Add('`Qty` DECIMAL(5,2),');
              Add('`StockNo` INTEGER UNSIGNED,');
              Add('`LinkId` INTEGER UNSIGNED NOT NULL,');
              Add('`Discount` DECIMAL(10,2),');
              Add('`CostPrice` DECIMAL(10,2),');
              Add('`Price2` DECIMAL(10,2),');
              Add('`Barcode` VARCHAR(30),');
              Add('`TCStockNo` VARCHAR(20),');
              Add('`ExtraDescr` VARCHAR(255),');
              Add('`ModelNo` VARCHAR(20),');
              Add('`Comment` VARCHAR(10),');
              Add('PRIMARY KEY(`Nr`),');
              Add('KEY `LinkInd` (`LinkID`)');
              Add(') ENGINE = InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`cashup_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Date` INTEGER UNSIGNED,');
              Add('`User` VARCHAR(30),');
              Add('`RealCashTotal` DECIMAL(10,2),');
              Add('`RealChequesTotal` DECIMAL(10,2),');
              Add('`RealCreditCardTotal` DECIMAL(10,2),');
              Add('`RealOtherTotal` Decimal(10,2),');
              Add('`CountCashTotal` DECIMAL(10,2),');
              Add('`CountChequesTotal` DECIMAL(10,2),');
              Add('`CountCreditCardTotal` DECIMAL(10,2),');
              Add('`CountOtherTotal` Decimal(10,2),');
              Add('`TotalInvoices` INTEGER UNSIGNED,');
              Add('`CUClosed` VARCHAR(5),');
              Add('`SyncHQ` INTEGER UNSIGNED,');
              Add('`RealLayBuys` DECIMAL(10,2),');
              Add('`CountLayBuys` DECIMAL(10,2),');
              Add('`TotalLayBuys` INTEGER UNSIGNED,');
              Add('`TimeStamp` VARCHAR(20),');
              Add('PRIMARY KEY(`Nr`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`branch_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Name` VARCHAR(30),');
              Add('`Tel` VARCHAR(20),');
              Add('`Adr1` VARCHAR(30),');
              Add('`Adr2` VARCHAR(30),');
              Add('`Adr3` VARCHAR(30),');
              Add('`PCode` VARCHAR(5),');
              Add('`Contact` VARCHAR(30),');
              Add('`LastSync` INTEGER UNSIGNED,');
              Add('`Created` INTEGER UNSIGNED,');
              Add('`StartInvNo` INTEGER UNSIGNED,');
              Add('PRIMARY KEY(`Nr`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`stocktrnsfer_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Branch_no` INTEGER UNSIGNED,');
              Add('`Date` INTEGER UNSIGNED,');
              Add('`Sync` INTEGER UNSIGNED,');
              Add('`Closed` VARCHAR(5) NOT NULL DEFAULT ''False'',');
              Add('PRIMARY KEY(`Nr`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`stocktrnsferitem_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`StockNo` INTEGER UNSIGNED,');
              Add('`Qty` DECIMAL(10,2),');
              Add('`BeforeQty` DECIMAL(10,2),');
              Add('`Description` VARCHAR(30),');
              Add('`LinkID` INTEGER UNSIGNED,');
              Add('`TCStockNo` VARCHAR(20),');
              Add('`Transfered` INTEGER UNSIGNED,');
              Add('PRIMARY KEY(`Nr`),');
              Add('INDEX `LinkIDInd`(`LinkID`),');
              Add('INDEX `StockNoInd`(`StockNo`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`trans_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`Description` VARCHAR(30),');
              Add('`Ammount` DECIMAL(10,2),');
              Add('`Date` INTEGER UNSIGNED,');
              Add('`LinkID` INTEGER UNSIGNED NOT NULL,');
              Add('`ShiftSet` INTEGER UNSIGNED,');
              Add('`SyncHQ` INTEGER UNSIGNED,');
              Add('`PaymentType` VARCHAR(15),');
              Add('`CUSet` INTEGER UNSIGNED,');
              Add('`PaymentBy` VARCHAR(45),');
              Add('PRIMARY KEY(`Nr`),');
              Add('INDEX `LinkIDInd`(`LinkID`)');
              Add(') ENGINE=InnoDB;');
            end;
            Query.ExecSQL;
            IniFile.WriteString ('Login', 'Username', Login.Text);
            IniFile.WriteString ('Login', 'Password', Encrypt(Password.Text));
            Inifile.WriteString('Login','Database', Schema.Text);
            IniFile.WriteString ('Login', 'Ip', Ip.Text);
            IniFile.WriteString ('Login', 'Port', PortEdit.Text);
            with Query.SQL do begin
              Clear;
              Add('Insert into `' + Schema.Text + '`.`user_db` (UserName, Password, Rights)');
              Add('Values ("' + Login.Text + '","' + Encrypt(Password.Text) + '",5)');
            end;
            Query.ExecSQL;
          end;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''invoice_db''');
            Add('and COLUMN_NAME=''RefNo''');
          end;
          Query.Open;
          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoice_db` ADD COLUMN `RefNo` VARCHAR(15) AFTER `Premium`;');
            end;
            Query.ExecSQL;
          end;

          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''InvNo''');
          end;
          Query.Open;
          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`global_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL,');
              Add('`InvNo` INTEGER UNSIGNED NOT NULL,');
              Add('`PurchaseInvNo` INTEGER UNSIGNED NOT NULL,');
              Add('PRIMARY KEY(`Nr`)');
              Add(') ENGINE = InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('Insert into `' + Schema.Text + '`.`global_db` (Nr, InvNo, PurchaseInvNo)');
              Add('Values (1,' + InttoStr(IniFile.ReadInteger('Invoice', 'InvNo', 0)) + ',' + InttoStr(IniFile.ReadInteger('Invoice', 'PurchaseInvNo', 0)) + ')');
            end;
            Query.ExecSQL;
//            with Query.SQL do begin
//              Clear;
//              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `BranchNo` INTEGER UNSIGNED AFTER `PaymentBy`;');
//            end;
//            Query.ExecSQL;
          end;

          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''invoice_db''');
            Add('and COLUMN_NAME=''TestField''');
          end;
          Query.Open;
          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoiceitem_db` MODIFY COLUMN `Qty` DECIMAL(8,2) DEFAULT NULL;');
            end;
            Query.ExecSQL;
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoice_db` ADD COLUMN `TestField` VARCHAR(20) AFTER `RefNo`;');
            end;
            Query.ExecSQL;
          end;

          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''invoiceitem_db''');
            Add('and COLUMN_NAME=''BranchNo''');
          end;
          Query.Open;

     // 1.0.4.0

          If Query.RecordCount = 0 then
          begin
            Query.Close;
//            with Query.SQL do begin
//              Clear;
//              Add('Update `' + Schema.Text + '`.`invoiceitem_db` set BranchNo = 0');
//              Add('where BranchNo is null');
//            end;
//            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoiceitem_db` ADD COLUMN `BranchNo` INTEGER NOT NULL DEFAULT 0,');
              Add('DROP INDEX `LinkInd`,');
              Add('ADD INDEX `LinkInd` USING BTREE(`LinkId`, `BranchNo`);');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('Update `' + Schema.Text + '`.`invoice_db` set BranchNo = 0');
              Add('where BranchNo is null');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoice_db` MODIFY COLUMN `BranchNo` INTEGER NOT NULL DEFAULT 0,');
              Add('DROP PRIMARY KEY,');
              Add('ADD PRIMARY KEY  USING BTREE(`Nr`, `BranchNo`),');
              Add('DROP INDEX `InvNoInd`,');
              Add('ADD INDEX `InvNoInd` USING BTREE(`InvNo`);');
            end;
            Query.ExecSQL;

            Query2.Close;
            with Query2.SQL do begin
              Clear;
              Add('Select Nr,BranchNo from `' + Schema.Text + '`.`invoice_db`');
            end;
            Query2.Open;
            If Query2.RecordCount <> 0 then
            begin
              Query2.first;
              try
                while not Query2.EOF do
                begin
                  with Query.SQL do begin
                    Clear;
                    if Query2.FieldByName('BranchNo').IsNull = False then
                    begin
                      Add('update `' + Schema.Text + '`.`invoiceitem_db` set BranchNo = ' + InttoStr(Query2.FieldByName('BranchNo').asInteger));
                      Add('where (LinkID = ' + InttoStr(Query2.FieldByName('Nr').AsInteger) + ')');
                    end;
                  end;
                  Query.ExecSQL;
                  Query2.Next;
                end;
              finally
              end;
            end;
            Query2.Close;

            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `BranchNo` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `PaymentBy`;');
            end;
            Query.ExecSQL;

            Query2.Close;
            with Query2.SQL do begin
              Clear;
              Add('Select InvNo,BranchNo from `' + Schema.Text + '`.`invoice_db`');
              Add('where InvClose=''LaybO'' or InvClose=''LaybC''');
            end;
            Query2.Open;
            If Query2.RecordCount <> 0 then
            begin
              Query2.first;
              try
                while not Query2.EOF do
                begin
                  with Query.SQL do
                  begin
                    Clear;
                    Add('update `' + Schema.Text + '`.`trans_db` set BranchNo = ' + InttoStr(Query2.FieldByName('BranchNo').asInteger));
                    Add('where (LinkID = ' + InttoStr(Query2.FieldByName('InvNo').AsInteger) + ')');
                  end;
                  Query.ExecSQL;
                  Query2.Next;
                end;
              finally
              end;
            end;
            Query2.Close;

            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoiceitem_db` ADD INDEX `TCStockNoInd`(`TCStockNo`);');
            end;
            Query.ExecSQL;
          end;
          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''DAccNo''');
          end;
          Query.Open;
    //1.1.0.0

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do
            begin
              Clear;
              Add('CREATE TABLE `' + Schema.Text + '`.`accounts_db` (');
              Add('`Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`AccNo` INTEGER UNSIGNED NOT NULL DEFAULT 0,');
              Add('`Name` VARCHAR(45),');
              Add('`Surname` VARCHAR(45),');
              Add('`ID` VARCHAR(20),');
              Add('`AccType` INTEGER UNSIGNED NOT NULL,');
              Add('`CompanyName` VARCHAR(45),');
              Add('`Tel` VARCHAR(20),');
              Add('`TelF` VARCHAR(20),');
              Add('`TelC` VARCHAR(20),');
              Add('`HAdr1` VARCHAR(30),');
              Add('`HAdr2` VARCHAR(30),');
              Add('`HAdr3` VARCHAR(30),');
              Add('`PAdr1` VARCHAR(30),');
              Add('`PAdr2` VARCHAR(30),');
              Add('`PAdr3` VARCHAR(30),');
              Add('`PCode` VARCHAR(5),');
              Add('`EMail` VARCHAR(45),');
              Add('`ChangeDate` INTEGER UNSIGNED,');
              Add('`CreateDate` INTEGER UNSIGNED,');
              Add('`BeginDate` INTEGER UNSIGNED,');
              Add('`EndDate` INTEGER UNSIGNED DEFAULT 0,');
              Add('`ByUser` VARCHAR(20),');
              Add('`DueDays` INTEGER UNSIGNED,');
              Add('`Total` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`BranchNo` INTEGER UNSIGNED NOT NULL DEFAULT 0,');
              Add('`SyncHQ` INTEGER UNSIGNED,');
              Add('`SyncBranch` INTEGER UNSIGNED,');
              Add('`Days30` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`Days60` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`Days90` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`Days120` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`Current` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('`RefNo` VARCHAR(30),');
              Add('`TCNo` VARCHAR(20),');
              Add('`BeginTotal` DECIMAL(10,2) NOT NULL DEFAULT 0,');
              Add('PRIMARY KEY (`Nr`),');
              Add('UNIQUE INDEX `AccNoInd`(`AccNo`, `BranchNo`, `AccType`),');
              Add('INDEX `IDInd`(`ID`),');
              Add('INDEX `AccNameInd`(`Surname`,`Name`)');
              Add(') ENGINE = InnoDB;');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `TYear` INTEGER UNSIGNED AFTER `BranchNo`,');
              Add('ADD COLUMN `TMonth` INTEGER UNSIGNED AFTER `TYear`,');
              Add('ADD COLUMN `SyncBranch` INTEGER UNSIGNED AFTER `TMonth`,');
              Add('ADD COLUMN `TransType` CHAR(1) DEFAULT ''L'' AFTER `SyncBranch`,');
              Add('DROP INDEX `LinkIDInd`,');
              Add('ADD INDEX `LinkIDInd` USING BTREE(`LinkID`, `BranchNo`);');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `IInvNo` INTEGER UNSIGNED AFTER `TransType`,');
              Add('ADD COLUMN `IBranchNo` INTEGER UNSIGNED AFTER `IInvNo`;');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `RefNo` VARCHAR(20) AFTER `IBranchNo`;');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `DAccNo` INTEGER UNSIGNED DEFAULT 0 AFTER `PurchaseInvNo`,');
              Add('ADD COLUMN `CAccNo` INTEGER UNSIGNED DEFAULT 0 AFTER `DAccNo`,');
              Add('ADD COLUMN `DActiveMonth` INTEGER UNSIGNED DEFAULT 0 AFTER `CAccNo`,');
              Add('ADD COLUMN `CActiveMonth` INTEGER UNSIGNED DEFAULT 0 AFTER `DActiveMonth`;');
            end;
            Query.ExecSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''invoiceitem_db''');
            Add('and COLUMN_NAME=''RentalSwi''');
          end;
          Query.Open;
    //1.1.1.1

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoiceitem_db` ADD COLUMN `RentalSwi` VARCHAR(5) DEFAULT ''False'' AFTER `BranchNo`,');
              Add('ADD COLUMN `ItemOrder` INTEGER UNSIGNED AFTER `RentalSwi`,');
              Add('ADD COLUMN `CommentSwi` VARCHAR(5) DEFAULT ''False'' AFTER `ItemOrder`;');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` ADD COLUMN `Commision` DECIMAL(8,2) AFTER `ModelNo`;');
            end;
            Query.ExecSQL;
            with Query.SQL do
            begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`trans_db` ADD COLUMN `TransOrder` VARCHAR(2) DEFAULT ''F'' AFTER `RefNo`;');
            end;
            Query.ExecSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''BranchNo''');
          end;
          Query.Open;
    //1.1.1.6

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `BranchNo` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `CActiveMonth`;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`accounts_db` MODIFY COLUMN `EMail` VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoice_db` MODIFY COLUMN `ClientEMail` VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `Vat` INTEGER UNSIGNED NOT NULL DEFAULT 14 AFTER `BranchNo`;');
            end;
            Query.ExecSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` MODIFY COLUMN `Vat` FLOAT NOT NULL DEFAULT 14;');
            end;
            Query.ExecSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''accounts_db''');
            Add('and COLUMN_NAME=''AllowCredit''');
          end;
          Query.Open;
    //1.1.1.7

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`accounts_db` ADD COLUMN `Discount` DECIMAL(10,2) DEFAULT 0 AFTER `BeginTotal`,');
              Add('ADD COLUMN `AllowCredit` VARCHAR(5) DEFAULT ''False'' AFTER `Discount`;');
            end;
            Query.ExecSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''ReportTitle''');
          end;
          Query.Open;
    //1.1.1.7

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `ReportTitle` VARCHAR(150) DEFAULT ''Pos List'' AFTER `Vat`;');
            end;
            Query.ExecSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''LayBuyEnable''');
          end;
          Query.Open;
    //1.1.1.9

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `LayBuyEnable` VARCHAR(2) AFTER `ReportTitle`,');
              Add('ADD COLUMN `LayBuyTerm` INTEGER UNSIGNED AFTER `LayBuyEnable`,');
              Add('ADD COLUMN `LayBuyDeposit` DECIMAL(10,2) AFTER `LayBuyTerm`,');
              Add('ADD COLUMN `OtherDescr` VARCHAR(20) AFTER `LayBuyDeposit`,');
              Add('ADD COLUMN `NegQty` VARCHAR(2) AFTER `OtherDescr`,');
              Add('ADD COLUMN `CommentDescr` VARCHAR(20) AFTER `NegQty`,');
              Add('ADD COLUMN `MinimumMarkup` FLOAT AFTER `CommentDescr`,');
              Add('ADD COLUMN `ShowAdditions` VARCHAR(2) AFTER `MinimumMarkup`,');
              Add('ADD COLUMN `CurrentUser` VARCHAR(2) AFTER `ShowAdditions`,');
              Add('ADD COLUMN `TCCashDebNo` VARCHAR(30) AFTER `CurrentUser`,');
              Add('ADD COLUMN `TCStockNoBarcode` VARCHAR(2) AFTER `TCCashDebNo`;');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stocktrnsferitem_db` ADD INDEX `TCStockNo`(`TCStockNo`);');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` ADD INDEX `TCStockNoInd`(`TCStockNo`);');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`invoice_db` ADD INDEX `InvCloseInd`(`InvClose`);');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stocktrnsfer_db` DROP PRIMARY KEY,');
              Add('ADD PRIMARY KEY  USING BTREE(`Nr`, `Branch_no`),');
              Add('ADD INDEX `ClosedInd`(`Closed`);');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` DROP INDEX `TCStockNoInd`,');
              Add('ADD UNIQUE INDEX `TCStockNoInd` USING BTREE(`TCStockNo`, `BranchNo`);');
            end;
            Query.execSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''stock_db''');
            Add('and COLUMN_NAME=''AvgCost''');
          end;
          Query.Open;
    //1.1.2.4

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` ADD COLUMN `AvgCost` DECIMAL(10,2) AFTER Commision;');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `DefaultRecPrintChoice` VARCHAR(2) AFTER `TCStockNoBarcode`,');
              Add('ADD COLUMN `Usr3AllowItemAmmChange` VARCHAR(2) AFTER `DefaultRecPrintChoice`;');
            end;
            Query.execSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''stock_db''');
            Add('and COLUMN_NAME=''CreditorLink''');
          end;
          Query.Open;
    //1.1.2.5

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` ADD COLUMN `CreditorLink` VARCHAR(20) AFTER `AvgCost`;');
            end;
            Query.execSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''Usr3AllowVisibleCashup''');
          end;
          Query.Open;
    //1.1.2.7



          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `Usr3AllowVisibleCashup` VARCHAR(2) AFTER `Usr3AllowItemAmmChange`;');
            end;
            Query.execSQL;
          end;

          Query.Close;
          with Query.SQL do begin
            Clear;
            Add('select * from information_schema.COLUMNS');
            Add('where TABLE_SCHEMA='''+ Schema.Text +'''');
            Add('and TABLE_NAME=''global_db''');
            Add('and COLUMN_NAME=''SQLScriptsNo''');
          end;
          Query.Open;
    //1.1.3.0

          If Query.RecordCount = 0 then
          begin
            Query.Close;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` DROP INDEX `TCStockNoInd`,');
              Add('ADD UNIQUE INDEX `TCStockNoInd` USING BTREE(`TCStockNo`, `BranchNo`);');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('DROP TABLE if exists `' + Schema.Text + '`.`stockadjust_db`;');
              Add('CREATE TABLE `' + Schema.Text + '`.`stockadjust_db` (');
              Add('`st_adj_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,');
              Add('`BranchNo` INTEGER UNSIGNED,');
              Add('`TCStockNoLink` VARCHAR(20) NOT NULL,');
              Add('`st_adj_by` VARCHAR(30) NOT NULL,');
              Add('`st_adj_date` INTEGER UNSIGNED NOT NULL,');
              Add('`st_adj_value` DECIMAL(10,2) NOT NULL,');
              Add('`st_adj_timestamp` TIMESTAMP NOT NULL,');
              Add('`SyncHQ` INTEGER UNSIGNED,');
              Add('PRIMARY KEY (`st_adj_id`),');
              Add('INDEX `TCStockNoInd`(`TCStockNoLink`, `BranchNo`))');
              Add('ENGINE = InnoDB;');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stock_db` ADD COLUMN `st_created_by` VARCHAR(45) NOT NULL DEFAULT ''none'' AFTER `CreditorLink`,');
              Add('ADD COLUMN `st_changed_by` VARCHAR(45) NOT NULL DEFAULT ''none'' AFTER `st_created_by`,');
              Add('ADD COLUMN `st_nontaxitem` VARCHAR(5) NOT NULL DEFAULT ''False'' AFTER `st_changed_by`;');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`stockadjust_db` ADD COLUMN `st_adj_type` VARCHAR(10) NOT NULL DEFAULT ''Adj'' AFTER `SyncHQ`;');
            end;
            Query.execSQL;
            with Query.SQL do begin
              Clear;
              Add('ALTER TABLE `' + Schema.Text + '`.`global_db` ADD COLUMN `SQLScriptsNo` INTEGER UNSIGNED AFTER `Usr3AllowVisibleCashup`;');
            end;
            Query.execSQL;
          end;
        end
        else
        begin
          try
            ADConnection.Params.Clear;
            ADConnection.Params.Add('DriverID=MySQL');
            ADConnection.Params.Add('Database=' + Schema.Text);
            ADConnection.Params.Add('User_Name='+Login.Text);
            ADConnection.Params.Add('Password='+Password.Text);
            ADConnection.Params.Add('Server='+Ip.Text);
            ADConnection.Params.Add('Port='+PortEdit.Text);
            ADConnection.Open;
          except
            ShowMessage('Unable to connect to MySQL Server');
          raise;
          end;
          IniFile.WriteString ('Login', 'Username', Login.Text);
          IniFile.WriteString ('Login', 'Password', Encrypt(Password.Text));
          Inifile.WriteString('Login','Database', Schema.Text);
          IniFile.WriteString ('Login', 'Ip', Ip.Text);
          IniFile.WriteString ('Login', 'Port', PortEdit.Text);
        end;

        Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
          localdir,AllUsersDataPath,UserDataPath,FileNameStr:String;
begin
        UserDataPath := GetSpecialFolder(CSIDL_APPDATA);
        localdir := GetCurrentDir;
        AllUsersDataPath := GetSpecialFolder(CSIDL_COMMON_APPDATA);
        if (Fileexists(localdir + '\ncompPOS.exe')) then
        begin
          FileNameStr := 'ncompPOS.ini';
        end
        else
        begin
          FileNameStr := 'Turbopos.ini';
        end;

        if Fileexists(UserDataPath + '\NCompPOS\' + FileNameStr) then
        begin
          IniFile := TIniFile.Create (UserDataPath + '\NCompPOS\' + FileNameStr)
        end
        else
        begin
          IniFile := TIniFile.Create (FileNameStr);
        end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
          Login.Text := IniFile.ReadString('Login', 'Username', 'root');
          Password.Text := Decrypt(IniFile.ReadString('Login', 'Password', ''));
          Schema.Text := IniFile.ReadString('Login', 'Database', 'ncomp');
          Ip.Text := IniFile.ReadString('Login', 'Ip', 'localhost');
          PortEdit.Text := IniFile.ReadString('Login', 'Port', '3306');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
          IniFile.Free;
end;

end.
