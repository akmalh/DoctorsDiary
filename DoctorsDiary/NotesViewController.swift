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
    
    let datePickerView:UIDatePicker = UIDatePicker()
    
    
    
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
        
        newNoteTopicField.text = ""
        newNoteDateField.text = ""
        newNoteContentField.text = ""
        
    }
    
    
    @IBAction func setNewNoteDate(sender: UITextField) {
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        newNoteDateField.text = dateFormatter.stringFromDate(sender.date)
        
        
    }

    
    
    @IBAction func saveNewNoteButton(sender: UIButton) {
        
        newNoteView.hidden = true
        var newNoteTopic = newNoteTopicField.text
        var newNoteDate = newNoteDateField.text
        var newNoteContent = newNoteContentField.text
        
        println(newNoteTopic)
        println(newNoteDate)
        println(newNoteContent)
        
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
