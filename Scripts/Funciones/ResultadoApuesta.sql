IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResultadoApuesta]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].ResultadoApuesta
GO

/*
Test
SELECT * 
FROM [dbo].[ResultadoApuesta](
	3, --@GolesLocalApuesta INT,
	3, --@GolesVisitanteApuesta INT,
	3, --@GolesLocalPartido INT,
	1, --@GolesVisitantePartido INT,
	1, --@EvaluarGanador BIT,
	0, --@EvaluarLocal BIT,
	0 --@EvaluarVisitante BIT
)
*/

CREATE FUNCTION [dbo].ResultadoApuesta(
	@GolesLocalApuesta INT,
	@GolesVisitanteApuesta INT,
	@GolesLocalPartido INT,
	@GolesVisitantePartido INT,
	@EvaluarGanador BIT,
	@EvaluarLocal BIT,
	@EvaluarVisitante BIT
)
RETURNS TABLE
AS
RETURN
(
	SELECT
		ApuestaLocal = CASE 
							WHEN @GolesLocalApuesta IS NULL OR @GolesVisitanteApuesta IS NULL THEN NULL
							WHEN @GolesLocalApuesta > @GolesVisitanteApuesta THEN CONVERT(BIT, 1) 
							ELSE CONVERT(BIT, 0)
						END,
		ApuestaVisitante = CASE 
							WHEN @GolesLocalApuesta IS NULL OR @GolesVisitanteApuesta IS NULL THEN NULL
							WHEN @GolesVisitanteApuesta > @GolesLocalApuesta THEN CONVERT(BIT, 1) 
							ELSE CONVERT(BIT, 0)
						END,
		ApuestaEmpate = CASE 
							WHEN @GolesLocalApuesta IS NULL OR @GolesVisitanteApuesta IS NULL THEN NULL
							WHEN @GolesVisitanteApuesta = @GolesLocalApuesta THEN CONVERT(BIT, 1) 
							ELSE CONVERT(BIT, 0)
						END,
		AcertoGanador = CASE 
							WHEN @EvaluarGanador = 1 AND
								 (@GolesLocalPartido IS NOT NULL OR @GolesVisitantePartido IS NOT NULL) THEN 
							CASE WHEN ((@GolesLocalPartido > @GolesVisitantePartido) AND (@GolesLocalApuesta > @GolesVisitanteApuesta)) OR
									  ((@GolesVisitantePartido > @GolesLocalPartido) AND (@GolesVisitanteApuesta > @GolesLocalApuesta)) OR
									  ((@GolesVisitantePartido = @GolesLocalPartido) AND (@GolesVisitanteApuesta = @GolesLocalApuesta)) 
								 THEN CONVERT(BIT, 1) ELSE CONVERT(BIT, 0)
							END
						ELSE NULL
						END,
		AcertoLocal = CASE
							WHEN (ISNULL(@EvaluarLocal, 0) = 0) OR 
								 @GolesLocalPartido IS NULL OR 
								 @GolesVisitantePartido IS NULL THEN NULL
							WHEN (ISNULL(@EvaluarLocal, 0) = 1) AND
								 (@GolesLocalPartido = @GolesLocalApuesta) THEN CONVERT(BIT, 1)
							WHEN (ISNULL(@EvaluarLocal, 0) = 1) AND
								 (@GolesLocalPartido <> @GolesLocalApuesta) THEN CONVERT(BIT, 0)	 
							ELSE NULL
					END,
		AcertoVisitante = CASE
							WHEN (ISNULL(@EvaluarVisitante, 0) = 0) OR 
								 @GolesLocalPartido IS NULL OR 
								 @GolesVisitantePartido IS NULL THEN NULL
							WHEN (ISNULL(@EvaluarVisitante, 0) = 1) AND
								 (@GolesVisitantePartido = @GolesVisitanteApuesta) THEN CONVERT(BIT, 1)
							WHEN (ISNULL(@EvaluarVisitante, 0) = 1) AND
								 (@GolesVisitantePartido <> @GolesVisitanteApuesta) THEN CONVERT(BIT, 0)	 
							ELSE NULL
					END
)