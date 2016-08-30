//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    var reps: [Representative]?
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }

 

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StateController.states.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)

       let state = StateController.states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
    

  

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailViewFromExisting" {
            guard let detailTVC = segue.destinationViewController as? RepresentativeTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else {return }
            
            let selectedState = StateController.states[indexPath.row]
            
            detailTVC.state = selectedState
            
        }
        
    }
 

}
