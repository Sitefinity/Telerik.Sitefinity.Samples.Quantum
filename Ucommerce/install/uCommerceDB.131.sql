ALTER PROCEDURE [dbo].[uCommerce_GetOrderNumber]
	@OrderNumberName NVARCHAR(128)
AS
BEGIN	
	SET NOCOUNT ON;

	DECLARE @OrderNumber NVARCHAR(256);

	BEGIN TRANSACTION
		SELECT @OrderNumber = CONVERT(NVARCHAR(256),(CurrentNumber + Increment))FROM uCommerce_OrderNumberSerie WHERE OrderNumberName = @OrderNumberName;
		UPDATE uCommerce_OrderNumberSerie
		SET CurrentNumber = CurrentNumber + Increment
		WHERE OrderNumberName = @OrderNumberName
	IF @@ERROR <> 0
	BEGIN	
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
	END

	SELECT @OrderNumber OrderNumber;
    
END