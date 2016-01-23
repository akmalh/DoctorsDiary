//
//  NoteContainerController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 21/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class NoteContainerController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var noteList: UITableView!
    //var noteListItems: [String] = ["Apple", "Banana", "Orange"]
    static var noteListItems: [String] = [""]
    //var noteDateListItems: [String] = ["10/01/2016", "11/02/2016", "23/04/2016"]
    static var noteDateListItems: [String] = [""]
    
    //var databasePath = NSString()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //initializeNotesList()
        
        noteList.delegate = self
        noteList.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var rowCount = 0
        rowCount = NoteContainerController.noteListItems.count
        return rowCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell: UITableViewCell = noteList.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        myCell.textLabel?.text = NoteContainerController.noteListItems[indexPath.row]
        myCell.detailTextLabel?.text = NoteContainerController.noteDateListItems[indexPath.row]
        return myCell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
        var itemSelected = NoteContainerController.noteListItems[indexPath.row]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var selectedItem = NSString(string: (tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }

//    func initializeNotesList ()
//    {
//        let filemgr = NSFileManager.defaultManager()
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
//        
//        let docsDir = dirPaths[0] as! String
//        
//        databasePath = docsDir.stringByAppendingPathComponent("notes.db")
//        
//        let currentDate = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.dateStyle = .MediumStyle
//        //println(formatter.stringFromDate(currentDate))
//        
//        let notesDB = FMDatabase(path: databasePath as String)
//        
//        if notesDB.open() {
//            let querySQL = "SELECT topic, content FROM NOTES WHERE date = '\(formatter.stringFromDate(currentDate))'"
//            
//            let results:FMResultSet? = notesDB.executeQuery(querySQL,
//                withArgumentsInArray: nil)
//            
//            if results?.next() == true {
////                address.text = results?.stringForColumn("address")
////                phone.text = results?.stringForColumn("phone")
////                status.text = "Record Found"
//                
//                println("From container")
//                println(results?.stringForColumn("topic"))
//                println(results?.stringForColumn("content"))
//            } else {
////                status.text = "Record not found"
////                address.text = ""
////                phone.text = ""
//                
//                println("Record not found")
//            }
//            notesDB.close()
//        } else {
//            println("Error: \(notesDB.lastErrorMessage())")
//        }
//        
//        
//    }

}
