//
//  APIControllerClass.swift
//  APIMVC
//
//  Created by Appinventiv-PC on 20/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import Foundation
class  APIControllerClass
{
    func singup( Parameters:[String:Any],success:@escaping (Model)-> Void)
    {
        let headers = ["cache-control": "no-cache","postman-token": "32450c7f-db09-0285-a8f6-5dd5fc9d9ba3"]
        
        let singupurl = "https://httpbin.org/get"
        
        var requestedUrl = singupurl+"?"
        
        for(key, value) in Parameters{requestedUrl.append("\(key)=\(value)&")}
        requestedUrl.removeLast()
       
        networkController().GET(URL:requestedUrl , Parameters: Parameters, headers: headers) { (User) in
            let user = Model(p:User) 
            success(user)
        }
  

}
}
