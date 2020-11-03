/* Inherited Definitions */

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = 'uCommerce_ProductDefinitionRelation'))
BEGIN
	CREATE TABLE [dbo].[uCommerce_ProductDefinitionRelation]
	(
		[ProductDefinitionRelationId] [int] IDENTITY(1,1) NOT NULL,
		[ProductDefinitionId] [int] NOT NULL,
		[ParentProductDefinitionId] [int] NOT NULL,
		[SortOrder] [int] NOT NULL,
	 CONSTRAINT [PK_uCommerce_ProductDefinitionRelation] PRIMARY KEY CLUSTERED 
	(
		[ProductDefinitionRelationId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	)

	ALTER TABLE [dbo].[uCommerce_ProductDefinitionRelation] ADD  CONSTRAINT [DF_uCommerce_ProductDefinitionRelation_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
END




IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = 'uCommerce_DefinitionRelation'))
BEGIN
	CREATE TABLE [dbo].[uCommerce_DefinitionRelation]
	(
		[DefinitionRelationId] [int] IDENTITY(1,1) NOT NULL,
		[DefinitionId] [int] NOT NULL,
		[ParentDefinitionId] [int] NOT NULL,
		[SortOrder] [int] NOT NULL,
	 CONSTRAINT [PK_uCommerce_DefinitionRelation] PRIMARY KEY CLUSTERED 
	(
		[DefinitionRelationId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	)
	ALTER TABLE [dbo].[uCommerce_DefinitionRelation] ADD  CONSTRAINT [DF_uCommerce_DefinitionRelation_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
End

IF NOT EXISTS (select * from uCommerce_AdminPage where FullName = 'EditDefinitionsOverview_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES ('EditDefinitionsOverview_aspx','')
	INSERT INTO uCommerce_AdminTab VALUES ('EditDefinitionsOverview.ascx',SCOPE_IDENTITY(),1,0,'Overview',0,0,1)
END
GO


