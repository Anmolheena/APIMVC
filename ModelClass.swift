//
//  ModelClass.swift
//  APIMVC
//
//  Created by Appinventiv-PC on 20/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import Foundation
struct Model {
    // Mark :- variables
    var username : String = ""
    var password: Any = ""
//    var discription:String = ""
    
    init(p: [String:Any])
    {
        let obj = p["args"] as! [[String:Any]]
        for item in obj{
            _ = item["username"] as! String
            _ = item["pasword"] as! String
        }
    }
    
   
   }
