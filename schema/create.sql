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


CREATE TABLE division(
	div_num integer NOT NULL, 
	div_name text NOT NULL, 
	loc_code integer NOT NULL, 
	loc_type text NOT NULL, 
	region integer NOT NULL, 
	superin text NOT NULL, 
	phone text NOT NULL, 
	fax text NOT NULL, 
	address1 text, 
	address2 text, 
	city text NOT NULL, 
	state text NOT NULL, 
	zip text NOT NULL);

ALTER TABLE division OWNER TO crew;

COMMENT ON TABLE division IS 'School divisions in Virginia';


CREATE TABLE pass_rate (
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	sch_num integer NOT NULL,
	race text NOT NULL, 
	gender text NOT NULL,
	disabil text NOT NULL,
  lep text NOT NULL,
  disadva text NOT NULL,
	cohort_cnt integer NOT NULL,
	diploma_rate real NOT NULL, 
	dropout_rate real NOT NULL);
	
ALTER TABLE pass_rate OWNER TO crew;

COMMENT ON TABLE pass_rate IS 'Four year pass rates in Virginia';


CREATE TABLE school(
	div_num integer NOT NULL, 
	sch_num integer NOT NULL, 
	nces_num bigint, 
	sch_name text NOT NULL, 
	low_grade text, 
	high_grade text, 
	sch_desc text NOT NULL, 
	grade_std text, 
	schedule text, 
	principal text, 
	address1 text, 
	address2 text, 
	city text, 
	state text, 
	zip text, 
	phone text, 
	member text NOT NULL);

ALTER TABLE school OWNER TO crew;

COMMENT ON TABLE school IS 'Schools in Virginia';


CREATE TABLE secondary_enrollment(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	sch_num integer NOT NULL,
	race text NOT NULL, 
	gender text NOT NULL,
	disabil text NOT NULL,
  lep text NOT NULL,
  disadva text NOT NULL,
	enroll_graduate_cnt integer NOT NULL, 
	ps_institution_type integer NOT NULL, 
	ps_enrollment_cnt integer NOT NULL);

ALTER TABLE secondary_enrollment OWNER TO crew;

COMMENT ON TABLE secondary_enrollment IS 'Secondary enrollment in Virginia';	


CREATE TABLE teacher(
	div_num integer NOT NULL,
	div_name text NOT NULL,
	average_salary real NOT NULL);
	
ALTER TABLE teacher OWNER TO crew;

COMMENT ON TABLE teacher IS 'Teacher salaries in Virginia';	


