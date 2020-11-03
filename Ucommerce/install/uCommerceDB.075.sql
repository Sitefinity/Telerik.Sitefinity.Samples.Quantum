GO
DELETE Permission
FROM uCommerce_Permission Permission
INNER JOIN 
	(
		SELECT
			Permission1.PermissionId, 
			Permission1.UserId, 
			Permission1.RoleId, 
			ROW_NUMBER() OVER(PARTITION BY Permission1.UserId, Permission1.RoleId order by Permission1.UserId) AS RowRank
		FROM uCommerce_Permission Permission1
		INNER JOIN 
			(
				SELECT
					UserId, 
					RoleId, 
					COUNT(*) AS CountOf
				FROM uCommerce_Permission
				GROUP BY UserId, RoleId
				HAVING COUNT(*)>1
			) 
			duplicate 
			ON 
				Permission1.UserId = duplicate.UserId and 
				Permission1.RoleId = duplicate.RoleId
	) 
	duplicate2 
	ON Permission.PermissionId = duplicate2.PermissionId
WHERE duplicate2.RowRank != 1
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'Unique_Permission_UserId_RoleId')
BEGIN
	ALTER TABLE uCommerce_Permission ADD CONSTRAINT
				Unique_Permission_UserId_RoleId UNIQUE NONCLUSTERED
		(
					UserId,RoleId
		)
END