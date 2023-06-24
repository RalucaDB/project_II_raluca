SELECT * FROM members;
CREATE FUNCTION deactivated_accounts_members() RETURNS void
LANGUAGE SQL
AS $$
	UPDATE generated SET first_name='Moore';
$$;
SELECT deactivated_accounts_members();

CREATE OR REPLACE FUNCTION GetMembersCount()
RETURNS BIGINT
LANGUAGE SQL
AS
$$
SELECT COUNT(*) AS first_name FROM members;
$$;
SELECT GetMembersCount(); 

CREATE OR REPLACE PROCEDURE AddMembers(
first_name VARCHAR(50),
last_name VARCHAR(50),
origin_country VARCHAR(40),
age INTEGER,
email_adress VARCHAR(255),
sex VARCHAR(1)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
INSERT INTO members(first_name, last_name, origin_country, age, email_adress, sex) VALUES (first_name_p, last_name_p, origin_country_p, age_p, email_adress_p, sex_p);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateMembers(
old_name VARCHAR(50),
new_name VARCHAR(50)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
UPDATE members
SET first_name=new_name
WHERE first_name=old_name;
END
$$;

SELECT * FROM generated;
CREATE PROCEDURE update_nume() 
LANGUAGE SQL
AS $$
	UPDATE generated SET last_name='Maria';
$$;
CALL update_nume();