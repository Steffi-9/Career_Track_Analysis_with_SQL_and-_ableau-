# Case Description

One of the functionalities the 365 company introduced in a 2021 platform release included the option for student enrollment in a career track. The tracks represent an ordinal sequence of courses that eventually lead to obtaining the skills for one of three job titles: data scientist, data analyst, or business analyst.

Completing a career track on the platform is a challenging task. To acquire a corresponding career certificate, a student must pass nine course exams (seven compulsory and two elective courses) and sit for a career track exam encompassing topics from all seven required courses.

In this Career Track Analysis with SQL and Tableau project, you’re tasked with analyzing the career track enrollments and achievements of 365’s students. You’ll first need to retrieve the necessary information from an SQL database. Afterward, you’ll feed this information to Tableau, visualize the results, and finally interpret them.

# Project requirements

You’ll work with MySQL Workbench 8.0 and Tableau 2022 or newer for this project.

# Extracting the Data with SQL

In this Career Track Analysis with SQL and Tableau project, you’re tasked with analyzing the career track enrollments and completions of 365’s students. You’ll first need to retrieve the necessary information from an SQL database. Afterward, you’ll feed this information to Tableau and visualize the results.

Study the sql_and_tableau database, consisting of the following tables:

career_track_info

track_id – the unique identification of a track, which serves as the primary key to the table

track_name – the name of the track

career_track_student_enrollments

student_id – the unique identification of a student

track_id – the unique identification of a track. Together with the previous column, they make up the primary key to the table—i.e., each student can enroll in a specific track only once. But a student can enroll in more than one career track.

date_enrolled – the date the student enrolled in the track. A student can enroll in more than one career track.

date_completed – the date the student completed the track. If the track is not completed, the field is NULL.

# Creating a Combo Chart in Tableau


![image](https://github.com/Steffi-9/Career_Track_Analysis_with_SQL_and-_ableau-/assets/58806839/02e5d9c7-5316-4219-8eea-da971960d38c)

# Creating a Bar Chart in Tableau


![image](https://github.com/Steffi-9/Career_Track_Analysis_with_SQL_and-_ableau-/assets/58806839/3891fbdd-ae9d-4a82-9e81-dc370ae84e73)

# Interpreting the Results

- Studying the height of the bars, we observe a fluctuating number of people enrolling monthly (roughly 800 and 1,200), with August registering a higher number.

- When considering the number of enrolled students per track, the data analyst career track is the most sought after among 365 students, followed by the data science track and, finally, the business analyst one.

- Studying the line part of the combo chart, we see the numbers fluctuating. But the passing rate (around 2%) is relatively low, with numbers varying between tracks. Therefore, it’s difficult to state any dependency with time—i.e., we can’t conclude with certainty the completion rate increases, decreases, or stays constant.

- We can argue, that students need a lot of time to complete an entire career track. This claim is supported by the second bar chart created in the project, where we’ve seen that it takes students an annual subscription to complete a single career track.

  








