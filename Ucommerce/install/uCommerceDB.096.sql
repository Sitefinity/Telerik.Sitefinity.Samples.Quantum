IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'AnyTargetAppliesAwards' AND [object_id] = OBJECT_ID(N'uCommerce_CampaignItem'))
BEGIN
    ALTER TABLE uCommerce_CampaignItem
	ADD AnyTargetAppliesAwards BIT NOT NULL Default 0
END

GO

IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'AnyTargetAdvertises' AND [object_id] = OBJECT_ID(N'uCommerce_CampaignItem'))
BEGIN
    ALTER TABLE uCommerce_CampaignItem
	ADD AnyTargetAdvertises BIT NOT NULL Default 1
END