-- Inserted new enum "processing" for async paymentmethodservices eg. Google Checkout pending paymentresult
SET IDENTITY_INSERT uCommerce_OrderStatus ON
INSERT INTO uCommerce_OrderStatus
(OrderStatusId, Name, Sort, RenderChildren, RenderInMenu, IncludeInAuditTrail, AllowUpdate, AlwaysAvailable, AllowOrderEdit, Pipeline) 
VALUES 
(1000002, 'Processing', 200, 1, 0, 1, 1, 0, 0, 'Processing')
SET IDENTITY_INSERT uCommerce_OrderStatus OFF

CREATE TABLE uCommerce_User(
	UserId int identity(1,1) not null,
	ExternalId nvarchar(255),
	CONSTRAINT [uCommerce_PK_User] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

CREATE TABLE uCommerce_Role(
	RoleId int identity(1,1) not null,
	Name nvarchar(255),
	ProductCatalogGroupId int foreign key references uCommerce_ProductCatalogGroup(ProductCatalogGroupId),
	ProductCatalogId int foreign key references uCommerce_ProductCatalog(ProductCatalogId),
	CultureCode nvarchar(10),
	PriceGroupId int foreign key references uCommerce_PriceGroup(PriceGroupId),
	RoleType int not null,
	ParentRoleId int foreign key references uCommerce_Role(RoleId),
	CONSTRAINT [uCommerce_PK_Role] PRIMARY KEY CLUSTERED 
	(
		[RoleId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
	
)

CREATE TABLE uCommerce_Permission(
	PermissionId int identity(1,1) not null,
	UserId int foreign key references uCommerce_User(UserId),
	RoleId int foreign key references uCommerce_Role(RoleId),
	CONSTRAINT [uCommerce_PK_Permission] PRIMARY KEY CLUSTERED 
	(
		[PermissionId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)

)
	
