//
//  UserCommunicator.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

struct UserCommunicator {
    
    static func getUsers(success: (users: [User]) -> Void, fail: (message: String) -> Void) {
        
        let url = "users"
        ApiClient.sendRequestWithUrl(url, method: "GET", success: { (data) in
            
//            success(users: <#T##[User]#>)
            if data.statusCode != 200 {
                
                let users = SampleUsers.users
                success(users: users)
            }
            }) { (message) in
                
        }
    }
    
    static func getAvatarWithUrl(url: String, success: (image: UIImage) -> Void) {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) { () -> Void in
            
            let img = self.downloadImage(url)
            dispatch_async(dispatch_get_main_queue(), {
                
                success(image: img)
            })
        }
    }
    
    private static func downloadImage(url: String) -> UIImage {
        
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)!
    }
}

struct SampleUsers {
    
    static var users : [User] {
        
        let names = ["Anna", "Blaise", "Caroline", "Herschel", "Cecilia", "Dorothy", "Edmond", "Halley", "Elizabeth", "Blackburn"]
        let avatars = ["http://i.cdn.turner.com/cnn/2010/LIVING/08/19/single.in.america/t1larg.single.woman.ts.jpg",
                       "http://static.eharmony.com/dating-advice/wp-content/uploads/2012/11/single-people-on-facebook-400x228.jpg",
                       "http://excelle.monster.com/nfs/excelle/attachment_images/0012/5272/ff_crop380w.jpg?1306250385",
                       "http://media.salon.com/2012/07/Screen-shot-2012-07-06-at-2.41.50-PM.png",
                       "http://cdn1.relevantmediagroup.com/sites/default/files/styles/article_header/public/field/image/single.jpg?itok=ccbmSA6I",
                       "http://media.indiatimes.in/media/content/2012/Jun/1735255_1437732895.jpg",
                       "https://www.beyond.com/data/articles/images/work-life-balance/singlepeople.jpg",
                       "http://www.coachseduction.com/wp-content/uploads/2015/09/pourquoi-celibataire-montreal.jpg",
                       "http://static.eharmony.com/blog/wp-content/uploads/2014/11/single-women-voting.jpg",
                       "http://i.dailymail.co.uk/i/pix/2015/05/29/02/2929496B00000578-3101635-image-a-1_1432862935225.jpg"]
        var users = [User]()
        for i in 0 ..< names.count {
            users.append(User(avatar: avatars[i], name: names[i], email: "\(names[i])@gmail.com"))
        }
        
        users.appendContentsOf(users)
        
        return users
    }
}