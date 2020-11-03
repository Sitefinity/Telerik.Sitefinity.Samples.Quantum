-- Add contraint to ParentCategoryId
ALTER TABLE dbo.uCommerce_Category ADD CONSTRAINT
	FK_uCommerce_Category_ParentCategory FOREIGN KEY
	(
	ParentCategoryId
	) REFERENCES dbo.uCommerce_Category
	(
	CategoryId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO