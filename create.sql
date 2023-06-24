create extension postgis;

select * from employee;
--CREATE TABLES
CREATE TABLE IF NOT EXISTS neighborhood(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (60) NOT NULL,
	SUPRAFATA DECIMAL NULL,
	GEOM GEOMETRY(POLYGON, 4326)
);
CREATE TABLE IF NOT EXISTS atraction_type(
	ID SERIAL PRIMARY KEY NOT NULL,
	TYPE VARCHAR (40) NOT NULL
);
CREATE TABLE IF NOT EXISTS employee(
	ID SERIAL PRIMARY KEY NOT NULL,
	FIRST_NAME VARCHAR (50) NOT NULL,
	LAST_NAME VARCHAR (50) NOT NULL,
	ADRESS VARCHAR (200) NOT NULL,
	PHONE_NUMBER VARCHAR(15) NOT NULL,
	SEX CHARACTER (1) NOT NULL,
	AGE INTEGER,
	EMAIL_ADDRESS VARCHAR (255) NOT NULL
);
CREATE TABLE IF NOT EXISTS members(
	ID SERIAL PRIMARY KEY NOT NULL,
	FIRST_NAME VARCHAR (50) NOT NULL,
	LAST_NAME VARCHAR (50) NOT NULL,
	ORIGIN_COUNTRY VARCHAR (40) NOT NULL,
	AGE INTEGER NOT NULL,
	EMAIL_ADDRESS VARCHAR (255) NOT NULL
);
CREATE TABLE IF NOT EXISTS atractions(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (150) NOT NULL,
	ADRESS VARCHAR (200) NOT NULL,
	NEIGHBORHOOD_ID INTEGER NOT NULL,
	PHONE_NUMBER VARCHAR (15),
	WEBSITE VARCHAR (512),
	ATRACTION_TYPE INTEGER NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL,
	EMPLOYEE_ID INTEGER NOT NULL,
	GEOM GEOMETRY(Point, 4326),
	DESCRIPTION VARCHAR (300),
	FOREIGN KEY(NEIGHBORHOOD_ID) REFERENCES neighborhood,
	FOREIGN KEY(ATRACTION_TYPE) REFERENCES atraction_type,
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee
);
CREATE TABLE IF NOT EXISTS health_facilities(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	ADRESS VARCHAR (200) NOT NULL,
	TYPE VARCHAR (200) NOT NULL,
	NEIGHBORHOOD_ID INTEGER NOT NULL,
	EMPLOYEE_ID INTEGER NOT NULL,
	GEOM GEOMETRY(Point, 4326),
	FOREIGN KEY(NEIGHBORHOOD_ID) REFERENCES neighborhood,
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee
);
CREATE TABLE IF NOT EXISTS water_fountains(
	ID SERIAL PRIMARY KEY NOT NULL,
	ADRESS VARCHAR (200) NOT NULL,
	NEIGHBORHOOD_ID INTEGER NOT NULL,
	EMPLOYEE_ID INTEGER NOT NULL,
	GEOM GEOMETRY(Point, 4326),
	FOREIGN KEY(NEIGHBORHOOD_ID) REFERENCES neighborhood,
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee
);
CREATE TABLE IF NOT EXISTS tourist_routes(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	START_POINT VARCHAR(50),
	END_POINT VARCHAR(50),
	EMPLOYEE_ID INTEGER NOT NULL,
	GEOM GEOMETRY(LineString, 4326),
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee
);
CREATE TABLE IF NOT EXISTS parks(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	NEIGHBORHOOD_ID INTEGER NOT NULL,
	EMPLOYEE_ID INTEGER NOT NULL,
	GEOM GEOMETRY(Polygon, 4326),
	FOREIGN KEY(NEIGHBORHOOD_ID) REFERENCES neighborhood,
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee
);
CREATE TABLE IF NOT EXISTS atraction_rating_employee(
	ID SERIAL PRIMARY KEY NOT NULL,
	RATING VARCHAR (2) NOT NULL,
	EMPLOYEE_ID INTEGER NOT NULL,
	ATRACTION_ID INTEGER NOT NULL,
	FOREIGN KEY(EMPLOYEE_ID) REFERENCES employee,
	FOREIGN KEY(ATRACTION_ID) REFERENCES atractions
);
CREATE TABLE IF NOT EXISTS atraction_rating_members(
	ID SERIAL PRIMARY KEY NOT NULL,
	RATING VARCHAR (2) NOT NULL,
	MEMBERS_ID INTEGER NOT NULL,
	ATRACTION_ID INTEGER NOT NULL,
	FOREIGN KEY(MEMBERS_ID) REFERENCES members,
	FOREIGN KEY(ATRACTION_ID) REFERENCES atractions
);

create table neighborhood_2 as
select name, count (*) neighborhood_id,ST_Union(geom) geom from parks group by name;

select * from centroid_neighborhood;

create table centroid_neighborhood as
select name as nume_cartier, ST_centroid(geom) as centroid from neighborhood;

create table centroid_parks AS
select name as nume_parc, ST_Centroid(geom) as centorid from parks;

select * from centroid_parks_union;

create table centroid_parks_union AS
select nume_parc as nume, ST_Centroid(centorid) as centorid from centroid_parks;

alter table parks add column perimetru DECIMAL;
update parks set perimetru= ST_Perimeter(geom)/1000 ;

alter table neighborhood add column perimetru DECIMAL;
update neighborhood set perimetru= ST_Perimeter(geom)/1000 ;

----polygon to line
create table parks_linii as 
select name, ST_Boundary(geom) as geom from parks;
select * from neighborhood;

create table neighborhood_linii as 
select name, ST_Boundary(geom) as geom from neighborhood;

create table parks_poligon as 
select parks_linii, ST_MakePolygon(geom) as geom from parks_linii;

create table parks_poligon_2 as 
select ST_Dump(ST_Polygonize(geom)) as geom from parks_linii;
select * from parks_poligon_2;



alter table neighborhood add column city_fid INTEGER NOT NULL Default 1;

create table city(
	ID SERIAL PRIMARY KEY NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	GEOM GEOMETRY(Polygon, 4326)
);

alter table neighborhood add constraint city_id_fk foreign key(city_fid) references city(id);



