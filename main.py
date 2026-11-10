import sqlite3
from sqlite3 import Error
from sqlite3 import Connection
import json
from datetime import datetime
import requests
from bs4 import BeautifulSoup
import random
#Need to install lxml (pip install xmlx)

conn = sqlite3.connect("Checkpoint2-dbase.sqlite3")

def delete_from_table(conn: Connection, table: str):
    cursor = conn.cursor()
    cursor.execute(f"DELETE FROM {table}")
    conn.commit()

def load_clubs(conn: Connection):
    with open('./data/org.json', 'r') as file:
        orgs: json = json.load(file)
    cursor = conn.cursor()

    data = [(i, org['name'], ', '.join(org['categories']), org['description']) for i, org in enumerate(orgs, start=1)]

    cursor.executemany("""
        INSERT OR IGNORE INTO Club VALUES (?,?,?,?)
    """, (data))

    conn.commit()

def load_events(conn: Connection):
    with open('./data/events.json', 'r') as file:
        events: json = json.load(file)
    cursor = conn.cursor()

    data = [(i, 
             event['eventName'], 
             event['organizationName'],
             event['location'], 
             datetime.fromisoformat(event['startDateTimeUtc']).date().isoformat(),
             datetime.fromisoformat(event['startDateTimeUtc']).time().isoformat(),
             datetime.fromisoformat(event['endDateTimeUtc']).time().isoformat()
             ) for i, event in enumerate(events, start=1)]

    cursor.executemany("""
        INSERT OR IGNORE INTO Event VALUES (?,?,?,?,?,?,?)
    """, (data))

    conn.commit()

def load_buildings(conn: Connection):
    with open('./data/buildings.json', 'r') as file:
        data: json = json.load(file)
    cursor = conn.cursor()

    buildings = data['data']

    data = [(i,
             building[2],
             building[1]
             ) for i, building in enumerate(buildings, start=1)]

    cursor.executemany("""
        INSERT OR IGNORE INTO Building VALUES (?,?,?)
    """, (data))

    conn.commit()

def load_rooms(conn: Connection):
    with open('./data/rooms.json', 'r') as file:
        data: json = json.load(file)
    cursor = conn.cursor()

    rooms = data['data']

    data: list = []
    for i in range(1, len(rooms)):
        cursor.execute("""
                    SELECT building_id
                    FROM Building
                    WHERE abbreviation = ?
                """, (rooms[i][5],))

        
        room_id = i
        building_id = cursor.fetchone()[0]
        room_num = rooms[i][1]
        room_type = rooms[i][3]
        capacity = rooms[i][2]

        data.append((room_id, building_id, room_num, room_type, capacity))

    cursor.executemany("""
        INSERT OR IGNORE INTO Room VALUES (?,?,?,?,?)
    """, (data))

    conn.commit()

def load_faculty(conn: Connection):
    cursor = conn.cursor()
    request = requests.get("https://idm.ucmerced.edu/idm/directory/matchEntries/OS/professor/0/330")
    # print(request.text)
    data = json.loads(request.text)
    faculties = data['directoryEntries']
    # with open("output.txt", "w", encoding="utf-8") as file:
    #     file.write(str(data))

    data = [(i, faculty['departments'][0]['departmentTitle'], faculty['departments'][0]['departmentTitle'], None, faculty['firstName'], faculty['lastName'], faculty['email']) for i, faculty in enumerate(faculties)]
    cursor.executemany("""
        INSERT OR IGNORE INTO Faculty VALUES (?,?,?,?,?,?,?)
    """, (data))

    conn.commit()

def load_students(conn: Connection):
    cursor = conn.cursor()
    with open('./data/students.json', 'r') as file:
        data: json = json.load(file)
    students =  data["html"]["body"]["div"][0]["directorycontainerdto"]["directoryentries"]["directoryentries"]
    data: list = []
    i = 307
    majors = ["Aerospace Engineering", "American Studies", "Anthropology", "Applied Mathematical Sciences", "Artificial Intelligence", "Biochemical and Biomolecular Engineering", "Biochemistry", "Bioengineering", "Biological Sciences", "Business Administration", "Chemical Engineering", "Chemistry", "Chicanx Studies", "Civil Engineering", "Cognitive Science", "Communication and Media", "Community Research and Service", "Computer Science", "Computer Science and Engineering", "Critical Race and Ethnic Studies", "Data Science and Analytics", "Data Science and Computing", "Ecology, Evolution, and Conservation Biology", "Economics", "Electrical Engineering", "Environmental Engineering", "Environmental Humanities", "Environmental Systems Science", "Geospatial Technology", "Global Arts Studies", "History", "Liberal Studies", "Literatures in English", "Management Analytics and Decision-Making", "Management and Business Economics", "Management of Innovation, Sustainability, and Technology", "Materials Science and Engineering", "Mechanical Engineering", "Natural Sciences Education", "Neuroscience", "Philosophy", "Physics", "Political Science", "Psychology", "Public Health", "Science, Technology, and Ethics", "Sociology", "Spanish", "Writing Studies"]
    for student in students:
        if student['affiliation'] != 'student': continue
        i += 1
        year = ''
        type = ''
        match random.randint(1,4):
            case 1:
                year = '1st Year'
            case 2:
                year = '2nd Year'
            case 3:
                year = '3rd Year'
            case 4:
                year = '4th Year'
        x = random.uniform(0, 1)
        type = 'Undergraduate'
        if x <= 0.2:
            type = 'Graduate'
        major = majors[random.randint(0, len(majors)-1)]
        
        data.append((i, student['firstname'], student['lastname'], student['email'], year, type, major))
    cursor.executemany("""
        INSERT OR IGNORE INTO Student VALUES (?,?,?,?,?,?,?)
    """, (data))
    conn.commit()

