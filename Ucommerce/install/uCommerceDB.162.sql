IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_CompletedDate')
BEGIN
  DROP INDEX IX_uCommerce_PurchaseOrder_CompletedDate ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_CompletedDate] ON [dbo].[uCommerce_PurchaseOrder](CompletedDate ASC);
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_CreatedDate')
BEGIN
  DROP INDEX IX_uCommerce_PurchaseOrder_CreatedDate ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX IX_uCommerce_PurchaseOrder_CreatedDate ON [dbo].[uCommerce_PurchaseOrder](CreatedDate ASC);
GO
