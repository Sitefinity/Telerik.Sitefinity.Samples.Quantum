GO
delete from uCommerce_ProductDefinitionFieldDescription 
where (DisplayName is null or DisplayName = '') AND (Description is null or Description = '') 
GO
DELETE pdfd
FROM uCommerce_ProductDefinitionFieldDescription pdfd
INNER JOIN (SELECT
                pdfd1.ProductDefinitionFieldDescriptionId,pdfd1.CultureCode,pdfd1.ProductDefinitionFieldId,ROW_NUMBER() OVER(PARTITION BY pdfd1.CultureCode,pdfd1.ProductDefinitionFieldId ORDER BY pdfd1.CultureCode,pdfd1.ProductDefinitionFieldId) AS RowRank
                FROM uCommerce_ProductDefinitionFieldDescription pdfd1
                    INNER JOIN (SELECT
                                    CultureCode,ProductDefinitionFieldId, COUNT(*) AS CountOf
                                    FROM uCommerce_ProductDefinitionFieldDescription
                                    GROUP BY CultureCode,ProductDefinitionFieldId
                                    HAVING COUNT(*)>1
                                ) dt ON pdfd1.CultureCode=dt.CultureCode and pdfd1.ProductDefinitionFieldId=dt.ProductDefinitionFieldId
            ) dt2 ON pdfd.ProductDefinitionFieldDescriptionId=dt2.ProductDefinitionFieldDescriptionId
WHERE dt2.RowRank!=1
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_ProductDefinitionFieldDescription_CultureCode_ProductDefintionFieldId')
BEGIN
	ALTER TABLE uCommerce_ProductDefinitionFieldDescription ADD CONSTRAINT
				Unique_ProductDefinitionFieldDescription_CultureCode_ProductDefintionFieldId UNIQUE NONCLUSTERED
		(
					CultureCode,ProductDefinitionFieldId
		)
END

