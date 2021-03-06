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
    var noteListItems: [String] = [""]
    var noteDateListItems: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadNoteList()
        
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
        rowCount = noteListItems.count
        return rowCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell: UITableViewCell = noteList.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        myCell.textLabel?.text = noteListItems[indexPath.row]
        myCell.detailTextLabel?.text = noteDateListItems[indexPath.row]
        return myCell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
        _ = noteListItems[indexPath.row]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        _ = NSString(string: (tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }

    func loadNoteList ()
    {
        var databasePath = NSString()
        _ = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        
        let docsDir = dirPaths[0] 
        
        databasePath = (docsDir as NSString).stringByAppendingPathComponent("doctorsdiary.sqlite")
        
        _ = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        let doctorsDB = FMDatabase(path: databasePath as String)
        
        if doctorsDB.open() {
            
            let querySQL = "SELECT topic, content, date FROM NOTES"
            
            let results:FMResultSet? = doctorsDB.executeQuery(querySQL,withArgumentsInArray: nil)
            
            print(results?.columnCount())
            
            if results?.next() == true {
                
                while (results!.next()) {
                    
                    let topic = (results?.stringForColumn("topic"))!
                    let date = (results?.stringForColumn("date"))!
                    noteListItems.append("\(topic)")
                    noteDateListItems.append("\(date)")
                    
                }
                
                
            } else {
                
                print("Record not found")
            }
            doctorsDB.close()
        } else {
            print("Error: \(doctorsDB.lastErrorMessage())")
        }
        
    }


}
