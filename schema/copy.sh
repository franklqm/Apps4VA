#!/bin/sh
# Run this script directly on the db server.

echo COPY pass_rate FROM vdoe
psql -c "COPY (
    SELECT *
    FROM ontime_cohort
  ) TO STDOUT;" vdoe | \
  psql -c "COPY pass_rate FROM STDIN;" crew

echo COPY secondary_enrollment FROM vdoe
psql -c "COPY (
    SELECT *
    FROM postsec_enroll
  ) TO STDOUT;" vdoe | \
  psql -c "COPY secondary_enrollment FROM STDIN;" crew
