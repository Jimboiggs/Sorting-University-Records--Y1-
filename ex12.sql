CREATE TABLE FACULTIES (
    faculty TEXT PRIMARY KEY
);

INSERT INTO FACULTIES (faculty)
SELECT DISTINCT faculty
FROM facultiescsv;


CREATE TABLE BUILDINGS (
    building TEXT PRIMARY KEY,
    faculty TEXT
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