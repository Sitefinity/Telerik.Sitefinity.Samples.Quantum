-- Discount specific order line award
CREATE TABLE [dbo].[uCommerce_DiscountSpecificOrderLineAward](
	[DiscountSpecificOrderLineAwardId] [int] NOT NULL,
	[AmountOff] [decimal](18, 2) NOT NULL,
	[AmountType] [int] NOT NULL,
	[DiscountTarget] [int] NOT NULL,
	[Sku] [nvarchar](255) NULL,
	[VariantSku] [nvarchar](255) NULL,
 CONSTRAINT [PK_DiscountSpecificOrderLineAward] PRIMARY KEY CLUSTERED 
(
	[DiscountSpecificOrderLineAwardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

DECLARE @EntityUiId INT
INSERT INTO uCommerce_EntityUi ([Type], VirtualPathUi, SortOrder) VALUES ('UCommerce.EntitiesV2.DiscountSpecificOrderLineAward, UCommerce', 'Awards/DiscountSpecificOrderLineUi.ascx', 13)
SELECT @EntityUiId = SCOPE_IDENTITY()

INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Rabat på specifik ordrelinie', null, 'da-DK')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Discount specific order line', null, 'en-US')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Rabatt-bezogene Auftragsposition', null, 'de-DE')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Rabatt specifika orderrad', null, 'se-SV')