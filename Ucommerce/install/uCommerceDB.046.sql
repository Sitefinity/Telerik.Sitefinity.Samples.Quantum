BEGIN TRAN

-- INSERT definition types for Marketing 1.0
DECLARE @typeid INT
SELECT @typeid = DefinitionTypeId FROM uCommerce_DefinitionType WHERE Name = 'Category'
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Category Definitions', 'en-US')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Kategoridefinitioner', 'da-DK')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Kategoriedefinitionen', 'de-DE')

/* Don't deploy for now
INSERT INTO uCommerce_DefinitionType (DefinitionTypeId, Name, SortOrder, Deleted) VALUES (2, 'Campaign', 2, 0)
SELECT @typeid = 2
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Campaign Definitions', 'en-US')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'kampagnedefinitioner', 'da-DK')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Kampagnedefinitionen', 'de-DE')
*/

INSERT INTO uCommerce_DefinitionType (DefinitionTypeId, Name, SortOrder, Deleted) VALUES (3, 'CampaignItem', 3, 0)
SELECT @typeid = 3
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Campaign Item Definitions', 'en-US')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Kampagne aktivitet definitioner', 'da-DK')
INSERT INTO uCommerce_DefinitionTypeDescription (DefinitionTypeId, DisplayName, CultureCode) VALUES (@typeid, 'Kampagne Aktivität Definitionen', 'de-DE')

-- INSERT (Default campaign item definitions)
INSERT INTO uCommerce_Definition (Name, DefinitionTypeId, Description, Deleted, SortOrder) VALUES ('Default Campaign Item', @typeid, 'Default campaign item', 0, 1)

-- UPDATE existing default category definition from default to default category definition
UPDATE uCommerce_Definition SET Name = 'Default Category Definition' WHERE Name = 'Default' AND Description = 'Default category definition'

-- INSERT EntityUi for Marketing 1.0
SET IDENTITY_INSERT [dbo].[uCommerce_EntityUi] ON

INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (1, N'UCommerce.EntitiesV2.VoucherTarget, UCommerce', N'Targets/VoucherUi.ascx', 5)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (2, N'UCommerce.EntitiesV2.AmountOffOrderTotalAward, UCommerce', N'Awards/AmountOffOrderTotalUi.ascx', 7)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (3, N'UCommerce.EntitiesV2.ProductTarget, UCommerce', N'Targets/ProductUi.ascx', 4)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (4, N'UCommerce.EntitiesV2.AmountOffOrderLinesAward, UCommerce', N'Awards/AmountOffOrderLinesUi.ascx', 8)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (5, N'UCommerce.EntitiesV2.OrderAmountTarget, UCommerce', N'Targets/OrderAmountUi.ascx', 6)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (6, N'UCommerce.EntitiesV2.AmountOffUnitAward, UCommerce', N'Awards/AmountOffUnitUi.ascx', 9)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (7, N'UCommerce.EntitiesV2.CategoryTarget, UCommerce', N'Targets/CategoryUi.ascx', 3)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (8, N'UCommerce.EntitiesV2.ProductCatalogTarget, UCommerce', N'Targets/ProductCatalogUi.ascx', 2)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (9, N'UCommerce.EntitiesV2.ProductCatalogGroupTarget, UCommerce', N'Targets/ProductCatalogGroupUi.ascx', 1)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (10, N'UCommerce.EntitiesV2.PercentOffOrderLinesAward, UCommerce', N'Awards/PercentOffOrderLinesUi.ascx', 10)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (12, N'UCommerce.EntitiesV2.PercentOffOrderTotalAward, UCommerce', N'Awards/PercentOffOrderTotalUi.ascx', 11)
INSERT [dbo].[uCommerce_EntityUi] ([EntityUiId], [Type], [VirtualPathUi], [SortOrder]) VALUES (13, N'UCommerce.EntitiesV2.PercentOffShippingTotalAward, UCommerce', N'Awards/PercentOffShippingTotalUi.ascx', 12)
SET IDENTITY_INSERT [dbo].[uCommerce_EntityUi] OFF

-- EntityUi Descriptions
SET IDENTITY_INSERT [dbo].[uCommerce_EntityUiDescription] ON
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (1, 1, N'Promocode', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (3, 1, N'Rabatkupon', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (39, 1, N'[Voucher]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (4, 2, N'Amount off order total', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (40, 2, N'[Amount off order total]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (5, 2, N'Rabat på hele ordren', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (6, 3, N'Product', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (7, 3, N'Produkt', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (41, 3, N'Produkt', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (8, 4, N'Amount off order line total', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (42, 4, N'[Amount off order line total]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (9, 4, N'Rabat på hele ordrelinien', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (50, 5, N'[Buy for more than]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (10, 5, N'Buy for more than', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (11, 5, N'Køb samlet for mere end', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (43, 6, N'[Amount off unit price]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (18, 6, N'Amount off unit price', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (20, 6, N'Rabat på enhedsprisen', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (21, 7, N'Category', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (23, 7, N'Kategori', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (44, 7, N'Kategorie', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (24, 8, N'Product catalog', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (26, 8, N'Produktkatalog', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (45, 8, N'[Produktkatalog]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (27, 9, N'Product catalog group', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (28, 9, N'Produktkatalog gruppe', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (46, 9, N'Katalog-Gruppe', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (30, 10, N'Percentage off order line', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (47, 10, N'[Percentage off order line]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (31, 10, N'Procentrabat på hele ordrelinie', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (33, 12, N'Percentage off order', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (48, 12, N'[Percentage off order]', NULL, N'de-DE')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (34, 12, N'Procentrabat på hele ordren', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (37, 13, N'Procentrabat på levering', NULL, N'da-DK')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (38, 13, N'Percentage off shipping total', NULL, N'en-US')
INSERT [dbo].[uCommerce_EntityUiDescription] ([EntityUiDescriptionId], [EntityUiId], [DisplayName], [Description], [CultureCode]) VALUES (49, 13, N'[Percentage off shipping total]', NULL, N'de-DE')
SET IDENTITY_INSERT [dbo].[uCommerce_EntityUiDescription] OFF

COMMIT