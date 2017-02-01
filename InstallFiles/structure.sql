-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	4.1.16-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Create schema riskfin
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ ncomp;
USE ncomp;

DROP TABLE IF EXISTS `user_db`;
CREATE TABLE `user_db` (
  `Nr` int(10) unsigned NOT NULL auto_increment,
  `UserName` varchar(45) NOT NULL default '',
  `Password` varchar(45) default NULL,
  `Rights` int(10) unsigned default NULL,
  PRIMARY KEY  (`Nr`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `notes_db`;
CREATE TABLE `notes_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Date` INTEGER(10) UNSIGNED,
  `LinkID` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  `FromWhere` CHAR NOT NULL DEFAULT '',
  `Description` VARCHAR(150),
  `AttentionDate` INTEGER(10) UNSIGNED,
  `NoteBy` VARCHAR(45),
  `Completed` VARCHAR(5) NOT NULL DEFAULT 'False',
  `AttentionTime` VARCHAR(10),
  PRIMARY KEY(`Nr`),
  UNIQUE `LinkInd`(`LinkID`, `FromWhere`, `Nr`)
) ENGINE=MYISAM;

DROP TABLE IF EXISTS `stock_db`;
CREATE TABLE `stock_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45),
  `DateCreated` INTEGER UNSIGNED,
  `DateChanged` INTEGER UNSIGNED,
  `CostPrice` DECIMAL(10,2),
  `SalesPrice` DECIMAL(10,2),
  `SalesPrice2` DECIMAL(10,2),
  `Barcode` VARCHAR(30),
  `Qty` DECIMAL(8,2),
  `AlertQty` DECIMAL(8,2),
  `NonStockItem` VARCHAR(5),
  `StartingQty` DECIMAL(8,2),
  `TCStockNo` VARCHAR(20),
  `Changed` CHAR,
  `BranchNo` INTEGER,
  `SyncHQ` INTEGER,
  `BranchMainStockNo` INTEGER UNSIGNED,
  `Group` VARCHAR(20),
  `ExtraDescr` VARCHAR(100),
  `ModelNo` VARCHAR(20),
  PRIMARY KEY(`Nr`),
  INDEX `BarcodeInd`(`Barcode`),
  INDEX `DescriptionInd`(`Description`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `invoice_db`;
CREATE TABLE  `invoice_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `ClientName` varchar(30) default NULL,
  `ClientTelW` varchar(20) default NULL,
  `ClientTelC` varchar(20) default NULL,
  `ClientAdr1` varchar(30) default NULL,
  `ClientAdr2` varchar(30) default NULL,
  `ClientAdr3` varchar(30) default NULL,
  `ClientPCode` varchar(4) default NULL,
  `ClientVatNo` varchar(30) default NULL,
  `InvDate` int(10) unsigned default NULL,
  `InvBy` varchar(45) default NULL,
  `MemLink` int(10) unsigned default NULL,
  `InvClose` varchar(5) default NULL,
  `AmmTendered` decimal(10,2) default NULL,
  `InvoiceType` varchar(15) default NULL,
  `GLDebNo` varchar(20) default NULL,
  `CUSet` int(11) default NULL,
  `InvTotal` decimal(10,2) default NULL,
  `ShiftSet` varchar(20) default NULL,
  `InvNo` int(10) unsigned NOT NULL default '0',
  `ClientEMail` VARCHAR(30) default NULL,
  `BranchNo` INTEGER default NULL,
  `SyncHQ` INTEGER default NULL,
  `Days30` decimal(10,2) default NULL,
  `Days60` decimal(10,2) default NULL,
  `Days90` decimal(10,2) default NULL,
  `Days120` decimal(10,2) default NULL,
  `TermMonths` INTEGER UNSIGNED,
  `Premium` decimal(10,2) default NULL,
  PRIMARY KEY  (`Nr`),
  INDEX `InvNoInd`(`InvNo`)
) ENGINE=MyISAM;


