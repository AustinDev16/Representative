//
//  Representative.swift
//  Representative
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class Representative {
    
    private let kName = "name"
    private let kParty = "party"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    
    let name: String
    let party: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(dictionary: [String: AnyObject]){
        guard let name = dictionary[kName] as? String,
         let party = dictionary[kParty] as? String,
         district = dictionary[kDistrict] as? String,
         phone = dictionary[kPhone] as? String,
        office = dictionary[kOffice] as? String,
        link = dictionary[kLink] as? String else {return nil}
        
        self.name = name
        self.party = party
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
        
    }
    
}