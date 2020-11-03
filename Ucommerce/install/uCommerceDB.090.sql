GO
ALTER TABLE uCommerce_Customer
ALTER COLUMN EmailAddress nvarchar(255) NULL
GO
ALTER TABLE uCommerce_OrderAddress
ALTER COLUMN EmailAddress nvarchar(255) NULL
GO
ALTER TABLE uCommerce_Address
ALTER COLUMN EmailAddress nvarchar(255) NULL