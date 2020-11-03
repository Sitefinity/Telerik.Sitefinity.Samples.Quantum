IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'Ogone'))
BEGIN 
	/* Definitions for Payment Methods */
	DECLARE @DefinitionTypeId INT
	SELECT @DefinitionTypeId = 4

	-- OGone config definition
	INSERT INTO uCommerce_Definition 
		(Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
	VALUES
		('Ogone', NEWID(), @DefinitionTypeId, 'Configuration for Ogone', 0, 1)

	DECLARE @DefinitionId INT
	SELECT @DefinitionId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'PspId', 1 /* ShortText */, 'yourPspId' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'UserId', 1 /* ShortText */, 'yourUserId' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'Password', 1 /* ShortText */, 'yoursecretpassword' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'AcceptUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/orderconfirmation.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'CancelUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'BackUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/preview.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'DeclineUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/decline.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'ExceptionUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/error.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'CallbackUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'ShaSignIn', 1 /* ShortText */, 'yourShaSignIn' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'ShaSignOut', 1 /* ShortText */, 'yourShaSignOut' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'InstantAcquire', 6 /* Boolean */, 'false' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'TestMode', 6 /* Boolean */, 'true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
END