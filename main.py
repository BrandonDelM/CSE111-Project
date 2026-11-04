import sqlite3
from sqlite3 import Error
from sqlite3 import Connection
import json
from datetime import datetime
import requests
from bs4 import BeautifulSoup
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


delete_from_table(conn, 'Faculty')
load_faculty(conn)