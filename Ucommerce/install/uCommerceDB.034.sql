/*
	Definitions framework 1.0 1 of 3
	- Definitions tables
	
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
PRINT N'Dropping foreign keys from [dbo].[uCommerce_Category]'
GO
ALTER TABLE [dbo].[uCommerce_Category] DROP
CONSTRAINT [FK_uCommerce_Category_ParentCategory]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_DefinitionField]'
GO
CREATE TABLE [dbo].[uCommerce_DefinitionField]
(
[DefinitionFieldId] [int] NOT NULL IDENTITY(1, 1),
[DataTypeId] [int] NOT NULL,
[DefinitionId] [int] NOT NULL,
[Name] [nvarchar] (512) NOT NULL,
[DisplayOnSite] [bit] NOT NULL,
[Multilingual] [bit] NOT NULL,
[RenderInEditor] [bit] NOT NULL,
[Searchable] [bit] NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_uCommerce_DefinitionField_SortOrder] DEFAULT ((0)),
[Deleted] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DefinitionField] on [dbo].[uCommerce_DefinitionField]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionField] ADD CONSTRAINT [PK_DefinitionField] PRIMARY KEY CLUSTERED  ([DefinitionFieldId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_Definition]'
GO
CREATE TABLE [dbo].[uCommerce_Definition]
(
[DefinitionId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (512) NOT NULL,
[DefinitionTypeId] [int] NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[Deleted] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerceDefinition] on [dbo].[uCommerce_Definition]'
GO
ALTER TABLE [dbo].[uCommerce_Definition] ADD CONSTRAINT [PK_uCommerceDefinition] PRIMARY KEY CLUSTERED  ([DefinitionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_uCommerce_Definition] on [dbo].[uCommerce_Definition]'
GO
CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition] ON [dbo].[uCommerce_Definition] ([DefinitionTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_DefinitionType]'
GO
CREATE TABLE [dbo].[uCommerce_DefinitionType]
(
[DefinitionTypeId] [int] NOT NULL,
[Name] [nvarchar] (512) NOT NULL,
[Deleted] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_DefinitionType] on [dbo].[uCommerce_DefinitionType]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionType] ADD CONSTRAINT [PK_uCommerce_DefinitionType] PRIMARY KEY CLUSTERED  ([DefinitionTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_DefinitionFieldDescription]'
GO
CREATE TABLE [dbo].[uCommerce_DefinitionFieldDescription]
(
[DefinitionFieldDescriptionId] [int] NOT NULL IDENTITY(1, 1),
[CultureCode] [nvarchar] (5) NOT NULL,
[DisplayName] [nvarchar] (255) NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[DefinitionFieldId] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DefinitionFieldDescription] on [dbo].[uCommerce_DefinitionFieldDescription]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionFieldDescription] ADD CONSTRAINT [PK_DefinitionFieldDescription] PRIMARY KEY CLUSTERED  ([DefinitionFieldDescriptionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[uCommerce_DefinitionField] ADD
CONSTRAINT [FK_uCommerce_DefinitionField_uCommerce_Definition] FOREIGN KEY ([DefinitionId]) REFERENCES [dbo].[uCommerce_Definition] ([DefinitionId]),
CONSTRAINT [FK_uCommerce_DefinitionField_uCommerce_DataType] FOREIGN KEY ([DataTypeId]) REFERENCES [dbo].[uCommerce_DataType] ([DataTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_Definition]'
GO
ALTER TABLE [dbo].[uCommerce_Definition] ADD
CONSTRAINT [FK_uCommerce_Definition_uCommerce_DefinitionType] FOREIGN KEY ([DefinitionTypeId]) REFERENCES [dbo].[uCommerce_DefinitionType] ([DefinitionTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_CategoryProperty]'
GO
CREATE TABLE [dbo].[uCommerce_CategoryProperty]
(
[CategoryPropertyId] [int] NOT NULL IDENTITY(1, 1),
[Value] [nvarchar] (max) NOT NULL,
[DefinitionFieldId] [int] NOT NULL,
[CultureCode] [nvarchar] (5) NULL,
[CategoryId] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_DefinitionFieldDescription]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionFieldDescription] ADD
CONSTRAINT [FK_uCommerce_DefinitionFieldDescription_uCommerce_DefinitionField] FOREIGN KEY ([DefinitionFieldId]) REFERENCES [dbo].[uCommerce_DefinitionField] ([DefinitionFieldId])
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