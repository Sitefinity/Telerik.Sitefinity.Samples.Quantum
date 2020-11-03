-- Cleans up data for Product properties and adds a constraint to prevent duplicate values.
-- Null or empty values can safely be removed as those are default values if querying yields no result.
GO
DELETE FROM uCommerce_ProductProperty where Value = ''
GO
DELETE FROM uCommerce_ProductProperty where Value is null
GO
DELETE property
FROM uCommerce_ProductProperty property
INNER JOIN 
	(
		SELECT
			property1.ProductPropertyId, 
			property1.ProductId, 
			property1.ProductDefinitionFieldId, 
			ROW_NUMBER() OVER(PARTITION BY property1.ProductId, property1.ProductDefinitionFieldId ORDER BY property1.Value DESC) AS RowRank
		FROM uCommerce_ProductProperty property1
		INNER JOIN 
			(
				SELECT
					ProductId, 
					ProductDefinitionFieldId, 
					COUNT(*) AS CountOf
				FROM uCommerce_ProductProperty
				GROUP BY ProductId, ProductDefinitionFieldId
				HAVING COUNT(*)>1
			) 
			duplicate 
			ON 
				property1.ProductId = duplicate.ProductId and 
				property1.ProductDefinitionFieldId = duplicate.ProductDefinitionFieldId
	) 
	duplicate2 
	ON property.ProductPropertyId = duplicate2.ProductPropertyId
WHERE duplicate2.RowRank != 1
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_ProductProperty_ProductId_ProductDefinitionFieldId')
BEGIN
	ALTER TABLE uCommerce_ProductProperty ADD CONSTRAINT
				Unique_ProductProperty_ProductId_ProductDefinitionFieldId UNIQUE NONCLUSTERED
		(
					ProductId,ProductDefinitionFieldId
		)
END