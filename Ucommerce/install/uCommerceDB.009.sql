/*
Related Products
*/
SET NUMERIC_ROUNDABORT OFF

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tmpErrors')) DROP TABLE tmpErrors

CREATE TABLE tmpErrors (Error int)

SET XACT_ABORT ON

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

PRINT N'Creating [dbo].[uCommerce_ProductRelation]'

CREATE TABLE [dbo].[uCommerce_ProductRelation]
(
[ProductRelationId] [int] NOT NULL IDENTITY(1, 1),
[ProductId] [int] NOT NULL,
[RelatedProductId] [int] NOT NULL,
[ProductRelationTypeId] [int] NOT NULL
)

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating primary key [PK_uCommerce_ProductRelation2] on [dbo].[uCommerce_ProductRelation]'

ALTER TABLE [dbo].[uCommerce_ProductRelation] ADD CONSTRAINT [PK_uCommerce_ProductRelation2] PRIMARY KEY CLUSTERED  ([ProductRelationId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating index [IX_uCommerce_ProductRelation] on [dbo].[uCommerce_ProductRelation]'

CREATE UNIQUE NONCLUSTERED INDEX [IX_uCommerce_ProductRelation] ON [dbo].[uCommerce_ProductRelation] ([ProductId], [RelatedProductId], [ProductRelationTypeId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating [dbo].[uCommerce_ProductRelationType]'

CREATE TABLE [dbo].[uCommerce_ProductRelationType]
(
[ProductRelationTypeId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (128) NOT NULL,
[Description] [nvarchar] (max) NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductRelation_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) NOT NULL,
[ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductRelation_ModifiedOn] DEFAULT (getdate()),
[ModifiedBy] [nvarchar] (50) NOT NULL
)

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating primary key [PK_uCommerce_ProductRelation] on [dbo].[uCommerce_ProductRelationType]'

ALTER TABLE [dbo].[uCommerce_ProductRelationType] ADD CONSTRAINT [PK_uCommerce_ProductRelation] PRIMARY KEY CLUSTERED  ([ProductRelationTypeId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Adding foreign keys to [dbo].[uCommerce_ProductRelation]'

ALTER TABLE [dbo].[uCommerce_ProductRelation] ADD
CONSTRAINT [FK_uCommerce_ProductRelation_uCommerce_Product2] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[uCommerce_Product] ([ProductId]),
CONSTRAINT [FK_uCommerce_ProductRelation_uCommerce_Product3] FOREIGN KEY ([RelatedProductId]) REFERENCES [dbo].[uCommerce_Product] ([ProductId]),
CONSTRAINT [FK_uCommerce_ProductRelation_uCommerce_ProductRelationType] FOREIGN KEY ([ProductRelationTypeId]) REFERENCES [dbo].[uCommerce_ProductRelationType] ([ProductRelationTypeId])


DECLARE @NewAdminPageId INT;
INSERT [dbo].[uCommerce_AdminPage] ([FullName]) VALUES (N'ASP.umbraco_ucommerce_settings_catalog_editproductrelationtype_aspx')
SET @NewAdminPageId = @@IDENTITY

INSERT INTO [dbo].[uCommerce_AdminTab] ([VirtualPath],[AdminPageId], [SortOrder], [MultiLingual], [ResouceKey], [HasSaveButton], [HasDeleteButton], [Enabled])
     VALUES ('EditProductRelationTypeBaseProperties.ascx',@NewAdminPageId,1,0,'Common',1,0,1)

INSERT INTO [dbo].[uCommerce_AdminTab] ([VirtualPath],[AdminPageId], [SortOrder], [MultiLingual], [ResouceKey], [HasSaveButton], [HasDeleteButton], [Enabled])
     VALUES ('EditProductRelations.ascx',1,7,0,'Relations',0,0,1)
           



-- Add rows to [dbo].[uCommerce_ProductRelationType]
INSERT INTO [dbo].[uCommerce_ProductRelationType] ([Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) 
VALUES (N'Default', 'Relations between products', '2010-01-01 00:00:00.00', N'Administrator', '2010-01-01 00:00:00.000', N'Administrator')



IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

IF EXISTS (SELECT * FROM tmpErrors) ROLLBACK TRANSACTION

IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
commit TRANSACTION
END
ELSE PRINT 'The database update failed'

DROP TABLE tmpErrors
