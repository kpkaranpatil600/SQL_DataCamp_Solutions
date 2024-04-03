
WITH country_medals AS (...),
      country_ranks AS (...)

SELECT STRING_AGG(Country, ', ')
FROM country_ranks
