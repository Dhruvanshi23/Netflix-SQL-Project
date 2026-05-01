--  SUBQUERY: Latest shows
SELECT title, release_year
FROM netflix_titles
WHERE release_year = (SELECT MAX(release_year) FROM netflix_titles);

--  SUBQUERY: Above average year
SELECT title, release_year
FROM netflix_titles
WHERE release_year > (SELECT AVG(release_year) FROM netflix_titles);

--  GROUP + HAVING
SELECT country, COUNT(*) AS total
FROM netflix_titles
GROUP BY country
HAVING COUNT(*) > 10;

--  BETWEEN
SELECT * FROM netflix_titles
WHERE release_year BETWEEN 2015 AND 2020;

--  IN
SELECT * FROM netflix_titles
WHERE country IN ('India', 'United States');

--  SELF JOIN
SELECT A.title, B.title, A.release_year
FROM netflix_titles A
JOIN netflix_titles B
ON A.release_year = B.release_year
AND A.show_id <> B.show_id;

--  FILTERED JOIN
SELECT A.title AS movie, B.title AS tv_show
FROM netflix_titles A
JOIN netflix_titles B
ON A.release_year = B.release_year
WHERE A.type = 'Movie' 
AND B.type = 'TV Show';

--  CTE
WITH country_count AS (
    SELECT country, COUNT(*) AS total
    FROM netflix_titles
    GROUP BY country
)
SELECT * FROM country_count;

--  CTE FILTER
WITH country_count AS (
    SELECT country, COUNT(*) AS total
    FROM netflix_titles
    GROUP BY country
)
SELECT * FROM country_count WHERE total > 10;

--  LIKE + AND
SELECT * 
FROM netflix_titles
WHERE listed_in LIKE '%Dramas%' 
AND type = 'Movie';

--  NULL CHECK
SELECT * 
FROM netflix_titles 
WHERE country IS NOT NULL;

--  ORDER + LIMIT
SELECT * 
FROM netflix_titles
ORDER BY release_year DESC
LIMIT 10;

--  MULTIPLE CONDITIONS
SELECT * 
FROM netflix_titles
WHERE type = 'Movie' 
AND release_year > 2015;

--  OR CONDITION
SELECT * 
FROM netflix_titles
WHERE country = 'India' 
OR country = 'USA';

--  COUNT FILTER
SELECT COUNT(*) 
FROM netflix_titles 
WHERE type = 'Movie';