DROP TABLE IF EXISTS `invoiceitem_db`;
CREATE TABLE `invoiceitem_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45),
  `Price` DECIMAL(10,2),
  `Qty` DECIMAL(5,2),
  `StockNo` INTEGER UNSIGNED,
  `LinkId` INTEGER UNSIGNED NOT NULL,
  `Discount` DECIMAL(10,2),
  `CostPrice` DECIMAL(10,2),
  `Price2` DECIMAL(10,2),
  `Barcode` VARCHAR(30),
  `TCStockNo` VARCHAR(20),
  `ExtraDescr` VARCHAR(100),
  `ModelNo` VARCHAR(20),
  PRIMARY KEY(`Nr`),
  KEY `LinkInd` (`LinkID`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `cashup_db`;
CREATE TABLE `cashup_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Date` INTEGER UNSIGNED,
  `User` VARCHAR(30),
  `RealCashTotal` DECIMAL(10,2),
  `RealChequesTotal` DECIMAL(10,2),
  `RealCreditCardTotal` DECIMAL(10,2),
  `RealOtherTotal` Decimal(10,2),
  `CountCashTotal` DECIMAL(10,2),
  `CountChequesTotal` DECIMAL(10,2),
  `CountCreditCardTotal` DECIMAL(10,2),
  `CountOtherTotal` Decimal(10,2),
  `TotalInvoices` INTEGER UNSIGNED,
  `CUClosed` VARCHAR(5),
  `SyncHQ` INTEGER UNSIGNED,
  `RealLayBuys` DECIMAL(10,2),
  `CountLayBuys` DECIMAL(10,2),
  `TotalLayBuys` INTEGER UNSIGNED,
  PRIMARY KEY(`Nr`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `branch_db`;
CREATE TABLE `branch_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30),
  `Tel` VARCHAR(20),
  `Adr1` VARCHAR(30),
  `Adr2` VARCHAR(30),
  `Adr3` VARCHAR(30),
  `PCode` VARCHAR(5),
  `Contact` VARCHAR(30),
  `LastSync` INTEGER UNSIGNED,
  `Created` INTEGER UNSIGNED,
  `StartInvNo` INTEGER UNSIGNED,
  PRIMARY KEY(`Nr`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `stocktrnsfer_db`;
CREATE TABLE `stocktrnsfer_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Branch_no` INTEGER UNSIGNED,
  `Date` INTEGER UNSIGNED,
  `Sync` INTEGER UNSIGNED,
  `Closed` VARCHAR(5) NOT NULL DEFAULT 'False',
  PRIMARY KEY(`Nr`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `stocktrnsferitem_db`;
CREATE TABLE `stocktrnsferitem_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `StockNo` INTEGER UNSIGNED,
  `Qty` DECIMAL(10,2),
  `BeforeQty` DECIMAL(10,2),
  `Description` VARCHAR(30),
  `LinkID` INTEGER UNSIGNED,
  `TCStockNo` VARCHAR(20),
  `Transfered` INTEGER UNSIGNED,
  PRIMARY KEY(`Nr`),
  INDEX `LinkIDInd`(`LinkID`),
  INDEX `StockNoInd`(`StockNo`)
)
ENGINE = MYISAM;

DROP TABLE IF EXISTS `trans_db`;
CREATE TABLE `trans_db` (
  `Nr` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(30),
  `Ammount` DECIMAL(10,2),
  `Date` INTEGER UNSIGNED,
  `LinkID` INTEGER UNSIGNED NOT NULL,
  `ShiftSet` INTEGER UNSIGNED,
  `SyncHQ` INTEGER UNSIGNED,
  `PaymentType` VARCHAR(15),
  `CUSet` INTEGER UNSIGNED,
  `PaymentBy` VARCHAR(45),
  PRIMARY KEY(`Nr`),
  INDEX `LinkIDInd`(`LinkID`)
)
ENGINE = MyISAM;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
