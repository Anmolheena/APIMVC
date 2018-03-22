//
//  NetworkController.swift
//  APIMVC
//
//  Created by Appinventiv-PC on 22/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import Foundation
 class networkController{
    func GET(URL:String, Parameters:[String:Any],headers :[String:Any] , success:@escaping ([String:Any])-> Void)
    {
        let URL = NSMutableURLRequest(url: NSURL(string: URL)! as URL,                                    cachePolicy: .useProtocolCachePolicy,                                    timeoutInterval: 10.0)
        URL.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: URL as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil
                else {
                    print("returning error")
                    return
                    
            }
            do{
                guard let d = data
                    else {
                        print("not returning data")
                        return
                        
                }
                let datafetched = try! JSONSerialization.jsonObject(with: d, options: .mutableContainers) as! NSArray
                print(datafetched)
                success(datafetched as! [String : Any])
                
            }
            
        })
        dataTask.resume()
        
}
}
