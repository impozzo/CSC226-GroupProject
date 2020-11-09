CREATE DATABASE `226-projectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

-- `226-projectdb`.customer definition
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- `226-projectdb`.product definition

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Catagory` varchar(24) DEFAULT NULL,
  `Inventory` int(11) NOT NULL DEFAULT 100,
  `Price` decimal(10,0) NOT NULL,
  `ImageName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- `226-projectdb`.`order` definition

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID_FK` int(11) NOT NULL,
  `ShippingStreet` varchar(100) NOT NULL,
  `ShippingState` varchar(2) NOT NULL,
  `ShippingCity` varchar(100) NOT NULL,
  `ShippingZip` varchar(5) NOT NULL,
  `OrderTotal` decimal(10,0) NOT NULL,
  `OrderStatus` varchar(16) NOT NULL,
  `UpdateDate` datetime NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Order_Customer_FK` (`CustomerID_FK`),
  CONSTRAINT `Order_Customer_FK` FOREIGN KEY (`CustomerID_FK`) REFERENCES `customer` (`CustomerID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- `226-projectdb`.orderdetail definition

CREATE TABLE `orderdetail` (
  `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID_FK` int(11) NOT NULL,
  `ProductID_FK` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL ,
  `SubTotal` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderDetail_Order_FK` (`OrderID_FK`),
  KEY `OrderDetail_Product_FK` (`ProductID_FK`),
  CONSTRAINT `OrderDetail_Order_FK` FOREIGN KEY (`OrderID_FK`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `OrderDetail_Product_FK` FOREIGN KEY (`ProductID_FK`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- `226-projectdb`.paymentmethod definition

CREATE TABLE `paymentmethod` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID_FK` int(11) NOT NULL,
  `NameOnCard` varchar(100) NOT NULL,
  `CcNumber` varchar(16) NOT NULL,
  `CardExpire` varchar(8) NOT NULL,
  `CvvCode` int(3) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL DEFAULT 1,
  `BillingStreet` varchar(100) NOT NULL,
  `BillingState` varchar(100) NOT NULL,
  `BillingCity` varchar(100) NOT NULL,
  `BillingZip` varchar(5) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `Payment_Customer_FK` (`CustomerID_FK`),
  CONSTRAINT `Payment_Customer_FK` FOREIGN KEY (`CustomerID_FK`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

