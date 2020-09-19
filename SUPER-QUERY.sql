UPDATE authors
SET nationality = "GBR"
WHERE nationality = "ENG";

SELECT DISTINCT nationality 
FROM authors;

SELECT sellable, COUNT(book_id), SUM(price * copies) 
FROM books 
GROUP BY sellable;

SELECT COUNT(book_id), SUM(IF(YEAR < 1950, 1, 0)) as `< 1950` 
FROM books;

SELECT COUNT(book_id), 
SUM(if(year < 1950, 1, 0)) as `< 1950`, 
SUM(if(year < 1950, 0, 1)) as `> 1950` 
FROM books;

SELECT COUNT(book_id), 
SUM(IF(YEAR < 1950, 1, 0)) as `< 1950`, 
SUM(IF(YEAR >= 1950 AND YEAR < 1990, 1, 0)) as `< 1990`,  
SUM(IF(YEAR >= 1990 AND YEAR < 2000, 1, 0)) as `< 1990`, 
SUM(IF(YEAR >= 2000, 1, 0)) as `> 2000`
FROM books;

SELECT nationality, COUNT(book_id), 
SUM(IF(YEAR < 1950, 1, 0)) as `< 1950`, 
SUM(IF(YEAR >= 1950 AND YEAR < 1990, 1, 0)) as `< 1990`,  
SUM(IF(YEAR >= 1990 AND YEAR < 2000, 1, 0)) as `< 1990`, 
SUM(IF(YEAR >= 2000, 1, 0)) as `> 2000`
FROM books AS b 
JOIN authors AS a 
ON a.author_id = b.author_id 
WHERE a.nationality IS NOT NULL 
GROUP BY nationality;

SELECT COUNT(book_id) FROM books;