SELECT
  Year,
  ROW_NUMBER() OVER() AS Row_N
FROM (
  SELECT DISTINCT year AS Year
  FROM Summer_Medals
  ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;
