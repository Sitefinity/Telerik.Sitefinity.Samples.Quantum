IF NOT EXISTS(select * from uCommerce_DataType where TypeName = 'EmailContent')
BEGIN
	INSERT INTO uCommerce_DataType VALUES
	(
		'EmailContent',
		0,
		'',
		1,
		'EmailContent',
		0,
		NEWID(),
		GETDATE(),
		'',
		GETDATE(),
		'',
		null
	)
END
