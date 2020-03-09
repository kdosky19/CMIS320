SPOOL order.log;

SET PAGESIZE 40 
SET LINESIZE 180 
SET SERVEROUTPUT ON 
SET ECHO ON
SPOOL some_filename.txt;

DROP TABLE Customer_T     CASCADE CONSTRAINTS;
DROP TABLE Movie_T        CASCADE CONSTRAINTS;
DROP TABLE AcademyAward_T CASCADE CONSTRAINTS;
DROP TABLE Actor_T        CASCADE CONSTRAINTS;
DROP TABLE Director_T     CASCADE CONSTRAINTS;
DROP TABLE Rental_T       CASCADE CONSTRAINTS;
DROP TABLE Invnetory_T    CASCADE CONSTRAINTS;
DROP TABLE Distributor_T  CASCADE CONSTRAINTS;


CREATE TABLE Customer_T(
CustomerID NUMBER(6),
FirstName VARCHAR2(15),
LastName VARCHAR2(15),
Address VARCHAR2(70),
PhoneNumber NUMBER(10),
CONSTRAINT CustID_PK PRIMARY KEY (CustomerID)
);

CREATE TABLE Director_T(
DirectorID NUMBER(6) NOT NULL,
FirstName VARCHAR2(15),
LastName VARCHAR2(15),
CONSTRAINT DirectorID_PK PRIMARY KEY (DirectorID)
);

CREATE TABLE Actor_T(
ActorID NUMBER(6) NOT NULL,
FirstName VARCHAR2(15),
LastName VARCHAR2(15),
CONSTRAINT ActorID_PK PRIMARY KEY (ActorID)
);

CREATE TABLE Movie_T(
MovieID NUMBER(6),
DirectorID NUMBER(6),
ActorID NUMBER(6),
Title VARCHAR2(15),
Year NUMBER(4),
Dvd VARCHAR2(2),
Vhs VARCHAR2(2),
Description VARCHAR2(75),
Genre VARCHAR2(20),
CONSTRAINT MovieID_PK PRIMARY KEY (MovieID),
CONSTRAINT Movie_FK1 FOREIGN KEY (DirectorID) REFERENCES Director_T (DirectorID),
CONSTRAINT Movie_FK2 FOREIGN KEY (ActorID) REFERENCES Actor_T (ActorID)
);

CREATE TABLE AcademyAward_T(
AcademyAwardID NUMBER(6) NOT NULL,
MovieID NUMBER(6) NOT NULL,
YearWon NUMBER(4),
CONSTRAINT AcademyAwardID_PK PRIMARY KEY (AcademyAwardID),
CONSTRAINT AcademyAward_FK1 FOREIGN KEY (MovieID) REFERENCES Movie_T (MovieID)
);

CREATE TABLE Actor_T(
ActorID NUMBER(6) NOT NULL,
FirstName VARCHAR2(15),
LastName VARCHAR2(15),
CONSTRAINT ActorID_PK PRIMARY KEY (ActorID)
);

CREATE TABLE Rental_T(
RentalID NUMBER(6) NOT NULL,
CustomerID NUMBER(6) NOT NULL,
MovieID NUMBER(6) NOT NULL,
DateRented DATE DEFAULT SYSDATE,
DateReturned DATE DEFAULT SYSDATE,
Price NUMBER(6),
Fee NUMBER(6),
CONSTRAINT RentalID_PK PRIMARY KEY (RentalID),
CONSTRAINT Rental_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer_T (CustomerID),
CONSTRAINT Rental_FK2 FOREIGN KEY (MovieID) REFERENCES Movie_T (MovieID)
);

CREATE TABLE Invnetory_T(
InvnetoryID NUMBER(6) NOT NULL,
MovieID NUMBER(6) NOT NULL,
DistributorID NUMBER(6),
CONSTRAINT InvnetoryID_PK PRIMARY KEY (InvnetoryID),
CONSTRAINT Invnetory_FK1 FOREIGN KEY (MovieID) REFERENCES Movie_T (MovieID),
CONSTRAINT Invnetory_FK2 FOREIGN KEY (DistributorID) REFERENCES Distributor_T (DistributorID)
);

CREATE TABLE Distributor_T(
DistributorID NUMBER(6) NOT NULL,
DistributorName VARCHAR2(25),
Address VARCHAR2(70),
PhoneNumber NUMBER(10),
Email VARCHAR2(30),
CONSTRAINT DistributorID_PK PRIMARY KEY (DistributorID)
);


SET SERVEROUTPUT OFF;

SPOOL OFF;





