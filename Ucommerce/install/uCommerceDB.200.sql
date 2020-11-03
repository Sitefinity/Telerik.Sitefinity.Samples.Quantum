SELECT ProductCatalogGroupId,
	   count(*) AS CountRows,
	   count(DISTINCT SortOrder) AS CountSortOrders
FROM dbo.uCommerce_ProductCatalog
GROUP BY ProductCatalogGroupId         
HAVING count(*) > count(DISTINCT SortOrder);

IF @@ROWCOUNT > 0 
BEGIN
	WITH numberedCatalogs AS
	( 
		SELECT productCatalogId, ROW_NUMBER() OVER (PARTITION BY productCatalogGroupId ORDER BY SortOrder) AS rowNumber
		FROM uCommerce_ProductCatalog
	)
	UPDATE uCommerce_ProductCatalog
	SET SortOrder = numberedCatalogs.rowNumber -1
	FROM numberedCatalogs
	WHERE uCommerce_ProductCatalog.productCatalogId = numberedCatalogs.productCatalogId;
END
				
SELECT productCatalogId,
       parentCategoryId,
       COUNT(*) AS RowsCount,
       COUNT(DISTINCT SortOrder) AS DistinctSortOrdersCount
FROM dbo.UCommerce_Category
GROUP BY productCatalogId,
         parentCategoryId
HAVING COUNT(*) > COUNT(DISTINCT SortOrder);

IF @@ROWCOUNT > 0
BEGIN
	WITH numberedCategories AS
	( 
		SELECT categoryId, ROW_NUMBER() OVER (PARTITION BY productCatalogId, parentCategoryId ORDER BY SortOrder) AS rowNumber
		FROM uCommerce_Category
	)
	UPDATE uCommerce_Category
	SET SortOrder = numberedCategories.rowNumber -1
	FROM numberedCategories
	WHERE uCommerce_Category.CategoryId = numberedCategories.categoryId;
END