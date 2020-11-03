if (exists (SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'uCommerce_ShippingMethodPrice' AND COLUMN_NAME = 'CurrencyId')) 
begin
	DROP INDEX IX_uCommerce_ShippingMethodPrice_CurrencyId ON uCommerce_ShippingMethodPrice;
	ALTER TABLE uCommerce_ShippingMethodPrice DROP CONSTRAINT uCommerce_FK_ShippingMethodPrice_Currency;  
    ALTER TABLE uCommerce_ShippingMethodPrice DROP COLUMN CurrencyId
end