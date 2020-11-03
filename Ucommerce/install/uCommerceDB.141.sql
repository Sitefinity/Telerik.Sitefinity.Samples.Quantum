-- Cleans up data for PaymentMethod properties and adds a constraint to prevent duplicate values.
-- Null or empty values can safely be removed as those are default values if querying yields no result.
GO
DELETE FROM uCommerce_PaymentMethodProperty where Value = ''
GO
DELETE FROM uCommerce_PaymentMethodProperty where Value is null
GO

DELETE property
FROM uCommerce_PaymentMethodProperty property
INNER JOIN 
	(
		SELECT
			property1.PaymentMethodPropertyId, 
			property1.PaymentMethodId,
			property1.CultureCode,
			property1.DefinitionFieldId, 
			ROW_NUMBER() OVER(PARTITION BY property1.PaymentMethodId, property1.CultureCode, property1.DefinitionFieldId ORDER BY property1.Value DESC) AS RowRank
		FROM uCommerce_PaymentMethodProperty property1
		INNER JOIN 
			(
				SELECT
					PaymentMethodId,
					CultureCode,
					DefinitionFieldId, 
					COUNT(*) AS CountOf
				FROM uCommerce_PaymentMethodProperty
				GROUP BY PaymentMethodId, CultureCode, DefinitionFieldId
				HAVING COUNT(*)>1
			) 
			duplicate 
			ON 
				property1.PaymentMethodId = duplicate.PaymentMethodId and 
				property1.DefinitionFieldId = duplicate.DefinitionFieldId and
				(property1.CultureCode = duplicate.CultureCode or (property1.CultureCode is NULL and duplicate.CultureCode is NULL))
	) 
	duplicate2 
	ON property.PaymentMethodPropertyId = duplicate2.PaymentMethodPropertyId
WHERE duplicate2.RowRank != 1
GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'PaymentMethodProperty_Unique_PaymentMethodId_DefinitionFieldId')
BEGIN
	ALTER TABLE uCommerce_PaymentMethodProperty ADD CONSTRAINT
				PaymentMethodProperty_Unique_PaymentMethodId_DefinitionFieldId UNIQUE NONCLUSTERED
		(
			PaymentMethodId,CultureCode,DefinitionFieldId
		)
END