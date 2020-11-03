IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'OrdersStartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'OrdersStartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'OrdersStartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END

GO

IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'StoresStartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'StoresStartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'StoresStartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END

GO

IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'MarketingStartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'MarketingStartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'MarketingStartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END

GO

IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'AnalyticsStartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'AnalyticsStartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'AnalyticsStartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END

GO

IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'SettingsStartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'SettingsStartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'SettingsStartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END

GO

IF NOT EXISTS (SELECT * FROM uCommerce_AdminPage Where FullName = 'StartPage_aspx')
BEGIN
	INSERT INTO uCommerce_AdminPage VALUES 
	(
		'StartPage_aspx',
		''
	)
	INSERT INTO uCommerce_AdminTab VALUES
	(
		'StartPageWidgets.ascx',
		SCOPE_IDENTITY(),
		1,
		0,
		'Overview',
		0,
		0,
		1
	)
END