SELECT first_name, last_name, email_name
FROM Faculty
WHERE department_name = 'Physics';

SELECT first_name, last_name, year, major
FROM Student
WHERE year = '1st Year';

SELECT year, COUNT(*)
FROM Student
GROUP BY year;

SELECT department_name, COUNT(*)
FROM Faculty
GROUP BY department_name;