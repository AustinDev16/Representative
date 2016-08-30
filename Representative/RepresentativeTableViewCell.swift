//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    
    var representative: Representative?
    
    func updateWithRep(representative: Representative, state: String){
        nameLabel.text = representative.name
        stateLabel.text = state
        districtLabel.text = representative.district
        phoneLabel.text = representative.phone
        partyLabel.text = representative.party
        websiteLabel.text = representative.link
        
        self.representative = representative
    }
 

}
