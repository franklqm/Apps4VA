CREATE TABLE absentee(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	div_name text NOT NULL,
	gender text NOT NULL,
	race text NOT NULL, 
	disabil text NOT NULL,
   	lep text NOT NULL,
    disadva text NOT NULL,
	grade_num integer NOT NULL, 
	absentee_percentage real NOT NULL);
	
ALTER TABLE absentee OWNER TO crew;

COMMENT ON TABLE absentee IS 'absentee data in Virginia';	


CREATE TABLE pass_rate (
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	div_name text NOT NULL,
	gender text NOT NULL,
	race text NOT NULL, 
	disabil text NOT NULL,
   	lep text NOT NULL,
    disadva text NOT NULL,
	pass_rate real NOT NULL);
	
ALTER TABLE pass_rate OWNER TO crew;

COMMENT ON TABLE pass_rate IS 'Four year pass rates in Virginia';


CREATE TABLE school(
	div_num integer NOT NULL, 
	sch_num integer NOT NULL, 
	nces_num bigint NOT NULL, 
	sch_name text NOT NULL, 
	low_grade text NOT NULL, 
	high_grade text NOT NULL, 
	sch_desc text NOT NULL, 
	grade_std text NOT NULL, 
	schedule text NOT NULL, 
	principal text NOT NULL, 
	address1 text NOT NULL, 
	address2 text NOT NULL, 
	city text NOT NULL, 
	state text NOT NULL, 
	zip text NOT NULL, 
	phone text NOT NULL, 
	member text NOT NULL);

ALTER TABLE division OWNER TO crew;

COMMENT ON TABLE division IS 'School divisions in Virginia';


CREATE TABLE secondary_enrollment(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	div_name text NOT NULL,
	gender text NOT NULL,
	race text NOT NULL, 
	disabil text NOT NULL,
   	lep text NOT NULL,
    disadva text NOT NULL,
	pass_rate real NOT NULL);

ALTER TABLE seconday_enrollment OWNER TO crew;

COMMENT ON TABLE seconday_enrollment IS 'Secondary enrollment in Virginia';	


CREATE TABLE teacher(
	div_num integer NOT NULL,
	div_name text NOT NULL,
	elementary_salary real NOT NULL, 
	secondary_salary real NOT NULL, 
	average_salary real NOT NULL);
	
ALTER TABLE teacher OWNER TO crew;

COMMENT ON TABLE teacher IS 'Teacher salaries in Virginia';	


