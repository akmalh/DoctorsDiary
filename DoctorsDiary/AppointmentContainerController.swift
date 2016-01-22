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
    
    var appointmentTitleListItems: [String] = ["Apple", "Banana", "Orange"]
    var appointmentDateListItems: [String] = ["10/01/2016", "11/02/2016", "23/04/2016"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    
}
