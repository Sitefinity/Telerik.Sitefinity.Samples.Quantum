IF type_id('[dbo].[uCommerce_GuidList]') IS NULL
BEGIN
    CREATE TYPE [dbo].[uCommerce_GuidList] AS TABLE([Guid] [uniqueidentifier] NOT NULL PRIMARY KEY CLUSTERED)
END