SELECT name, email, gender 
FROM clients 
WHERE gender = 'F';

SELECT name, YEAR(NOW()) -YEAR(birthdate)
FROM clients limit 10;

SELECT name, email, YEAR(NOW()) - YEAR(birthdate) as edad, gender 
FROM clients 
WHERE gender = 'F' 
AND name LIKE '%Lop%';

SELECT b.book_id, a.name, a.author_id, b.title 
FROM books as b 
JOIN authors as a 
ON a.author_id = b.author_id 
WHERE a.author_id between 1 and 5;

SELECT c.name, b.title, t.type 
FROM transactions as t 
JOIN books as b 
ON t.book_id = b.book_id 
JOIN clients as c 
ON t.client_id = c.client_id 
JOIN authors as a 
ON b.author_id = a.author_id 
WHERE c.gender = 'F' 
AND t.type IN('sell', 'lend');

SELECT b.title, a.name 
FROM authors as a, books as b 
WHERE a.author_id = b.author_id 
LIMIT 10;

SELECT b.title, a.name 
FROM books as b 
INNER JOIN authors as a 
ON a.author_id = b.author_id 
LIMIT 10;

SELECT a.author_id, a.name, a.nationality, b.title 
FROM authors as a 
LEFT JOIN books as b 
ON b.author_id = a.author_id 
WHERE a.author_id BETWEEN 1 and 5 
ORDER BY a.author_id;

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id) 
FROM authors as a 
LEFT JOIN books as b 
ON b.author_id = a.author_id 
WHERE a.author_id BETWEEN 1 and 5 
GROUP BY a.author_id 
ORDER BY a.author_id;

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id) 
FROM authors as a 
JOIN books as b 
ON b.author_id = a.author_id 
WHERE a.author_id BETWEEN 1 and 5 
GROUP BY a.author_id 
ORDER BY a.author_id;

SELECT DISTINCT nationality 
FROM authors 
ORDER BY nationality;

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors 
WHERE nationality IS NOT NULL 
AND nationality NOT IN ('RUS','AUT')
GROUP BY nationality 
ORDER BY c_authors DESC, nationality ASC;

SELECT nationality, 
COUNT(book_id) as libros, 
AVG(price) AS prom, 
STDDEV(price) AS std
FROM books as b 
JOIN authors as a 
ON a.author_id = b.author_id 
GROUP BY nationality 
ORDER BY libros DESC;

SELECT a.nationality, MAX(price), MIN(price) 
FROM books as b 
JOIN authors as a 
ON a.author_id = b.author_id 
GROUP BY nationality;

SELECT c.name, t.type, b.title, a.name, CONCAT(a.name, " (", a.nationality, ")") as author, 
TO_DAYS(NOW()) - TO_DAYS(t.created_at) as ago  
FROM transactions as t 
LEFT JOIN clients as c 
ON c.client_id = t.client_id 
LEFT JOIN books as b 
ON b.book_id = t.book_id 
LEFT JOIN authors as a 
ON b.author_id = a.author_id;
