IF (NOT EXISTS (SELECT 1 from uCommerce_Definition where Name = 'PayPal Subscriptions'))
BEGIN 
  /* Definitions for Payment Methods */
  DECLARE @DefinitionTypeId INT
  SELECT @DefinitionTypeId = 4

  -- PayPal Subscriptions config definition
  INSERT INTO uCommerce_Definition 
    (Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
  VALUES
    ('PayPal Subscriptions', '3b726615-12f7-4c5d-a0ba-23ad8b80e9f3', @DefinitionTypeId, 'Configuration for PayPal Subscriptions', 0, 1)

  DECLARE @DefinitionId INT
  SELECT @DefinitionId = SCOPE_IDENTITY()

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'ApiUsername', 1 /* ShortText */, 'api username' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'ApiPassword', 1 /* ShortText */, 'password' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'ApiSignature', 1 /* ShortText */, 'the api signature' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Sandbox', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'ReturnMethod', 1 /* ShortText */, 'PostMethod' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Business', 1 /* ShortText */, 'Account as specified by PayPal' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'NotifyUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'PaymentAction', 1 /* ShortText */, 'Authorization' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'PrivateCertificatePath', 1 /* ShortText */, '~/UCommerce/Configuration/my_pkcs12.p12' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'PublicPayPalCertificatePath', 1 /* ShortText */, '~/UCommerce/Configuration/paypal_cert.pem' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'PrivateCertificatePassword', 1 /* ShortText */, 'password' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'UseEncryption', 6 /* Boolean */, 'True' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'Return', 1 /* ShortText */, 'http://www.yoursite.com/shop/checkout/orderconfirmation.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

  INSERT INTO uCommerce_DefinitionField
    (DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
  VALUES
    (@DefinitionId, 'CancelReturn', 1 /* ShortText */, 'http://www.yoursite.com/shop/checkout/Cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END

