/*New table to store values for definition fields*/

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_EntityProperty]'))

BEGIN

	CREATE TABLE [dbo].[uCommerce_EntityProperty](
		[EntityPropertyId] [int] IDENTITY(1,1) NOT NULL,
		[EntityId] [uniqueidentifier] NOT NULL,
		[DefinitionFieldId] [int] foreign key references uCommerce_DefinitionField(DefinitionFieldId) NOT NULL,
		[Value] nvarchar(max) NOT NULL,
		[Version] [int] NOT NULL,
		[CultureCode] [nvarchar](60),
		[Guid] [uniqueidentifier] NOT NULL
	 CONSTRAINT [PK_uCommerce_EntityProperty] PRIMARY KEY CLUSTERED 
	(
		[EntityPropertyId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END

GO

