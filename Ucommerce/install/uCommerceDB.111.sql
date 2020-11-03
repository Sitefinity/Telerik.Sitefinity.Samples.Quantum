IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'ePay'))
BEGIN 
  /* Definitions for Payment Methods */
  DECLARE @DefinitionTypeId INT
  SELECT @DefinitionTypeId = 4

  -- ePay config definition
  INSERT INTO uCommerce_Definition 
    (Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
  VALUES
    ('ePay', 'e2f5e714-3f04-405f-8bb7-6db53c1f4572', @DefinitionTypeId, 'Configuration for ePay', 0, 1)

  DECLARE @DefinitionId INT
  SELECT @DefinitionId = SCOPE_IDENTITY()

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Key', 1 /* ShortText */, 'MD5 key as configured in ePay' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

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
    (@DefinitionId, 'DeclineUrl', 1 /* ShortText */, 'http://www.myonlinestore.com/shop/checkout/Cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Pwd', 1 /* ShortText */, 'API password' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'MerchantNumber', 1 /* ShortText */, '0' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'InstantAcquire', 6 /* Boolean */, 'False' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'OwnReceipt', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'UseMd5', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'SplitPayment', 6 /* Boolean */, 'False' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END

