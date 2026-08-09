/*
==========================================================
Project : Masai Road Auto Paints Management System
File    : 05_PriceList.sql
Version : 1.0

Purpose:
Stores historical standard selling prices for products.

A product can have multiple prices over time, but only
one price should be active for a given period.

PIMA pricing is handled separately through the PIMA
configuration and is NOT stored here.
==========================================================
*/

USE MasaiRoadAutoPaintsDB;

DROP TABLE IF EXISTS PriceList;

CREATE TABLE PriceList
(
    PriceID INT AUTO_INCREMENT PRIMARY KEY,

    ProductID INT NOT NULL,

    SellingPrice DECIMAL(12,2) NOT NULL,

    EffectiveFrom DATETIME NOT NULL,

    EffectiveTo DATETIME NULL,

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT FK_PriceList_Product
        FOREIGN KEY (ProductID)
        REFERENCES ProductMaster(ProductID),

    CONSTRAINT CK_PriceList_SellingPrice
        CHECK (SellingPrice >= 0),

    CONSTRAINT CK_PriceList_DateRange
        CHECK (
            EffectiveTo IS NULL
            OR EffectiveTo > EffectiveFrom
        )
);
