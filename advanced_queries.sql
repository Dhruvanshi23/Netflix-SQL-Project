--  TOP YEARS
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY total DESC
LIMIT 5;

--  MOST COMMON RATING
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC
LIMIT 1;

--  DIRECTOR ANALYSIS
SELECT director, COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY director
ORDER BY total_movies DESC;

--  BEFORE 2000
SELECT * FROM netflix_titles
WHERE release_year < 2000;

--  MOVIE VS TV SHOW
SELECT type, COUNT(*) 
FROM netflix_titles 
GROUP BY type;

--  Top 5 countries with most content
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 5;

--  Year with highest number of releases
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
HAVING COUNT(*) = (
    SELECT MAX(year_count)
    FROM (
        SELECT COUNT(*) AS year_count
        FROM netflix_titles
        GROUP BY release_year
    ) AS temp
);

--  Directors with more than 5 movies
SELECT director, COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie' AND director IS NOT NULL
GROUP BY director
HAVING COUNT(*) < 5
ORDER BY total_movies DESC;

--  CASE
SELECT 
 SUM(CASE when country='India' then 1 else 0 end) as 'show in india',
 SUM(CASE when country='United States' then 1 else 0 end) as 'show in United States',
 SUM(CASE when country='south Africa' then 1 else 0 end) as 'Show in South Africa'
 FROM netflix_titles;

--  SUBQUERY IN HAVING
SELECT country, COUNT(*) AS total
FROM netflix_titles
GROUP BY country
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM netflix_titles
        GROUP BY country
    ) AS temp
);

--  CASE STATEMENT
SELECT title,
       CASE 
           WHEN release_year > 2015 THEN 'New'
           ELSE 'Old'
       END AS category
FROM netflix_titles;

--  MULTI CONDITION
SELECT * FROM netflix_titles
WHERE listed_in LIKE '%Drama%' AND rating = 'TV-MA';

--  DISTINCT COUNT
SELECT COUNT(DISTINCT country) 
FROM netflix_titles;

--  STRING FILTER
SELECT * 
FROM netflix_titles
WHERE duration LIKE '%Season%';

--  FINAL COMPLEX QUERY
WITH movies AS (
    SELECT * FROM netflix_titles WHERE type = 'Movie'
),
tvshows AS (
    SELECT * FROM netflix_titles WHERE type = 'TV Show'
)
SELECT m.title AS movie, t.title AS tv_show, m.release_year
FROM movies m
JOIN tvshows t
ON m.release_year = t.release_year;
