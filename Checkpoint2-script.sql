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
-- 1. Event table: Added VARCHAR(150) to location, date, start_time, and end_time
-- 2. Room table: Changed room_number to VARCHAR(150)
-- 3. Student Table: Removed Foreign keys
-- 4. Faculty table: Added VARCHAR(150) to department_name, school_name, and club_affiliation
--       AND Removed foreign keys
-- 5. EventAttendance table: Added VARCHAR(150) to attendee_date
--       AND fixed the spelling error
--       AND Added event_id to connect to event
--       ANd Made attendee_id and event_id both primary keys
-- 6. memberOf table: Removed primary key since a person can have multiple positions
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
-- Statement 09: Brandon Del Mundo: 50%, Christine Uy: 50%
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
-- Statement 21: Overlapping events using subquery with EXISTS
-- Explanation: Finds events that are over lapping in time.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 21: Overlapping events using subquery with EXISTS ==========' AS " ";

SELECT 
    e.event_name,
    e.date,
    e.start_time,
    e.end_time
FROM Event AS e 
WHERE EXISTS (

    SELECT e2.event_name
    FROM Event As e2 
    WHERE e2.date = e.date
        AND (e2.event_id <> e.event_id)
        AND (e.start_time < e2.start_time)
        AND (e.end_time > e2.start_time)
)
ORDER BY e.date ASC, e.start_time ASC, e.end_time;


-- ----------------------------------------------------------------------------
-- Statement 22: Classify rooms using conditional CASE expressions
-- Explanation: Categorizes rooms as Small (capacity of 1–30), Medium (capacity of 31–75), 
--      or Large (capacity greater than 75), excluding rooms with 0 capacity. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 22: Classify rooms using conditional CASE expressions ==========' AS " ";

SELECT
    b.abbreviation,
    r.room_number,
    r.capacity,
    CASE
        WHEN r.capacity <= 30 THEN 'Small'
        WHEN r.capacity <= 75 THEN 'Medium'
        ELSE 'Large'
    END AS room_size
FROM Room AS r
JOIN Building AS b
    ON r.building_id = b.building_id
WHERE r.capacity > 0
ORDER BY b.abbreviation ASC;


-- ----------------------------------------------------------------------------
-- Statement 23: View Creation showing the number of events hosted by a club
-- Explanation: Creates a view to show the number of events a club has hosted. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 23: View Creation showing the number of events hosted by a club ==========' AS " ";

-- creates view 
DROP VIEW IF EXISTS View_ClubEventCounts;

CREATE VIEW View_ClubEventCounts AS
SELECT
    c.club_name,
    COUNT(e.event_id) AS total_events
FROM Club AS c
LEFT JOIN Event AS e
    ON c.club_name = e.club_name
GROUP BY c.club_name;

-- shows view results
SELECT *
FROM ClubEventCounts
ORDER BY total_events DESC;


-- ----------------------------------------------------------------------------
-- Statement 24: Order of Bobcats on Broadway events using ROW_NUMBER()
-- Explanation:  Assigns a sequential number of events from a club (ex. Bobcats on 
--      Brodway) by using window function ROW_NUMBERS(). Number based on event date
--      and starts with the earlist event.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 24: Order of Bobcats on Broadway events using ROW_NUMBER()  ==========' AS " ";

SELECT
    club_name,
    event_name,
    date,
    ROW_NUMBER() OVER (
        PARTITION BY club_name
        ORDER BY date
    ) AS event_number
FROM Event
WHERE club_name = 'Bobcats on Broadway';


-- ----------------------------------------------------------------------------
-- Statement 25: Ranks the top 5 clubs with the most events. 
-- Explanation: Lists the top 5 clubs that host the most events. Clubs that have the
--      same number of events share the rank. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 25:  Ranks the top 5 clubs with the most events.  ==========' AS " ";

SELECT *
FROM (
    SELECT
        club_name,
        total_events,
        DENSE_RANK() OVER (
            ORDER BY total_events DESC
        ) AS club_rank
    FROM (
        SELECT
            club_name,
            COUNT(*) AS total_events
        FROM Event
        GROUP BY club_name
    )
)
WHERE club_rank <= 5
ORDER BY club_rank;


-- ----------------------------------------------------------------------------
-- Statement 26: Find the most popular event for each club
-- Explanation: Using the window function ROW_number to find a clubs most attended event.
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 26: Find the most popular event for each club ==========' AS " ";

SELECT
    club_name,
    event_name,
    total_attendance
FROM (
    SELECT
        e.club_name,
        e.event_name,
        COUNT(ea.attendee_id) AS total_attendance,
        ROW_NUMBER() OVER (
            PARTITION BY e.club_name
            ORDER BY COUNT(ea.attendee_id) DESC
        ) AS event_rank
    FROM Event AS e
    LEFT JOIN EventAttendance AS ea
        ON e.event_id = ea.event_id
    GROUP BY e.event_id, e.club_name, e.event_name
)
WHERE event_rank = 1;


-- ----------------------------------------------------------------------------
-- Statement 27: Classify club based on number of events (CASE)
-- Explanation: Classify clubs as 'Very Active' (20 or more events), 'Active'
--      (10 - 19 events), 'Low Activity' (1 - 9 events), or states club has no events. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 27: Classify club based on number of events (CASE)  ==========' AS " ";

SELECT
    club_name,
    total_events,
    CASE
        WHEN total_events >= 20 THEN 'Very Active'
        WHEN total_events >= 10 THEN 'Active'
        WHEN total_events >= 1 THEN 'Low Activity'
        ELSE 'No Events'
    END AS activity_level
FROM (
    SELECT
        c.club_name,
        COUNT(e.event_id) AS total_events
    FROM Club AS c
    LEFT JOIN Event AS e
        ON c.club_name = e.club_name
    GROUP BY c.club_id, c.club_name
)
ORDER BY total_events DESC;

-- ----------------------------------------------------------------------------
-- Statement 28: Find clubs hosting events in the first week of the months (INTERSECT)
-- Explanation: Shows the clubs that host at least one event during the first 
--      week of the month. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 28: Find clubs hosting events in the first week of the months (INTERSECT) ==========' AS " ";

SELECT club_name
FROM Event
WHERE date BETWEEN '2026-10-01' AND '2026-10-07'

INTERSECT

SELECT club_name
FROM Event
WHERE date BETWEEN '2026-11-01' AND '2026-11-07'

ORDER BY club_name;

-- ----------------------------------------------------------------------------
-- Statement 29: Show clubs most recent events. 
-- Explanation: Uses the window function ROW_NUMBER to find each clubs most
--      recent event. 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 29: Show clubs most recent events. ==========' AS " ";

SELECT
    club_name,
    event_name,
    date
FROM (
    SELECT
        club_name,
        event_name,
        date,
        ROW_NUMBER() OVER (
            PARTITION BY club_name
            ORDER BY date DESC
        ) AS event_number
    FROM Event
)
WHERE event_number = 1
ORDER BY club_name;

-- ----------------------------------------------------------------------------
-- Statement 30: View showing number of events by location. 
-- Explanation: Creates a view that shows the number of events in each location. 
-- ----------------------------------------------------------------------------

SELECT '========== SECTION 3: QUERY 30: View showing number of events by location.  ==========' AS " ";

DROP VIEW IF EXISTS View_EventsByLocation;

CREATE VIEW View_EventsByLocation AS
SELECT
    location,
    COUNT(*) AS total_events
FROM Event
GROUP BY location;

SELECT *
FROM View_EventsByLocation
ORDER BY total_events DESC;