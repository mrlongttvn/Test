//
//  LoginCommunicator.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/5/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import Foundation

struct LoginCommunicator {
    
    static func login(email: String,
                      password: String,
                      success: (message: String) -> Void,
                      fail: (message: String) -> Void) {
        
        let api = "auth/signin"
        var params = [String: String]()
        params["email"] = email
        params["password"] = password
        
        ApiClient.sendRequestWithUrl(api, params: params, method: "POST", success: { (response) in
            
            if response.statusCode == 201 {
                success(message: "Successful")
            }
            else {
                fail(message: "Fail")
            }
            
        }) { (message) in
            fail(message: message)
            print("fail login")
        }
    }
}