//
//  AppointmentViewController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 20/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var createNewAppointmentView: UIView!
    @IBOutlet weak var newAppointmentTitleField: UITextField!
    @IBOutlet weak var newAppointmentDateField: UITextField!
    @IBOutlet weak var newAppointmentDescriptionField: UITextView!
    let datePickerView:UIDatePicker = UIDatePicker()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createNewAppointmentView.hidden = true
        newAppointmentTitleField.delegate = self
        newAppointmentDateField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newAppointmentButton(sender: UIButton) {
        
        createNewAppointmentView.hidden = false
        
        newAppointmentTitleField.text = ""
        newAppointmentDateField.text = ""
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
        
    }
    

    @IBAction func setNewAppointmentDate(sender: UITextField) {
        
        //let datePickerView:UIDatePicker = UIDatePicker()
        
//        datePickerView.datePickerMode = UIDatePickerMode.Date
//        
//        sender.inputView = datePickerView
//        
//        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    
        datePickerView.datePickerMode = .Date
        newAppointmentDateField.inputView = datePickerView
        var toolBar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 44))
        toolBar.tintColor = UIColor.grayColor()
        var doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "showSelectedDate")
        var space: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        toolBar.items = [space, doneBtn]
        newAppointmentDateField.inputAccessoryView = toolBar
    }
    
    func showSelectedDate()
    {
        var formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "dd/MMM/YYYY hh:min a"
        newAppointmentDateField.text = "\(formatter.stringFromDate(datePickerView.date))"
        newAppointmentDateField.resignFirstResponder()
    }
    
    func setDateField()
    {
        println("here")
        newAppointmentDateField.resignFirstResponder()
    }
    
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

}
