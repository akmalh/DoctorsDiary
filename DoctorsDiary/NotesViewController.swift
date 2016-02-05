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
        print(formatter.stringFromDate(currentDate))
        
        newNoteTopicField.text = ""
        newNoteDateField.text = formatter.stringFromDate(currentDate)
        newNoteContentField.text = ""
        
    }

    
    
    @IBAction func saveNewNoteButton(sender: UIButton) {
        
        newNoteView.hidden = true
        _ = newNoteTopicField.text
        _ = newNoteDateField.text
        _ = newNoteContentField.text
        
        // Saving note to the database
        
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
            
            let insertSQL = "INSERT INTO NOTES (topic, date, content) VALUES ('\(newNoteTopicField.text)', '\(newNoteDateField.text)', '\(newNoteContentField.text)')"
            
            let result = doctorsDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                //status.text = "Failed to add contact"
                
                // Generating alert
                
                let alert = UIAlertView(title: "Failed to add note", message: "Failed to add note", delegate: nil, cancelButtonTitle: "Close")
                alert.title = "Failed"
                
                // Move to the UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Show the alert
                    alert.show()
                })
                
                
                print("Error: \(doctorsDB.lastErrorMessage())")
            } else {
                //status.text = "Contact Added"
                
                let alert = UIAlertView(title: "Successfully saved note", message: "Successfully saved note", delegate: nil, cancelButtonTitle: "Close.")
                alert.title = "Success"
                
                // Move to the UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Show the alert
                    alert.show()
                })
            }
        } else {
            print("Error: \(doctorsDB.lastErrorMessage())")
        }

        
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

}
