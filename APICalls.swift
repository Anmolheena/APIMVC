//
//  APICalls.swift
//  APIMVC
//
//  Created by Appinventiv-PC on 21/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import Foundation

class   APICalls {
    // Mark :-instance
    static func instance() ->APICalls{
        return APICalls()
    }
    //Mark :- GET method
    func get(params:Dictionary<String, Any>,url : String,headers : Dictionary<String, Any>,success: @escaping([String:Any])-> Void){
           var requestedUrl = url
           let params1 = params
            for(key, value) in params1{
            requestedUrl.append("?\(key)=\(value)&")
            }
           requestedUrl.removeLast()
        // Mark :-
           let request = NSMutableURLRequest(url: NSURL(string: requestedUrl)! as URL ,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
  
   
  request.httpMethod = "GET"
        request.allHTTPHeaderFields = (headers as! [String : String])
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error )
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            guard let d = data else{return}
            let fetchedData = try! JSONSerialization.jsonObject(with: d, options: .mutableContainers) as!NSDictionary
            success(fetchedData as! [String : Any])
        }
    })
    
    dataTask.resume()
    }
    
}
