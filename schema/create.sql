-- DROP TABLE IF EXISTS absentee;

CREATE TABLE absentee(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	div_name text NOT NULL,
	b0and10_cnt integer NOT NULL,
 	b11and15_cnt integer NOT NULL,
 	b16and20_cnt integer NOT NULL,
 	over20_cnt integer NOT NULL,
	PRIMARY KEY (sch_year, div_num)
);
	
ALTER TABLE absentee OWNER TO crew;
COMMENT ON TABLE absentee IS 'absentee data in Virginia';	


-- DROP TABLE IF EXISTS division;

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
	zip text NOT NULL,
	PRIMARY KEY (div_num)
);

ALTER TABLE division OWNER TO crew;
COMMENT ON TABLE division IS 'School divisions in Virginia';


-- DROP TABLE IF EXISTS pass_rate;

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
	dropout_rate real NOT NULL
);
	
ALTER TABLE pass_rate OWNER TO crew;
COMMENT ON TABLE pass_rate IS 'Four year pass rates in Virginia';


-- DROP TABLE IF EXISTS school;

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
	member text NOT NULL
);

ALTER TABLE school OWNER TO crew;
COMMENT ON TABLE school IS 'Schools in Virginia';


-- DROP TABLE IF EXISTS secondary_enrollment;

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
	ps_enrollment_cnt integer NOT NULL
);

ALTER TABLE secondary_enrollment OWNER TO crew;
COMMENT ON TABLE secondary_enrollment IS 'Secondary enrollment in Virginia';	


-- DROP TABLE IF EXISTS teacher;

CREATE TABLE teacher(
	div_num integer NOT NULL,
	div_name text NOT NULL,
	average_salary real,
	PRIMARY KEY (div_num)
);
	
ALTER TABLE teacher OWNER TO crew;
COMMENT ON TABLE teacher IS 'Teacher salaries in Virginia';	

-- Table: fall_membership

-- DROP TABLE fall_membership;

CREATE TABLE fall_membership
(
  sch_year integer NOT NULL,
  div_num integer NOT NULL,
  sch_num integer NOT NULL,
  grade_num integer NOT NULL,
  race text NOT NULL,
  gender text NOT NULL,
  disabil text NOT NULL,
  lep text NOT NULL,
  disadva text NOT NULL,
  fall_cnt integer NOT NULL
);

ALTER TABLE fall_membership
  OWNER TO crew;
--GRANT ALL ON TABLE fall_membership TO postgres;
--GRANT SELECT ON TABLE fall_membership TO public;
COMMENT ON TABLE fall_membership
  IS 'Number of students enrolled in VA public schools each Sep 30th';