def load_persons(conn: Connection):
    cursor = conn.cursor()
    data: list = []
    cursor.execute("SELECT id, first_name, last_name, email_name FROM Faculty")
    facultys = cursor.fetchall()
    for faculty in facultys:
        data.append((faculty[0], faculty[1], faculty[2], faculty[3]))
    cursor.execute("SELECT * FROM Student")
    students = cursor.fetchall()
    for student in students:
        data.append((student[0], student[1], student[2], student[3]))
    cursor.executemany("""
            INSERT OR IGNORE INTO Person VALUES (?,?,?,?)
        """, (data))
    conn.commit()

def set_faculty(conn: Connection):
    cursor = conn.cursor()
    cursor.execute("SELECT id FROM Faculty")
    faculty_ids: list = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT club_name from Club")
    clubs: list = [row[0] for row in cursor.fetchall()]
    random_faculty = random.sample(faculty_ids, len(clubs))
    cursor.executemany(
            "UPDATE Faculty SET club_affiliation = ? WHERE id = ?",
            list(zip(clubs, random_faculty)),
        )
    conn.commit()

def load_EventAttendance(conn: Connection):
    cursor = conn.cursor()
    cursor.execute("SELECT id, first_name, last_name FROM Student")
    students = cursor.fetchall()
    cursor.execute("SELECT event_id, date FROM Event")
    events = cursor.fetchall()
    for event in events:
        attended: list = [student for student in students if random.random() < 0.025]
        data = [(attendee[0], event[0], attendee[1], attendee[2],event[1]) for attendee in attended]
        cursor.executemany("""
            INSERT OR IGNORE INTO EventAttendance VALUES (?,?,?,?,?)
        """, (data))
        conn.commit()
        
def load_memberOf_officers(conn: Connection):
    cursor = conn.cursor()
    cursor.execute("SELECT id FROM Student")
    students = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT club_name FROM Club")
    clubs = [row[0] for row in cursor.fetchall()]
    random_students = random.sample(students, len(clubs))
    data = [(student_id, 'President', club) for club, student_id in zip(clubs, random_students)]
    cursor.executemany(
        "INSERT OR IGNORE INTO memberOf VALUES (?,?,?)",
        (data),
    )
    conn.commit()
    random_students = random.sample(students, len(clubs))
    data = [(student_id, 'Vice President', club) for club, student_id in zip(clubs, random_students)]
    cursor.executemany(
        "INSERT OR IGNORE INTO memberOf VALUES (?,?,?)",
        (data),
    )
    conn.commit()
    random_students = random.sample(students, len(clubs))
    data = [(student_id, 'Secretary', club) for club, student_id in zip(clubs, random_students)]
    cursor.executemany(
        "INSERT OR IGNORE INTO memberOf VALUES (?,?,?)",
        (data),
    )
    conn.commit()
    random_students = random.sample(students, len(clubs))
    data = [(student_id, 'Treasurer', club) for club, student_id in zip(clubs, random_students)]
    cursor.executemany(
        "INSERT OR IGNORE INTO memberOf VALUES (?,?,?)",
        (data),
    )
    conn.commit()

def load_memberOf_members(conn: Connection):
    cursor = conn.cursor()
    cursor.execute("SELECT id FROM Student")
    students = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT club_name FROM Club")
    clubs = [row[0] for row in cursor.fetchall()]
    for club in clubs:
        cursor.execute("SELECT id FROM memberOf WHERE club_affiliation = ?", (club,))
        officers = [row[0] for row in cursor.fetchall()]
        members = [student for student in students if random.random() < 0.02 and student not in officers]
        data = [(member_id, 'Member', club) for member_id in members]
        cursor.executemany(
            "INSERT OR IGNORE INTO memberOf VALUES (?,?,?)",
            (data),
        )
        conn.commit()


# delete_from_table(conn, 'memberOf')
# load_memberOf_officers(conn)
# load_memberOf_members(conn)