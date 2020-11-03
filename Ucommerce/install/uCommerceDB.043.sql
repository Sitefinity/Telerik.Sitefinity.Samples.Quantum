-- Grant execute permission on all uCommerce procs to public role
DECLARE @grantExecSql NVARCHAR(MAX)
SELECT @grantExecSql = ''
DECLARE  @username NVARCHAR(255)
SET @username = 'public'
SELECT @grantExecSql = @grantExecSql + 'GRANT EXEC ON ' + QUOTENAME(ROUTINE_SCHEMA) + '.' +  
QUOTENAME(ROUTINE_NAME) + ' TO [' + @username + '];' FROM INFORMATION_SCHEMA.ROUTINES
WHERE OBJECTPROPERTY(OBJECT_ID(ROUTINE_NAME),'IsMSShipped') = 0   
AND ROUTINE_TYPE='PROCEDURE' 
EXEC (@grantExecSql)