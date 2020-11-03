
-- Add support for payment properties
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[uCommerce_PaymentProperty](
	[PaymentPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_uCommerce_PaymentProperty] PRIMARY KEY CLUSTERED 
(
	[PaymentPropertyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

ALTER TABLE [dbo].[uCommerce_PaymentProperty]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_PaymentProperty_uCommerce_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[uCommerce_Payment] ([PaymentId])
GO

ALTER TABLE [dbo].[uCommerce_PaymentProperty] CHECK CONSTRAINT [FK_uCommerce_PaymentProperty_uCommerce_Payment]
GO
