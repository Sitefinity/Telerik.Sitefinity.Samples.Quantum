IF NOT EXISTS (SELECT * FROM uCommerce_DataType WHERE TypeName = 'SigningAlgorithm' AND DefinitionName = 'Enum')
BEGIN
	INSERT INTO uCommerce_DataType VALUES ('SigningAlgorithm', 1, '', 1, 'Enum', 0,NEWID(), GETDATE(), '', GETDATE(), '')

	DECLARE @DataTypeId INT = @@IDENTITY
	INSERT INTO uCommerce_DataTypeEnum VALUES (@DataTypeId, 'SHA1', 0, NEWID(), 0)
	INSERT INTO uCommerce_DataTypeEnum VALUES (@DataTypeId, 'SHA256', 0, NEWID(), 1)	

	DECLARE @AdyenDefinitionId int = (select DefinitionId from uCommerce_Definition where Name = 'Adyen')
	INSERT INTO uCommerce_DefinitionField VALUES (@DataTypeId, @AdyenDefinitionId, 'SigningAlgorithm', 1, 0, 1, 0, 1, 0, 1, 'SHA1', NEWID())
END 