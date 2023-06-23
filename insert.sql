--INSERT DATA INTO TABLE 
					
INSERT INTO employee(first_name, last_name, adress, phone_number, sex, age, email_address)
VALUES
	('Popescu','Andrei','Bulevardul Vasile Parvan, nr.4','0740173956','M','26','p.andrei@yahoo.com'),
	('Ionescu','Maria','Bulevardul Corneliu Coposu, nr.30','0740173934','F','40','i.maria@gmail.com'),
	('Pop','Mihai','Bulevardul Vasile Parvan, nr.25','0740176745','M','30','mihai.p@yahoo.com'),
	('Gliga','Elena','Bulevardul Corneliu Coposu, nr.22','0740172345','F','31','gliga.elena@gmail.com');

INSERT INTO members(first_name, last_name, origin_country, age, email_address)
VALUES
	('Smith','Ruth','UK','26','smith.r@yahoo.com'),
	('Moore','Greta','Germany','40','greta.moore@yahoo.com'),
	('Toth','Tunde','Hungary','20','tunde.t@gmail.com'),
	('Zielonka','Igor','Poland','25','igor.zie@gmail.com'),
	('Mencia','Ilaria','Italy','57','ilaria.m@yahoo.com');
	

INSERT INTO atraction_type (type) VALUES
					('Art'),
					('Museum'),
					('Food'),
					('Music'),
					('Sporting events'),
					('Statues and Monuments'),
					('Tours'),
					('Performances/Entertainment');
								

INSERT INTO atraction_rating_employee(rating, employee_id, atraction_id)
VALUES
	('9','4','1'),
	('10','1','2'),
	('8','2','4'),
	('7','3','3'),
	('9','4','5'),
	('10','2','6'),
	('6','4','9'),
	('9','3','10');

INSERT INTO atraction_rating_members(rating, members_id, atraction_id)
VALUES
	('9','4','1'),
	('10','1','2'),
	('8','2','4'),
	('7','3','3'),
	('9','2','5'),
	('10','2','6'),
	('6','5','8'),
	('9','5','3');
							
SELECT * FROM atraction_rating_members;