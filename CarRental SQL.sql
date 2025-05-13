CREATE DATABASE CarRental;CREATE TABLE `branch` (
  CREATE DATABASE CarRental;
USE CarRental;

CREATE TABLE `branch` (
  `BranchID` INT NOT NULL,
  `BranchName` VARCHAR(255),
  `Phone` VARCHAR(255),
  `Address` VARCHAR(255),
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `car` (
  `CarID` INT NOT NULL,
  `Make` VARCHAR(255),
  `Model` VARCHAR(255),
  `Year` INT,
  `PlateNumber` VARCHAR(255),
  `Status` VARCHAR(255),
  `DailyRate` DOUBLE,
  `BranchID` INT,
  PRIMARY KEY (`CarID`),
  FOREIGN KEY (`BranchID`) REFERENCES `branch`(`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `customer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(255),
  `LastName` VARCHAR(255),
  `Phone` VARCHAR(255),
  `Email` VARCHAR(255),
  `DriverLicense` VARCHAR(255),
  `Address` VARCHAR(255),
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(255),
  `LastName` VARCHAR(255),
  `Phone` VARCHAR(255),
  `Role` VARCHAR(255),
  `BranchID` INT,
  PRIMARY KEY (`EmployeeID`),
  FOREIGN KEY (`BranchID`) REFERENCES `branch`(`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rental` (
  `RentalID` INT NOT NULL,
  `CustomerID` INT,
  `EmployeeID` INT,
  `CarID` INT,
  `RentalDate` DATETIME,
  `ReturnDate` DATETIME,
  `TotalAmount` DOUBLE,
  `PaymentStatus` VARCHAR(255),
  PRIMARY KEY (`RentalID`),
  FOREIGN KEY (`CustomerID`) REFERENCES `customer`(`CustomerID`),
  FOREIGN KEY (`EmployeeID`) REFERENCES `employee`(`EmployeeID`),
  FOREIGN KEY (`CarID`) REFERENCES `car`(`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `payment` (
  `PaymentID` INT NOT NULL,
  `RentalID` INT,
  `PaymentDate` DATETIME,
  `Amount` DOUBLE,
  `PaymentMethod` VARCHAR(255),
  PRIMARY KEY (`PaymentID`),
  FOREIGN KEY (`RentalID`) REFERENCES `rental`(`RentalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
