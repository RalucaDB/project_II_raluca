UPDATE employee SET  adress='Mun. Timisoara, Jud. Timis' WHERE id=1;
UPDATE employee SET  adress='Mun. Timisoara, Jud. Timis' WHERE id IN (1,3);

UPDATE employee SET  adress='Bulevardul Vasile Parvan' WHERE first_name='Popescu' AND sex='M';


UPDATE members SET age='55' WHERE origin_country='UK';

UPDATE members 
SET age='23', 
	origin_country='United Kingdom'  
WHERE first_name='Smith';

SELECT * FROM employee where id in(
SELECT employee_id FROM parks WHERE id=1
);

UPDATE employee SET  adress='Bulevardul Vasile Parvan 7' WHERE id IN --STEP update
(
	SELECT employee_id FROM atractions WHERE id=  --STEP 2
	(
		SELECT id FROM atractions WHERE name='KFC' --STEP 1
	)
);

SELECT * FROM  employee;
