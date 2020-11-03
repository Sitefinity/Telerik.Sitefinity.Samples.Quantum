IF NOT EXISTS(SELECT * FROM sys.columns 
            WHERE Name = N'DisplayName' AND Object_ID = Object_ID(N'uCommerce_UserWidgetSetting'))
BEGIN
    ALTER TABLE uCommerce_UserWidgetSetting
	ADD DisplayName nvarchar(max)
END