CREATE TABLE uCommerce_ProductCatalogGroupCampaignRelation(
	ProductCatalogGroupCampaignRelationId int identity(1,1) not null,
	CampaignId int foreign key references uCommerce_Campaign(CampaignId),
	ProductCatalogGroupId int foreign key references uCommerce_ProductCatalogGroup(ProductCatalogGroupId),
	CONSTRAINT [uCommerce_PK_ProductCatalogGroupCampaignRelation] PRIMARY KEY CLUSTERED 
	(
		ProductCatalogGroupCampaignRelationId ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)	
)