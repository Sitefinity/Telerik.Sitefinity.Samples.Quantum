IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'PayEx'))
BEGIN 
	/* Definitions for Payment Methods */
	DECLARE @DefinitionTypeId INT
	SELECT @DefinitionTypeId = 4

	-- PayEx config definition
	INSERT INTO uCommerce_Definition 
		(Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
	VALUES
		('PayEx', '{E549E6D5-2B8F-4EC8-BA85-3B52354EFB39}', @DefinitionTypeId, 'Configuration for PayEx', 0, 1)

	DECLARE @DefinitionId INT
	SELECT @DefinitionId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'TestMode', 6 /* Boolean */, 'false' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'AccountNumber', 3 /* Number */, '1' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'CallbackUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'AcceptUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/orderconfirmation.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'CancelUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/Cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'Key', 1 /* ShortText */, 'Key used for encryption' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
END