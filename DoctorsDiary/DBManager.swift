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
        
        println("AirCasting: Creating database and table")
        
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let path = documentsFolder.stringByAppendingPathComponent("doctorsdiary.sqlite")
        ddDatabase = FMDatabase(path: path)
        
        if !ddDatabase.open() {
            println("DoctorsDiary: Unable to open database")
            return false
        }
        
        if !createTables() {
            println("DoctorsDiary: Failed to create table: \(ddDatabase.lastErrorMessage())")
            return false
        } else{
            println("DoctorsDiary: Database tables created successfully")
        }
        


        return true
    }
}
