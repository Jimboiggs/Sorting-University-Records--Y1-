CREATE TABLE FACULTIES (
    faculty TEXT NOT NULL PRIMARY KEY
);

INSERT INTO FACULTIES (faculty)
SELECT DISTINCT faculty
FROM facultiescsv;


CREATE TABLE BUILDINGS (
    building TEXT NOT NULL,
    faculty TEXT NOT NULL,
    PRIMARY KEY (building, faculty)
);

INSERT INTO BUILDINGS (building, faculty)
SELECT DISTINCT building, faculty
FROM facultiescsv;


CREATE TABLE ROOMS (
    building TEXT NOT NULL,
    room TEXT NOT NULL,
    capacity INTEGER NOT NULL,
    PRIMARY KEY (building, room)
);

INSERT INTO ROOMS (building, room, capacity)
SELECT DISTINCT building, room, capacity
FROM facultiescsv;


CREATE TABLE LECTURERS (
    lecturer_email TEXT NOT NULL PRIMARY KEY,
    lecturer_firstname TEXT NOT NULL,
    lecturer_surname TEXT NOT NULL
);

INSERT INTO LECTURERS (lecturer_email, lecturer_firstname, lecturer_surname)
SELECT DISTINCT lecturer_email, lecturer_firstname, lecturer_surname
FROM facultiescsv;


CREATE TABLE LECTURERFACULTY (
    lecturer_email TEXT NOT NULL,
    faculty TEXT NOT NULL,
    PRIMARY KEY (lecturer_email, faculty)
);

INSERT INTO LECTURERFACULTY (lecturer_email, faculty)
SELECT DISTINCT lecturer_email, faculty
FROM facultiescsv;


CREATE TABLE STUDENTS (
    studentID INTEGER NOT NULL PRIMARY KEY,
    student_firstname TEXT NOT NULL,
    student_surname TEXT NOT NULL,
    student_email TEXT NOT NULL,
    year INTEGER NOT NULL,
    street TEXT NULL,
    postcode TEXT NULL,
    contact_number TEXT NULL
);

INSERT INTO STUDENTS (studentID, student_firstname, student_surname, student_email, year, street, postcode, contact_number)
SELECT DISTINCT
    studentID,
    student_firstname,
    student_surname,
    student_email,
    year,
    CASE 
        WHEN instr(address, '\n') > 0
            THEN substr(address, 1, instr(address, '\n') - 1)
        ELSE address
    END AS street,

    CASE
        WHEN instr(address, '\n') > 0 THEN
            substr(
                substr(address, instr(address, '\n') + 1),
                length(substr(address, instr(address, '\n') + 1)) - 4
            )
        ELSE NULL
    END AS postcode,
    contact_number
FROM studentscsv;


CREATE TABLE MODULES (
    moduleID TEXT NOT NULL PRIMARY KEY,
    module_name TEXT NOT NULL,
    leader TEXT NOT NULL
);

INSERT INTO MODULES (moduleID, module_name, leader)
SELECT DISTINCT moduleID, module_name, leader
FROM studentscsv;


CREATE TABLE STUDENTMODULES (
    studentID INTEGER NOT NULL,
    moduleID TEXT,
    exam_mark INTEGER,
    PRIMARY KEY (studentID, moduleID)
);

INSERT INTO STUDENTMODULES (studentID, moduleID, exam_mark)
SELECT DISTINCT studentID, moduleID, exam_mark
FROM studentscsv;


CREATE TABLE LECTURERMODULES (
    lecturer_email TEXT NOT NULL,
    moduleID TEXT NOT NULL,
    PRIMARY KEY (lecturer_email, moduleID)
);

INSERT INTO LECTURERMODULES (lecturer_email, moduleID)
SELECT DISTINCT lecturer_email, moduleID FROM (
    SELECT leader AS lecturer_email, moduleID
    FROM studentscsv
    WHERE leader IS NOT NULL AND leader <> ''

    UNION
    
    SELECT lecturer1 AS lecturer_email, moduleID
    FROM studentscsv
    WHERE lecturer1 IS NOT NULL AND lecturer1 <> ''

    UNION

    SELECT lecturer2 AS lecturer_email, moduleID
    FROM studentscsv
    WHERE lecturer2 IS NOT NULL AND lecturer2 <> ''

);


CREATE TABLE COURSEWORKMARKS (
    studentID INTEGER NOT NULL,
    moduleID TEXT NOT NULL,
    courseworkID INTEGER NOT NULL,
    mark INTEGER NOT NULL,
    PRIMARY KEY (studentID, moduleID, courseworkID)
);

INSERT INTO COURSEWORKMARKS (studentID, moduleID, mark)
SELECT DISTINCT studentID, moduleID, coursework1
FROM studentscsv
WHERE coursework1 IS NOT NULL;

INSERT INTO COURSEWORKMARKS (studentID, moduleID, mark)
SELECT DISTINCT studentID, moduleID, coursework2
FROM studentscsv
WHERE coursework2 IS NOT NULL;

INSERT INTO COURSEWORKMARKS (studentID, moduleID, mark)
SELECT DISTINCT studentID, moduleID, coursework3
FROM studentscsv
WHERE coursework3 IS NOT NULL;