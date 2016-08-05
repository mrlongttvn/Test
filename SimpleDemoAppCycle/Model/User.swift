//
//  User.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import Foundation

struct User {
    
    var avatar: String
    var name: String
    var email: String

    init(avatar: String, name: String, email: String) {
        self.avatar = avatar
        self.name = name
        self.email = email
    }
}