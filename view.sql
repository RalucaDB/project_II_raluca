--CREATE VIEW
CREATE VIEW employee_view AS 
SELECT * FROM employee;

--SELECT FROM VIEW

SELECT * FROM imprejurimi_atractii_view;

create view imprejurimi_atractii_view as
select e.first_name nume_angajat, e.last_name, e.phone_number, p.name as "nume parc" from employee e
inner join atractions
on e.id=atractions.id
inner join neighborhood
on e.id=neighborhood.id
inner join parks p
on neighborhood.id=p.id;

SELECT nume_angajat, phone_number FROM imprejurimi_atractii_view;

SELECT * FROM imprejurimi_atractii_view
INNER JOIN employee
on imprejurimi_atractii_view.phone_number=employee.phone_number;

SELECT ia.*,e FROM imprejurimi_atractii_view AS ia
INNER JOIN employee AS e
on ia.nume_angajat=e.first_name;

CREATE TABLE GENERATED AS
SELECT ia.*,e.first_name FROM imprejurimi_atractii_view AS ia
INNER JOIN employee AS e
on ia.nume_angajat=e.first_name;

--view for insert
INSERT INTO generated
SELECT ia.*,e.first_name FROM imprejurimi_atractii_view AS ia
INNER JOIN employee AS e
on ia.nume_angajat=e.first_name;

SELECT * FROM public.generated;

--view for update
UPDATE GENERATED SET adress='Mun. Timisoara, Jud. Timis' WHERE nume_='Mihai';

--view for update
UPDATE GENERATED SET last_name='Elena' 
WHERE first_name=(
					SELECT DISTINCT first_name FROM imprejurimi_atractii_view WHERE phone_number='0740173956'
	          		);

--DELETE FROM GENERATED
DELETE FROM generated WHERE nume_angajat IN(
					SELECT nume_angajat FROM imprejurimi_atractii_view WHERE first_name='Popescu'
					);
					