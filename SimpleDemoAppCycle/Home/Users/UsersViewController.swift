//
//  UsersViewController.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

class UsersViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSlideMenuButton()
        
        UserCommunicator.getUsers({ [unowned self] (users) in
            
            self.users = users
            self.tableView.reloadData()
        }) { (message) in
            
        }
    }
    
    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        let name = NSUserDefaults.standardUserDefaults().valueForKeyPath("name") as? String
        if let name = name {
            title = name.uppercaseString
        }
    }
}

extension UsersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return users.count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserTableCell", forIndexPath: indexPath) as! UserTableCell
        cell.backgroundColor = indexPath.row % 2 == 0 ?
            UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1) :
            UIColor.whiteColor()
        cell.setup(users[indexPath.row])
        
        cell.downloadAvatarAtIndex(indexPath) { image in
            if tableView.indexPathsForVisibleRows!.contains(cell.index) {
                cell.updateAvatar(image)
            }
        }
        return cell
    }
}