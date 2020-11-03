IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'TargetOrderLine' AND [object_id] = OBJECT_ID(N'uCommerce_QuantityTarget'))
BEGIN
    ALTER TABLE [dbo].[uCommerce_QuantityTarget] ADD TargetOrderLine bit NOT NULL DEFAULT(0)
END