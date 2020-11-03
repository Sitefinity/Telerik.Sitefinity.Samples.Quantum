-- Support for culture codes longer than 5 chars
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;

GO
PRINT N'Altering [dbo].[uCommerce_CategoryDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_CategoryDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_CategoryProperty]...';


GO
ALTER TABLE [dbo].[uCommerce_CategoryProperty] ALTER COLUMN [CultureCode] NVARCHAR (60) NULL;


GO
PRINT N'Altering [dbo].[uCommerce_Country]...';


GO
ALTER TABLE [dbo].[uCommerce_Country] ALTER COLUMN [Culture] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_DataTypeEnumDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_DataTypeEnumDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_DefinitionFieldDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_DefinitionFieldDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_EmailContent]...';


GO
ALTER TABLE [dbo].[uCommerce_EmailContent] ALTER COLUMN [CultureCode] NVARCHAR (50) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_OrderStatusDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_OrderStatusDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_PaymentMethodDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_PaymentMethodDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ProductCatalogDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_ProductCatalogDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ProductDefinitionFieldDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_ProductDefinitionFieldDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ProductDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_ProductDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ProductReview]...';


GO
ALTER TABLE [dbo].[uCommerce_ProductReview] ALTER COLUMN [CultureCode] NVARCHAR (60) NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ProductReviewComment]...';


GO
ALTER TABLE [dbo].[uCommerce_ProductReviewComment] ALTER COLUMN [CultureCode] NVARCHAR (60) NULL;


GO
PRINT N'Altering [dbo].[uCommerce_ShippingMethodDescription]...';


GO
ALTER TABLE [dbo].[uCommerce_ShippingMethodDescription] ALTER COLUMN [CultureCode] NVARCHAR (60) NOT NULL;


GO