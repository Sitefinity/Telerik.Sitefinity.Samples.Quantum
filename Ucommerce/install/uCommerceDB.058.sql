/*********************************/
/*** Common upgrade Query List for uCommerce 3 ***/
/*********************************/

/* Change MediaId into a nvarchar to support Umbraco 5 HiveIds **/
ALTER TABLE uCommerce_ShippingMethod ALTER COLUMN ImageMediaId nvarchar(255)
ALTER TABLE uCommerce_PaymentMethod ALTER COLUMN ImageMediaId nvarchar(255)