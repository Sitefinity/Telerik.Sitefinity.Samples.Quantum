GO

DELETE pgp
FROM uCommerce_PriceGroupPrice pgp
INNER JOIN (SELECT
                pgp1.PriceGroupPriceId,pgp1.ProductId,pgp1.PriceGroupId, ROW_NUMBER() OVER(PARTITION BY pgp1.ProductId,pgp1.PriceGroupId ORDER BY pgp1.ProductId,pgp1.PriceGroupId) AS RowRank
                FROM uCommerce_PriceGroupPrice pgp1
                    INNER JOIN (SELECT
                                    ProductId,PriceGroupId, COUNT(*) AS CountOf
                                    FROM uCommerce_PriceGroupPrice
                                    GROUP BY ProductId,PriceGroupId
                                    HAVING COUNT(*)>1
                                ) duplicate ON pgp1.PriceGroupId=duplicate.PriceGroupId and pgp1.ProductId=duplicate.ProductId
            ) duplicate2 ON pgp.PriceGroupPriceId=duplicate2.PriceGroupPriceId
WHERE duplicate2.RowRank!=1

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_ProductId_PriceGroupId_PriceGroupPrice')
BEGIN
	ALTER TABLE uCommerce_PriceGroupPrice ADD CONSTRAINT
				Unique_ProductId_PriceGroupId_PriceGroupPrice UNIQUE NONCLUSTERED
		(
					ProductId,PriceGroupId
		)
END
