/*
	Definition 2 of 3
	- category property with ref to definition field
	- category ref to definition

*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tmpErrors')) DROP TABLE tmpErrors
GO
CREATE TABLE tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO

INSERT INTO uCommerce_DefinitionType (DefinitionTypeId, Name, Deleted) VALUES (1, 'Category', 0)
INSERT INTO uCommerce_Definition (Name, DefinitionTypeId, [Description], Deleted) VALUES ('Default',1, 'Default category definition', 0)

GO
PRINT N'Creating primary key [PK_uCommerce_CategoryProperty] on [dbo].[uCommerce_CategoryProperty]'
GO
ALTER TABLE [dbo].[uCommerce_CategoryProperty] ADD CONSTRAINT [PK_uCommerce_CategoryProperty] PRIMARY KEY CLUSTERED  ([CategoryPropertyId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering [dbo].[uCommerce_Category]'
GO
ALTER TABLE [dbo].[uCommerce_Category] ADD
[DefinitionId] [int] NOT NULL CONSTRAINT [DF_uCommerce_Category_DefinitionId] DEFAULT ((1))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_Category]'
GO
ALTER TABLE [dbo].[uCommerce_Category] ADD
CONSTRAINT [FK_uCommerce_Category_uCommerce_Definition] FOREIGN KEY ([DefinitionId]) REFERENCES [dbo].[uCommerce_Definition] ([DefinitionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_DefinitionField]'
GO
IF EXISTS (SELECT * FROM tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE tmpErrors
GO