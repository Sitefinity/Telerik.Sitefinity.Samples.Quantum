IF NOT EXISTS(SELECT * FROM uCommerce_AdminTab WHERE VirtualPath = 'EditProductCatalogGroupDescription.ascx')
BEGIN
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'EditProductCatalogGroupDescription.ascx',
		2,
		2,
		1,
		'Description',
		1,
		0,
		1
	)
END
