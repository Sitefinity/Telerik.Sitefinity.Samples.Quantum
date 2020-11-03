DECLARE @DataTypeId INT

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionType]
                WHERE [Name] = 'Data Types')
BEGIN
		SET @DataTypeId = (SELECT Max([DefinitionTypeId]) FROM [uCommerce_DefinitionType])+1;
	    INSERT INTO [dbo].[uCommerce_DefinitionType] ([DefinitionTypeId], [Name], [Deleted], [SortOrder]) VALUES (@DataTypeId, 'Data Types', 0, 200)
END

IF NOT EXISTS (SELECT * FROM [uCommerce_Definition]
                WHERE [Name] = 'Data Type')
BEGIN
	INSERT INTO [dbo].[uCommerce_Definition] ([Name], [DefinitionTypeId], [Description], [Deleted], [SortOrder], [Guid], [BuiltIn], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy])
	VALUES ('Data Type', @DataTypeId, 'The minimum required fields to describe a data type.', 0, 0, '28877FD4-A790-47A5-9D85-8A08BB8C46FC', 1, GETDATE(), '', GETDATE(), '')
END

IF NOT EXISTS (SELECT * FROM [uCommerce_Definition]
                WHERE [Name] = 'Definition Picker')
BEGIN
	INSERT INTO [dbo].[uCommerce_Definition] ([Name], [DefinitionTypeId], [Description], [Deleted], [SortOrder], [Guid], [BuiltIn], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy])
	VALUES ('Definition Picker', @DataTypeId, 'Allows you to create new pickers for a given type in the definition system.', 0, 0, '37889B09-AC8A-436A-A087-833016ED4A14', 1, GETDATE(), '', GETDATE(), '')
END

IF NOT EXISTS (SELECT * FROM [uCommerce_Definition]
                WHERE [Name] = 'Component Picker')
BEGIN
	INSERT INTO [dbo].[uCommerce_Definition] ([Name], [DefinitionTypeId], [Description], [Deleted], [SortOrder], [Guid], [BuiltIn], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy])
	VALUES ('Component Picker', @DataTypeId, 'Allows you to create new pickers for a given service in Castle Windsor.', 0, 0, '96B66456-DB72-435D-9B6F-0D129891B95B', 1, GETDATE(), '', GETDATE(), '')
END