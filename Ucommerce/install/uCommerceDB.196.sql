/* Insert default data into uCommerce_CurrencyExchangeRate */
/* This data should be overwritten at initialization with updated values*/
IF 
	NOT EXISTS (SELECT [Guid] FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = '0BF25250-C6AF-4F24-A4C9-8A7BF96D2699')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'EUR')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'GBP')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('0BF25250-C6AF-4F24-A4C9-8A7BF96D2699',
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'EUR'),
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'GBP'),
           0.87)
END
GO

IF 
	NOT EXISTS (SELECT [Guid] FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = 'BD834558-A12F-400E-9D79-C8F941922345')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'EUR')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'USD')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('BD834558-A12F-400E-9D79-C8F941922345',
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'EUR'),
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'USD'),
           1.13)
END
GO

IF 
	NOT EXISTS (SELECT 1 FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = '5A497BEF-C652-4101-AC9B-948C5EA95B77')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'EUR')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'DKK')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('5A497BEF-C652-4101-AC9B-948C5EA95B77',
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'EUR'),
           (SELECT TOP 1 CurrencyId from uCommerce_Currency where ISOCode = 'DKK'),
           7.46)
END
GO

IF 
	NOT EXISTS (SELECT 1 FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = '3A7B92E0-D55A-4F7F-AF96-3C2926DA5BB5')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'GBP')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'USD')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('3A7B92E0-D55A-4F7F-AF96-3C2926DA5BB5',
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'GBP'),
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'USD'),
           1.29)
END
GO

IF 
	NOT EXISTS (SELECT 1 FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = '3E15875D-63EF-46B9-BE7C-FDE24C86AF11')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'GBP')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'DKK')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('3E15875D-63EF-46B9-BE7C-FDE24C86AF11',
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'GBP'),
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'DKK'),
           8.56)
END
GO

IF 
	NOT EXISTS (SELECT 1 FROM uCommerce_CurrencyExchangeRate WHERE [Guid] = '139DAC71-B643-4156-BA98-F1902924DC49')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'USD')
	AND
	EXISTS(SELECT 1 FROM uCommerce_Currency WHERE ISOCode = 'DKK')
BEGIN
	INSERT INTO [dbo].[uCommerce_CurrencyExchangeRate]
		       ([Guid]
			   ,[FromCurrencyId]
			   ,[ToCurrencyId]
			   ,[Rate])
     VALUES
           ('139DAC71-B643-4156-BA98-F1902924DC49',
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'USD'),
           (SELECT CurrencyId from uCommerce_Currency where ISOCode = 'DKK'),
           6.62)
END
GO
