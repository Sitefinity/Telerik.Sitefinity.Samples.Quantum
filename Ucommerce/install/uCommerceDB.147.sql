-- RECREATE CONSTRAINS
IF (OBJECT_ID('PK_uCommerce_CategoryTarget', 'PK') IS NULL)
BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryTarget] ADD  CONSTRAINT [PK_uCommerce_CategoryTarget] PRIMARY KEY CLUSTERED 
	(
		[CategoryTargetId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END

IF (OBJECT_ID('FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget', 'F') IS NULL)
BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryTarget]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget] FOREIGN KEY([CategoryTargetId])
	REFERENCES [dbo].[uCommerce_Target] ([TargetId])

	ALTER TABLE [dbo].[uCommerce_CategoryTarget] CHECK CONSTRAINT [FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget]
END

IF (OBJECT_ID((select d.name
 from sys.tables t   
  join    sys.default_constraints d       
   on d.parent_object_id = t.object_id  
  join    sys.columns c      
   on c.object_id = t.object_id      
    and c.column_id = d.parent_column_id
 where t.name = N'uCommerce_CategoryTarget'
  and c.name = N'CategoryGuids'), 'D') IS NULL)
BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryTarget] ADD  DEFAULT (NULL) FOR [CategoryGuids]
END