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
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%

--SECTION 2: INTERMEDIATE STATEMENTS
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%

-- SECTION 3: COMPLEX STATEMENTS
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
-- Statement 01: Brandon Del Mundo: 50%, Christine Uy: 50%
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
-- Statement 01: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 1: ==========' AS " ";

SELECT e.club_name, e.event_name, c.club_type
FROM Club c, Event e
WHERE club_type LIKE '%Academic%'
AND e.club_name = c.club_name;


-- ----------------------------------------------------------------------------
-- Statement 02: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 2: ==========' AS " ";

SELECT last_name, first_name, club_affiliation
FROM Student s, memberOf mo
WHERE s.id = mo.id
AND s.major like 'Computer Science%'
ORDER BY 1, 2;


-- ----------------------------------------------------------------------------
-- Statement 03: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 3: ==========' AS " ";

SELECT club_name, event_name, date, location, capacity
FROM event e, building b, room r
WHERE e.location like (b.abbreviation || '%')
AND b.building_id = r.building_id
AND e.location like ('%' || r.room_number)
AND r.capacity > 30
ORDER BY 1, 2, 3;


-- ----------------------------------------------------------------------------
-- Statement 04: 
-- Explanation:  
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 4:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 05: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 5:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 06: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 6:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 07: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 7:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 08: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 8:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 09: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 9:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 10: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 2: QUERY 10:  ==========' AS " ";

-- ============================================================================
-- SECTION 3: COMPLEX STATEMENTS (Statements 22 to 32)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 01: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 1:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 02: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 2:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 03:
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 3:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 04: 
-- Explanation:  
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 4:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 05: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 5:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 06: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 6:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 07: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 7:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 08: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 8:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 09: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 9:  ==========' AS " ";

-- ----------------------------------------------------------------------------
-- Statement 10: 
-- Explanation: 
-- ----------------------------------------------------------------------------
SELECT '========== SECTION 3: QUERY 10:  ==========' AS " ";