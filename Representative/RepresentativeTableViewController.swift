//
//  RepresentativeTableViewController.swift
//  Representative
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {

    var state: String?
    var reps: [Representative]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else {return}
        
        RepresentativeController.searchRepsByState(state, completion: { (representative) in
            
            
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.reps = representative
                print(self.reps?.count)
                print("Finished")
                
                self.tableView.reloadData()
            })
        })
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reps?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as? RepresentativeTableViewCell,
            let state = state,
        let rep = reps?[indexPath.row] else {return UITableViewCell() }
        
        cell.updateWithRep(rep, state: state)
        return cell
    }


}
