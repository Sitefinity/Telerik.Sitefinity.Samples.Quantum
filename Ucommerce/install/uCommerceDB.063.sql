-- Migrate data type definitions to new provider based system based on IControlFactory

-- Built-in data types
UPDATE uCommerce_DataType SET DefinitionName = 'ShortText' WHERE TypeName = 'ShortText'
UPDATE uCommerce_DataType SET DefinitionName = 'Number' WHERE TypeName = 'Number'
UPDATE uCommerce_DataType SET DefinitionName = 'Date' WHERE TypeName = 'DatePicker'