IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'uCommerce_AppSystemVersion')
BEGIN
	CREATE TABLE [dbo].[uCommerce_AppSystemVersion](
		[AppSystemVersionId] [int] IDENTITY(1,1) NOT NULL,
		[SchemaVersion] [int] NOT NULL,
		[MigrationName] nvarchar(512)
	)
END