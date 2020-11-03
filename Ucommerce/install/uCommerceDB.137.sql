IF NOT EXISTS (SELECT 1 
		   FROM INFORMATION_SCHEMA.TABLES 
		   WHERE TABLE_NAME='uCommerce_UserGroup')
BEGIN
	CREATE TABLE uCommerce_UserGroup (
		[UserGroupId] [int] IDENTITY(1,1) PRIMARY KEY,
		[ExternalId] [nvarchar](255) NOT NULL,
	)
END

GO

IF NOT EXISTS (SELECT 1 
		   FROM INFORMATION_SCHEMA.TABLES 
		   WHERE TABLE_NAME='uCommerce_UserGroupPermission')
BEGIN
	CREATE TABLE uCommerce_UserGroupPermission (
		[PermissionId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
		[UserGroupId] [int] FOREIGN KEY REFERENCES uCommerce_UserGroup(UserGroupId),
		[RoleId] [int] FOREIGN KEY REFERENCES uCommerce_Role(RoleId),
	)
END

GO

IF NOT EXISTS (SELECT 1 FROM uCommerce_AdminPage WHERE FullName = 'editusergroupaccess_aspx')
BEGIN
	DECLARE @AdminPageId int
	INSERT INTO [uCommerce_AdminPage] (FullName) VALUES ('editusergroupaccess_aspx')
	SELECT @AdminPageId = SCOPE_IDENTITY()
	INSERT INTO [uCommerce_AdminTab]  VALUES ('EditUserGroupRoles.ascx', @AdminPageId, 1, 0, 'Common', 1, 0, 1)
END