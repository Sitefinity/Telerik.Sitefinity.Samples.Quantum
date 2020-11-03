/*

OrderProperties on OrderLine and PurchaseOrder

*/

SET NUMERIC_ROUNDABORT OFF

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tmpErrors')) DROP TABLE tmpErrors

CREATE TABLE tmpErrors (Error int)

SET XACT_ABORT ON

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

PRINT N'Creating [dbo].[uCommerce_OrderProperty]'

CREATE TABLE [dbo].[uCommerce_OrderProperty]
(
[OrderPropertyId] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NOT NULL,
[OrderLineId] [int] NULL,
[Key] [nvarchar] (255) NOT NULL,
[Value] [nvarchar] (max) NOT NULL
)

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating primary key [PK_uCommerce_OrderProperty] on [dbo].[uCommerce_OrderProperty]'

ALTER TABLE [dbo].[uCommerce_OrderProperty] ADD CONSTRAINT [PK_uCommerce_OrderProperty] PRIMARY KEY CLUSTERED  ([OrderPropertyId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Creating index [IX_uCommerce_OrderProperty] on [dbo].[uCommerce_OrderProperty]'

CREATE UNIQUE NONCLUSTERED INDEX [IX_uCommerce_OrderProperty] ON [dbo].[uCommerce_OrderProperty] ([Key], [OrderId], [OrderLineId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Adding foreign keys to [dbo].[uCommerce_OrderProperty]'

ALTER TABLE [dbo].[uCommerce_OrderProperty] ADD
CONSTRAINT [FK_uCommerce_OrderProperty_uCommerce_PurchaseOrder] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[uCommerce_PurchaseOrder] ([OrderId]),
CONSTRAINT [FK_uCommerce_OrderProperty_uCommerce_OrderLine] FOREIGN KEY ([OrderLineId]) REFERENCES [dbo].[uCommerce_OrderLine] ([OrderLineId])

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

IF EXISTS (SELECT * FROM tmpErrors) ROLLBACK TRANSACTION

IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'

DROP TABLE tmpErrors
