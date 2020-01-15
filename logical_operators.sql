SELECT 100 > 5;
SELECT -15 > 15;
SELECT 1 > 1;
SELECT 'a' > 'b';
SELECT 'A' > 'a';

SELECT 3 < -10;
SELECT -10 < -9;
SELECT 42 <= 42;
SELECT 'h' < 'p';
SELECT 'Q' <= 'q';

SELECT 1 < 5 && 7 = 9;
SELECT -10 > -20 AND 0 <= 0;
SELECT -40 <= -0 && 10 > 40;
SELECT 54 <= 54 AND 'a' = 'A';

SELECT 40 <= 100 || -2 > 0;
SELECT 10 > 5 || 5 = 5;
SELECT 'a' = 5 OR 3000 > 2000;