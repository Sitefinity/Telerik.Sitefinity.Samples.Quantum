-- Normalize campaigns` order
IF (SELECT COUNT(*) FROM dbo.Ucommerce_Campaign WHERE Deleted = 0) > (SELECT COUNT(*) FROM (SELECT DISTINCT [Priority] FROM dbo.Ucommerce_Campaign WHERE Deleted = 0) AS InnerQuery)
OR (
	SELECT COUNT(*)
		FROM dbo.Ucommerce_Campaign
		WHERE [Priority] = 0 AND Deleted = 0
) > 0
BEGIN
	WITH numberedCampaigns AS
	( 
		SELECT CampaignId, ROW_NUMBER() 
		OVER (ORDER BY [Priority], CreatedOn desc) AS rowNumber
		FROM Ucommerce_Campaign
		WHERE Deleted = 0
	)
	UPDATE Ucommerce_Campaign
	SET [Priority] = numberedCampaigns.rowNumber
	FROM numberedCampaigns
	WHERE Ucommerce_Campaign.CampaignId = numberedCampaigns.CampaignId
		AND Deleted = 0;
END;
