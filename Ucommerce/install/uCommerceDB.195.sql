/* New ExchangeRate table */
IF NOT EXISTS (SELECT * FROM sys.objects
	WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_CurrencyExchangeRate]'))
BEGIN
	CREATE TABLE [dbo].[uCommerce_CurrencyExchangeRate](
		[CurrencyExchangeRateId] [int] IDENTITY(1,1) NOT NULL,
		[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_uCommerce_CurrencyExchangeRate_Guid] default NEWSEQUENTIALID(),
		[FromCurrencyId] int NOT NULL,
		[ToCurrencyId] int NOT NULL,
		[Rate] decimal(19,9) NOT NULL,
		CONSTRAINT [PK_uCommerce_CurrencyExchangeRate] PRIMARY KEY CLUSTERED([CurrencyExchangeRateId] ASC),
		CONSTRAINT FK_uCommerce_CurrencyExchangeRate_FromCurrencyId FOREIGN KEY ([FromCurrencyId]) REFERENCES uCommerce_Currency([CurrencyId]),
		CONSTRAINT FK_uCommerce_CurrencyExchangeRate_ToCurrencyId FOREIGN KEY ([ToCurrencyId]) REFERENCES uCommerce_Currency([CurrencyId])
	);
END

GO
/* UX_uCommerce_CurrencyExchangeRate_Guid */
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CurrencyExchangeRate]') AND name = N'UX_uCommerce_CurrencyExchangeRate_Guid')
BEGIN
	DROP INDEX [UX_uCommerce_CurrencyExchangeRate_Guid] ON [dbo].[uCommerce_CurrencyExchangeRate];
END

GO

CREATE UNIQUE INDEX [UX_uCommerce_CurrencyExchangeRate_Guid] ON [dbo].[uCommerce_CurrencyExchangeRate]
(
	[Guid] ASC
);

GO
/* UX_uCommerce_CurrencyExchangeRate_FromCurrencyId */
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CurrencyExchangeRate]') AND name = N'UX_uCommerce_CurrencyExchangeRate_FromCurrencyId')
BEGIN
	DROP INDEX [UX_uCommerce_CurrencyExchangeRate_FromCurrencyId] ON [dbo].[uCommerce_CurrencyExchangeRate];
END

GO

CREATE UNIQUE INDEX [UX_uCommerce_CurrencyExchangeRate_FromCurrencyId] ON [dbo].[uCommerce_CurrencyExchangeRate] 
(
	[FromCurrencyId], [ToCurrencyId]
);

GO
/* UX_uCommerce_CurrencyExchangeRate_FromCurrencyId */
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CurrencyExchangeRate]') AND name = N'UX_uCommerce_CurrencyExchangeRate_ToCurrencyId')
BEGIN
	DROP INDEX [UX_uCommerce_CurrencyExchangeRate_ToCurrencyId] ON [dbo].[uCommerce_CurrencyExchangeRate];
END

GO

CREATE UNIQUE INDEX [UX_uCommerce_CurrencyExchangeRate_ToCurrencyId] ON [dbo].[uCommerce_CurrencyExchangeRate]
(
	[ToCurrencyId], [FromCurrencyId]
);

GO


