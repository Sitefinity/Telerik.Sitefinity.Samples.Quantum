-- Normalize promotions` order for campaign
IF (
	SELECT COUNT(*) FROM dbo.Ucommerce_CampaignItem AS A
	INNER JOIN 
	(
		SELECT [Priority], CampaignId
			FROM dbo.Ucommerce_CampaignItem
			WHERE Deleted = 0
			GROUP BY CampaignId, [Priority]
			HAVING COUNT(*) > 1
	) AS B
	ON A.[Priority] = B.[Priority] AND A.CampaignId = B.CampaignId
	WHERE A.Deleted = 0
	) > 1
OR (
		SELECT COUNT(*)
			FROM dbo.Ucommerce_CampaignItem
			WHERE [Priority] = 0 AND Deleted = 0
	) > 0
BEGIN
	WITH numberedCampaignItems AS
	(
		SELECT CampaignItemId, ROW_NUMBER()
		OVER (PARTITION BY CampaignId ORDER BY [Priority], CreatedOn desc) AS rowNumber
		FROM Ucommerce_CampaignItem
		WHERE Deleted = 0
	)
	UPDATE Ucommerce_CampaignItem
	SET [Priority] = numberedCampaignItems.rowNumber
	FROM numberedCampaignItems
	WHERE Ucommerce_CampaignItem.CampaignItemId = numberedCampaignItems.CampaignItemId
		AND Deleted = 0;
END