-- Add unique identifier to definitions so we can unify definition across tables
ALTER TABLE uCommerce_Definition ADD [Guid] uniqueidentifier not null DEFAULT NEWID()
ALTER TABLE uCommerce_ProductDefinition ADD [Guid] uniqueidentifier not null DEFAULT NEWID()
ALTER TABLE uCommerce_DataType ADD [Guid] uniqueidentifier not null DEFAULT NEWID()
