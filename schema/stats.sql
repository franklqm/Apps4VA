ANALYZE VERBOSE absentee;
SELECT count(*) AS absent_cnt FROM absentee;

ANALYZE VERBOSE division;
SELECT count(*) AS div_cnt FROM division;

ANALYZE VERBOSE pass_rate;
SELECT count(*) AS pass_cnt FROM pass_rate;

ANALYZE VERBOSE school;
SELECT count(*) AS sch_cnt FROM school;

ANALYZE VERBOSE secondary_enrollment;
SELECT count(*) AS sec_cnt FROM secondary_enrollment;

ANALYZE VERBOSE teacher;
SELECT count(*) AS teach_cnt FROM teacher;
