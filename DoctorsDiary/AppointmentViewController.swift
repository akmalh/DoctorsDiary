//
//  AppointmentViewController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 20/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    
    @IBOutlet weak var createNewAppointmentView: UIView!
    @IBOutlet weak var newAppointmentTitleField: UITextField!
    @IBOutlet weak var newAppointmentDateField: UITextField!
    @IBOutlet weak var newAppointmentDescriptionField: UITextView!
    //let datePickerView:UIDatePicker = UIDatePicker()
    
    var databasePath = NSString()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createNewAppointmentView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newAppointmentButton(sender: UIButton) {
        
        createNewAppointmentView.hidden = false
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        println(formatter.stringFromDate(currentDate))
        
        newAppointmentTitleField.text = ""
        newAppointmentDateField.text = formatter.stringFromDate(currentDate)
        newAppointmentDescriptionField.text = ""
        
    }
    
    @IBAction func saveNewAppointmentButton(sender: UIButton) {
        
        createNewAppointmentView.hidden = true
        
        var newAppointmentTitle = newAppointmentTitleField.text
        var newAppointmentDate = newAppointmentDateField.text
        var newAppointmentDescription = newAppointmentDescriptionField.text
        
        // Saving appointments to the database
        
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

            
            let insertSQL = "INSERT INTO APPOINTMENTS (title, date, description) VALUES ('\(newAppointmentTitleField.text)', '\(newAppointmentDateField.text)', '\(newAppointmentDescriptionField.text)')"
            
            let result = doctorsDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                //status.text = "Failed to add contact"
                
                // Generating alert
                
                var alert = UIAlertView(title: "Failed to add appointment", message: "Failed to add appointment", delegate: nil, cancelButtonTitle: "Close")
                alert.title = "Failed"
                
                // Move to the UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Show the alert
                    alert.show()
                })
                
                
                println("Error: \(doctorsDB.lastErrorMessage())")
            } else {
                //status.text = "Contact Added"
                
                var alert = UIAlertView(title: "Successfully saved appointment", message: "Successfully saved appointment", delegate: nil, cancelButtonTitle: "Close.")
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
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("appointmentView") as! AppointmentViewController
        
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
