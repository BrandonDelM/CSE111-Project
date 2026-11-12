-- ============================================================================
-- CSE 111 Fall 2026: Project Checkpoint 2 Script
-- Project Title: Club Event Organizer
-- Team Members: Brandon Del Mundo, Christine Uy
-- File: Checkpoint2-script.sql
-- ============================================================================


-- ============================================================================
-- SCHEMA MODIFICATIONS SINCE CHECKPOINT 1
-- ============================================================================
-- Explain any modifications to your relational schema made since Checkpoint 1.
-- (e.g., added indexes, modified check constraints, renamed columns, or
-- clarified weak entity vs. junction relationships). If no changes were made,
-- explicitly state: "No modifications made to the Checkpoint 1 schema."
--
-- Modifications:
-- 1. [Description of schema modification 1, or None]
-- 2. [Description of schema modification 2]
-- ============================================================================


-- ============================================================================
-- MEMBER CONTRIBUTIONS SUMMARY (GROUPED AT THE TOP)
-- ============================================================================
-- SECTION 1: SIMPLE STATEMENTS
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 02: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 03: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 04: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 05: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 06: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 07: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 08: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 9: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 10: Brandon Del Mundo: 50%, Christine Uy: 50%

--SECTION 2: INTERMEDIATE STATEMENTS
-- Statement 11: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 12: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 13: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 14: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 15: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 16: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 17: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 18: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 19: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 20: Brandon Del Mundo: 50%, Christine Uy: 50%

-- SECTION 3: COMPLEX STATEMENTS
-- Statement 21: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 22: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 23: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 24: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 25: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 26: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 27: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 28: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 29: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 30: Brandon Del Mundo: 50%, Christine Uy: 50%
-- ============================================================================

-- Ensure SQLite foreign key constraints are enforced
PRAGMA foreign_keys = ON;

-- Set output format for readability during evaluation
.headers on
.mode column


-- ============================================================================
-- SECTION 1: SIMPLE STATEMENTS (Statements 1 to 10)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 01: All first year students 
-- Explanation: Lists the name, year, and major of all the first year students.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 1: All First year students ==========' AS " ";

SELECT first_name , last_name, year, major
FROM Student
WHERE year = '1st Year';


-- ----------------------------------------------------------------------------
-- Statement 02: Physics faculty
-- Explanation: Retrieve the name and email of all the faculty in the physics 
--                  department.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 2: Physics faculty ==========' AS " ";

SELECT first_name, last_name, email_name
FROM Faculty
WHERE department_name = 'Physics';


-- ----------------------------------------------------------------------------
-- Statement 03: Total students by year
-- Explanation: Shows count of how many students are in each year
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 3: Total students by year ==========' AS " ";

SELECT year, COUNT(*) AS total_students
FROM Student
GROUP BY year;


-- ----------------------------------------------------------------------------
-- Statement 04: Total faculty by department 
-- Explanation: Retreives the id, department name, school name, 
--                  club affiliation, name, and email  of all the faculty 
--                  members in the database. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 4: Total faculty by department  ==========' AS " ";

SELECT department_name, COUNT(*) AS total_faculty
FROM Faculty
GROUP BY department_name;


-- ----------------------------------------------------------------------------
-- Statement 05: Tests inserting and deleting a new building
-- Explanation: Inserts the test building with its id, name, abbreviation. 
--      Shows building to confirm it was inserted, then deletes test building. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 5: Tests inserting/deleting a new building ==========' AS " ";

-- inserts test building
INSERT INTO Building (building_id, building_name, abbreviation)
VALUES (999, 'TEST BUILDING', 'TEST');

-- prints out club info to confirm club was added
SELECT *
FROM Building
WHERE building_id = 999;

-- deletes test building
DELETE FROM Building
WHERE building_id = 999;


-- ----------------------------------------------------------------------------
-- Statement 06: Inserts new club and updates description
-- Explanation: Inserts a test club then updates description, shows both before 
--      and after description to show updated info. Deletes test club afterwards. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 6: Tests inserting/updating/deleting a club desc  ==========' AS " ";

