//
//  CalendarViewController.swift
//  DoctorsApp
//
//  Created by Akmal Hossain on 20/01/2016.
//  Copyright (c) 2016 Akmal Hossain. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
