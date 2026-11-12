-- REFERENCE FOR SCHEMA

-- to check queries from test database paste in terminal:
-- sqlite3 -bail cp2-test-db.sqlite3 ".read Checkpoint2-script.sql" > query-results.txt 2>&1
        -- puts output in query-results and stops at first error found & sends error message to the file


--------------- paste in terminal for quick check of schema--------------------
SELECT name, sql
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

--------------- full schema: .schema ------------------------------------------
CREATE TABLE Club (
    club_id INTEGER PRIMARY KEY,
    club_name VARCHAR(150) NOT NULL,
    club_type,
    club_desc VARCHAR(150)
);

--BTW, added VARCHAR(150) to location, date, start_time, and end_time
CREATE TABLE Event (
    event_id INTEGER PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    club_name VARCHAR(150) NOT NULL,
    location VARCHAR(150),
    date VARCHAR(150),
    start_time VARCHAR(150),
    end_time VARCHAR(150)
);


CREATE TABLE Building (
        building_id INTEGER PRIMARY KEY,
        building_name VARCHAR(150) NOT NULL, 
        abbreviation VARCHAR(150) NOT NULL
);

--Changed room_number to VARCHAR(150)
CREATE TABLE Room (
    room_id INTEGER PRIMARY KEY,
    building_id INTEGER,
    room_number VARCHAR(150),
    room_type VARCHAR(150) NOT NULL,
    capacity INTEGER NOT NULL
);

--Removed Foreign key because it was breaking things
CREATE TABLE Student (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL,
    year INTERGER,
    student_type VARCHAR(150),
    major VARCHAR(150)
    -- FOREIGN KEY (id) REFERENCES Person (id) ON UPDATE CASCADE
    -- ON DELETE RESTRICT
);


CREATE TABLE Person (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL
);

--Added VARCHAR(150) to department_name, school_name, and club_affiliation
--Removed foreign key because it was breaking the code
CREATE TABLE Faculty (
    id INTEGER PRIMARY KEY,
    department_name VARCHAR(150),
    school_name VARCHAR(150),
    club_affiliation VARCHAR(150),
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL
    -- FOREIGN KEY (id) REFERENCES Person (id) ON UPDATE CASCADE
    -- ON DELETE RESTRICT
);


--Added VARCHAR(150) to attendee_date and fixed the spelling error
--Added event_id to connect to event
--Made attendee_id and event_id both primary keys
CREATE TABLE EventAttendance (
        attendee_id INTEGER,
        event_id VARCHAR(150),
        attendee_first_name VARCHAR(150),
        attendee_last_name VARCHAR(150),
        attendee_date VARCHAR(150),
    PRIMARY KEY (attendee_id, event_id)
);

--Removed primary key since a person can have multiple positions
CREATE TABLE memberOf (
    id INTEGER,
    member_type VARCHAR(150) NOT NULL,
    club_affiliation VARCHAR(150)
);