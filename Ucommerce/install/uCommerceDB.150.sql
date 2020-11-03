IF NOT EXISTS(SELECT * FROM sys.columns 
            WHERE Name = N'AssemblyVersion' AND Object_ID = Object_ID(N'uCommerce_SystemVersion'))
BEGIN
	ALTER TABLE uCommerce_SystemVersion
		ADD AssemblyVersion NVARCHAR(MAX) NOT NULL DEFAULT '0.0.0.00000'
END