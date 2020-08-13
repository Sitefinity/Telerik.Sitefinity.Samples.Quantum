DELETE FROM uCommerce_OrderProperty
WHERE OrderPropertyId NOT IN
(
	SELECT MIN(OrderPropertyId)
	FROM uCommerce_OrderProperty
	GROUP BY OrderId,OrderLineId,[Key]
)

GO