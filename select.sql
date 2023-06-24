SELECT * FROM employee;

SELECT first_name AS "Nume angajat", last_name AS "Prenume angajat", phone_number AS "Nr. telefon", NOW() AS "Data raport" FROM employee;

SELECT first_name AS "Nume angajat", last_name AS "Prenume angajat", email_address AS "Contact", NOW() "Data raport" FROM employee;

SELECT first_name "Nume angajat", last_name "Prenume angajat", email_address "Contact", NOW() "Data raport" FROM employee as e;

SELECT first_name, last_name, phone_number "Nr. telefon", NOW() "Data raport", (id*3)/2 as "Id angajat" FROM employee;



SELECT * FROM employee WHERE id=3;

SELECT first_name, last_name, phone_number FROM employee WHERE id=4;

SELECT first_name, last_name, sex, age FROM employee WHERE id=2;

SELECT * FROM  employee WHERE id in (3,1,4);

SELECT * FROM  employee WHERE id > 3;

SELECT * FROM  employee WHERE id >= 3;

SELECT * FROM  employee WHERE id <= 3;

SELECT * FROM  employee WHERE id=2 AND first_name='Ionescu';

SELECT * FROM  employee WHERE id=1 OR last_name='Mihai';

SELECT * FROM  employee WHERE id !=3 OR first_name='Ionescu';
SELECT * FROM  employee WHERE id <> 3 OR first_name='Ionescu';

SELECT * FROM  employee WHERE id not in (3,2);

SELECT * FROM  employee WHERE last_name in ('Andrei');
SELECT * FROM  employee WHERE last_name not in ('Andrei');

SELECT * FROM  employee WHERE (last_name='Maria' and id>1) or (id=4) AND adress='Bulevardul Corneliu Coposu, nr.22';

SELECT * FROM  employee WHERE last_name LIKE('%r%');

SELECT * FROM  employee WHERE first_name LIKE('P%');

SELECT * FROM  employee WHERE adress LIKE('%Co%');

SELECT first_name "Nume angajat", last_name "Prenume angajat", phone_number "Contact", NOW() "Data raport" FROM employee as e
WHERE first_name='Popescu';

SELECT first_name "Nume angajat", e.last_name "Prenume angajat", phone_number "Contact", NOW() "Data raport" FROM employee as e
WHERE e.last_name='Maria';

SELECT employee.first_name AS "Nume angajat", employee.last_name AS "Prenume angajat", employee.adress AS "Adresa", NOW() AS "Data raport" FROM employee;

SELECT e.first_name AS "Nume angajat", e.last_name AS "Prenume angajat", e.phone_number AS "Nr. telefon", NOW() AS "Data raport" FROM employee as e;

CREATE TABLE IF NOT EXISTS employee_extended AS
SELECT first_name AS "Nume angajat", last_name AS "Prenume angajat", adress AS "Adresa", NOW() AS "Data raport" FROM employee;

CREATE VIEW employee_extended_view AS
SELECT first_name AS "Nume angajat", last_name AS "Prenume angajat", phone_number AS "Nr. telefon", NOW() AS "Data raport" FROM employee;
SELECT * FROM employee_extended_view;

SELECT *, now() as "Acum" FROM  members;

SELECT first_name, origin_country, age FROM
(
	select *, now() as "Acum" FROM  members
) as temp;

SELECT * FROM employee WHERE id IN --STEP 3
(
	SELECT employee_id FROM atractions WHERE id=  --STEP 2
	(
		SELECT id FROM atractions WHERE name='Muzeul Satului Banatean' --STEP 1
	)
);


select ST_GeometryType(geom) from tourist_routes;
select ST_AsText(geom) from parks;
select ST_LineFromMultiPoint('MultiPoint(1 2,2 3)') from water_fountains;
select ST_StartPoint(geom) from tourist_routes;
select ST_EndPoint(geom) from tourist_routes;


select ST_Points(geom) geom from neighborhood
union
select geom from neighborhood
union
select ST_Centroid(geom) geom from neighborhood;

select name, SUM(pop2011) populatie_2011, ST_Union(geom) geom from judete group by region;
select MIN(suprafata), Max(suprafata), Sum(suprafata) from neighborhood;	

select ST_Y(ST_Centroid(centorid)),ST_X(ST_Centroid(centorid)) from centroid_parks;

select * from neighborhood;
select ST_AsGeoJSON(geom) from parks;
			
select ST_AsEWKT(geom) from water_fountains;
			
select ST_AsKML(geom) from atractions;



