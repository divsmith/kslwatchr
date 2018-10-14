-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [kslwatchr].[History];
GO


DROP TABLE [kslwatchr].[Image];
GO


DROP TABLE [kslwatchr].[Product];
GO


DROP TABLE [kslwatchr].[Seller];
GO


-- ************************************** [kslwatchr].[Seller]

CREATE TABLE [kslwatchr].[Seller]
(
 [SellerId]     INT IDENTITY NOT NULL ,
 [Id]           TEXT NOT NULL ,
 [Name]         TEXT NOT NULL ,
 [HomePhone]    TEXT NULL ,
 [MobilePhone]  TEXT NOT NULL ,
 [Email]        TEXT NOT NULL ,
 [SellerNumber] INT NOT NULL ,
 [AccountAge]   DATE NOT NULL ,
 [DateCreated]  DATE NULL ,
 [DateUpdated]  DATE NULL ,

 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED ([SellerId] ASC)
);
GO





-- ************************************** [kslwatchr].[Product]

CREATE TABLE [kslwatchr].[Product]
(
 [ProductId]     INT IDENTITY NOT NULL ,
 [Id]            INT NOT NULL ,
 [Title]         TEXT NOT NULL ,
 [Price]         SMALLMONEY NOT NULL ,
 [Url]           TEXT NOT NULL ,
 [DateCreated]   DATETIME NOT NULL ,
 [DateSold]      DATETIME NULL ,
 [DateRemoved]   DATETIME NULL ,
 [Keywords]      TEXT "WORD1, WORD2" NULL ,
 [Description]   TEXT NULL ,
 [DateExpires]   DATETIME NOT NULL ,
 [PageViews]     SMALLINT NOT NULL ,
 [Favorited]     SMALLINT NOT NULL ,
 [SellerType]    TEXT "PRIVATE" OR "BUSINESS" NOT NULL ,
 [DateUpdated]   DATETIME NOT NULL ,
 [Location]      TEXT NOT NULL ,
 [Category]      TEXT NOT NULL ,
 [SubCategory]   TEXT NOT NULL ,
 [Longitude]     FLOAT NULL ,
 [Latitude]      FLOAT NULL ,
 [City]          TEXT NOT NULL ,
 [State]         TEXT NOT NULL ,
 [Zip]           TINYINT NOT NULL ,
 [Name]          TEXT NOT NULL ,
 [HomePhone]     TEXT NOT NULL ,
 [MobilePhone]   TEXT NOT NULL ,
 [MarketType]    TEXT "SALE OR BUY" NOT NULL ,
 [DealershipId]  INT NULL ,
 [Status]        TINYINT 0 OR 1="ACTIVE" NOT NULL ,
 [ListingNumber] INT NULL ,

 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
 CONSTRAINT [One_Seller_To_Many_Products] FOREIGN KEY ([ProductId])
  REFERENCES [kslwatchr].[Seller]([SellerId])
);
GO


--SKIP Index: [fkIdx_20]




-- ************************************** [kslwatchr].[History]

CREATE TABLE [kslwatchr].[History]
(
 [HistoryId] INT IDENTITY NOT NULL ,
 [ProductId] INT IDENTITY NOT NULL ,
 [Date]      DATETIME NOT NULL ,
 [Price]     SMALLMONEY NULL ,
 [Views]     SMALLINT NULL ,
 [Favorites] SMALLINT NULL ,

 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED ([HistoryId] ASC),
 CONSTRAINT [One_Product_To_Many_History] FOREIGN KEY ([ProductId])
  REFERENCES [kslwatchr].[Product]([ProductId])
);
GO


--SKIP Index: [fkIdx_37]




-- ************************************** [kslwatchr].[Image]

CREATE TABLE [kslwatchr].[Image]
(
 [ImageId]      INT IDENTITY NOT NULL ,
 [ProductId]    INT IDENTITY NOT NULL ,
 [Id]           TEXT "1385092-1536291092-797850" NOT NULL ,
 [DateCreated]  DATETIME NOT NULL ,
 [DateUpdated]  DATETIME NOT NULL ,
 [OrigFileName] TEXT NOT NULL ,

 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED ([ImageId] ASC),
 CONSTRAINT [One_Product_To_Many_Images] FOREIGN KEY ([ProductId])
  REFERENCES [kslwatchr].[Product]([ProductId])
);
GO


--SKIP Index: [fkIdx_28]




