//
//  RepresentativeController.swift
//  Representative
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepsByState(state: String, completion: ([Representative]) -> Void){
        
        guard let url = self.baseURL else {fatalError("No url available")}
        
        let urlParameters = ["state": "\(state)", "output": "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            guard let data = data,
            jsonAnyObject = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
            jsonDictionary = jsonAnyObject as? [String: AnyObject],
            representativeDictionary = jsonDictionary["results"] as? [[String: AnyObject]]
            else { completion([]); return}
            
            let representatives = representativeDictionary.flatMap({ Representative(dictionary: $0)})
            
            completion(representatives)
            
            
        }
        
        
    }
    
}

