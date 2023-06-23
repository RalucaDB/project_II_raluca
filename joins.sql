--inner join
SELECT * FROM employee
INNER JOIN parks
ON employee.id=parks.employee_id;

--left join
SELECT * FROM employee
LEFT OUTER JOIN parks
ON employee.id=parks.employee_id;

--right join
SELECT * FROM employee
RIGHT OUTER JOIN water_fountains
ON employee.id=water_fountains.employee_id;

--full join
SELECT * FROM employee
FULL JOIN health_facilities
ON employee.id=health_facilities.employee_id;

SELECT * FROM neighborhood;
SELECT * FROM health_facilities;

SELECT * FROM employee
INNER JOIN parks
ON employee.id=parks.employee_id
INNER JOIN neighborhood
ON parks.id=neighborhood.id
INNER JOIN water_fountains
ON neighborhood.id=water_fountains.id;

SELECT * FROM employee
INNER JOIN parks
ON employee.id=parks.employee_id
LEFT JOIN neighborhood
ON parks.id=neighborhood.id
RIGHT JOIN health_facilities
ON neighborhood.id=health_facilities.id

SELECT * FROM employee
LEFT JOIN parks
ON employee.id=parks.employee_id
LEFT JOIN neighborhood
ON parks.id=neighborhood.id
LEFT JOIN members
ON neighborhood.id=members.id

SELECT * FROM employee
RIGHT JOIN water_fountains
ON employee.id=water_fountains.employee_id
RIGHT JOIN neighborhood
ON water_fountains.id=neighborhood.id
RIGHT JOIN members
ON neighborhood.id=members.id;

SELECT * FROM employee
INNER JOIN parks
ON employee.id=parks.employee_id
INNER JOIN neighborhood
ON parks.id=neighborhood.id
INNER JOIN water_fountains
ON neighborhood.id=water_fountains.id
WHERE employee.sex='M';

SELECT * FROM  employee AS e
INNER JOIN  parks AS p
ON e.id=p.employee_id
INNER JOIN neighborhood AS n
ON p.employee_id=n.id;

SELECT e.first_name, e.last_name, e.age, a.name, a.adress, r.rating FROM  employee AS e
INNER JOIN  atractions AS a
ON e.id=a.employee_id
INNER JOIN atraction_rating_employee AS r
ON a.id=r.id
WHERE r.rating='10';

SELECT * FROM
(
SELECT * FROM  employee AS e
INNER JOIN  atractions AS a
ON e.id=a.employee_id
INNER JOIN parks AS p
ON e.id=p.id
) AS al;

SELECT first_name,last_name, neighborhood_id FROM
(
SELECT * FROM  employee AS e
INNER JOIN  parks AS p
ON e.id=p.id
INNER JOIN neighborhood AS n
ON e.id=n.id
) AS al;

--ALIAS & FILTRARE
SELECT e.first_name angajat, a.rating nota, a.atraction_id atractie from employee as e
INNER JOIN atraction_rating_employee as a
ON e.id=a.id;

SELECT e.first_name angajat, p.neighborhood_id cartier, p.name nume from employee as e
LEFT JOIN parks as p
ON e.id=p.id;

SELECT m.first_name membru, a.rating nota, a.atraction_id atractie from members as m
RIGHT JOIN atraction_rating_members as a
ON m.id=a.id;

SELECT COUNT (*) FROM atractions
RIGHT OUTER JOIN employee
ON atractions.id=employee.id;