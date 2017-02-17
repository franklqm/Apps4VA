#!/bin/sh
# Run this script directly on the db server.

echo COPY postsec_enroll FROM vdoe
psql -c "COPY (
    SELECT p.sch_year, p.div_num, d.div_name, p.gender, p.race, p.disabil, p.lep, p.disadva, ps_enrollment_cnt
    FROM postsec_enroll p
	JOIN division d ON p.div_num = d.div_num
  ) TO STDOUT;" vdoe | \
  psql -c "COPY postsec_enroll FROM STDIN;" crew

echo COPY ontime_cohort FROM vdoe
psql -c "COPY (
    SELECT o.sch_year, o.div_num, d.div_name, o.gender, o.disabil, o.lep, o.disadva, o.diploma_rate
    FROM ontime_cohort o
	JOIN division d ON o.div_num = d.div_num
  ) TO STDOUT;" vdoe | \
  psql -c "COPY ontime_cohort FROM STDIN;" crew


