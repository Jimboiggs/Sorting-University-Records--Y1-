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