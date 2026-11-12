-- to test a single query

-- Ensure SQLite foreign key constraints are enforced
PRAGMA foreign_keys = ON;

-- Set output format for readability during evaluation
.headers on
.mode column

----------------------------------------------
-- testing code

-- for single query: sqlite3 cp2-test-db.sqlite3 ".read test-query.sql"

-- for all queries (WARNING: USES ACTUAL DATABASE): 
        -- sqlite3 -bail cp2-test-db.sqlite3 ".read Checkpoint2-script.sql" > query-results.txt 2>&1
            -- puts output in query-results and stops at first error found & sends error message to the file




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