ANALYZE VERBOSE teacher;
SELECT count(*) AS teach_cnt FROM teacher_table;

ANALYZE VERBOSE absentee;
SELECT count(*) AS absent_cnt FROM absentee_table;

ANALYZE VERBOSE pass_rate;
SELECT count(*) AS pass_cnt FROM pass_rate;

ANALYZE VERBOSE secondary_enrollment;
SELECT count(*) AS sec_cnt FROM secondary_enrollment;
