SELECT studentID, student_firstname, student_surname, exam_mark
FROM STUDENTS
RIGHT JOIN STUDENTMODULES ON STUDENTS.studentID = STUDENTMODULES.studentID
WHERE year = 1 AND moduleID LIKE '%COMP%'
ORDER BY mark DESC;