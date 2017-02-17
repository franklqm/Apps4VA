# GROUP NAME

474 Query Crew


# DESCRIPTION

Our application enables policy makers to view and update a list of divisions,
schools, and colleges in Virginia. The data is based on last year's VLDS fall
membership and additional data from NCES.

Our application allows to see the corrleation between teacher salaries and student performance in Virginia.  Student performance is looked at as four year pass rates, absentee rates, and secondary enrollment rates.


# STEPS TO CREATE DATABASE

1. Download create.sql, copy.sh, and stats.sql from git.

3. Run create.sql to create tables with group ownership.

4. Run copy.sh on db.cs.jmu.edu to copy data from VDOE.

5. Run stats.sql to count rows and analyze the tables.
