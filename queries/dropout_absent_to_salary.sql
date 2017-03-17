--
--
--
--

DROP FUNCTION IF EXISTS dropout_absent_to_salary(dropout_rate real, absentee_percentage real);

CREATE FUNCTION dropout_absent_to_salary(dropout_rate real, absentee_percentage real)
RETURNS TABLE(div_name text, average_salary real) AS $$

	SELECT d.div_name, t.average_salary
	FROM division d
		JOIN absentee a ON d.div_num = a.div_num
		JOIN pass_rate p ON d.div_num = p.div_num
		JOIN teacher t ON d.div_num = t.div_num
	WHERE p.dropout_rate = $1
		AND a.absentee_percentage = $2
		AND p.race = 'ALL'
		AND p.gender = 'ALL'
		AND p.disabil = 'ALL'
		AND p.lep = 'ALL'
		AND p.disadva = 'ALL'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION dropout_absent_to_salary(dropout_rate real, absentee_percentage real) OWNER TO crew;