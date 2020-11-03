-- DELETE CONSTRAINS IF THEY EXIST
IF (OBJECT_ID('PK_uCommerce_CategoryTarget', 'PK') IS NOT NULL)
BEGIN
    ALTER TABLE uCommerce_CategoryTarget DROP CONSTRAINT PK_uCommerce_CategoryTarget
END

IF (OBJECT_ID('FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE uCommerce_CategoryTarget DROP CONSTRAINT FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget
END

declare @table_name nvarchar(256)
declare @col_name nvarchar(256)
declare @Command  nvarchar(1000)

set @table_name = N'uCommerce_CategoryTarget'
set @col_name = N'CategoryGuid'

select @Command = 'ALTER TABLE ' + @table_name + ' drop constraint ' + d.name
 from sys.tables t   
  join    sys.default_constraints d       
   on d.parent_object_id = t.object_id  
  join    sys.columns c      
   on c.object_id = t.object_id      
    and c.column_id = d.parent_column_id
 where t.name = @table_name
  and c.name = @col_name

execute (@Command)