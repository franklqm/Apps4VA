--
--
--
--

DROP FUNCTION IF EXISTS pass_and_secondary(loc_type text, absentee_percentage real);

CREATE FUNCTION pass_and_secondary(loc_type text, absentee_percentage real)
RETURNS TABLE(div_name text, cohort_cnt integer, ps_enrollment_cnt integer) AS $$

	SELECT d.div_name, p.cohort_cnt, s.ps_enrollment_cnt
	FROM division d
		JOIN pass_rate p ON d.div_num = p.div_num
		JOIN secondary_enrollment s ON d.div_num = s.div_num
	WHERE d.loc_type = $1
		AND a.absentee_percentage = $2
		AND p.race = 'ALL'
		AND p.gender = 'ALL'
		AND p.disabil = 'ALL'
		AND p.lep = 'ALL'
		AND p.disadva = 'ALL'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION pass_and_secondary(loc_type text, absentee_percentage real) OWNER TO crew;