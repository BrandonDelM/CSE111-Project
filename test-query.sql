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

