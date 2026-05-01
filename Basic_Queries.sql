-- 
SELECT * 
FROM netflix_titles;

-- 
SELECT title 
FROM netflix_titles;

-- 
SELECT DISTINCT type 
FROM netflix_titles;

-- 
SELECT COUNT(*) 
FROM netflix_titles;

-- 
SELECT * 
FROM netflix_titles 
WHERE type = 'Movie';

-- 
SELECT * 
FROM netflix_titles 
WHERE type = 'TV Show';

-- 
SELECT title 
FROM netflix_titles 
WHERE release_year = 2020;

-- 
SELECT * 
FROM netflix_titles 
WHERE country = 'India';

-- 
SELECT * FROM netflix_titles WHERE rating = 'PG';

-- 
SELECT * 
FROM netflix_titles 
WHERE title LIKE 'A%';

-- 
SELECT * 
FROM netflix_titles 
WHERE title LIKE '%Love%';

-- 
SELECT * 
FROM netflix_titles 
ORDER BY release_year DESC;

-- 
SELECT * 
FROM netflix_titles 
ORDER BY title ASC;

-- 
SELECT country, COUNT(*) 
FROM netflix_titles 
GROUP BY country;

-- 
SELECT type, COUNT(*) 
FROM netflix_titles 
GROUP BY type;

-- 
SELECT rating, COUNT(*) 
FROM netflix_titles 
GROUP BY rating;

-- 
SELECT * 
FROM netflix_titles 
WHERE director IS NULL;

-- 
SELECT * 
FROM netflix_titles 
WHERE cast IS NULL;

-- 
SELECT MAX(release_year) 
FROM netflix_titles;

-- 
SELECT MIN(release_year) 
FROM netflix_titles;