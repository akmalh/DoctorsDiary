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
