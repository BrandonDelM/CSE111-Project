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