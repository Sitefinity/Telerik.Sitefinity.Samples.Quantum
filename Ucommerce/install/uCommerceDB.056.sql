CREATE TABLE [dbo].[uCommerce_QuantityTarget](
	[QuantityTargetId] [int] NOT NULL,
	[MinQuantity] [int] NOT NULL,
 CONSTRAINT [PK_uCommerce_QuantityTarget] PRIMARY KEY CLUSTERED 
(
	[QuantityTargetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

ALTER TABLE [dbo].[uCommerce_QuantityTarget] ADD  CONSTRAINT [DF_uCommerce_Quantity_Target_MinAmount]  DEFAULT ((0)) FOR [MinQuantity]
GO

-- Add UI registration
insert into uCommerce_EntityUi ([Type], VirtualPathUi, SortOrder) values ('UCommerce.EntitiesV2.QuantityTarget, UCommerce', 'Targets/QuantityUi.ascx', 7)
declare @id int
select @id = SCOPE_IDENTITY()
insert into uCommerce_EntityUiDescription (EntityUiId, DisplayName, Description, CultureCode) values (@id, 'Buy more than', 'Buy a greater or equal quantity of a product', 'en-us')
insert into uCommerce_EntityUiDescription (EntityUiId, DisplayName, Description, CultureCode) values (@id, 'Køb flere end', 'Køb flere end eller det samme antal', 'da-dk')
insert into uCommerce_EntityUiDescription (EntityUiId, DisplayName, Description, CultureCode) values (@id, 'Kaufen mehr als', 'Kaufen mehr als', 'de-de')
insert into uCommerce_EntityUiDescription (EntityUiId, DisplayName, Description, CultureCode) values (@id, 'Köpa mer än', 'Köpa mer än', 'sv-se')