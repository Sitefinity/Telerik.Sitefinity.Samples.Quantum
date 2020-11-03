IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = 'uCommerce_FreeGiftAward'))
BEGIN
	CREATE TABLE uCommerce_FreeGiftAward
	(
		FreeGiftAwardId int primary key,
		Sku nvarchar(max) not null,
		VariantSku nvarchar(max)	
	)
END

IF NOT EXISTS (select * from uCommerce_EntityUi where Type = 'UCommerce.EntitiesV2.FreeGiftAward, UCommerce')
BEGIN
	declare @entityUiId as int 
	insert into uCommerce_EntityUi values
	(
		'UCommerce.EntitiesV2.FreeGiftAward, UCommerce',
		'Awards/FreeGiftAwardUi.ascx',
		5
	)
	SET @entityUiId = SCOPE_IDENTITY()

	insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Free gift',null,'en-US')
	insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Gratis gåva',null,'sv-SE')
	insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Gratis gave',null,'da-DK')
	insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Geschenk',null,'de-DE')
END



