-- Dynamic Order Property target for Marketing Foundation

CREATE TABLE [dbo].[uCommerce_DynamicOrderPropertyTarget](
	[DynamicOrderPropertyTargetId] [int] NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[CompareMode] [int] NOT NULL,
	[TargetOrderLine] [bit] NOT NULL,
 CONSTRAINT [PK_uCommerce_DynamicOrderPropertyTarget] PRIMARY KEY CLUSTERED 
(
	[DynamicOrderPropertyTargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[uCommerce_DynamicOrderPropertyTarget] ADD  CONSTRAINT [DF_uCommerce_DynamicOrderPropertyTarget_TargetOrderLine]  DEFAULT ((0)) FOR [TargetOrderLine]
GO

DECLARE @EntityUiId INT
INSERT INTO uCommerce_EntityUi ([Type], VirtualPathUi, SortOrder) VALUES ('UCommerce.EntitiesV2.DynamicOrderPropertyTarget, UCommerce', 'Targets/DynamicOrderPropertyUi.ascx', 14)

SELECT @EntityUiId = SCOPE_IDENTITY()

INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Dynamisk ordre egenskab', null, 'da-DK')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Dynamic order property', null, 'en-US')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Dynamische Auftrag Eigenschaft', null, 'de-DE')
INSERT INTO uCommerce_EntityUiDescription (EntityUiId, DisplayName, [Description], CultureCode) 
VALUES (@EntityUiId, 'Dynamisk order egendom', null, 'se-SV')