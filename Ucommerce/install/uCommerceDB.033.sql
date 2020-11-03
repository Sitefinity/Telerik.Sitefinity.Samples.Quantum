-- Config data for Product Reviews
-- New tabs for reviews
INSERT INTO [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId], [Name], [Deleted]) VALUES (1000, N'New', 0)
INSERT INTO [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId], [Name], [Deleted]) VALUES (2000, N'Approved', 0)
INSERT INTO [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId], [Name], [Deleted]) VALUES (3000, N'Unapproved', 0)
INSERT INTO [dbo].[uCommerce_ProductReviewStatus] ([ProductReviewStatusId], [Name], [Deleted]) VALUES (4000, N'ReportedAsAbuse', 0)

UPDATE [dbo].[uCommerce_AdminTab] SET [SortOrder]=8 WHERE [AdminTabId]=6

INSERT INTO [dbo].[uCommerce_AdminTab] ([VirtualPath], [AdminPageId], [SortOrder], [MultiLingual], [ResouceKey], [HasSaveButton], [HasDeleteButton], [Enabled]) VALUES (N'EditProductReview.ascx', 1, 7, 0, N'Reviews', 0, 0, 1)
INSERT INTO [dbo].[uCommerce_AdminTab] ([VirtualPath], [AdminPageId], [SortOrder], [MultiLingual], [ResouceKey], [HasSaveButton], [HasDeleteButton], [Enabled]) VALUES (N'EditProductReviewGroup.ascx', 2, 2, 0, N'PendingReviews', 0, 0, 1)