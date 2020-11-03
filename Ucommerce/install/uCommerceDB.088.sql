GO
DELETE FROM uCommerce_CategoryDescription where (DisplayName is null or DisplayName = '') AND ([Description] is null or [Description] = '') 
GO
DELETE categoryDescription
FROM uCommerce_CategoryDescription categoryDescription
INNER JOIN (SELECT
                categoryDescription1.CategoryDescriptionId,categoryDescription1.CultureCode,categoryDescription1.CategoryId,ROW_NUMBER() OVER(PARTITION BY categoryDescription1.CultureCode,categoryDescription1.CategoryId ORDER BY categoryDescription1.CultureCode,categoryDescription1.CategoryId) AS RowRank
                FROM uCommerce_CategoryDescription categoryDescription1
                    INNER JOIN (SELECT
                                    CultureCode,CategoryId, COUNT(*) AS CountOf
                                    FROM uCommerce_CategoryDescription
                                    GROUP BY CultureCode,CategoryId
                                    HAVING COUNT(*)>1
                                ) dt ON categoryDescription1.CultureCode=dt.CultureCode and categoryDescription1.CategoryId=dt.CategoryId
            ) dt2 ON categoryDescription.CategoryDescriptionId=dt2.CategoryDescriptionId
WHERE dt2.RowRank!=1
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_CategoryDescription_CultureCode_CategoryId')
BEGIN
	ALTER TABLE uCommerce_CategoryDescription ADD CONSTRAINT
				Unique_CategoryDescription_CultureCode_CategoryId UNIQUE NONCLUSTERED
		(
					CultureCode,CategoryId
		)
END