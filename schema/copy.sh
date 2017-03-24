#!/bin/sh
# Run this script directly on the db server.

echo COPY division FROM vdoe
psql -c "COPY (
	SELECT *
	FROM division
  ) TO STDOUT;" vdoe | \
  psql -c "COPY division FROM STDIN;" crew 

echo COPY pass_rate FROM vdoe
psql -c "COPY (
    SELECT *
    FROM ontime_cohort
  ) TO STDOUT;" vdoe | \
  psql -c "COPY pass_rate FROM STDIN;" crew
  
echo COPY school FROM vdoe
psql -c "COPY (
	SELECT *
	FROM school
  ) TO STDOUT;" vdoe | \
  psql -c "COPY school FROM STDIN;" crew

echo COPY secondary_enrollment FROM vdoe
psql -c "COPY (
    SELECT *
    FROM postsec_enroll
  ) TO STDOUT;" vdoe | \
  psql -c "COPY secondary_enrollment FROM STDIN;" crew
  
echo COPY teacher FROM csv
psql -c "\copy teacher FROM final_teacher_salary.csv WITH CSV HEADER" crew
  
    
