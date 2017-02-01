# MySQL-Front 3.2  (Build 1.26)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET CHARACTER SET 'latin1' */;


CREATE DATABASE rprintserv;
USE rprintserv;

CREATE TABLE accdb (
  `No` int(11) NOT NULL auto_increment,
  BusName varchar(30) default '',
  AccName varchar(30) default '',
  Tel varchar(15) default '',
  Adr1 varchar(30) default '',
  Adr2 varchar(30) default '',
  Adr3 varchar(100) default '',
  `Password` varchar(10) default '',
  BlackColor varchar(5) default '',
  Binding varchar(5) default '',
  Photos varchar(5) default '',
  EMail varchar(40) default '',
  Department varchar(30) default '',
  Category varchar(100) default '',
  ContactName varchar(30) default NULL,
  PRIMARY KEY  (`No`),
  KEY BusNameInd (BusName),
  KEY AccNameInd (AccName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE bindingdb (
  Id int(6) unsigned NOT NULL auto_increment,
  Binding varchar(30) default NULL,
  Cost decimal(10,2) default NULL,
  PRIMARY KEY  (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO bindingdb VALUES (1,'Glue',1.5);
INSERT INTO bindingdb VALUES (2,'Staple',0.5);
INSERT INTO bindingdb VALUES (3,'No Binding',0);
INSERT INTO bindingdb VALUES (4,'Ring Binding',3);

CREATE TABLE classdb (
  Id int(6) unsigned NOT NULL auto_increment,
  ClassName varchar(30) default NULL,
  PRIMARY KEY  (Id),
  UNIQUE KEY ClassNameInd (ClassName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO classdb VALUES (1,'Admin');
INSERT INTO classdb VALUES (2,'Management');

CREATE TABLE coverpaperdb (
  `No` int(11) NOT NULL auto_increment,
  CoverType varchar(30) NOT NULL default '',
  Cost decimal(10,2) default NULL,
  Size varchar(20) NOT NULL default '',
  `Type` varchar(20) NOT NULL default '',
  Color varchar(20) NOT NULL default '',
  Weight varchar(100) NOT NULL default '',
  Printable varchar(20) NOT NULL default '',
  PRIMARY KEY  (`No`),
  KEY CoverTypeInd (CoverType)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE debitnotetable (
  Id int(6) unsigned NOT NULL auto_increment,
  `Date` varchar(10) default NULL,
  AccLink int(6) NOT NULL default '0',
  JobLink int(6) NOT NULL default '0',
  Description varchar(30) default NULL,
  Total decimal(10,2) default NULL,
  PRIMARY KEY  (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO debitnotetable VALUES (2,'2005/05/26',1,9,'Debit Note',155.7);
INSERT INTO debitnotetable VALUES (3,'2005/05/26',1,8,'Debit Note',256.3);
INSERT INTO debitnotetable VALUES (4,'2005/06/02',1,13,'Debit Note',25);

CREATE TABLE deliverydb (
  Id int(6) unsigned NOT NULL auto_increment,
  DeliveryType varchar(30) default NULL,
  DeliveryCost decimal(10,2) default NULL,
  PRIMARY KEY  (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO deliverydb VALUES (1,'By Feet',150);
INSERT INTO deliverydb VALUES (2,'By Bicycle',250);
INSERT INTO deliverydb VALUES (3,'Collect',0);

CREATE TABLE dnitemstable (
  Id int(6) unsigned NOT NULL auto_increment,
  DNLink int(6) NOT NULL default '0',
  Description varchar(30) default NULL,
  Qty decimal(10,2) default NULL,
  Cost decimal(10,2) default NULL,
  Total decimal(10,2) default NULL,
  PRIMARY KEY  (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO dnitemstable VALUES (6,2,'Plain A4',1,0.2,0.2);
INSERT INTO dnitemstable VALUES (7,2,'Color Document',1,3,3);
INSERT INTO dnitemstable VALUES (8,2,'Staple',1,0.5,0.5);
INSERT INTO dnitemstable VALUES (9,2,'By Feet',1,150,150);
INSERT INTO dnitemstable VALUES (10,2,'Normal',1,2,2);
INSERT INTO dnitemstable VALUES (11,3,'Plain A3',1,0.8,0.8);
INSERT INTO dnitemstable VALUES (12,3,'Color Document',1,3,3);
INSERT INTO dnitemstable VALUES (13,3,'Staple',1,0.5,0.5);
INSERT INTO dnitemstable VALUES (14,3,'By Bicycle',1,250,250);
INSERT INTO dnitemstable VALUES (15,3,'Normal',1,2,2);
INSERT INTO dnitemstable VALUES (16,4,'Black & White',1,22.5,22.5);
INSERT INTO dnitemstable VALUES (17,4,'Staple',1,0.5,0.5);
INSERT INTO dnitemstable VALUES (18,4,'Collect',1,0,0);
INSERT INTO dnitemstable VALUES (19,4,'Normal',1,2,2);

CREATE TABLE jobdb (
  `No` int(11) NOT NULL auto_increment,
  DocumentName varchar(100) NOT NULL default '',
  PriceEstimate decimal(10,2) default NULL,
  PaperType varchar(20) NOT NULL default '',
  JobStatus varchar(20) NOT NULL default '',
  Copies decimal(10,0) NOT NULL default '0',
  BindingType varchar(30) NOT NULL default '',
  SidedForm varchar(20) NOT NULL default '',
  FrontCover varchar(20) NOT NULL default '',
  BackCover varchar(20) NOT NULL default '',
  PrintType varchar(20) NOT NULL default '',
  Pages decimal(10,0) NOT NULL default '0',
  Delivery varchar(20) NOT NULL default '',
  Priority varchar(20) NOT NULL default '',
  CompletionDate varchar(10) NOT NULL default '',
  Memo blob,
  ServerMemo blob,
  FrontCoverMemo blob,
  BackCoverMemo blob,
  FrontCoverTitle varchar(250) default '',
  BackCoverTitle varchar(250) default '',
  FrontCoverTo varchar(30) default '',
  FrontCoverCC varchar(30) default '',
  FrontCoverSubject varchar(30) default '',
  AccNo int(11) NOT NULL default '0',
  DateRequested varchar(10) NOT NULL default '',
  FinishedDate varchar(10) default NULL,
  FrontCoverActive varchar(5) default NULL,
  BackCoverActive varchar(5) default NULL,
  DebitNoteActive varchar(5) default NULL,
  ArcMark varchar(5) default 'False',
  AflAdr1 varchar(50) default NULL,
  AflAdr2 varchar(50) default NULL,
  AflAdr3 varchar(50) default NULL,
  PRIMARY KEY  (`No`),
  KEY AccNoInd (AccNo),
  KEY DueDateInd (CompletionDate,DateRequested),
  KEY StatusInd (JobStatus)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE papertypesdb (
  PaperTypeName varchar(30) NOT NULL default '',
  Cost decimal(10,2) default NULL,
  Size varchar(20) default '',
  `Type` varchar(20) default '',
  Color varchar(20) default '',
  Weight varchar(20) default '',
  `No` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`No`),
  KEY PaperTypeInd (PaperTypeName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO papertypesdb VALUES ('Plain A4',0.2,'A4','Plain','White','80 Gsm',1);
INSERT INTO papertypesdb VALUES ('Plain A3',0.8,'A3','Plain','White','80 Gsm',2);
INSERT INTO papertypesdb VALUES ('Matt A4',0.6,'A4','Matt','White','80 Gsm',4);
INSERT INTO papertypesdb VALUES ('Matt A3',1,'A3','Matt','White','80 Gsm',5);

CREATE TABLE pdfdb (
  `No` int(11) NOT NULL auto_increment,
  JobLink int(11) NOT NULL default '0',
  pdfdoc longblob,
  PRIMARY KEY  (`No`),
  KEY JobLinkInd (JobLink)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE printroominf (
  `No` int(11) NOT NULL auto_increment,
  PrintRoomName varchar(50) NOT NULL default '',
  Logo longblob,
  Ip varchar(20) default '',
  Tel varchar(20) default '',
  Fax varchar(20) default '',
  Adr1 varchar(50) default '',
  Adr2 varchar(50) default '',
  Adr3 varchar(50) default '',
  BTW varchar(20) default '',
  InvDescr varchar(30) default '',
  InvDate varchar(10) default '',
  JTPaperType varchar(30) default NULL,
  JTPrintType varchar(30) default NULL,
  ArchiveIP varchar(20) default '',
  Archiveuser varchar(30) default '',
  ArchivePass varchar(30) default '',
  ArchiveEnabled varchar(5) default '',
  ArcEveryDays int(10) unsigned zerofill default '0000000000',
  ArcFreeDisk int(10) unsigned zerofill default '0000000000',
  ArcOlderDays int(10) unsigned zerofill default '0000000000',
  ArcOlderMonths int(10) unsigned zerofill default '0000000000',
  DNPaperType varchar(30) default NULL,
  DNPrintType varchar(30) default NULL,
  DNDescription varchar(50) default NULL,
  PRIMARY KEY  (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE printtypedb (
  `No` int(11) NOT NULL auto_increment,
  PrintType varchar(30) default '',
  Cost decimal(10,2) default NULL,
  category varchar(20) default NULL,
  PRIMARY KEY  (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO printtypedb VALUES (3,'Black & White',2.5,'Black');
INSERT INTO printtypedb VALUES (4,'Photo',3.5,'Photo');
INSERT INTO printtypedb VALUES (5,'Color Document',3,'Color');
INSERT INTO printtypedb VALUES (6,'Color Picture',3.2,'Color');
INSERT INTO printtypedb VALUES (7,'Greyscale',2.5,NULL);

CREATE TABLE prioritydb (
  `No` int(11) NOT NULL auto_increment,
  Priority varchar(30) NOT NULL default '',
  Cost decimal(10,2) default NULL,
  PRIMARY KEY  (`No`),
  KEY PriorityInd (Priority)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO prioritydb VALUES (1,'High',2.35);
INSERT INTO prioritydb VALUES (2,'Normal',2);
INSERT INTO prioritydb VALUES (3,'Low',1.25);

CREATE TABLE sideddb (
  `No` int(11) NOT NULL auto_increment,
  SidedName varchar(30) default '',
  Cost decimal(10,2) default NULL,
  PRIMARY KEY  (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO sideddb VALUES (1,'Single',1);
INSERT INTO sideddb VALUES (2,'Double',2);

CREATE TABLE userrightsdb (
  `No` int(6) NOT NULL auto_increment,
  AccLink int(6) default NULL,
  ProdLink int(6) default NULL,
  Besk varchar(10) default NULL,
  DisplayBesk varchar(30) default NULL,
  PRIMARY KEY  (`No`),
  UNIQUE KEY LinkInd (AccLink,ProdLink,Besk)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO userrightsdb VALUES (201,1,1,'Paper','Plain A4');
INSERT INTO userrightsdb VALUES (204,1,3,'Types','Black & White');
INSERT INTO userrightsdb VALUES (205,1,4,'Types','Photo');
INSERT INTO userrightsdb VALUES (207,1,6,'Types','Color Picture');
INSERT INTO userrightsdb VALUES (208,1,7,'Types','Greyscale');
INSERT INTO userrightsdb VALUES (209,1,1,'bindings','Glue');
INSERT INTO userrightsdb VALUES (210,1,2,'bindings','Staple');
INSERT INTO userrightsdb VALUES (211,1,3,'bindings','No Binding');
INSERT INTO userrightsdb VALUES (212,1,4,'bindings','Ring Binding');
INSERT INTO userrightsdb VALUES (213,1,1,'delivery','By Feet');
INSERT INTO userrightsdb VALUES (215,1,3,'delivery','Collect');
INSERT INTO userrightsdb VALUES (216,1,1,'Sided','Single');
INSERT INTO userrightsdb VALUES (217,1,2,'Sided','Double');
INSERT INTO userrightsdb VALUES (218,1,1,'Priority','High');
INSERT INTO userrightsdb VALUES (219,1,2,'Priority','Normal');
INSERT INTO userrightsdb VALUES (220,1,3,'Priority','Low');
INSERT INTO userrightsdb VALUES (223,1,5,'Types','Color Document');
INSERT INTO userrightsdb VALUES (224,1,2,'delivery','By Bicycle');
INSERT INTO userrightsdb VALUES (225,1,2,'Paper','Plain A3');
INSERT INTO userrightsdb VALUES (226,1,4,'Paper','Matt A4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
