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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ riskfin;
USE riskfin;

DROP TABLE IF EXISTS `bank_db`;
CREATE TABLE `bank_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `BankName` varchar(30) default NULL,
  `BranchName` varchar(30) default NULL,
  `BranchCode` varchar(15) default NULL,
  `AccountNo` varchar(15) default NULL,
  `AccountHolderName` varchar(30) default NULL,
  `TypeAccount` int(1) default NULL,
  `DeductionDate` int(10) unsigned default '0',
  `LinkID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `LinkIdInd` (`LinkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `children_db`;
CREATE TABLE `children_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `Surname` varchar(30) default NULL,
  `Names` varchar(30) default NULL,
  `ID` varchar(13) default NULL,
  `CaptiorDate` int(10) unsigned default '0',
  `BeginDate` int(10) unsigned default '0',
  `EndDate` int(10) unsigned default '0',
  `LinkID` int(10) unsigned NOT NULL default '0',
  `BirthDate` int(10) unsigned default '0',
  `ChangeDate` int(10) unsigned default NULL,
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `LinkIdInd` (`LinkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `death_db`;
CREATE TABLE `death_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `ClaimAmmount` decimal(10,2) default NULL,
  `DeathReason` varchar(40) default NULL,
  `DateReceived` int(8) unsigned default NULL,
  `Accepted` varchar(5) default 'False',
  `AcceptedAmmount` decimal(10,2) default NULL,
  `DeathDate` int(8) unsigned default '0',
  `LinkId` int(11) default '0',
  `DateAccepted` int(8) unsigned default NULL,
  `DeathConfirmed` varchar(5) default 'False',
  `FromWhere` varchar(10) default NULL,
  `FromId` varchar(13) default NULL,
  `FromName` varchar(45) default NULL,
  `FromSurname` varchar(45) default NULL,
  `ClaimantsNames` varchar(45) default NULL,
  `ClaimantsSurname` varchar(45) default NULL,
  `ClaimantsBirthDate` int(10) unsigned default '0',
  `ClaimantsId` varchar(13) default NULL,
  `ClaimantsTelH` varchar(20) default NULL,
  `ClaimantsTelW` varchar(20) default NULL,
  `ClaimantsStrAdr` varchar(100) default NULL,
  `ClaimantsPosAdr` varchar(100) default NULL,
  `ClaimantsPosCode` varchar(10) default NULL,
  `Relationship` varchar(45) default NULL,
  `MainMemberId` varchar(5) default NULL,
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `LinkIdInd` (`LinkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `extended_db`;
CREATE TABLE `extended_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `Surname` varchar(30) default NULL,
  `Names` varchar(30) default NULL,
  `Initials` varchar(10) default NULL,
  `ID` varchar(13) default NULL,
  `Premium` decimal(10,2) default NULL,
  `BeginDate` int(10) unsigned default '0',
  `CaptiorDate` int(10) unsigned default '0',
  `LinkID` int(10) unsigned NOT NULL default '0',
  `BirthDate` int(10) unsigned default '0',
  `EndDate` int(10) unsigned default '0',
  `WaitingPeriod` int(2) default '0',
  `ProductLink` int(6) unsigned default NULL,
  `ChangeDate` int(10) unsigned default NULL,
  PRIMARY KEY  (`Nr`),
  KEY `LinkIDInd` (`LinkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `group_db`;
CREATE TABLE `group_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `GroupName` varchar(40) default NULL,
  `CaptiorDate` int(10) unsigned default '0',
  `BeginDate` int(10) unsigned default '0',
  `EndDate` int(10) unsigned default '0',
  `Active` smallint(6) default '0',
  `Contact` varchar(30) default NULL,
  `StrAdr1` varchar(30) default NULL,
  `StrAdr2` varchar(30) default NULL,
  `StrAdr3` varchar(30) default NULL,
  `PosAdr1` varchar(30) default NULL,
  `PosAdr2` varchar(30) default NULL,
  `PosAdr3` varchar(30) default NULL,
  `PosCode` varchar(4) default NULL,
  `WTel` varchar(20) default NULL,
  `CTel` varchar(20) default NULL,
  `FTel` varchar(20) default NULL,
  `Producttype` int(10) unsigned default '0',
  `UnderwriterTotal` decimal(10,2) default '0.00',
  `RetailTotal` decimal(10,2) default '0.00',
  `CommisionTotal` decimal(10,2) default '0.00',
  `MemberTotal` int(11) default '0',
  `AgentCode` varchar(20) default NULL,
  `CustomProduct` varchar(5) default 'False',
  `BankName` varchar(30) default NULL,
  `BranchName` varchar(30) default NULL,
  `BranchCode` varchar(20) default NULL,
  `BankAccNo` varchar(30) default NULL,
  `TypeAcc` varchar(30) default NULL,
  `MUnderwriterTotal` decimal(10,2) default '0.00',
  `MRetailTotal` decimal(10,2) default '0.00',
  `MProfitTotal` decimal(10,2) default '0.00',
  `LastMonthUpdate` int(10) unsigned default NULL,
  `MMemberTotal` int(10) unsigned default '0',
  `EMail` varchar(45) default NULL,
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `GroupNameInd` (`GroupName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `institution_db`;
CREATE TABLE `institution_db` (
  `Nr` tinyint(6) unsigned NOT NULL auto_increment,
  `InstitutionType` int(1) default NULL,
  `CompanyCode` varchar(15) default NULL,
  `TransactionType` varchar(30) default NULL,
  `DeductionDate` int(10) unsigned default '0',
  `PerselNr` varchar(15) default NULL,
  `DepartmentCode` varchar(15) default NULL,
  `OnderskrywersCompanyNr` varchar(15) default NULL,
  `LinkId` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `LinkIdInd` (`LinkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `member_db`;
CREATE TABLE `member_db` (
  `Nr` int(6) unsigned NOT NULL default '0',
  `Surname` varchar(30) NOT NULL default '',
  `FullName` varchar(30) default NULL,
  `Initials` varchar(10) default NULL,
  `H Adr1` varchar(30) default NULL,
  `H Adr2` varchar(30) default NULL,
  `H Adr3` varchar(30) default NULL,
  `P Adr1` varchar(30) default NULL,
  `P Adr2` varchar(30) default NULL,
  `P Adr3` varchar(30) default NULL,
  `P Kode` varchar(4) default NULL,
  `Tel H` varchar(15) default NULL,
  `Tel W` varchar(15) default NULL,
  `Tel C` varchar(15) default NULL,
  `Married` char(1) default NULL,
  `RefNr` varchar(20) default NULL,
  `Agent code` varchar(20) default NULL,
  `PolicyStatus` int(1) default NULL,
  `Paymentmethod` int(1) default '0',
  `BeginDate` int(10) unsigned default '0',
  `CaptiorDate` int(10) unsigned default '0',
  `EndDate` int(10) unsigned default '0',
  `Reason` varchar(40) default NULL,
  `GroupLink` int(10) unsigned default NULL,
  `Sex` char(1) default NULL,
  `ID` varchar(13) NOT NULL default '',
  `ProductLink` int(10) unsigned default NULL,
  `WaitingPeriod` int(3) unsigned default '0',
  `BirthDate` int(10) unsigned NOT NULL default '0',
  `FullPremium` decimal(10,2) default '0.00',
  `DuplID` int(11) default '0',
  `LastPayment` int(10) unsigned default NULL,
  `ExtraFees` decimal(10,2) default '0.00',
  `ChangeDate` int(10) unsigned default NULL,
  `EMail` varchar(45) default NULL,
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  UNIQUE KEY `IDInd` (`ID`,`DuplID`),
  KEY `SurnameInd` (`Surname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pay_db`;
CREATE TABLE `pay_db` (
  `Nr` int(10) unsigned NOT NULL default '0',
  `LinkId` int(10) unsigned NOT NULL default '0',
  `Ammount` decimal(10,2) NOT NULL default '0.00',
  `PayDate` int(10) unsigned NOT NULL default '0',
  `Month` int(10) unsigned default '0',
  `Year` int(10) unsigned default '0',
  `Printed` varchar(5) default 'False',
  `User` varchar(45) default NULL,
  `RefNo` varchar(20) default NULL,
  PRIMARY KEY  (`Nr`),
  KEY `LinkInd` (`LinkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_db`;
CREATE TABLE `product_db` (
  `nr` int(6) unsigned NOT NULL auto_increment,
  `Description` varchar(40) default NULL,
  `AgeGroup` int(1) unsigned default NULL,
  `Coverage` decimal(10,2) default '0.00',
  `SpouseCoverage` decimal(10,2) default '0.00',
  `JoiningFee` decimal(10,2) default '0.00',
  `RetailPremium` decimal(10,2) default '0.00',
  `UnderwriterPremium` decimal(10,2) default '0.00',
  `Period` int(4) default NULL,
  `CommStructure` int(1) unsigned default NULL,
  `CommisionAmmount` decimal(10,2) default '0.00',
  `GroupLink` int(6) unsigned default NULL,
  `UnderwriterName` varchar(30) default NULL,
  `BeginAge` int(11) default '0',
  `EndAge` int(11) default '0',
  `Double` varchar(5) default 'False',
  `Married` int(11) default '0',
  `Child1Coverage` decimal(10,2) default '0.00',
  `Child2Coverage` decimal(10,2) default '0.00',
  `Child3Coverage` decimal(10,2) default '0.00',
  `Stillborn` decimal(10,2) default '0.00',
  `ExtendedChildFee` decimal(10,2) default '1.00',
  `CustomDesc` varchar(5) default NULL,
  PRIMARY KEY  (`nr`),
  UNIQUE KEY `nr` (`nr`),
  KEY `GroupLinkInd` (`GroupLink`,`Description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `productlist_db`;
CREATE TABLE `productlist_db` (
  `Nr` int(11) NOT NULL default '0',
  `Producttype` varchar(20) default NULL,
  `CustomType` varchar(5) default 'False',
  PRIMARY KEY  (`Nr`),
  KEY `ProducttypeInd` (`Producttype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `spouse_db`;
CREATE TABLE `spouse_db` (
  `Nr` int(6) unsigned NOT NULL auto_increment,
  `Surname` varchar(30) default NULL,
  `Names` varchar(30) default NULL,
  `Initials` varchar(10) default NULL,
  `ID` varchar(13) default NULL,
  `Sex` char(1) default NULL,
  `LinkID` int(10) unsigned NOT NULL default '0',
  `CaptiorDate` int(10) unsigned default '0',
  `BeginDate` int(10) unsigned default '0',
  `BirthDate` int(10) unsigned default '0',
  `WaitingPeriod` int(2) default '0',
  `EndDate` int(10) unsigned default '0',
  `ChangeDate` int(10) unsigned default NULL,
  PRIMARY KEY  (`Nr`),
  UNIQUE KEY `Nr` (`Nr`),
  KEY `LinkIdInd` (`LinkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_db`;
CREATE TABLE `user_db` (
  `Nr` int(10) unsigned NOT NULL auto_increment,
  `UserName` varchar(45) NOT NULL default '',
  `Password` varchar(45) default NULL,
  `Rights` int(10) unsigned default NULL,
  PRIMARY KEY  (`Nr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
