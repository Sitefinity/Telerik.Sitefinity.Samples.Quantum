-- Aligns all targets and awards created outside of the code (which makes sure the Guid between subclass and superclass match) so the GUID between Target and specific Target match.
-- This is primarily used for updating all the 
BEGIN TRANSACTION
GO
	UPDATE uCommerce_QuantityTarget					SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = QuantityTargetId)
	UPDATE uCommerce_DynamicOrderPropertyTarget		SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = DynamicOrderPropertyTargetId)
	UPDATE uCommerce_PriceGroupTarget				SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = PriceGroupTargetId)
	UPDATE uCommerce_ShippingMethodsTarget			SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = ShippingMethodsTargetId)
	UPDATE uCommerce_CategoryTarget					SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = CategoryTargetId)
	UPDATE uCommerce_ProductCatalogTarget			SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = ProductCatalogTargetId)
	UPDATE uCommerce_ProductTarget					SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = ProductTargetId)
	UPDATE uCommerce_VoucherTarget					SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = VoucherTargetId)
	UPDATE uCommerce_OrderAmountTarget				SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = OrderAmountTargetId)
	UPDATE uCommerce_ProductCatalogGroupTarget		SET [Guid] = (SELECT [Guid] FROM uCommerce_Target t WHERE t.TargetId = ProductCatalogGroupTargetId)

	UPDATE uCommerce_PercentOffShippingTotalAward	SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = PercentOffShippingTotalAwardId) 
	UPDATE uCommerce_PercentOffOrderTotalAward		SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = PercentOffOrderTotalAwardId)
	UPDATE uCommerce_PercentOffOrderLinesAward		SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = PercentOffOrderLinesAwardId)
	UPDATE uCommerce_DiscountSpecificOrderLineAward SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = DiscountSpecificOrderLineAwardId)
	UPDATE uCommerce_FreeGiftAward					SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = FreeGiftAwardId)
	UPDATE uCommerce_AmountOffOrderLinesAward		SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = AmountOffOrderLinesAwardId)
	UPDATE uCommerce_AmountOffOrderTotalAward		SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = AmountOffOrderTotalAwardId)
	UPDATE uCommerce_AmountOffUnitAward				SET [Guid] = (SELECT [Guid] FROM uCommerce_Award a WHERE a.AwardId = AmountOffUnitAwardId)
COMMIT