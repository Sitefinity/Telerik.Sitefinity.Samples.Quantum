/* New RedirectUrl table */
IF NOT EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_AuthenticationRedirectUrl]'))
BEGIN
    CREATE TABLE [dbo].[uCommerce_AuthenticationRedirectUrl](
        [AuthenticationRedirectUrlId] [int] IDENTITY(1,1) NOT NULL,
        [Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_uCommerce_AuthenticationRedirectUrl_Guid] default NEWSEQUENTIALID(),
        [Url] nvarchar(max) NOT NULL,
        [ProductCatalogGroupId] int NOT NULL,
        CONSTRAINT [PK_uCommerce_AuthenticationRedirectUrl] PRIMARY KEY CLUSTERED([AuthenticationRedirectUrlId] ASC),
        CONSTRAINT FK_uCommerce_AuthenticationRedirectUrl_ProductCatalogGroupId FOREIGN KEY ([ProductCatalogGroupId]) REFERENCES uCommerce_ProductCatalogGroup([ProductCatalogGroupId])
    );
END

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AuthenticationRedirectUrl]') AND name = N'UX_uCommerce_AuthenticationRedirectUrl_Guid')
    BEGIN
        DROP INDEX [UX_uCommerce_AuthenticationRedirectUrl_Guid] ON [dbo].[uCommerce_AuthenticationRedirectUrl];
    END

GO

CREATE UNIQUE INDEX [UX_uCommerce_AuthenticationRedirectUrl_Guid] ON [dbo].[uCommerce_AuthenticationRedirectUrl]
    (
     [Guid] ASC
        );