INSERT INTO one_day_course_summaries
SELECT *
FROM current_one_day_course_summaries_view
WHERE one_day_course_id = 1;

INSERT INTO one_day_course_summaries
SELECT *
FROM current_one_day_course_summaries_view
WHERE one_day_course_id IN (1, 2, 3, 4, 5);

INSERT INTO one_day_course_summaries
SELECT *
FROM current_one_day_course_summaries_view
WHERE one_day_course_id BETWEEN 1 AND 5;

INSERT INTO one_day_course_summaries
SELECT *
FROM current_one_day_course_summaries_view
WHERE one_day_course_id >= 1 AND one_day_course_id <= 5;
