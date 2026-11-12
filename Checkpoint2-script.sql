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
-- Statement 05: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 06: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 07: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 08: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 09: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 10: 
-- Explanation: 
-- ----------------------------------------------------------------------------



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


-- ----------------------------------------------------------------------------
-- Statement 05: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 06: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 07: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 08: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 09: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 10: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ============================================================================
-- SECTION 3: COMPLEX STATEMENTS (Statements 22 to 32)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 01: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 02: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 03:
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 04: 
-- Explanation:  
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 05: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 06: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 07: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 08: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 09: 
-- Explanation: 
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Statement 10: 
-- Explanation: 
-- ----------------------------------------------------------------------------
