BEGIN TRAN

-- Add tax fields to Shipment
ALTER TABLE uCommerce_Shipment ADD Tax money not null default 0
ALTER TABLE uCommerce_Shipment ADD TaxRate money not null default 0
ALTER TABLE uCommerce_Shipment ADD ShipmentTotal money not null default 0

-- Add modifiedon to purchase order to be able to track abandoned baskets
ALTER TABLE uCommerce_PurchaseOrder ADD ModifiedOn DATETIME NOT NULL DEFAULT GETDATE()

-- Add culture code to purchase order to be able to send e-mail in correct language from backend
ALTER TABLE uCommerce_PurchaseOrder ADD CultureCode nvarchar(60) NULL

COMMIT