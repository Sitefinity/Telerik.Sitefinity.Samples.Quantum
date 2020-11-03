/*
	Definition 3 of 3
	- Add final constraints

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

PRINT N'Adding foreign keys to [dbo].[uCommerce_CategoryProperty]'
GO
ALTER TABLE [dbo].[uCommerce_CategoryProperty] ADD
CONSTRAINT [FK_uCommerce_CategoryProperty_uCommerce_DefinitionField] FOREIGN KEY ([DefinitionFieldId]) REFERENCES [dbo].[uCommerce_DefinitionField] ([DefinitionFieldId]),
CONSTRAINT [FK_uCommerce_CategoryProperty_uCommerce_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[uCommerce_Category] ([CategoryId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
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