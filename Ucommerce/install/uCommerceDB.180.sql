DECLARE @AdminPageId INT
SET @AdminPageId = (select AdminPageId from uCommerce_AdminPage where FullName = 'editdatatype_aspx')

IF NOT EXISTS(select * from uCommerce_AdminTab where @AdminPageId = AdminPageId AND VirtualPath = 'EditDataTypeMultiLingualProperties.ascx') 
BEGIN
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'EditDataTypeMultiLingualProperties.ascx',
		@AdminPageId,
		1,
		1,
		'Description',
		1,
		0,
		1
	)
END