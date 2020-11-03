/*
	Fix for concurrently generating order numbers without duplicates under high load
	and moving prefix and suffix to the OrderNumberSeriesService.
 */
ALTER PROCEDURE [dbo].[uCommerce_GetOrderNumber]
	@OrderNumberName NVARCHAR(128)
AS
BEGIN	
	SET NOCOUNT ON;

	DECLARE @Increment INT
	SELECT @Increment = Increment FROM uCommerce_OrderNumberSerie WHERE OrderNumberName = @OrderNumberName;

	DECLARE @TabCounter TABLE (NewCounter INT);
	UPDATE uCommerce_OrderNumberSerie SET CurrentNumber = CurrentNumber+@Increment
	OUTPUT INSERTED.CurrentNumber INTO @tabCounter (NewCounter)
	WHERE OrderNumberName = @OrderNumberName;

	DECLARE @NextOrderNumber INT;
	SELECT @NextOrderNumber = NewCounter FROM @TabCounter;

	SELECT CONVERT(NVARCHAR(256),(@NextOrderNumber)) OrderNumber
	FROM uCommerce_OrderNumberSerie 
	WHERE OrderNumberName = @OrderNumberName;

END