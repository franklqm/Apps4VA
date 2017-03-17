-- 
-- 
--
--

DROP FUNCTION IF EXISTS disabil_fnc(disabil text, loc_type text);

CREATE FUNCTION disabil_fnc(disabil text, loc_type text)
RETURNS TABLE(div_name text, absent_percentage real, diploma_rate) AS $$

	SELECT d.div_name, a.absentee_percentage, p.diploma_rate
	FROM division d
		JOIN absentee a ON d.div_num = a.div_num
		JOIN pass_rate p ON d.div_num = a.div_num 
	WHERE p.disabil = $1
		AND a.disabil = $1
		AND d.loc_type = $2
		AND p.race = 'ALL'
		AND p.gender = 'ALL'
		AND p.lep = 'ALL'
		AND p.disadva = 'ALL'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION disabil_fnc(disabil text, loc_type text) OWNER TO crew;