//
//  ViewController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 20/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var topPageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

