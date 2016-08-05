//
//  UserTableCell.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {

    @IBOutlet weak var avatarIV: UIImageView!
    
    @IBOutlet weak var nameL: UILabel!
    
    @IBOutlet weak var emailL: UILabel!
    
    var user: User!
    var index: NSIndexPath!
    func setup(user: User) {
        self.user = user
        setupView()
        setupData(user)
    }
    
    func updateAvatar(image: UIImage) {
        avatarIV.image = image
    }
    
    func downloadAvatarAtIndex(index: NSIndexPath, complete: (image: UIImage) -> Void) {
        self.index = index
        UserCommunicator.getAvatarWithUrl(user.avatar, success: { (image) in
            complete(image: image)
        })
    }
    
    private func setupView() {
        
        avatarIV.createCircleShape()
    }
    
    override func prepareForReuse() {
        avatarIV.image = UIImage(named: "user")
    }
    
    private func setupData(user: User) {
    
        nameL.text = user.name
        emailL.text = user.email
    }
}
