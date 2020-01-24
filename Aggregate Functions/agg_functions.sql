SELECT COUNT(*) FROM books;

SELECT released_year AS Year, COUNT(*) AS "Total Books" FROM books GROUP BY released_year ORDER BY released_year;

SELECT SUM(stock_quantity) AS "# in Stock" FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS Author, AVG(released_year) AS "Average Released Year" FROM books GROUP BY author_lname, author_fname ORDER BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS Author FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(author_fname, ' ', author_lname) AS Author, Pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT released_year AS year, COUNT(*) AS "# books", AVG(pages) AS "avg pages" FROM books GROUP BY released_year ORDER BY released_year;