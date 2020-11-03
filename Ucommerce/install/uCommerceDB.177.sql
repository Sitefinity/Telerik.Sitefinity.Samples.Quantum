DECLARE @ServiceId INT
SET @ServiceId = (SELECT DefinitionFieldId FROM uCommerce_DefinitionField WHERE [Guid] = 'D8199A19-D798-4B5D-B650-54901F12AAE2')

DECLARE @EditorId INT
SET @EditorId = (SELECT DefinitionFieldId FROM uCommerce_DefinitionField WHERE [Guid] = '9D777EE6-1DCD-4004-876C-D42CC2E7D368')

DECLARE @DefinitionTypeId INT
SET @DefinitionTypeId = (SELECT DefinitionFieldId FROM uCommerce_DefinitionField WHERE [Guid] = '94220441-758D-46E9-AF89-B6D2C8C2A2C1')

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '0DD761D4-B1D2-4DBE-AB5A-9ADD2639CF9F' AND DefinitionFieldId = @EditorId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], [DefinitionFieldId], [Value], [Version], [CultureCode], [Guid])
	VALUES ('0DD761D4-B1D2-4DBE-AB5A-9ADD2639CF9F', @EditorId, 'DefinitionPicker', 1, null, NEWID())
END

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '07C32617-25C2-465A-A9E2-D94B9F6B5C80' AND DefinitionFieldId = @EditorId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], [DefinitionFieldId], [Value], [Version], [CultureCode], [Guid])
	VALUES ('07C32617-25C2-465A-A9E2-D94B9F6B5C80', @EditorId, 'DefinitionTypePicker', 1, null, NEWID())
END

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '07C32617-25C2-465A-A9E2-D94B9F6B5C80' AND DefinitionFieldId = @DefinitionTypeId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], [DefinitionFieldId], [Value], [Version], [CultureCode], [Guid])
	VALUES ('07C32617-25C2-465A-A9E2-D94B9F6B5C80', @DefinitionTypeId, '5', 1, null, NEWID())
END

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '2D65650B-810A-47D3-8431-A0608A853FED' AND DefinitionFieldId = @EditorId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], [DefinitionFieldId], [Value], [Version], [CultureCode], [Guid])
	VALUES ('2D65650B-810A-47D3-8431-A0608A853FED', @EditorId, 'ShortText', 1, null, NEWID())
END

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '2125BD48-9F28-48DB-BA8E-05C00575483E' AND DefinitionFieldId = @ServiceId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], DefinitionFieldId, [Value], [Version], [CultureCode], [Guid])
	VALUES ('2125BD48-9F28-48DB-BA8E-05C00575483E', @ServiceId, 'UCommerce.Presentation.Web.Controls.IControlFactory, UCommerce.Presentation', 1, 'en-US', NEWID())
END

IF NOT EXISTS (SELECT * FROM [uCommerce_EntityProperty] 
                WHERE [EntityId] = '2125BD48-9F28-48DB-BA8E-05C00575483E' AND DefinitionFieldId = @EditorId)
BEGIN
	INSERT INTO [dbo].[uCommerce_EntityProperty] ([EntityId], [DefinitionFieldId], [Value], [Version], [CultureCode], [Guid])
	VALUES ('2125BD48-9F28-48DB-BA8E-05C00575483E', @EditorId, 'ComponentTypePicker', 1, null, NEWID())
END