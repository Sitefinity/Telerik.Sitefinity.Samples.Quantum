IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'Netaxept'))
BEGIN 
  /* Definitions for Payment Methods */
  DECLARE @DefinitionTypeId INT
  SELECT @DefinitionTypeId = 4

  -- Netaxept config definition
  INSERT INTO uCommerce_Definition 
    (Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
  VALUES
    ('Netaxept', '9ef69c1a-b167-422a-90bb-8c011f6fec51', @DefinitionTypeId, 'Configuration for Netaxept', 0, 1)

  DECLARE @DefinitionId INT
  SELECT @DefinitionId = SCOPE_IDENTITY()

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'TestMode', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'MerchantId', 1 /* ShortText */, 'Merchant ID as specified by Netaxept' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Password', 1 /* ShortText */, 'API password' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'CallbackUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'AcceptUrl', 1 /* ShortText */, 'http://www.yoursite.com/shop/checkout/orderconfirmation.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'CancelUrl', 1 /* ShortText */, 'http://www.yoursite.com/shop/checkout/cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'DeclineUrl', 1 /* ShortText */, 'http://www.yoursite.com/shop/checkout/decline.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'AvailablePaymentOptions', 1 /* ShortText */, 'MasterCard,Visa,Dankort' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'SinglePageView', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Force3DSecure', 6 /* Boolean */, 'False' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END

