
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/25/2018 13:19:44
-- Generated from EDMX file: C:\Users\Admin\documents\visual studio 2015\Projects\HomeAssignment\HomeAssignment\Models\MoviesDatabase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MoviesDataset];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Rental_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rentals] DROP CONSTRAINT [FK_Rental_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_Rental_DVD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rentals] DROP CONSTRAINT [FK_Rental_DVD];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[DVDs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DVDs];
GO
IF OBJECT_ID(N'[dbo].[Rentals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rentals];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [Cust_Fname] nvarchar(50)  NOT NULL,
    [Cust_Lname] nvarchar(50)  NOT NULL,
    [Cust_DateReg] datetime  NOT NULL,
    [Cust_username] nvarchar(50)  NOT NULL,
    [Cust_password] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'DVDs'
CREATE TABLE [dbo].[DVDs] (
    [MoviesID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Price] decimal(18,2)  NOT NULL,
    [ReleaseDate] datetime  NOT NULL,
    [Genre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rentals'
CREATE TABLE [dbo].[Rentals] (
    [RentID] int IDENTITY(1,1) NOT NULL,
    [MoviesID] int  NOT NULL,
    [CustomerID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [MoviesID] in table 'DVDs'
ALTER TABLE [dbo].[DVDs]
ADD CONSTRAINT [PK_DVDs]
    PRIMARY KEY CLUSTERED ([MoviesID] ASC);
GO

-- Creating primary key on [RentID] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [PK_Rentals]
    PRIMARY KEY CLUSTERED ([RentID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [FK_Rental_Customer]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Rental_Customer'
CREATE INDEX [IX_FK_Rental_Customer]
ON [dbo].[Rentals]
    ([CustomerID]);
GO

-- Creating foreign key on [MoviesID] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [FK_Rental_DVD]
    FOREIGN KEY ([MoviesID])
    REFERENCES [dbo].[DVDs]
        ([MoviesID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Rental_DVD'
CREATE INDEX [IX_FK_Rental_DVD]
ON [dbo].[Rentals]
    ([MoviesID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------