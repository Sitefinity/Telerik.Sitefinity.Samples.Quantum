IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'Default Payment Method Service'))
BEGIN 
  /* Definitions for Payment Methods */
  DECLARE @DefinitionTypeId INT
  SELECT @DefinitionTypeId = 4

  -- PayPal Subscriptions config definition
  INSERT INTO uCommerce_Definition 
    (Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
  VALUES
    ('Default Payment Method Service', '3b123654-23ab-4d3c-b1fa-23ad8b80e9f3', @DefinitionTypeId, 'Configuration for Default Payment Method Service', 0, 1)

  DECLARE @DefinitionId INT
  SELECT @DefinitionId = SCOPE_IDENTITY()

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'AcceptUrl', 1 /* ShortText */, '' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
END