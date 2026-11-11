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
-- Statement 01: First year students 
-- Explanation: Lists the name, year, and major of all the first year students.
-- ----------------------------------------------------------------------------
SELECT first_name, last_name, year, major
FROM Student
WHERE year = '1st Year';

-- ----------------------------------------------------------------------------
-- Statement 02: Physics faculty
-- Explanation: Retrieve the name and email of all the faculty in the physics 
--                  department.
-- ----------------------------------------------------------------------------
SELECT first_name, last_name, email_name
FROM Faculty
WHERE department_name = 'Physics';

-- ----------------------------------------------------------------------------
-- Statement 03: All students in database
-- Explanation: Retreives the id, name, email, year, student type, and
--                   major of all students
-- ----------------------------------------------------------------------------
SELECT year, COUNT(*)
FROM Student
GROUP BY year;

-- ----------------------------------------------------------------------------
-- Statement 04: All faculty members in database
-- Explanation: Retreives the id, department name, school name, 
--                  club affiliation, name, and email  of all the faculty 
--                  members in the database. 
-- ----------------------------------------------------------------------------
SELECT department_name, COUNT(*)
FROM Faculty
GROUP BY department_name;


-- ============================================================================
-- SECTION 2: INTERMEDIATE STATEMENTS (Statements 11 to 21)
-- ============================================================================


-- ============================================================================
-- SECTION 3: COMPLEX STATEMENTS (Statements 22 to 32)
-- ============================================================================