INSERT INTO Club (club_id, club_name, club_type, club_desc)
VALUES (999, 'TEST CLUB', 'Test', 'Test club for query');

-- prints out club info to confirm club was added
SELECT *
FROM Club
WHERE club_id = 999;

SELECT 'updated club desc' AS " ";

-- updates club description
UPDATE Club
SET club_desc = 'Updated club desc'
WHERE club_id = 999;

-- prints out club info to confirm club updated
SELECT *
FROM Club
WHERE club_id = 999;

-- deletes test club
DELETE FROM Club
WHERE club_id = 999;


-- ----------------------------------------------------------------------------
-- Statement 07: Chronological orders of events during last week of October 
-- Explanation: Shows events during the month of October in chronological order
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 7: Chronological orders of events during last week of October ==========' AS " ";

SELECT 
    event_name AS Events_in_October,
    date
FROM Event
WHERE date BETWEEN '2026-10-25' AND '2026-10-31'
ORDER BY date ASC;


-- ----------------------------------------------------------------------------
-- Statement 08: Fraternity and Sorority filer
-- Explanation: Lists the name of all the Fraternity and Sorority.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 8: Fraternity and Sorority filer ==========' AS " ";

SELECT club_name
FROM Club
WHERE club_type LIKE '%Fraternity%' 
    OR club_type LIKE '%Sorority%';


-- ----------------------------------------------------------------------------
-- Statement 09: Number of students in major
-- Explanation: Counts the total number of students for a certain major
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 9: Number of students in major  ==========' AS " ";

SELECT
    major,
    COUNT(id) AS total_students
FROM Student
GROUP BY major
ORDER BY total_students DESC;


-- ----------------------------------------------------------------------------
-- Statement 10: Counts the members of each club
-- Explanation: Counts the number of members from each club.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 1: QUERY 10: Counts the members of each club  ==========' AS " ";

SELECT 
    club_affiliation AS club,
    COUNT(id) AS num_of_memembers
FROM memberOf
GROUP BY club_affiliation
ORDER BY club_affiliation ASC;


-- ============================================================================
-- SECTION 2: INTERMEDIATE STATEMENTS (Statements 11 to 21)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 11: Academic clubs and events (2-Table Inner Join)
-- Explanation: Shows all clubs that have club type of academic and their events. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 11: Academic clubs and events ==========' AS " ";

SELECT e.club_name, e.event_name, c.club_type
FROM Club c
JOIN Event e ON e.club_name = c.club_name
WHERE club_type LIKE '%Academic%';


-- ----------------------------------------------------------------------------
-- Statement 12: Computer Science majors and their clubs (2-Table Inner Join)
-- Explanation: Lists the clubs of students who are computer science majors.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 12: Computer Science majors and their clubs ==========' AS " ";

SELECT last_name, first_name, club_affiliation
FROM Student s, memberOf mo
WHERE s.id = mo.id
AND s.major like 'Computer Science%'
ORDER BY 1, 2;


-- ----------------------------------------------------------------------------
-- Statement 13: Events in rooms with capacity over 30 (Multi-Table Join)
-- Explanation: Lists the events taken place in rooms that have a room 
--      capacity over 30 people. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 13: Events in rooms with capacity over 30 ==========' AS " ";

SELECT club_name, event_name, date, location, capacity
FROM event e, building b, room r
WHERE e.location like (b.abbreviation || '%')
AND b.building_id = r.building_id
AND e.location like ('%' || r.room_number)
AND r.capacity > 30
ORDER BY 1, 2, 3;


-- ----------------------------------------------------------------------------
-- Statement 14: Clubs with no events (2-table Left Outer Join)
-- Explanation: Lists clubs that have not had any events. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 14: Clubs with no events (2-table Left Outer Join) ==========' AS " ";

SELECT c.club_name, c.club_type
FROM Club As c
LEFT JOIN Event AS e 
    ON c.club_name = e.club_name
WHERE e.event_id IS NULL
ORDER BY c.club_name;


-- ----------------------------------------------------------------------------
-- Statement 15: Counts event attendance
-- Explanation: Counts the number of attendees for each event and lists the 
--      event name and its club. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 15:  Counts event attendance ==========' AS " ";

