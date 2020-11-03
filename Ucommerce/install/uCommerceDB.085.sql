GO

/* Builtin capability for definitions and fields to indicate that they should not be deleted */
ALTER TABLE uCommerce_Definition ADD BuiltIn BIT DEFAULT(0) NOT NULL
ALTER TABLE uCommerce_DefinitionField ADD BuiltIn BIT DEFAULT(0) NOT NULL

/* Default value support for fields */
ALTER TABLE uCommerce_DefinitionField ADD DefaultValue nvarchar(max) NULL

GO

/* Add definitions to payment methods */
ALTER TABLE uCommerce_PaymentMethod ADD DefinitionId INT NULL REFERENCES uCommerce_Definition (DefinitionId)

CREATE TABLE [dbo].[uCommerce_PaymentMethodProperty](
	[PaymentMethodPropertyId] [int] IDENTITY (1, 1) NOT NULL,
	[DefinitionFieldId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[CultureCode] [nvarchar](60) NULL,
	[PaymentMethodId] [int] NOT NULL,
 CONSTRAINT [PK_uCommerce_PaymentMethodProperty] PRIMARY KEY CLUSTERED 
 (
	[PaymentMethodPropertyId] ASC
 )
)
GO