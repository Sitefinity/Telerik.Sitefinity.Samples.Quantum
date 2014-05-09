:setvar DatabaseName {0}

GO

USE [$(DatabaseName)];
GO

UPDATE [dbo].[sf_sites] SET
	live_url = REPLACE(live_url, 'quantum.sitefinity.com', '$(DatabaseName)')

GO