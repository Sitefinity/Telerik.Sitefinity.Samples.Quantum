Declare @EntityUiId INT = (select MAX(EntityUiId) from uCommerce_EntityUi where VirtualPathUi = 'Targets/CategoryUi.ascx')

IF(@EntityUiId IS NOT NULL)
BEGIN
	INSERT INTO uCommerce_EntityUiDescription VALUES (@EntityUiId, 'Kategorier', null, 'sv')
	UPDATE uCommerce_EntityUiDescription SET DisplayName = 'Kategorier' WHERE EntityUiId = @EntityUiId AND CultureCode = 'da'
	UPDATE uCommerce_EntityUiDescription SET DisplayName = 'Categories' WHERE EntityUiId = @EntityUiId AND CultureCode = 'en'
	UPDATE uCommerce_EntityUiDescription SET DisplayName = 'Kategorien' WHERE EntityUiId = @EntityUiId AND CultureCode = 'de'
END


