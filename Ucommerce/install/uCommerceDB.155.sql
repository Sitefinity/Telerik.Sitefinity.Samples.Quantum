
WITH CTE AS(
   SELECT CategoryPropertyId, CategoryId, CultureCode, DefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY CategoryId, CultureCode, DefinitionFieldId  ORDER BY CategoryPropertyId DESC)
   FROM uCommerce_CategoryProperty
)
DELETE FROM CTE WHERE RN > 1