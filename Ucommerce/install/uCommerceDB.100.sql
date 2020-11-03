DECLARE @entityUiId int;
SET @entityUiId = (select EntityUiId from uCommerce_EntityUi where Type = 'UCommerce.EntitiesV2.ProductTarget, UCommerce')

UPDATE uCommerce_EntityUiDescription
SET DisplayName = 'Products'
WHERE EntityUiId = @entityUiId AND CultureCode = 'en'

UPDATE uCommerce_EntityUiDescription
SET DisplayName = 'Produkter'
WHERE EntityUiId = @entityUiId AND CultureCode = 'da'

UPDATE uCommerce_EntityUiDescription
SET DisplayName = 'Produkter'
WHERE EntityUiId = @entityUiId AND CultureCode = 'sv'

UPDATE uCommerce_EntityUiDescription
SET DisplayName = 'Produkts'
WHERE EntityUiId = @entityUiId AND CultureCode = 'de'

GO