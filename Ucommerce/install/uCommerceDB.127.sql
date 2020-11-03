IF (NOT EXISTS (SELECT 1 from uCommerce_DataType where TypeName = 'GlobalCollectPaymentProducts'))
BEGIN 
	/* Definitions for Payment Methods */
	DECLARE @DataTypeId INT
	DECLARE @DataTypeEnumId INT
	
	INSERT INTO uCommerce_DataType
		(TypeName, Nullable, ValidationExpression, BuiltIn, DefinitionName, Deleted, [Guid])
	VALUES
		('GlobalCollectPaymentProducts', 0, '', 0, 'EnumMultiSelect', 1, NEWID())

	SELECT @DataTypeId = SCOPE_IDENTITY()


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '2', 0, NEWID(), 101) /* American Express */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'American Express', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '134', 0, NEWID(), 102) /* American Express Prepaid */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'American Express Prepaid', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '140', 0, NEWID(), 103) /* Argencard */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Argencard', '')

		
	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '146', 0, NEWID(), 104) /* Aura */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Aura', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '135', 0, NEWID(), 105) /* Cabal */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Cabal', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '130', 0, NEWID(), 106) /* Carte Bancaire */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Carte Bancaire', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '141', 0, NEWID(), 107) /* Consumax */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Consumax', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '123', 0, NEWID(), 108) /* Dankort */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Dankort', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '132', 0, NEWID(), 109) /* Diners Club */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Diners Club', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '128', 0, NEWID(), 110) /* Discover */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Discover', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '147', 0, NEWID(), 111) /* ELO */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'ELO', '')

	
	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '148', 0, NEWID(), 112) /* Hipercard */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Hipercard', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '139', 0, NEWID(), 113) /* Italcred */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Italcred', '')

	
	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '125', 0, NEWID(), 114) /* JCB */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'JCB', '')

		
	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '124', 0, NEWID(), 115) /* Laser */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Laser', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '117', 0, NEWID(), 116) /* Maestro */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Maestro', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '142', 0, NEWID(), 117) /* Mas */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Mas', '')
		

	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '3', 0, NEWID(), 118) /* MasterCard */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'MasterCard', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '119', 0, NEWID(), 119) /* MasterCard Debit */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'MasterCard Debit', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '136', 0, NEWID(), 120) /* Naranja */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Naranja', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '145', 0, NEWID(), 121) /* Nativa */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Nativa', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '137', 0, NEWID(), 122) /* Nevada */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Nevada', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '144', 0, NEWID(), 123) /* Pyme Nacion */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Pyme Nacion', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '149', 0, NEWID(), 124) /* Tarjeta Shopping */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Tarjeta Shopping', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '1', 0, NEWID(), 125) /* Visa */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Visa', '')

	
	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '114', 0, NEWID(), 126) /* Visa Debit */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Visa Debit', '')
		

	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '111', 0, NEWID(), 127) /* Visa Delta */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Visa Delta', '')


	INSERT INTO uCommerce_DataTypeEnum
		(DataTypeId, Value, Deleted, [Guid], SortOrder)
	VALUES
		(@DataTypeId, '122', 0, NEWID(), 128) /* Visa Electron */

	SELECT @DataTypeEnumId = SCOPE_IDENTITY()

	INSERT INTO uCommerce_DataTypeEnumDescription
		(DataTypeEnumId, CultureCode, DisplayName, [Description])
	VALUES
		(@DataTypeEnumId, 'en-US', 'Visa Electron', '')

	DECLARE @DefinitionId INT
	SELECT @DefinitionId = definitionID FROM uCommerce_Definition WHERE [Guid]='7523DC62-640F-4006-A507-19451909E90B' 

	INSERT INTO uCommerce_DefinitionField
		(DefinitionId, Name, DataTypeId, DefaultValue, Multilingual, RenderInEditor, DisplayOnSite, Searchable, SortOrder, Deleted, Builtin)
	VALUES
		(@DefinitionId, 'Force3DSecureForThesePaymentProducts', @DataTypeId /* GlobalCollectPaymentProducts */, '' /* Default value */, 0 /* Not multilingual */, 1 /* Render in editor */, 1 /* Display on site */, 0 /* Searchable */, 1 /* Sort order */, 0 /* Deleted */, 1 /* Builtin */)

END