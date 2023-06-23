DELETE FROM health_facilities WHERE id=4;

DELETE FROM employee WHERE phone_number='0740173934';

DELETE FROM employee WHERE employee_id IN 
(
	SELECT employee_id FROM atractions WHERE id=
	(
		SELECT id FROM atractions WHERE name='Steaua_Fratelia'
	)
);

DELETE FROM atractions
WHERE start_date>='2023-04-04' AND end_date<='2023-05-06';