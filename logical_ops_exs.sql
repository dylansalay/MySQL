SELECT 10 != 10;
-- 0 False

SELECT 15 > 14 && 99 - 5 <= 94;
-- 1 True

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
-- 1 True

-- Select all books written before 1980
SELECT title, released_year FROM books
WHERE released_year < 1980;

-- Select all books written by Eggers or Chabon
SELECT title, author_lname FROM books
WHERE author_lname IN('Eggers', 'Chabon');

-- Select all books written by Lahiri, Published after 2000
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

-- Select all books with page counts between 100 and 200
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or an 'S'
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

-- OR

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname, 1, 1) = 'C' 
OR SUBSTR(author_lname, 1, 1) = 'S';

-- OR

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C','S');


-- Case Statement
-- If title contains 'stories' -> short stories
-- If title contains 'Just Kids' or 'A Heartbreaking Work' -> Memoir
-- Else -> Novel

SELECT title, author_lname,
CASE
WHEN title LIKE '%stories%' THEN 'Short Stories'
WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS Type
FROM books;

-- Select author_fname, author_lname and book count for each author
SELECT author_fname, author_lname, 
CASE
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT(COUNT(*),' books')
END AS Count
FROM books
GROUP BY author_lname, author_fname;

