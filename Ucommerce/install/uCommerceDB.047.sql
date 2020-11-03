-- Insert standard discount types
BEGIN TRAN
/****** Object:  Table [dbo].[uCommerce_Campaign]    Script Date: 04/01/2011 15:00:31 ******/
SET IDENTITY_INSERT [uCommerce_Campaign] ON
INSERT [uCommerce_Campaign] ([CampaignId], [Name], [StartsOn], [EndsOn], [Enabled], [Priority], [Deleted], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (2, N'Default Campaign', DATEADD(d, -1, GETDATE()), DATEADD(d, 30, GETDATE()), 1, 1, 0, NULL, NULL, DATEADD(d, -1, GETDATE()), DATEADD(d, -1, GETDATE()))
SET IDENTITY_INSERT [uCommerce_Campaign] OFF
/****** Object:  Table [dbo].[uCommerce_ProductCatalogGroupTarget]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_ProductCatalogGroupTarget] ([ProductCatalogGroupTargetId], [Name]) VALUES (6, N'uCommerce.dk')
INSERT [uCommerce_ProductCatalogGroupTarget] ([ProductCatalogGroupTargetId], [Name]) VALUES (13, N'uCommerce.dk')
/****** Object:  Table [dbo].[uCommerce_PercentOffShippingTotalAward]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_PercentOffShippingTotalAward] ([PercentOffShippingTotalAwardId], [PercentOff]) VALUES (6, CAST(100.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[uCommerce_PercentOffOrderTotalAward]    Script Date: 04/01/2011 15:00:31 ******/
/****** Object:  Table [dbo].[uCommerce_PercentOffOrderLinesAward]    Script Date: 04/01/2011 15:00:31 ******/
/****** Object:  Table [dbo].[uCommerce_OrderAmountTarget]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_OrderAmountTarget] ([OrderAmountTargetId], [MinAmount]) VALUES (12, CAST(400.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[uCommerce_CampaignItem]    Script Date: 04/01/2011 15:00:31 ******/
SET IDENTITY_INSERT [uCommerce_CampaignItem] ON
INSERT [uCommerce_CampaignItem] ([CampaignItemId], [CampaignId], [DefinitionId], [Name], [Enabled], [Priority], [AllowNextCampaignItems], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [Deleted]) VALUES (3, 2, 2, N'Discounted unit price', 1, 1, 1, N'admin', N'admin', GETDATE(), GETDATE(), 0)
INSERT [uCommerce_CampaignItem] ([CampaignItemId], [CampaignId], [DefinitionId], [Name], [Enabled], [Priority], [AllowNextCampaignItems], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [Deleted]) VALUES (4, 2, 2, N'Bundle discount', 1, 2, 1, N'admin', N'admin', GETDATE(), GETDATE(), 0)
INSERT [uCommerce_CampaignItem] ([CampaignItemId], [CampaignId], [DefinitionId], [Name], [Enabled], [Priority], [AllowNextCampaignItems], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [Deleted]) VALUES (5, 2, 2, N'100€ voucher', 1, 3, 1, N'admin', N'admin', GETDATE(), GETDATE(), 0)
INSERT [uCommerce_CampaignItem] ([CampaignItemId], [CampaignId], [DefinitionId], [Name], [Enabled], [Priority], [AllowNextCampaignItems], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [Deleted]) VALUES (6, 2, 2, N'100€ voucher for specific product', 1, 4, 1, N'admin', N'admin', GETDATE(), GETDATE(), 0)
INSERT [uCommerce_CampaignItem] ([CampaignItemId], [CampaignId], [DefinitionId], [Name], [Enabled], [Priority], [AllowNextCampaignItems], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [Deleted]) VALUES (7, 2, 2, N'Free shipping for orders over 400€', 1, 5, 1, N'admin', N'admin', GETDATE(), GETDATE(), 0)
SET IDENTITY_INSERT [uCommerce_CampaignItem] OFF
/****** Object:  Table [dbo].[uCommerce_Target]    Script Date: 04/01/2011 15:00:31 ******/
SET IDENTITY_INSERT [uCommerce_Target] ON
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (3, 3, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (4, 3, 1, 0)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (6, 4, 1, 0)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (7, 4, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (8, 4, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (9, 5, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (10, 6, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (11, 6, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (12, 7, 0, 1)
INSERT [uCommerce_Target] ([TargetId], [CampaignItemId], [EnabledForDisplay], [EnabledForApply]) VALUES (13, 7, 1, 0)
SET IDENTITY_INSERT [uCommerce_Target] OFF
/****** Object:  Table [dbo].[uCommerce_Award]    Script Date: 04/01/2011 15:00:31 ******/
SET IDENTITY_INSERT [uCommerce_Award] ON
INSERT [uCommerce_Award] ([AwardId], [CampaignItemId], [Name]) VALUES (2, 3, N'')
INSERT [uCommerce_Award] ([AwardId], [CampaignItemId], [Name]) VALUES (3, 4, N'')
INSERT [uCommerce_Award] ([AwardId], [CampaignItemId], [Name]) VALUES (4, 5, N'')
INSERT [uCommerce_Award] ([AwardId], [CampaignItemId], [Name]) VALUES (5, 6, N'')
INSERT [uCommerce_Award] ([AwardId], [CampaignItemId], [Name]) VALUES (6, 7, N'')
SET IDENTITY_INSERT [uCommerce_Award] OFF
/****** Object:  Table [dbo].[uCommerce_CategoryTarget]    Script Date: 04/01/2011 15:00:31 ******/
/****** Object:  Table [dbo].[uCommerce_AmountOffUnitAward]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_AmountOffUnitAward] ([AmountOffUnitAwardId], [AmountOff]) VALUES (2, CAST(100.00 AS Decimal(18, 2)))
INSERT [uCommerce_AmountOffUnitAward] ([AmountOffUnitAwardId], [AmountOff]) VALUES (5, CAST(100.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[uCommerce_AmountOffOrderTotalAward]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_AmountOffOrderTotalAward] ([AmountOffOrderTotalAwardId], [AmountOff]) VALUES (3, CAST(200.00 AS Decimal(18, 2)))
INSERT [uCommerce_AmountOffOrderTotalAward] ([AmountOffOrderTotalAwardId], [AmountOff]) VALUES (4, CAST(100.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[uCommerce_AmountOffOrderLinesAward]    Script Date: 04/01/2011 15:00:31 ******/
/****** Object:  Table [dbo].[uCommerce_ProductTarget]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_ProductTarget] ([ProductTargetId], [Sku], [VariantSku]) VALUES (3, N'100-000-001', NULL)
INSERT [uCommerce_ProductTarget] ([ProductTargetId], [Sku], [VariantSku]) VALUES (4, N'100-000-001', NULL)
INSERT [uCommerce_ProductTarget] ([ProductTargetId], [Sku], [VariantSku]) VALUES (7, N'200-000-001', NULL)
INSERT [uCommerce_ProductTarget] ([ProductTargetId], [Sku], [VariantSku]) VALUES (8, N'100-000-001', NULL)
INSERT [uCommerce_ProductTarget] ([ProductTargetId], [Sku], [VariantSku]) VALUES (11, N'100-000-001', NULL)
/****** Object:  Table [dbo].[uCommerce_ProductCatalogTarget]    Script Date: 04/01/2011 15:00:31 ******/
/****** Object:  Table [dbo].[uCommerce_VoucherTarget]    Script Date: 04/01/2011 15:00:31 ******/
INSERT [uCommerce_VoucherTarget] ([VoucherTargetId], [Name]) VALUES (9, N'')
INSERT [uCommerce_VoucherTarget] ([VoucherTargetId], [Name]) VALUES (10, N'')
/****** Object:  Table [dbo].[uCommerce_VoucherCode]    Script Date: 04/01/2011 15:00:31 ******/
COMMIT