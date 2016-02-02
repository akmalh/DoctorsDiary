//
//  AppointmentContainerController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 21/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class AppointmentContainerController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var appointmentList: UITableView!
    
    var appointmentTitleListItems: [String] = [""]
    var appointmentDateListItems: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadAppointmentList()
        
        appointmentList.delegate = self
        appointmentList.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var rowCount = 0
        rowCount = appointmentTitleListItems.count
        return rowCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell: UITableViewCell = appointmentList.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        myCell.textLabel?.text = appointmentTitleListItems[indexPath.row]
        myCell.detailTextLabel?.text = appointmentDateListItems[indexPath.row]
        return myCell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
        var itemSelected = appointmentTitleListItems[indexPath.row]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var selectedItem = NSString(string: (tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }
    
    func loadAppointmentList ()
    {
        var databasePath = NSString()
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        
        databasePath = docsDir.stringByAppendingPathComponent("doctorsdiary.sqlite")
        
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        let doctorsDB = FMDatabase(path: databasePath as String)
        
        if doctorsDB.open() {
            
            let querySQL = "SELECT title, description, date FROM APPOINTMENTS"
            
            let results:FMResultSet? = doctorsDB.executeQuery(querySQL,withArgumentsInArray: nil)
            
            
            if results?.next() == true {
                
                while (results!.next()) {
                    
                    let title = (results?.stringForColumn("title"))!
                    let date = (results?.stringForColumn("date"))!
                    appointmentTitleListItems.append("\(title)")
                    appointmentDateListItems.append("\(date)")
                    
                }
                
                
            } else {
                
                println("Record not found")
            }
            doctorsDB.close()
        } else {
            println("Error: \(doctorsDB.lastErrorMessage())")
        }
        
    }

}