SELECT 
    c.club_name,
    e.event_name,
    COUNT(ea.attendee_id) AS total_attendees
FROM Event AS e 
LEFT JOIN EventAttendance AS ea 
    ON e.event_id = ea.event_id
LEFT JOIN Club AS c
    ON e.club_name = c.club_name
GROUP BY e.event_id, e.event_name 
ORDER BY total_attendees DESC;


-- ----------------------------------------------------------------------------
-- Statement 16: List students who are in multiple clubs
-- Explanation: Finds students who are in more than 1 club and orders them in 
--      descending order of amount of clubs. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 16: List students who are in multiple clubs (GROUP BY & HAVING) ==========' AS " ";

SELECT 
    s.first_name,
    s.last_name,
    COUNT(mo.club_affiliation) AS num_clubs
FROM Student AS s 
JOIN memberOf AS mo 
    ON s.id = mo.id
GROUP BY s.id
HAVING COUNT(mo.club_affiliation) > 1
ORDER BY num_clubs DESC;


-- ----------------------------------------------------------------------------
-- Statement 17: Clubs that host popular events (Scalar Subquery)
-- Explanation: Finds the clubs that host events with attendence above 
--      the adverage attendance across all events. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 17: Clubs that host popular events (Scalar Subquery)  ==========' AS " ";

SELECT 
    e.club_name,
    e.event_name,
    COUNT(ea.attendee_id) AS num_attendees
FROM Event AS e 
JOIN EventAttendance AS ea 
    ON e.event_id = ea.event_id 
GROUP BY e.event_id, e.club_name, e.event_name
HAVING COUNT(ea.attendee_id) > (
    -- finds avg attendance
    SELECT AVG(total_attendees)
    FROM (
        --calc total attendance
        SELECT 
            event_id,
            COUNT(*) As total_attendees
        FROM EventAttendance
        GROUP BY event_id
        )
    )
ORDER BY num_attendees DESC;


-- ----------------------------------------------------------------------------
-- Statement 18: Faculity in no clubs (Subquery NOT IN)
-- Explanation: Lists the Faculity who are not in any clubs. Every club must
--      have one faculity member and a faculity member can only oversee one club.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 18: Faculity in no clubs  ==========' AS " ";

SELECT 
   first_name,
   last_name,
   email_name
FROM Faculty AS f
WHERE f.id NOT IN (
    SELECT m.id
    FROM memberOf AS m
);


-- ----------------------------------------------------------------------------
-- Statement 19: Events on the same day (Subquery & HAVING)
-- Explanation: Shows event that are taking place on the same day and lists the
--      event's details and club hosting them. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 19: Statement 19: Events on the same day (Subquery & HAVING) ==========' AS " ";

SELECT
    e.event_name,
    e.date,
    e.start_time,
    e.end_time,
    c.club_name
FROM Event AS e
JOIN Club AS c 
    ON e.club_name = c.club_name
WHERE e.date IN (

    --query that shows only events that share the same day
    SELECT date
    FROM Event
    GROUP BY date
    HAVING COUNT(*) > 1
)
ORDER BY e.date ASC, e.start_time ASC, e.end_time ASC;


-- ----------------------------------------------------------------------------
-- Statement 20: List president of each club (mult-table JOIN)
-- Explanation: List the club, its president and the president's email of each club.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 20: List president of each club (mult-table JOIN) ==========' AS " ";

SELECT 
    c.club_name,
    s.first_name,
    s.last_name,
    s.email_name
FROM Student AS s 
JOIN memberOf AS mo 
    ON s.id = mo.id 
JOIN Club AS c 
    ON mo.club_affiliation = c.club_name
WHERE mo.member_type = 'President';



-- ============================================================================
-- SECTION 3: COMPLEX STATEMENTS (Statements 21 to 30)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 21: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 21:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 22: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 22:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 23: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 23:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 24: 
-- Explanation:  
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 24:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 25: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 25:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 26: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 26:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 27: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 27:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 28: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 28:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 29: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 29:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 30: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 30:  ==========' AS " ";