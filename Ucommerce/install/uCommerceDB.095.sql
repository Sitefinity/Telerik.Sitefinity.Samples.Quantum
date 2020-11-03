update uCommerce_CategoryTarget set CategoryGuid =
    (select top 1 c.[Guid] from uCommerce_Category c where Name = ct.[Name] AND Deleted = 0) from uCommerce_CategoryTarget ct