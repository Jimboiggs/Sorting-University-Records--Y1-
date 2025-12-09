CREATE TABLE FACULTIES (
    faculty TEXT PRIMARY KEY
);

INSERT INTO FACULTIES (faculty)
SELECT DISTINCT faculty
FROM facultiescsv;


CREATE TABLE BUILDINGS (
    building TEXT,
    faculty TEXT,
    PRIMARY KEY (building, faculty)
);

INSERT INTO BUILDINGS (building, faculty)
SELECT DISTINCT building, faculty
FROM facultiescsv;


CREATE TABLE ROOMS (
    building TEXT,
    room TEXT,
    capacity INTEGER,
    PRIMARY KEY (building, room)
);

INSERT INTO ROOMS (building, room, capacity)
SELECT DISTINCT building, room, capacity
FROM facultiescsv;


CREATE TABLE LECTURERS (
    lecturer_email TEXT PRIMARY KEY,
    lecturer_firstname TEXT,
    lecturer_surname TEXT,
);

INSERT INTO LECTURERS (lecturer_email, lecturer_firstname, lecturer_surname)
SELECT DISTINCT lecturer_email, lecturer_firstname, lecturer_surname
FROM facultiescsv;


CREATE TABLE LECTURERFACULTY (
            lecturer_email TEXT,
            faculty TEXT,
            PRIMARY KEY (lecturer_email, faculty)
);

INSERT INTO LECTURERFACULTY (lecturer_email, faculty)
SELECT DISTINCT lecturer_email, faculty
FROM facultiescsv;


CREATE TABLE STUDENTS (
    studentID INTEGER,
    student_firstname TEXT,
    student_surname TEXT,
    student_email TEXT,
    year INTEGER,
    street TEXT,
    postcode TEXT,
    contact_number TEXT
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