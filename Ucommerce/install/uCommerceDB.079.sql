-- Remove duplicated external Ids and associated users + role.
GO
delete from uCommerce_user
where userId not in (select userId from uCommerce_permission)
GO
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = 'uCommerce_temporary_user_table'))
BEGIN
	DROP TABLE uCommerce_temporary_user_table
END
GO
create table uCommerce_temporary_user_table ( id int identity primary key, ExternalId nvarchar(MAX) )

DECLARE @user_id int, @user_externalId nvarchar(MAX)
DECLARE user_cursor CURSOR FOR 

SELECT * from uCommerce_User
OPEN user_cursor

FETCH NEXT FROM user_cursor
INTO @user_id, @user_externalId

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @user_externalId in (select ExternalId from uCommerce_temporary_user_table)
		BEGIN
			DELETE FROM uCommerce_Permission where UserId = @user_id
			DELETE FROM uCommerce_User where UserId = @user_id
		END
	ELSE
		BEGIN
			INSERT INTO uCommerce_temporary_user_table VALUES (@user_externalId)
		END
	FETCH NEXT FROM user_cursor 
	INTO @user_id, @user_externalId
END
CLOSE user_cursor
DEALLOCATE user_cursor
GO
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = 'uCommerce_temporary_user_table'))
BEGIN
	DROP TABLE uCommerce_temporary_user_table
END
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_User_External_Id')
BEGIN
	ALTER TABLE uCommerce_user ADD CONSTRAINT
				Unique_User_External_Id UNIQUE NONCLUSTERED
		(
					ExternalId
		)
END