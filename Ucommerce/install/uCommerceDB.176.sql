DECLARE @BaseDataTypeId INT
SET @BaseDataTypeId = (SELECT DefinitionId from uCommerce_Definition WHERE [Guid] = '28877FD4-A790-47A5-9D85-8A08BB8C46FC')

DECLARE @DefinitionPickerDataTypeId INT
SET @DefinitionPickerDataTypeId = (SELECT DefinitionId from uCommerce_Definition WHERE [Guid] = '37889B09-AC8A-436A-A087-833016ED4A14')

DECLARE @ComponentPickerDataTypeId INT
SET @ComponentPickerDataTypeId = (SELECT DefinitionId from uCommerce_Definition WHERE [Guid] = '96B66456-DB72-435D-9B6F-0D129891B95B')

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionRelation] 
                WHERE [DefinitionId] = @DefinitionPickerDataTypeId AND [ParentDefinitionId] = @BaseDataTypeId)
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionRelation] ([DefinitionId], [ParentDefinitionId], [SortOrder])
	VALUES (@DefinitionPickerDataTypeId, @BaseDataTypeId, 0)
END

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionRelation] 
                WHERE [DefinitionId] = @ComponentPickerDataTypeId AND [ParentDefinitionId] = @BaseDataTypeId)
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionRelation] ([DefinitionId], [ParentDefinitionId], [SortOrder])
	VALUES (@ComponentPickerDataTypeId, @BaseDataTypeId, 0)
END

