GO
IF NOT EXISTS (select * from uCommerce_DataType where DefinitionName = 'DateTime')
BEGIN
	insert into uCommerce_DataType values ('DateTimePicker',1,'',1,'DateTime',0,NEWID())
END