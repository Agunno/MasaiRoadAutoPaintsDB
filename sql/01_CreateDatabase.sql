/*
==========================================================
Project : Masai Road Auto Paints Management System (MRAPMS)
File    : 01_CreateDatabase.sql
Author  : Bill Agunno
Version : 1.0
Date    : 2026-08-07
==========================================================
Purpose:
Creates the MasaiRoadAutoPaintsDB database.

This script is idempotent.
Running it multiple times will recreate the database.
==========================================================
*/

DROP DATABASE IF EXISTS MasaiRoadAutoPaintsDB;

CREATE DATABASE MasaiRoadAutoPaintsDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE MasaiRoadAutoPaintsDB;

SELECT DATABASE() AS CurrentDatabase;

CREATE TABLE Categories
(
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT UQ_Categories_CategoryName UNIQUE (CategoryName)
);

INSERT INTO Categories (CategoryName, Description)
VALUES
('Primer', 'Automotive primers'),
('Paint', 'Automotive paints'),
('Thinner', 'Paint thinners'),
('Hardener', 'Paint hardeners'),
('Clear Coat', 'Clear coat products'),
('Compound', 'Cutting and polishing compounds'),
('Body Filler', 'Body fillers and putties'),
('Sandpaper', 'Abrasives'),
('Masking', 'Masking products'),
('Accessories', 'General accessories');

/*
==========================================================
Table : Units
Purpose : Stores standard units of measure used
          throughout the system.
==========================================================
*/

DROP TABLE IF EXISTS Units;

CREATE TABLE Units
(
    UnitID INT AUTO_INCREMENT PRIMARY KEY,

    UnitName VARCHAR(50) NOT NULL,

    UnitSymbol VARCHAR(10) NOT NULL,

    Description VARCHAR(255),

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT UQ_Units_UnitName
        UNIQUE (UnitName),

    CONSTRAINT UQ_Units_UnitSymbol
        UNIQUE (UnitSymbol)
);

INSERT INTO Units
(
    UnitName,
    UnitSymbol,
    Description
)
VALUES
('Millilitre','ml','Millilitres'),

('Litre','L','Litres'),

('Gallon','Gal','Gallons'),

('Piece','Pc','Individual items'),

('Sheet','Sheet','Individual sheets'),

('Roll','Roll','Rolls'),

('Packet','Pkt','Packets'),

('Tin','Tin','Metal tins');


/*
==========================================================
File    : 03_SuppliersTable.sql

Purpose:
Creates the Suppliers table.

==========================================================
*/


DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers
(
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,

    SupplierCode VARCHAR(20) NOT NULL,

    SupplierName VARCHAR(100) NOT NULL,

    ContactPerson VARCHAR(100),

    Phone VARCHAR(20),

    Email VARCHAR(100),

    Address VARCHAR(255),

    City VARCHAR(100),

    Country VARCHAR(100) DEFAULT 'Kenya',

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT UQ_SupplierCode
        UNIQUE (SupplierCode),

    CONSTRAINT UQ_SupplierName
        UNIQUE (SupplierName)
);
