//
//  SignUpCommunicator.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/5/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import Foundation
struct SignUpCommunicator {
    
    static func signUpWithName(name: String,
                               email: String,
                               password: String,
                               success: (message: String) -> Void,
                               fail: (message: String) -> Void) {
        let api = "create"
        var params = [String: String]()
        params["name"] = name
        params["email"] = email
        params["password"] = password
        
        ApiClient.sendRequestWithUrl(api, params: params, method: "POST", success: { (response) in
            
            if response.statusCode == 200 {
                success(message: "Successful")
            }
            else {
                fail(message: "Fail")
            }
            
            }) { (message) in
                fail(message: message)
        }
    }
}