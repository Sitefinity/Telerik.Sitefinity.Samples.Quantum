ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_PaymentMethodProperty_uCommerce_DefinitionField] FOREIGN KEY([DefinitionFieldId])
REFERENCES [dbo].[uCommerce_DefinitionField] ([DefinitionFieldId])

ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty] CHECK CONSTRAINT [FK_uCommerce_PaymentMethodProperty_uCommerce_DefinitionField]

ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_PaymentMethodProperty_uCommerce_PaymentMethod] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[uCommerce_PaymentMethod] ([PaymentMethodId])

ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty] CHECK CONSTRAINT [FK_uCommerce_PaymentMethodProperty_uCommerce_PaymentMethod]

/* Definitions for Payment Methods */
DECLARE @DefinitionTypeId INT
SELECT @DefinitionTypeId = 4

INSERT INTO uCommerce_DefinitionType (DefinitionTypeId, Name, SortOrder, Deleted) VALUES (@DefinitionTypeId, 'PaymentMethod', 100, 0)

INSERT INTO uCommerce_DefinitionTypeDescription 
	(DefinitionTypeId, DisplayName, CultureCode) 
VALUES
	(@DefinitionTypeId, 'Payment Method Definitions', 'en-US')

INSERT INTO uCommerce_DefinitionTypeDescription 
	(DefinitionTypeId, DisplayName, CultureCode) 
VALUES
	(@DefinitionTypeId, 'Betalingsmetode definitioner', 'da-DK')

INSERT INTO uCommerce_DefinitionTypeDescription 
	(DefinitionTypeId, DisplayName, CultureCode) 
VALUES
	(@DefinitionTypeId, 'Betalningsmetod definitioner', 'sv-SE')

INSERT INTO uCommerce_DefinitionTypeDescription 
	(DefinitionTypeId, DisplayName, CultureCode) 
VALUES
	(@DefinitionTypeId, 'Zahlungsmethode Definitionen', 'de-DE')

-- Global Collect config definition
INSERT INTO uCommerce_Definition 
	(Name, [Guid], DefinitionTypeId, [Description], Deleted, Builtin)
VALUES
	('Global Collect', '{7523DC62-640F-4006-A507-19451909E90B}', @DefinitionTypeId, 'Configuration for Global Collect', 0, 1)

DECLARE @DefinitionId INT
SELECT @DefinitionId = SCOPE_IDENTITY()

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'MerchantId', 3 /* Number */, '1' /* Default Value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'Live', 6 /* Bolean */, 'false' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'SecurityCheck', 1 /* ShortText */, 'IpCheck' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'DefaultPaymentProductId', 3 /* Number */, '123' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'DefaultCountry', 1 /* Number */, 'GB' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'InstantCapture', 6 /* Boolean */, 'false' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'CallbackUrl', 1 /* ShortText */, '(auto)' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'AcceptUrl', 1 /* ShortText */, '/shop/checkout/orderconfirmation.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

INSERT INTO uCommerce_DefinitionField
	(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
VALUES
	(@DefinitionId, 'DeclineUrl', 1 /* ShortText */, '/shop/checkout/cancel.aspx' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)
