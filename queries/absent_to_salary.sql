--
--
--
-- 

DROP FUNCTION IF EXISTS absent_to_salary(loc_type text, absentee_percentage real);

CREATE FUNCTION absent_to_salary(loc_type text, absentee_percentage real)
RETURNS TABLE(div_name text, average_salary real) AS $$ 

	SELECT d.div_name, t.average_salary
	FROM division d
		JOIN absentee a ON d.div_num = a.div_num
		JOIN teacher t ON d.div_num = t.div_num
	WHERE d.loc_type = $1
		AND a.absentee_percentage = $2
		AND a.race = 'ALL'
		AND a.gender = 'ALL'
		AND a.disabil = 'ALL'
		AND a.lep = 'ALL'
		AND a.disadva = 'ALL'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION absent_to_salary(loc_type text, absentee_percentage real) OWNER TO crew;