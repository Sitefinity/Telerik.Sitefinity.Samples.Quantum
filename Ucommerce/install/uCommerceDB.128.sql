-- Remove all indexes that include AmountOffTotal on uCommerce_Discount.
DECLARE @tableName nvarchar(500)
DECLARE @indexName nvarchar(500)
DECLARE @sql nvarchar(500)

DECLARE remove_index_cursor CURSOR FOR
SELECT OBJECT_NAME(ind.object_id) AS ObjectName
      , ind.name AS IndexName
FROM    sys.indexes ind
        INNER JOIN sys.index_columns ic
            ON ind.object_id = ic.object_id
               AND ind.index_id = ic.index_id
        INNER JOIN sys.columns col
            ON ic.object_id = col.object_id
               AND ic.column_id = col.column_id 
			   AND col.name = 'AmountOffTotal'
        INNER JOIN sys.tables t
            ON ind.object_id = t.object_id and t.name = 'uCommerce_Discount'
WHERE   t.is_ms_shipped = 0

OPEN remove_index_cursor
FETCH NEXT FROM remove_index_cursor INTO @tableName, @indexName
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = N'DROP INDEX ' + @indexName + ' ON ' + @tableName
	execute sp_executesql @sql
	FETCH NEXT FROM remove_index_cursor INTO @tableName, @indexName
END
CLOSE remove_index_cursor
DEALLOCATE remove_index_cursor
