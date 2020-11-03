/*

ADDRESSES Part 2 of 2

*/

PRINT N'Update data in [dbo].[uCommerce_Address] with data from [dbo].[uCommerce_Customer]'

UPDATE [dbo].[uCommerce_Address] 
SET 
	[FirstName] = c.FirstName,
	[LastName] = c.LastName,
	[EmailAddress] = c.EmailAddress,
	[PhoneNumber] = c.PhoneNumber,
	[MobilePhoneNumber] = c.MobilePhoneNumber
FROM [dbo].[uCommerce_Address] a INNER JOIN [dbo].[uCommerce_Customer] c ON a.CustomerId = c.CustomerId


PRINT N'Copy addresses from [dbo].[uCommerce_Address] to [dbo].[uCommerce_OrderAddress]'

SET IDENTITY_INSERT [dbo].[uCommerce_OrderAddress] ON;

INSERT INTO [dbo].[uCommerce_OrderAddress] (
		   OrderAddressId
		   ,[FirstName]
           ,[LastName]
           ,[EmailAddress]
           ,[PhoneNumber]
           ,[MobilePhoneNumber]
           ,[Line1]
           ,[Line2]
           ,[PostalCode]
           ,[City]
           ,[State]
           ,[CountryId]
           ,[Attention]
           ,[CompanyName]
           ,[AddressName])

SELECT  [AddressId],
			[FirstName]
           ,[LastName]
           ,[EmailAddress]
           ,[PhoneNumber]
           ,[MobilePhoneNumber]
           ,[Line1]
           ,[Line2]
           ,[PostalCode]
           ,[City]
           ,[State]
           ,[CountryId]
           ,[Attention]
           ,[CompanyName]
           ,[AddressName] 
FROM  [dbo].[uCommerce_Address]
                    



SET IDENTITY_INSERT [dbo].[uCommerce_OrderAddress] OFF;

PRINT N'Adding foreign keys to [dbo].[uCommerce_PurchaseOrder]'

ALTER TABLE [dbo].[uCommerce_PurchaseOrder] ADD
CONSTRAINT [FK_uCommerce_PurchaseOrder_uCommerce_OrderAddress] FOREIGN KEY ([BillingAddressId]) REFERENCES [dbo].[uCommerce_OrderAddress] ([OrderAddressId])

PRINT N'Adding foreign keys to [dbo].[uCommerce_Shipment]'

ALTER TABLE [dbo].[uCommerce_Shipment] ADD
CONSTRAINT [FK_uCommerce_Shipment_uCommerce_OrderAddress] FOREIGN KEY ([ShipmentAddressId]) REFERENCES [dbo].[uCommerce_OrderAddress] ([OrderAddressId]),
CONSTRAINT [FK_uCommerce_Shipment_uCommerce_ShippingMethod] FOREIGN KEY ([ShippingMethodId]) REFERENCES [dbo].[uCommerce_ShippingMethod] ([ShippingMethodId])

PRINT N'Adding foreign keys to [dbo].[uCommerce_OrderAddress]'

ALTER TABLE [dbo].[uCommerce_OrderAddress] ADD
CONSTRAINT [uCommerce_FK_OrderAddress_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[uCommerce_Country] ([CountryId])

