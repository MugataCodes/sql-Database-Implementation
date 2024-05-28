-- ********************************************************
-- MODULE 2 - MS SQL SERVER VERSION OF JCConsulting MS ACCESS DATABASE
-- ********************************************************


-- --------------------------------------------------------
-- Table structure for table 'Categories'
-- --------------------------------------------------------
DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
  Category VARCHAR(15) NOT NULL, 
  PRIMARY KEY (Category)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'Categories'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Categories (Category) VALUES ('Coding');
I
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'Clients'
-- --------------------------------------------------------
DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
  ClientID INTEGER NOT NULL IDENTITY, 
  ClientName VARCHAR(35), 
  Street VARCHAR(25), 
  Zip VARCHAR(5), 
  Government TINYINT DEFAULT 0, 
  PRIMARY KEY (ClientID)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'Clients'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Clients (ClientName, Street, Zip, Government) VALUES ('Tri-Lakes Realtors', '135 E Jefferson St', '02447', 0);
INSERT INTO Clients (ClientName, Street, Zip, Government) VALUES ('Project Lead The Way', '762 Saratoga Blvd', '02446', 1);

-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'Employees'
-- --------------------------------------------------------
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
  EmployeeID VARCHAR(2) NOT NULL INDEX EMPLOYEID_IDX, 
  LastName VARCHAR(15), 
  FirstName VARCHAR(15), 
  HireDate DATETIME, 
  Title VARCHAR(255), 
  HomeZip VARCHAR(255), 
  Salary DECIMAL(19,4)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'Employees'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Employees (EmployeeID, LastName, FirstName, HireDate, Title, HomeZip, Salary) VALUES ('19', 'Kohn', 'Ali', '2020-01-01 00:00:00', 'Project Leader', '02466', 5000);
INSERT INTO Employees (EmployeeID, LastName, FirstName, HireDate, Title, HomeZip, Salary) VALUES ('22', 'Kaplan', 'Franco', '2020-02-01 00:00:00', 'Programmer', '02152', 5500);

-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'ProjectLineItems'
-- --------------------------------------------------------
DROP TABLE IF EXISTS ProjectLineItems;
CREATE TABLE ProjectLineItems (
  ProjectLineItemID INTEGER NOT NULL IDENTITY, 
  ProjectID INTEGER NOT NULL DEFAULT 0 INDEX PROJECTID_IDX, 
  TaskID VARCHAR(255) NOT NULL INDEX TASKID_IDX, 
  TaskDate DATETIME INDEX TASKDATE_IDX, 
  Quantity INTEGER DEFAULT 1, 
  Factor FLOAT NULL, 
  ProjectLineItemNotes VARCHAR(MAX), 
  PRIMARY KEY (ProjectLineItemID)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'ProjectLineItems'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO ProjectLineItems (ProjectID, TaskID, TaskDate, Quantity, Factor, ProjectLineItemNotes) VALUES (1, 'MEET00', '2019-02-06 00:00:00', 1, 1, NULL);
INSERT INTO ProjectLineItems (ProjectID, TaskID, TaskDate, Quantity, Factor, ProjectLineItemNotes) VALUES (1, 'PLAN01', '2019-02-06 00:00:00', 1, NULL, NULL);

INSERT INTO ProjectLineItems (ProjectID, TaskID, TaskDate, Quantity, Factor, ProjectLineItemNotes) VALUES ( 11, 'SUPP03', '2020-05-27 00:00:00', 8, 1, NULL);
INSERT INTO ProjectLineItems (ProjectID, TaskID, TaskDate, Quantity, Factor, ProjectLineItemNotes) VALUES ( 11, 'SUPP02', '2020-06-01 00:00:00', 4, 1, NULL);
INSERT INTO ProjectLineItems (ProjectID, TaskID, TaskDate, Quantity, Factor, ProjectLineItemNotes) VALUES ( 11, 'SUPP04', '2020-06-08 00:00:00', 12, 1, '12-month minimum');
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'Projects'
-- --------------------------------------------------------
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects (
  ProjectID INTEGER NOT NULL IDENTITY, 
  ProjectStartDate DATETIME, 
  ClientID INTEGER DEFAULT 0 INDEX CLIENTID_IDX, 
  EmployeeID VARCHAR(255) INDEX EMPLOYEEID_IDX, 
  ProjectNotes VARCHAR(MAX), 
  PRIMARY KEY (ProjectID)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'Projects'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Projects (ProjectStartDate, ClientID, EmployeeID, ProjectNotes) VALUES ('2019-02-06 00:00:00', 1, '52', 'Client wants digital solutions to help rebrand company name to emphasize commercial real estate.');

-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'TaskMasterList'
-- --------------------------------------------------------
DROP TABLE IF EXISTS TaskMasterList;
CREATE TABLE TaskMasterList (
  TaskID VARCHAR(6) NOT NULL, 
  Description VARCHAR(30), 
  CategoryID VARCHAR(15) INDEX CATERGORYID_IDX, 
  Per VARCHAR(255), 
  Estimate DECIMAL(19,4), 
  PRIMARY KEY (TaskID)
);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Dumping data for table 'TaskMasterList'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO TaskMasterList (TaskID, Description, CategoryID, Per, Estimate) VALUES ('CODE01', 'Code PHP', 'Coding', 'Hour', 150);

INSERT INTO TaskMasterList (TaskID, Description, CategoryID, Per, Estimate) VALUES ('TEST03', 'Test user experience', 'Testing', 'Hour', 75);
-- --------------------------------------------------------


-- --------------------------------------------------------
-- Table structure for table 'Zips'
-- --------------------------------------------------------
DROP TABLE IF EXISTS Zips;
CREATE TABLE Zips (
  City VARCHAR(255), 
  Zip VARCHAR(255) NOT NULL, 
  PRIMARY KEY (Zip)
);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table 'Zips'
-- --------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Zips (City, Zip) VALUES ('Springfield', '01071');

INSERT INTO Zips (City, Zip) VALUES ('Fall River', '02791');
-- --------------------------------------------------------

COMMIT;

