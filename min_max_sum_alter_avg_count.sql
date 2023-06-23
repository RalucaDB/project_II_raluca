
ALTER TABLE members
ADD COLUMN SEX CHARACTER (1);

SELECT AVG(age)::INTEGER AS medie FROM employee;

SELECT COUNT(*) AS nr_angajati FROM  employee;
SELECT COUNT(id) AS nr_angajati FROM  employee;
SELECT COUNT(distinct id) AS nr_angajati FROM  employee;
SELECT COUNT(last_name) AS nr_angajati FROM  employee;
SELECT COUNT(distinct first_name) AS nr_angajati FROM  employee;

SELECT MIN(age) AS varsta_minima FROM  employee;
SELECT MAX(age) AS varsta_maxima FROM  employee;

SELECT MIN(age) AS varsta_minima FROM  members;
SELECT MAX(age) AS varsta_maxima FROM  members;

SELECT SUM(age)/COUNT(*) AS medie FROM  employee;

SELECT AVG(age)::INTEGER AS medie_varsta, COUNT(*) AS nr_angajati,
	MIN(age) AS varsta_minima, MAX(age) AS varsta_maxima, SUM(age) AS total
FROM employee;

SELECT COUNT(*) AS nr_angajati FROM  employee WHERE age<30;
SELECT COUNT(*) AS nr_angajati FROM  employee WHERE age<35 AND sex='F';

SELECT * FROM  employee;

SELECT sex,COUNT(*) FROM  employee
WHERE age<50
GROUP BY sex;

SELECT COUNT(*), age FROM  employee
GROUP BY sex, age
HAVING age<50;

SELECT sex,COUNT(id) FROM  employee
WHERE age < 35 AND sex='F'
GROUP BY sex;

--HAVING COUNT(id)>1;
SELECT sex,COUNT(id) FROM  employee
WHERE age < 50 
GROUP BY sex
HAVING COUNT(id)>1 AND sex='F';
