/*
==========================================================
File    : 04_ProductMaster.sql
Purpose:
Creates the ProductMaster table.

Every product sold by Masai Road Auto Paints is
defined here.

==========================================================
*/

USE MasaiRoadAutoPaintsDB;

DROP TABLE IF EXISTS ProductMaster;

CREATE TABLE ProductMaster
(
    ProductID INT AUTO_INCREMENT PRIMARY KEY,

    ProductCode VARCHAR(20) NOT NULL,

    ProductName VARCHAR(150) NOT NULL,

    CategoryID INT NOT NULL,

    SupplierID INT NOT NULL,

    UnitID INT NOT NULL,

    BaseUnitID INT NOT NULL,

    ConversionFactor DECIMAL(10,2) NOT NULL DEFAULT 1.00,

    CanBeMeasured BOOLEAN NOT NULL DEFAULT FALSE,

    DefaultCost DECIMAL(12,2) DEFAULT 0.00,

    ReorderLevel DECIMAL(12,2) DEFAULT 0.00,

    Barcode VARCHAR(50),

    Notes VARCHAR(255),

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    ProductStatus ENUM("Active","Discontinued","OutOfStock") DEFAULT "Active",

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT UQ_Product_Code
        UNIQUE (ProductCode),

    CONSTRAINT FK_Product_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    CONSTRAINT FK_Product_Supplier
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID),

    CONSTRAINT FK_Product_Unit
        FOREIGN KEY (UnitID)
        REFERENCES Units(UnitID),

    CONSTRAINT FK_Product_BaseUnit
        FOREIGN KEY (BaseUnitID)
        REFERENCES Units(UnitID)
);