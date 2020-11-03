CREATE TABLE uCommerce_UserWidgetSetting
(
	UserWidgetSettingId int identity primary key,
	Section nvarchar(max),
	WidgetName nvarchar(max),
	Width nvarchar(max),
	Height nvarchar(max),
	PositionX nvarchar(max),
	PositionY nvarchar(max),
	UserId int foreign key references uCommerce_User(UserId)
)

CREATE TABLE uCommerce_UserWidgetSettingProperty
(
	UserWidgetSettingPropertyId int identity primary key,
	[Key] nvarchar(max),
	Value nvarchar(max),
	UserWidgetSettingId int foreign key references uCommerce_UserWidgetSetting(UserWidgetSettingId)
)

