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
        //newAppointmentTitleField.delegate = self
        //newAppointmentDateField.delegate = self
        
        initializeAppointmentsDatabase()
        
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
        
        println(newAppointmentTitle)
        println(newAppointmentDate)
        println(newAppointmentDescription)
        
        // Saving note to the database
        
        let appointmentsDB = FMDatabase(path: databasePath as String)
        
        if appointmentsDB.open() {
            
            let insertSQL = "INSERT INTO APPOINTMENTS (title, date, description) VALUES ('\(newAppointmentTitleField.text)', '\(newAppointmentDateField.text)', '\(newAppointmentDescriptionField.text)')"
            
            let result = appointmentsDB.executeUpdate(insertSQL,
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
                
                
                println("Error: \(appointmentsDB.lastErrorMessage())")
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
            println("Error: \(appointmentsDB.lastErrorMessage())")
        }
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let sessionsView = storyBoard.instantiateViewControllerWithIdentifier("appointmentView") as! AppointmentViewController
        
        sessionsView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        self.presentViewController(sessionsView,  animated: true, completion: nil)
        

        
    }
    
    // Pop up date picker not working
    
    
//    @IBAction func setNewAppointmentDate(sender: UITextField) {
//        
//        //let datePickerView:UIDatePicker = UIDatePicker()
//        
////        datePickerView.datePickerMode = UIDatePickerMode.Date
////        
////        sender.inputView = datePickerView
////        
////        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
//    
//        datePickerView.datePickerMode = .Date
//        newAppointmentDateField.inputView = datePickerView
//        var toolBar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 44))
//        toolBar.tintColor = UIColor.grayColor()
//        var doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "showSelectedDate")
//        var space: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
//        toolBar.items = [space, doneBtn]
//        newAppointmentDateField.inputAccessoryView = toolBar
//    }
//    
//    func showSelectedDate()
//    {
//        var formatter: NSDateFormatter = NSDateFormatter()
//        formatter.dateFormat = "dd/MMM/YYYY hh:min a"
//        newAppointmentDateField.text = "\(formatter.stringFromDate(datePickerView.date))"
//        newAppointmentDateField.resignFirstResponder()
//    }
//    
//    func setDateField()
//    {
//        println("here")
//        newAppointmentDateField.resignFirstResponder()
//    }
    
//    func datePickerValueChanged(sender:UIDatePicker) {
//        
//        let dateFormatter = NSDateFormatter()
//        
//        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
//        
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
//        
//        newAppointmentDateField.text = dateFormatter.stringFromDate(sender.date)
//        newAppointmentDateField.resignFirstResponder()
//        
//    }
    
    
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        
//        var touch : UITouch! = touches.first as! UITouch
//        
//    }
    
    
    
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
    
    func initializeAppointmentsDatabase ()
    {
        // Check and create DB
        
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        
        databasePath = docsDir.stringByAppendingPathComponent("appointments.db")
        
        println("Checking DB path for appointment")
        println(databasePath)
        
        if !filemgr.fileExistsAtPath(databasePath as String) {
            
            println("Creating New Appointments DB")
            
            let appointmentsDB = FMDatabase(path: databasePath as String)
            
            if appointmentsDB == nil {
                println("Error: \(appointmentsDB.lastErrorMessage())")
            }
            
            if appointmentsDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS APPOINTMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, DATE TEXT, DESCRIPTION TEXT)"
                if !appointmentsDB.executeStatements(sql_stmt) {
                    println("Error: \(appointmentsDB.lastErrorMessage())")
                }
                appointmentsDB.close()
            } else {
                println("Error: \(appointmentsDB.lastErrorMessage())")
            }
        }
        
    }


}
