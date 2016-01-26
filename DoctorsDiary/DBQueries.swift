//
//  DBQueries.swift
//  DoctorsDiary
//
//  Created by Akmal Hossain on 25/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import Foundation

class DBQueries{

    let create_appointments_table = "CREATE TABLE IF NOT EXISTS APPOINTMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, DATE TEXT, DESCRIPTION TEXT)"
    
    let create_notes_table = "CREATE TABLE IF NOT EXISTS NOTES (ID INTEGER PRIMARY KEY AUTOINCREMENT, TOPIC TEXT, DATE TEXT, CONTENT TEXT)"
    
    let insert_appointment = "INSERT INTO APPOINTMENTS (title, date, description) VALUES (?, ?, ?)"
    
    let insert_note = "INSERT INTO NOTES (topic, date, content) VALUES (?, ?, ?)"
    
}