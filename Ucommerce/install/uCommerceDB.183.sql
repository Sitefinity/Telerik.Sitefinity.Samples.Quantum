DECLARE @CategoryDefinitionTypeId INT
SET @CategoryDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'Category Definitions')

DECLARE @CampaignItemDefinitionTypeId INT
SET @CampaignItemDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'Campaign Item Definitions')

DECLARE @PaymentMethodDefinitionTypeId INT
SET @PaymentMethodDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'PaymentMethod Definitions')

DECLARE @DataTypeDefinitionTypeId INT
SET @DataTypeDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'Data Types')

DECLARE @ProductCatalogGroupDefinitionTypeId INT
SET @ProductCatalogGroupDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'Product Catalog Groups')

DECLARE @ProductCatalogDefinitionTypeId INT
SET @ProductCatalogDefinitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType WHERE [Name] = 'Product Catalogs')

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @CategoryDefinitionTypeId

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CategoryDefinitionTypeId, 'Categories', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CategoryDefinitionTypeId, 'Kategorier', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CategoryDefinitionTypeId, 'Categories', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CategoryDefinitionTypeId, 'Kategorier', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CategoryDefinitionTypeId, 'Kategorien', null, 'de-DE'
)

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @CampaignItemDefinitionTypeId
insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CampaignItemDefinitionTypeId, 'Campaign Items', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CampaignItemDefinitionTypeId, 'Kampange elementer', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CampaignItemDefinitionTypeId, 'Campaign Items', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CampaignItemDefinitionTypeId, 'Kampagne items', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@CampaignItemDefinitionTypeId, 'Campaign Items', null, 'de-DE'
)

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @PaymentMethodDefinitionTypeId

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@PaymentMethodDefinitionTypeId, 'Payment Methods', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@PaymentMethodDefinitionTypeId, 'Betalingsmetoder', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@PaymentMethodDefinitionTypeId, 'Payment Methods', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@PaymentMethodDefinitionTypeId, 'Betalingsmetoder', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@PaymentMethodDefinitionTypeId, 'Zahlungsmethode', null, 'de-DE'
)

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @DataTypeDefinitionTypeId
insert into uCommerce_DefinitionTypeDescription VALUES
(
	@DataTypeDefinitionTypeId, 'Data Types', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@DataTypeDefinitionTypeId, 'Datatyper', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@DataTypeDefinitionTypeId, 'Data Types', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@DataTypeDefinitionTypeId, 'Datatyper', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@DataTypeDefinitionTypeId, 'Datatypen', null, 'de-DE'
)

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @ProductCatalogGroupDefinitionTypeId
insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogGroupDefinitionTypeId, 'Product Catalog Groups', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogGroupDefinitionTypeId, 'Produktkataloggrupper', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogGroupDefinitionTypeId, 'Product Catalog Groups', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogGroupDefinitionTypeId, 'Produkt katalog grupper', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogGroupDefinitionTypeId, 'Produkt Katalog grupper', null, 'de-DE'
)

-- delete existing is easier just recreate them below
DELETE FROM uCommerce_DefinitionTypeDescription WHERE DefinitionTypeId = @ProductCatalogDefinitionTypeId
insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogDefinitionTypeId, 'Product Catalogs', null, 'en-US'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogDefinitionTypeId, 'Produktkataloger', null, 'da-DK'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogDefinitionTypeId, 'Product Catalogs', null, 'en-GB'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogDefinitionTypeId, 'Produkt kataloger', null, 'sv-SE'
)

insert into uCommerce_DefinitionTypeDescription VALUES
(
	@ProductCatalogDefinitionTypeId, 'Produkt Katalogen', null, 'de-DE'
)