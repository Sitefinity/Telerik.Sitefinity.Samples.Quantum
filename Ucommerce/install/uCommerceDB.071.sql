-- Enable ProductDefinitionfield to be indexed for faceted search.
IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'uCommerce_ProductDefinitionField' AND  COLUMN_NAME = 'Facet') 
BEGIN
	ALTER TABLE uCommerce_ProductDefinitionField
	ADD Facet bit NOT NULL DEFAULT 0
END