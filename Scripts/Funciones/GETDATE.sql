IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Getdate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Getdate]
GO

/*
Test
SELECT 	dbo.GETDATE()
*/

CREATE FUNCTION [dbo].[Getdate]()
RETURNS DATETIME 
AS
BEGIN 
	DECLARE @ReturnValue DATETIME = (SELECT TOP 1 DATEADD(HOUR, -3, GETUTCDATE()))
	RETURN @ReturnValue
END

