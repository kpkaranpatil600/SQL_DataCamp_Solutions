WITH athete_medals AS
(
  SELECT
    athete, COUNT(*) AS medals
  FROM summer_medals
  GROUP BY athete
)

  SELECT
      athete,
      ROW_NUMBER() OVER(ORDER BY medals DESC) AS row_n
  FROM athete_medals
  ORDER BY medals DESC;
