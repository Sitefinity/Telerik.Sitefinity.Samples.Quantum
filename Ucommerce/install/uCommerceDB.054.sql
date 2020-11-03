insert into uCommerce_AdminPage 
(
	FullName,
	ActiveTab
)
values 
(
	'ASP.umbraco_ucommerce_settings_security_edituseraccess_aspx',
	''
)

insert into uCommerce_AdminTab (
	VirtualPath,
	AdminPageId,
	SortOrder,
	MultiLingual,
	ResouceKey,
	HasSaveButton,
	HasDeleteButton,
	[Enabled]
)
values 
(
	'EditUserRoles.ascx',
	SCOPE_IDENTITY(),
	1,
	0,
	'Common',
	1,
	0,
	1	
)
