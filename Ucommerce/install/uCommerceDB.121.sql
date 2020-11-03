IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'Secure Trading'))
BEGIN 
  /* Definitions for Payment Methods */
  DECLARE @DefinitionTypeId INT
  SELECT @DefinitionTypeId = 4

  -- Secure Trading config definition
  INSERT INTO uCommerce_Definition 
    (Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
  VALUES
    ('Secure Trading', '445ddeff-81bc-4227-91f5-390ff75e3392', @DefinitionTypeId, 'Configuration for Secure Trading', 0, 1)

  DECLARE @DefinitionId INT
  SELECT @DefinitionId = SCOPE_IDENTITY()

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Sitereference', 1 /* ShortText */, 'your unique secure trading site reference' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'AcceptUrl', 1 /* ShortText */, 'myonlineshop.com/orderconfirmationPage' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'DeclineUrl', 1 /* ShortText */, 'myonlineshop.com/declineUrl' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Key', 1 /* ShortText */, 'your key used for md5 hash' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'InstantCapture', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'WebServiceAlias', 1 /* ShortText */, 'alias used for webservice' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'WebServicePassword', 1 /* ShortText */, 'http://myonlinestore.com/accept.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END

