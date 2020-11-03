/*
	Product Reviews V1
		- ProductReview
		- ProductReviewComment
		- ProductReviewStatus
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
PRINT N'Creating [dbo].[uCommerce_ProductReview]'
GO
CREATE TABLE [dbo].[uCommerce_ProductReview]
(
[ProductReviewId] [int] NOT NULL IDENTITY(1, 1),
[Rating] [int] NULL,
[CustomerId] [int] NULL,
[ProductCatalogGroupId] [int] NOT NULL,
[CreatedOn] [datetime] NOT NULL,
[ModifiedOn] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (50) NULL,
[CultureCode] [nvarchar] (5) NULL,
[ReviewHeadline] [nvarchar] (512) NULL,
[ReviewText] [nvarchar] (max) NULL,
[ProductId] [int] NOT NULL,
[Ip] [nvarchar] (50) NOT NULL,
[ProductReviewStatusId] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_ProductReview] on [dbo].[uCommerce_ProductReview]'
GO
ALTER TABLE [dbo].[uCommerce_ProductReview] ADD CONSTRAINT [PK_uCommerce_ProductReview] PRIMARY KEY CLUSTERED  ([ProductReviewId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_uCommerce_ProductReview] on [dbo].[uCommerce_ProductReview]'
GO
CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview] ON [dbo].[uCommerce_ProductReview] ([ProductId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_ProductReviewStatus]'
GO
CREATE TABLE [dbo].[uCommerce_ProductReviewStatus]
(
[ProductReviewStatusId] [int] NOT NULL,
[Name] [nvarchar] (1024) NOT NULL,
[Deleted] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_ProductReviewStatus] on [dbo].[uCommerce_ProductReviewStatus]'
GO
ALTER TABLE [dbo].[uCommerce_ProductReviewStatus] ADD CONSTRAINT [PK_uCommerce_ProductReviewStatus] PRIMARY KEY CLUSTERED  ([ProductReviewStatusId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[uCommerce_ProductCatalogGroup]'
GO
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroup] ADD
[ProductReviewsRequireApproval] [bit] NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroup_ProductReviewsRequireApproval] DEFAULT ((0))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[uCommerce_Product]'
GO
ALTER TABLE [dbo].[uCommerce_Product] ADD
[Rating] [float] NULL CONSTRAINT [DF_uCommerce_Product_AverageRating] DEFAULT ((0))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_ProductReviewComment]'
GO
CREATE TABLE [dbo].[uCommerce_ProductReviewComment]
(
[ProductReviewCommentId] [int] NOT NULL IDENTITY(1, 1),
[ProductReviewId] [int] NOT NULL,
[CustomerId] [int] NULL,
[CreatedOn] [datetime] NOT NULL,
[ModifiedOn] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (50) NULL,
[CultureCode] [nvarchar] (5) NULL,
[Comment] [nvarchar] (max) NULL,
[Helpful] [bit] NOT NULL CONSTRAINT [DF_uCommerce_ProductReviewComment_Helpful] DEFAULT ((0)),
[Unhelpful] [bit] NOT NULL CONSTRAINT [DF_uCommerce_ProductReviewComment_Unhelpful] DEFAULT ((0)),
[Ip] [nvarchar] (50) NOT NULL,
[ProductReviewStatusId] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_ProductReviewComment] on [dbo].[uCommerce_ProductReviewComment]'
GO
ALTER TABLE [dbo].[uCommerce_ProductReviewComment] ADD CONSTRAINT [PK_uCommerce_ProductReviewComment] PRIMARY KEY CLUSTERED  ([ProductReviewCommentId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_ProductReviewComment]'
GO
ALTER TABLE [dbo].[uCommerce_ProductReviewComment] ADD
CONSTRAINT [FK_uCommerce_ProductReviewComment_uCommerce_ProductReview] FOREIGN KEY ([ProductReviewId]) REFERENCES [dbo].[uCommerce_ProductReview] ([ProductReviewId]),
CONSTRAINT [FK_uCommerce_ProductReviewComment_uCommerce_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[uCommerce_Customer] ([CustomerId]),
CONSTRAINT [FK_uCommerce_ProductReviewComment_uCommerce_ProductReviewStatus] FOREIGN KEY ([ProductReviewStatusId]) REFERENCES [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_ProductReview]'
GO
ALTER TABLE [dbo].[uCommerce_ProductReview] ADD
CONSTRAINT [FK_uCommerce_ProductReview_uCommerce_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[uCommerce_Customer] ([CustomerId]),
CONSTRAINT [FK_uCommerce_ProductReview_uCommerce_ProductCatalogGroup] FOREIGN KEY ([ProductCatalogGroupId]) REFERENCES [dbo].[uCommerce_ProductCatalogGroup] ([ProductCatalogGroupId]),
CONSTRAINT [FK_uCommerce_ProductReview_uCommerce_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[uCommerce_Product] ([ProductId]),
CONSTRAINT [FK_uCommerce_ProductReview_uCommerce_ProductReviewStatus] FOREIGN KEY ([ProductReviewStatusId]) REFERENCES [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId])
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