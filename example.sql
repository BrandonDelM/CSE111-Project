SELECT first_name, last_name, email_name
FROM Faculty
WHERE department_name = 'Physics';

SELECT first_name, last_name, year, major
FROM Student
WHERE year = '1st Year';

SELECT year, COUNT(*)
FROM Student
GROUP BY year;

SELECT department_name, COUNT(*)
FROM Faculty
GROUP BY department_name;

SELECT e.club_name, e.event_name, c.club_type
FROM Club c, Event e
WHERE club_type LIKE '%Academic%'
AND e.club_name = c.club_name;

SELECT last_name, first_name, club_affiliation
FROM Student s, memberOf mo
WHERE s.id = mo.id
AND s.major like 'Computer Science%'
ORDER BY 1, 2;

SELECT club_name, event_name, date, location, capacity
FROM event e, building b, room r
WHERE e.location like (b.abbreviation || '%')
AND b.building_id = r.building_id
AND e.location like ('%' || r.room_number)
AND r.capacity > 30
ORDER BY 1, 2, 3;