//
//  ApiClient.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/5/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import Foundation

struct ApiClient {
    
    private static let apiUrl = "http://54.255.201.10:9000/"
    
    static func sendRequestWithUrl(url: String,
                                   params: [String: AnyObject]? = nil,
                                   method: String,
                                   success: (data: NSHTTPURLResponse) -> Void,
                                   fail: (message: String) -> Void) {

        let fullUrl = "\(apiUrl)\(url)"
        let request = NSMutableURLRequest(URL: NSURL(string: fullUrl)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = method
        
        if let params = params {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
        }
        
        let loginString = NSString(format: "%@:%@", "k@gmail.com", "123456789")
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        request.setValue(fullUrl, forHTTPHeaderField: "Origin")
        request.setValue("", forHTTPHeaderField: "X-CSRF-Token")
        request.setValue("m \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        
            dispatch_async(dispatch_get_main_queue()) {
                guard error == nil else {
                    fail(message: "Request fail")
                    return
                }
                
                success(data: response! as! NSHTTPURLResponse)
            }
        })
        
        task.resume()
    }
}