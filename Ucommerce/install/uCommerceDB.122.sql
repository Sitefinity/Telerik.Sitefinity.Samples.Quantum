IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'Ideal (Ing Bank)'))
BEGIN 
	/* Definitions for Payment Methods */
	DECLARE @DefinitionTypeId INT
	SELECT @DefinitionTypeId = 4

	-- Ideal (Ing Bank) config definition
	INSERT INTO uCommerce_Definition 
		(Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
	VALUES
		('Ideal (Ing Bank)', '{C94644E4-F213-48A6-98EB-741ACA16155F}', @DefinitionTypeId, 'Configuration for Ideal (Ing Bank)', 0, 1)

	DECLARE @DefinitionId INT
	SELECT @DefinitionId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'SubId', 1 /* ShortText */, '0' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'MerchantId', 1 /* ShortText */, 'Your Merchant Id' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
	
	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'SecretKey', 1 /* ShortText */, 'Your Secret key' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'Language', 1 /* ShortText */, 'nl' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
	
	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'TestMode', 6 /* Boolean */, 'true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
	
	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'ErrorUrl', 1 /* ShortText */, '/cart/Confirmation.aspx?Error=true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)	
		
	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'CancelUrl', 1 /* ShortText */, '/cart/Confirmation.aspx?Cancel=true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'SuccessUrl', 1 /* ShortText */, '/cart/Confirmation.aspx?Accept=true' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END