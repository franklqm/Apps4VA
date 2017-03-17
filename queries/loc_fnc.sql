--
-- Average pass rate for each division given a division type and school year
--
--

DROP FUNCTION IF EXISTS loc_fnc(loc_type text, sch_year integer);

CREATE FUNCTION loc_fnc(loc_type text, sch_year integer)
RETURNS TABLE(div_name text, absent_percentage real, diploma_rate real) AS $$

	SELECT d.div_name, a.absentee_percentage, p.diploma_rate
	FROM division d
		JOIN absentee a ON d.div_num = a.div_num 
		JOIN pass_rate p ON d.div_num = p.div_num
	WHERE d.loc_type = $1
		AND a.sch_year = $2
		AND p.sch_year = $2
		-- all students
		AND race = 'ALL'
		AND gender = 'ALL'
		AND disabil = 'ALL'
		AND lep = 'ALL'
		AND disadva = 'ALL'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION loc_fnc(loc_type text, sch_year integer) OWNER TO crew;

select *
from pass_rate
limit 100;