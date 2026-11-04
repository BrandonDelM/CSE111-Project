--Created by Christine Uy and Brandon Del Mundo

CREATE TABLE Person (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL,
);

CREATE TABLE Student (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL,
    year INTERGER,
    student_type VARCHAR(150),
    major VARCHAR(150),
    FOREIGN KEY (id) REFERENCES Person (id) ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Faculty (
    id INTEGER PRIMARY KEY,
    department_name,
    school_name,
    club_affiliation,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_name VARCHAR(150) NOT NULL,
    FOREIGN KEY (id) REFERENCES Person (id) ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Club (
    club_id INTEGER PRIMARY KEY,
    club_name VARCHAR(150) NOT NULL,
    club_type,
    club_desc VARCHAR(150)
);

CREATE TABLE EventAttendance (
	attendee_id INTEGER PRIMARY KEY,
	attendee_first_name VARCHAR(150),
	attendee_last_name VARCHAR(150),
	ateendee_date 
);

CREATE TABLE Event (
    event_id INTEGER PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    club_name VARCHAR(150) NOT NULL,
    location,
    date,
    start_time,
    end_time
);

CREATE TABLE Building (
	building_id INTEGER PRIMARY KEY,
	building_name VARCHAR(150) NOT NULL, 
	abbreviation VARCHAR(150) NOT NULL
);

CREATE TABLE Room (
    room_id INTEGER PRIMARY KEY,
    building_id INTEGER,
    room_number INTEGER,
    room_type VARCHAR(150) NOT NULL,
    capacity INTEGER NOT NULL
);

CREATE TABLE memberOf (
    id INTEGER PRIMARY KEY,
    member_type VARCHAR(150) NOT NULL,
    club_affiliation VARCHAR(150)
);