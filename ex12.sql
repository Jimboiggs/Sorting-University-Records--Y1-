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
    lecturer_surname TEXT NOT NULL,
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
    studentID INTEGER NOT NULL,
    student_firstname TEXT NOT NULL,
    student_surname TEXT NOT NULL,
    student_email TEXT NOT NULL,
    year INTEGER NOT NULL,
    street TEXT NULL,
    postcode TEXT NULL,
    contact_number TEXT NULL
);

INSERT INTO STUDENTS (studentID, student_firstname, student_surname, student_email, year, street, postcode, contact_number)
SELECT DISTINCT (
    student_firstname,
    student_surname,
    student_email,
    year,
    substr(address, 1, instr(address, char(10)) - 1) AS street,
    substr(address, length(address) - instr(reverse(address), ' ') + 2) AS postcode,
    contact_number
)
FROM studentscsv;