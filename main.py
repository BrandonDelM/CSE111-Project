import sqlite3
from sqlite3 import Error
from sqlite3 import Connection
import json
from datetime import datetime

conn = sqlite3.connect("Checkpoint2-dbase.sqlite3")

def delete_from_table(conn: Connection, table: str):
    cursor = conn.cursor()
    cursor.execute(f"DELETE FROM {table}")
    conn.commit()

def load_clubs(conn: Connection):
    with open('org.json', 'r') as file:
        orgs: json = json.load(file)
    cursor = conn.cursor()

    data = [(i, org['name'], ', '.join(org['categories']), org['description']) for i, org in enumerate(orgs, start=1)]

    cursor.executemany("""
        INSERT OR IGNORE INTO Club VALUES (?,?,?,?)
    """, (data))

    conn.commit()

def load_events(conn: Connection):
    with open('events.json', 'r') as file:
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

delete_from_table(conn, 'Event')
load_events(conn)