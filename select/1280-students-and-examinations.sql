/*
Link: https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50

Topic: JOIN, GROUP BY, COUNT
Pattern: CROSS JOIN + LEFT JOIN + aggregation

Approach: 
Generate every student-subject pair, then count matching exam records.

Complexity:
Approximately O(S * U + E), depending on the execution plan,
where S = students, U = subjects, and E = examination records.

What tripped me up:
Joining multiple tables and ensuring subjects with zero attended exams are preserved with 0 count, plus ensuring ORDER BY sorts by both student_id and subject_name as specified by the problem.

What I learned:
CROSS JOIN creates all combinations; LEFT JOIN preserves
combinations with no matching exam records. Ordering by student_id, subject_name produces deterministic output matching the expected format.

*/

SELECT
    Students.student_id,
    Students.student_name,
    Subjects.subject_name,
    COUNT(Examinations.subject_name) AS attended_exams
FROM Students
CROSS JOIN Subjects
LEFT JOIN Examinations
    ON Students.student_id = Examinations.student_id
    AND Subjects.subject_name = Examinations.subject_name
GROUP BY
    Students.student_id,
    Students.student_name,
    Subjects.subject_name
ORDER BY
    Students.student_id,
    Subjects.subject_name;
