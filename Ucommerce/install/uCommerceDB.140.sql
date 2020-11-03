-- Add unique identifier to revisions of entities.
ALTER TABLE uCommerce_Definition ADD [CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_Definition_CreatedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_Definition ADD [CreatedBy] [nvarchar] (50) NOT NULL DEFAULT ('')
ALTER TABLE uCommerce_Definition ADD [ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_Definition_ModifiedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_Definition ADD [ModifiedBy] [nvarchar] (50) NOT NULL DEFAULT ('')

ALTER TABLE uCommerce_ProductDefinition ADD [CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductDefinition_CreatedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_ProductDefinition ADD [CreatedBy] [nvarchar] (50) NOT NULL DEFAULT ('')
ALTER TABLE uCommerce_ProductDefinition ADD [ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductDefinition_ModifiedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_ProductDefinition ADD [ModifiedBy] [nvarchar] (50) NOT NULL DEFAULT ('')

ALTER TABLE uCommerce_DataType ADD [CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_DataType_CreatedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_DataType ADD [CreatedBy] [nvarchar] (50) NOT NULL DEFAULT ('')
ALTER TABLE uCommerce_DataType ADD [ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_DataType_ModifiedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_DataType ADD [ModifiedBy] [nvarchar] (50) NOT NULL DEFAULT ('')

ALTER TABLE uCommerce_ProductCatalogGroup ADD [CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroup_CreatedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_ProductCatalogGroup ADD [CreatedBy] [nvarchar] (50) NOT NULL DEFAULT ('')
ALTER TABLE uCommerce_ProductCatalogGroup ADD [ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroup_ModifiedOn] DEFAULT (getdate())
ALTER TABLE uCommerce_ProductCatalogGroup ADD [ModifiedBy] [nvarchar] (50) NOT NULL DEFAULT ('')

/****** Object:  Index [NonClusteredIndex-20150724-133601]    Script Date: 24-07-2015 15:46:18 ******/
CREATE NONCLUSTERED INDEX [uCommerce_NonClusteredIndex_ProductDescriptionId] ON [dbo].[uCommerce_ProductDescriptionProperty]
(
	[ProductDescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
