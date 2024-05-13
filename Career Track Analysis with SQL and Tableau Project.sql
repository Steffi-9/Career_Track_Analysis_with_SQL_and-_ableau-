Use sql_and_tableau;
Select * FROM career_track_info;
Select * FROM career_track_student_enrollments;
Select ROW_NUMBER() OVER(ORDER BY student_id,track_name DESC ) AS student_track_id ,track_name,student_id,date_enrolled,date_completed,
IF(date_completed IS NULL,0,1) AS track_completed,datediff(date_completed,date_enrolled) AS days_for_completion FROM 
career_track_info JOIN career_track_student_enrollments ON career_track_info.track_id = career_track_student_enrollments.track_id;
SELECT 
    student_track_id,student_id,track_name,date_enrolled,track_completed,days_for_completion,
    CASE
	   WHEN days_for_completion = 0 THEN 'Same day'
       WHEN days_for_completion BETWEEN 1 and 7  THEN '1 to 7 days'
       WHEN days_for_completion BETWEEN 8 and 30  THEN '8 to 30 days'
       WHEN days_for_completion BETWEEN 31 and 60  THEN '31 to 60 days'
       WHEN days_for_completion BETWEEN 61 and 90  THEN '61 to 90 days'
       WHEN days_for_completion BETWEEN 91 and 365  THEN '91 to 365 days'
       ELSE '366+ days'
       
    END AS completion_bucket
FROM
( Select ROW_NUMBER() OVER(ORDER BY student_id,track_name DESC ) AS student_track_id ,track_name,student_id,date_enrolled,date_completed,
IF(date_completed IS NULL,0,1) AS track_completed,datediff(date_completed,date_enrolled) AS days_for_completion FROM 
career_track_info JOIN career_track_student_enrollments ON career_track_info.track_id = career_track_student_enrollments.track_id ) a;


-- Study your solution to Extracting the Data with SQL. How many days did it take the student with the most extended completion period to complete a career track?

SELECT 
    student_track_id,student_id,track_name,days_for_completion,
    CASE
	   WHEN days_for_completion = 0 THEN 'Same day'
       WHEN days_for_completion BETWEEN 1 and 7  THEN '1 to 7 days'
       WHEN days_for_completion BETWEEN 8 and 30  THEN '8 to 30 days'
       WHEN days_for_completion BETWEEN 31 and 60  THEN '31 to 60 days'
       WHEN days_for_completion BETWEEN 61 and 90  THEN '61 to 90 days'
       WHEN days_for_completion BETWEEN 91 and 365  THEN '91 to 365 days'
       ELSE '366+ days'
       
    END AS completion_bucket
FROM
( Select ROW_NUMBER() OVER(ORDER BY student_id,track_name DESC ) AS student_track_id ,track_name,student_id,date_enrolled,date_completed,
IF(date_completed IS NULL,0,1) AS track_completed,datediff(date_completed,date_enrolled) AS days_for_completion FROM 
career_track_info JOIN career_track_student_enrollments ON career_track_info.track_id = career_track_student_enrollments.track_id ) a
where days_for_completion=(Select max(days_for_completion) from (Select ROW_NUMBER() OVER(ORDER BY student_id,track_name DESC ) AS student_track_id ,track_name,student_id,date_enrolled,date_completed,
IF(date_completed IS NULL,0,1) AS track_completed,datediff(date_completed,date_enrolled) AS days_for_completion FROM 
career_track_info JOIN career_track_student_enrollments ON career_track_info.track_id = career_track_student_enrollments.track_id ) b) 
GROUP BY student_track_id,student_id,track_name,days_for_completion;


-- Question 3:
-- Study your solution to Extracting the Data with SQL. How many track completions are there in total?
 SELECT count(track_completed) from(
SELECT 
    student_track_id,student_id,track_name,date_enrolled,track_completed,days_for_completion,
    CASE
	   WHEN days_for_completion = 0 THEN 'Same day'
       WHEN days_for_completion BETWEEN 1 and 7  THEN '1 to 7 days'
       WHEN days_for_completion BETWEEN 8 and 30  THEN '8 to 30 days'
       WHEN days_for_completion BETWEEN 31 and 60  THEN '31 to 60 days'
       WHEN days_for_completion BETWEEN 61 and 90  THEN '61 to 90 days'
       WHEN days_for_completion BETWEEN 91 and 365  THEN '91 to 365 days'
       ELSE '366+ days'
       
    END AS completion_bucket
FROM
( Select ROW_NUMBER() OVER(ORDER BY student_id,track_name DESC ) AS student_track_id ,track_name,student_id,date_enrolled,date_completed,
IF(date_completed IS NULL,0,1) AS track_completed,datediff(date_completed,date_enrolled) AS days_for_completion FROM 
career_track_info JOIN career_track_student_enrollments ON career_track_info.track_id = career_track_student_enrollments.track_id ) a) b
WHERE track_completed=1 ;



