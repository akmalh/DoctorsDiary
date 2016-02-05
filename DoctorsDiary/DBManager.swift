//
//  DBManager.swift
//  DoctorsDiary
//
//  Created by Akmal Hossain on 25/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import Foundation

class DBManager{
    
    var ddDatabase: FMDatabase = FMDatabase()
    let dbQueries: DBQueries = DBQueries()

    func createDB() -> Bool{
    
        // Creating DB and tables
        
        print("AirCasting: Creating database and table")
        
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] 
        let path = (documentsFolder as NSString).stringByAppendingPathComponent("doctorsdiary.sqlite")
        ddDatabase = FMDatabase(path: path)
        
        if !ddDatabase.open() {
            print("DoctorsDiary: Unable to open database")
            return false
        }
        
        if !createTables() {
            print("DoctorsDiary: Failed to create table: \(ddDatabase.lastErrorMessage())")
            return false
        } else{
            print("DoctorsDiary: Database tables created successfully")
        }

        return true
    }
    
    func createTables() -> Bool {
        
        print("DoctorsDiary: createTables()")
        
        if !ddDatabase.executeUpdate(dbQueries.create_appointments_table, withArgumentsInArray: nil) {
            print("DoctorsDiary: Failed to create table: \(ddDatabase.lastErrorMessage())")
            return false
        }
        
        if !ddDatabase.executeUpdate(dbQueries.create_notes_table, withArgumentsInArray: nil) {
            print("DoctorsDiary: Failed to create table: \(ddDatabase.lastErrorMessage())")
            return false
        }
        
        return true
    }
}
