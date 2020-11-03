/*

ADDRESSES Part 1 of 2

*/

PRINT N'Dropping foreign keys from [dbo].[uCommerce_PurchaseOrder]'

ALTER TABLE [dbo].[uCommerce_PurchaseOrder] DROP
CONSTRAINT [uCommerce_FK_Order_Address]

PRINT N'Dropping foreign keys from [dbo].[uCommerce_Shipment]'

ALTER TABLE [dbo].[uCommerce_Shipment] DROP
CONSTRAINT [uCommerce_FK_Shipment_Address]

PRINT N'Creating [dbo].[uCommerce_OrderAddress]'

CREATE TABLE [dbo].[uCommerce_OrderAddress]
(
[OrderAddressId] [int] NOT NULL IDENTITY(1, 1),
[FirstName] [nvarchar] (512) NOT NULL,
[LastName] [nvarchar] (512) NOT NULL,
[EmailAddress] [nvarchar] (50) NULL,
[PhoneNumber] [nvarchar] (50) NULL,
[MobilePhoneNumber] [nvarchar] (50) NULL,
[Line1] [nvarchar] (512) NOT NULL,
[Line2] [nvarchar] (512) NULL,
[PostalCode] [nvarchar] (50) NOT NULL,
[City] [nvarchar] (512) NOT NULL,
[State] [nvarchar] (512) NULL,
[CountryId] [int] NOT NULL,
[Attention] [nvarchar] (512) NULL,
[CompanyName] [nvarchar] (512) NULL,
[AddressName] [nvarchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)


PRINT N'Creating primary key [uCommerce_PK_OrderAddress] on [dbo].[uCommerce_OrderAddress]'

ALTER TABLE [dbo].[uCommerce_OrderAddress] ADD CONSTRAINT [uCommerce_PK_OrderAddress] PRIMARY KEY CLUSTERED  ([OrderAddressId])

PRINT N'Altering [dbo].[uCommerce_Address]'

ALTER TABLE [dbo].[uCommerce_Address] ADD
[FirstName] [nvarchar] (512) NULL,
[LastName] [nvarchar] (512) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[PhoneNumber] [nvarchar] (50) NULL,
[MobilePhoneNumber] [nvarchar] (50) NULL

