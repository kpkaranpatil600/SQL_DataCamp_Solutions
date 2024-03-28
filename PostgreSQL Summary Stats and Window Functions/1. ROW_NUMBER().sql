SELECT
      year, event, country,
      ROW_NUMBER() OVER() AS row_n
FROM summer_medals

WHERE medal = 'Gold'; 
