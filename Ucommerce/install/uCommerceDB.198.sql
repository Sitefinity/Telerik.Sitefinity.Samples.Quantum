if (exists (SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'uCommerce_PaymentMethodFee' AND COLUMN_NAME = 'CurrencyId')) 
begin
	DROP INDEX IX_uCommerce_PaymentMethodFee_CurrencyId ON uCommerce_PaymentMethodFee;
	ALTER TABLE uCommerce_PaymentMethodFee DROP CONSTRAINT uCommerce_FK_PaymentMethodFee_Currency;  
    ALTER TABLE uCommerce_PaymentMethodFee DROP COLUMN CurrencyId
end