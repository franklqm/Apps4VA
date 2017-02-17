CREATE TABLE teacher_table (
	div_num integer NOT NULL,
	div_name text NOT NULL,
	elementary_salary real NOT NULL, 
	secondary_salary real NOT NULL, 
	average_salary real NOT NULL);
	
ALTER TABLE teacher_table OWNER TO crew;

COMMENT ON TABLE teacher_table IS 'Teacher salaries in Virginia';		
	
CREATE TABLE absentee_table(
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
	
ALTER TABLE absentee_table OWNER TO crew;

COMMENT ON TABLE absentee_table IS 'absentee data in Virginia';	

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
	
ALTER TABLE secondary_enrollment OWNER TO crew;

COMMENT ON TABLE secondary_enrollment IS 'Secondary enrollment in Virginia ';	