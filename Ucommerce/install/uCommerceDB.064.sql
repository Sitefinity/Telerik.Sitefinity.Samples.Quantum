-- Set checkout pipeline on default payment methods
-- to ensure that they follow the same flow as remote
-- payment gateways
UPDATE uCommerce_PaymentMethod SET Pipeline = 'Checkout' WHERE Name in ('Account', 'Invoice')