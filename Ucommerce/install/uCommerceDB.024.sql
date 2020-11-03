ALTER PROCEDURE [dbo].[uCommerce_GetProductTop10]
( 
	@ProductCatalogGroupId INT
)
AS
	SET NOCOUNT ON
	
	SELECT TOP 10
		dbo.uCommerce_ProductCatalogGroup.Name,
		dbo.uCommerce_OrderLine.Sku,
		dbo.uCommerce_OrderLine.ProductName,
		SUM(dbo.uCommerce_OrderLine.Quantity) TotalSales,
		SUM(ISNULL(dbo.uCommerce_OrderLine.Total, 0)) TotalRevenue,
		dbo.uCommerce_Currency.ISOCode Currency
	FROM
		dbo.uCommerce_OrderLine
		JOIN dbo.uCommerce_PurchaseOrder ON dbo.uCommerce_PurchaseOrder.OrderId = dbo.uCommerce_OrderLine.OrderId
		JOIN dbo.uCommerce_Currency ON dbo.uCommerce_Currency.CurrencyId = dbo.uCommerce_PurchaseOrder.CurrencyId
		LEFT JOIN dbo.uCommerce_ProductCatalogGroup ON dbo.uCommerce_ProductCatalogGroup.ProductCatalogGroupId = dbo.uCommerce_PurchaseOrder.ProductCatalogGroupId
	WHERE
		(	dbo.uCommerce_ProductCatalogGroup.ProductCatalogGroupId = @ProductCatalogGroupId
			OR
			@ProductCatalogGroupId IS NULL
		)
		AND
			dbo.uCommerce_PurchaseOrder.OrderStatusId in (2, 3, 5, 6, 7) -- New order, Completed order, Invoiced, Piad, Required Attention
	GROUP BY
		dbo.uCommerce_OrderLine.Sku,
		dbo.uCommerce_OrderLine.ProductName,
		dbo.uCommerce_ProductCatalogGroup.Name,
		dbo.uCommerce_Currency.ISOCode
	ORDER BY
		SUM(dbo.uCommerce_OrderLine.Quantity) DESC,
		dbo.uCommerce_ProductCatalogGroup.Name
