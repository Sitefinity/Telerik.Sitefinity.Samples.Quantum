GO

IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Skus' AND [object_id] = OBJECT_ID(N'uCommerce_ProductTarget'))
BEGIN
    ALTER TABLE uCommerce_ProductTarget
	ADD Skus nvarchar(max) NULL
END

GO