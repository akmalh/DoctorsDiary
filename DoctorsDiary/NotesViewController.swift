//
//  NotesViewController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 20/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var newNoteView: UIView!
    @IBOutlet weak var newNoteTopicField: UITextField!
    @IBOutlet weak var newNoteDateField: UITextField!
    @IBOutlet weak var newNoteContentField: UITextView!
    
    //var databasePath = NSString()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newNoteView.hidden = true
        //initializeNotesDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createNewNoteButton(sender: UIButton) {
        
        newNoteView.hidden = false
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        println(formatter.stringFromDate(currentDate))
        
        newNoteTopicField.text = ""
        newNoteDateField.text = formatter.stringFromDate(currentDate)
        newNoteContentField.text = ""
        
    }

    
    
    @IBAction func saveNewNoteButton(sender: UIButton) {
        
        newNoteView.hidden = true
        var newNoteTopic = newNoteTopicField.text
        var newNoteDate = newNoteDateField.text
        var newNoteContent = newNoteContentField.text
        
        // Saving note to the database
        
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
            
            let insertSQL = "INSERT INTO NOTES (topic, date, content) VALUES ('\(newNoteTopicField.text)', '\(newNoteDateField.text)', '\(newNoteContentField.text)')"
            
            let result = doctorsDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                //status.text = "Failed to add contact"
                
                // Generating alert
                
                var alert = UIAlertView(title: "Failed to add note", message: "Failed to add note", delegate: nil, cancelButtonTitle: "Close")
                alert.title = "Failed"
                
                // Move to the UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Show the alert
                    alert.show()
                })
                
                
                println("Error: \(doctorsDB.lastErrorMessage())")
            } else {
                //status.text = "Contact Added"
                
                var alert = UIAlertView(title: "Successfully saved note", message: "Successfully saved note", delegate: nil, cancelButtonTitle: "Close.")
                alert.title = "Success"
                
                // Move to the UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Show the alert
                    alert.show()
                })
            }
        } else {
            println("Error: \(doctorsDB.lastErrorMessage())")
        }

        
        //let notesDB = FMDatabase(path: databasePath as String)
        
//        if notesDB.open() {
//            
//            let insertSQL = "INSERT INTO NOTES (topic, date, content) VALUES ('\(newNoteTopicField.text)', '\(newNoteDateField.text)', '\(newNoteContentField.text)')"
//            
//            let result = notesDB.executeUpdate(insertSQL,
//                withArgumentsInArray: nil)
//            
//            if !result {
//                //status.text = "Failed to add contact"
//                
//                // Generating alert
//                
//                var alert = UIAlertView(title: "Failed to add note", message: "Failed to add note", delegate: nil, cancelButtonTitle: "Close")
//                alert.title = "Failed"
//                
//                // Move to the UI thread
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    // Show the alert
//                    alert.show()
//                })
//                
//                
//                println("Error: \(notesDB.lastErrorMessage())")
//            } else {
//                //status.text = "Contact Added"
//                
//                var alert = UIAlertView(title: "Successfully saved note", message: "Successfully saved note", delegate: nil, cancelButtonTitle: "Close.")
//                alert.title = "Success"
//                
//                // Move to the UI thread
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    // Show the alert
//                    alert.show()
//                })
//            }
//        } else {
//            println("Error: \(notesDB.lastErrorMessage())")
//        }

        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("notesView") as! NotesViewController
        
        sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        self.presentViewController(sessionsView,  animated: true, completion: nil)
        
    }
    
    

    @IBAction func bottomBarControl(sender: UISegmentedControl) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        switch sender.selectedSegmentIndex
        {
            
        case 0:
            
            let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("profileView") as! ProfileViewController
            
            sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(sessionsView,  animated: true, completion: nil)
            
        case 1:
            
            let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("appointmentView") as! AppointmentViewController
            
            sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(sessionsView,  animated: true, completion: nil)
            
        case 2:
            
            let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("calendarView") as! CalendarViewController
            
            sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(sessionsView,  animated: true, completion: nil)
            
        case 3:
            
            let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("notesView") as! NotesViewController
            
            sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(sessionsView,  animated: true, completion: nil)
            
            
        default:
            break;
        }
        
    }
    
//    func initializeNotesDatabase ()
//    {
//        // Check and create DB
//        
//        let filemgr = NSFileManager.defaultManager()
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
//        
//        let docsDir = dirPaths[0] as! String
//        
//        databasePath = docsDir.stringByAppendingPathComponent("doctorsdiary.sqlite")
//        
//        if !filemgr.fileExistsAtPath(databasePath as String) {
//            
//            println("No DB found")
//            
//            let notesDB = FMDatabase(path: databasePath as String)
//            
//            if notesDB == nil {
//                println("Error: \(notesDB.lastErrorMessage())")
//            }
//            
//            if notesDB.open() {
//                let sql_stmt = "CREATE TABLE IF NOT EXISTS NOTES (ID INTEGER PRIMARY KEY AUTOINCREMENT, TOPIC TEXT, DATE TEXT, CONTENT TEXT)"
//                if !notesDB.executeStatements(sql_stmt) {
//                    println("Error: \(notesDB.lastErrorMessage())")
//                }
//                notesDB.close()
//            } else {
//                println("Error: \(notesDB.lastErrorMessage())")
//            }
//        }
//
//    }

}
