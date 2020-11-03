/*New ProductPrice table*/
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_ProductPrice]'))
BEGIN
	CREATE TABLE [dbo].[uCommerce_ProductPrice](
		[ProductPriceId] [int] IDENTITY(1,1) NOT NULL,
		[MinimumQuantity] [int] NOT NULL DEFAULT 1,
		[Guid] [uniqueidentifier] NOT NULL,
		[ProductId] [int] NOT NULL,
		[PriceId] [int] NOT NULL
	 CONSTRAINT [PK_uCommerce_ProductPrice] PRIMARY KEY CLUSTERED 
	(
		[ProductPriceId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
