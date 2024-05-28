#
# DUMP FILE
#
# Database is ported from MS Access
#------------------------------------------------------------------
# Created using "MS Access to MySQL" form http://www.bullzip.com
# Program Version 5.5.282
#
# OPTIONS:
#   sourcefilename=C:/Users/Danielle Shaw/Work/Databases/Data Sets and Solution Files/Data Sets/02_InProgress/Module02/JCConsulting.accdb
#   sourceusername=
#   sourcepassword=
#   sourcesystemdatabase=
#   destinationdatabase=
#   storageengine=MyISAM
#   dropdatabase=0
#   createtables=1
#   unicode=1
#   autocommit=1
#   transferdefaultvalues=1
#   transferindexes=1
#   transferautonumbers=1
#   transferrecords=1
#   columnlist=1
#   tableprefix=
#   negativeboolean=0
#   ignorelargeblobs=0
#   memotype=LONGTEXT
#   datetimetype=DATETIME
#

CREATE DATABASE IF NOT EXISTS ``;
USE ``;

#
# Table structure for table 'Categories'
#

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `Category` VARCHAR(15) NOT NULL, 
  PRIMARY KEY (`Category`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Categories'
#

INSERT INTO `Categories` (`Category`) VALUES ('Coding');

# 7 records

#
# Table structure for table 'Clients'
#

DROP TABLE IF EXISTS `Clients`;

CREATE TABLE `Clients` (
  `ClientID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ClientName` VARCHAR(35), 
  `Street` VARCHAR(25), 
  `Zip` VARCHAR(5), 
  `Government` TINYINT(1) DEFAULT 0, 
  PRIMARY KEY (`ClientID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Clients'
#

INSERT INTO `Clients` (`ClientID`, `ClientName`, `Street`, `Zip`, `Government`) VALUES (1, 'Tri-Lakes Realtors', '135 E Jefferson St', '02447', 0);
INSERT INTO `Clients` (`ClientID`, `ClientName`, `Street`, `Zip`, `Government`) VALUES (2, 'Project Lead The Way', '762 Saratoga Blvd', '02446', 1);

# 24 records

#
# Table structure for table 'Employees'
#

DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
  `EmployeeID` VARCHAR(2) NOT NULL, 
  `LastName` VARCHAR(15), 
  `FirstName` VARCHAR(15), 
  `HireDate` DATETIME, 
  `Title` VARCHAR(255), 
  `HomeZip` VARCHAR(255), 
  `Salary` DECIMAL(19,4), 
  INDEX (`EmployeeID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Employees'
#

INSERT INTO `Employees` (`EmployeeID`, `LastName`, `FirstName`, `HireDate`, `Title`, `HomeZip`, `Salary`) VALUES ('19', 'Kohn', 'Ali', '2020-01-01 00:00:00', 'Project Leader', '02466', 5000);
INSERT INTO `Employees` (`EmployeeID`, `LastName`, `FirstName`, `HireDate`, `Title`, `HomeZip`, `Salary`) VALUES ('22', 'Kaplan', 'Franco', '2020-02-01 00:00:00', 'Programmer', '02152', 5500);

# 27 records

#
# Table structure for table 'ProjectLineItems'
#

DROP TABLE IF EXISTS `ProjectLineItems`;

CREATE TABLE `ProjectLineItems` (
  `ProjectLineItemID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER NOT NULL DEFAULT 0, 
  `TaskID` VARCHAR(255) NOT NULL, 
  `TaskDate` DATETIME, 
  `Quantity` INTEGER DEFAULT 1, 
  `Factor` FLOAT NULL, 
  `ProjectLineItemNotes` LONGTEXT, 
  INDEX (`TaskDate`), 
  INDEX (`ProjectID`), 
  INDEX (`TaskID`), 
  PRIMARY KEY (`ProjectLineItemID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'ProjectLineItems'
#

INSERT INTO `ProjectLineItems` (`ProjectLineItemID`, `ProjectID`, `TaskID`, `TaskDate`, `Quantity`, `Factor`, `ProjectLineItemNotes`) VALUES (1, 1, 'MEET00', '2019-02-06 00:00:00', 1, 1, NULL);
INSERT INTO `ProjectLineItems` (`ProjectLineItemID`, `ProjectID`, `TaskID`, `TaskDate`, `Quantity`, `Factor`, `ProjectLineItemNotes`) VALUES (2, 1, 'PLAN01', '2019-02-06 00:00:00', 1, NULL, NULL);
INSERT INTO `ProjectLineItems` (`ProjectLineItemID`, `ProjectID`, `TaskID`, `TaskDate`, `Quantity`, `Factor`, `ProjectLineItemNotes`) VALUES (4, 2, 'MEET00', '2019-02-07 00:00:00', 1, 1, NULL);

# 158 records

#
# Table structure for table 'Projects'
#

DROP TABLE IF EXISTS `Projects`;

CREATE TABLE `Projects` (
  `ProjectID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectStartDate` DATETIME, 
  `ClientID` INTEGER DEFAULT 0, 
  `EmployeeID` VARCHAR(255), 
  `ProjectNotes` LONGTEXT, 
  INDEX (`ClientID`), 
  INDEX (`EmployeeID`), 
  INDEX (`ProjectID`), 
  PRIMARY KEY (`ProjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Projects'
#

INSERT INTO `Projects` (`ProjectID`, `ProjectStartDate`, `ClientID`, `EmployeeID`, `ProjectNotes`) VALUES (1, '2019-02-06 00:00:00', 1, '52', 'Client wants digital solutions to help rebrand company name to emphasize commercial real estate.');

# 26 records

#
# Table structure for table 'TaskMasterList'
#

DROP TABLE IF EXISTS `TaskMasterList`;

CREATE TABLE `TaskMasterList` (
  `TaskID` VARCHAR(6) NOT NULL, 
  `Description` VARCHAR(30), 
  `CategoryID` VARCHAR(15), 
  `Per` VARCHAR(255), 
  `Estimate` DECIMAL(19,4), 
  INDEX (`CategoryID`), 
  INDEX (`TaskID`), 
  PRIMARY KEY (`TaskID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'TaskMasterList'
#

INSERT INTO `TaskMasterList` (`TaskID`, `Description`, `CategoryID`, `Per`, `Estimate`) VALUES ('CODE01', 'Code PHP', 'Coding', 'Hour', 150);

# 40 records

#
# Table structure for table 'Zips'
#

DROP TABLE IF EXISTS `Zips`;

CREATE TABLE `Zips` (
  `City` VARCHAR(255), 
  `Zip` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`Zip`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Zips'
#

INSERT INTO `Zips` (`City`, `Zip`) VALUES ('Springfield', '01071');

# 73 records

