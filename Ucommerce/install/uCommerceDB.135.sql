IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'SagePayV3'))
BEGIN 
	/* Definitions for Payment Methods */
	DECLARE @DefinitionTypeId INT
	SELECT @DefinitionTypeId = 4

	-- Adyen config definition
	INSERT INTO uCommerce_Definition 
		(Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
	VALUES
		('SagePayV3', NEWID(), @DefinitionTypeId, 'Configuration for SagePayV3', 0, 1)

	DECLARE @DefinitionId INT
	SELECT @DefinitionId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'TestMode', 6 /* Boolean */, 'true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'Vendor', 1 /* ShortText */, 'MyVendorName' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'TxType', 1 /* ShortText */, 'AUTHENTICATE' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'SuccessUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/Accept.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'AbortUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/Cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
	
	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'FailureUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/Cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'NotificationUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
END
