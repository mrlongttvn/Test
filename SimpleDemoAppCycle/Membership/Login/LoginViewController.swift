//
//  LoginViewController.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/5/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTf: NewTextField!
    
    @IBOutlet weak var passwordTf: NewTextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var signUpB: UIButton!

    @IBOutlet weak var loginCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        focusOnEmail()
        navigationController?.navigationBarHidden = true 
    }
    
    override func viewDidAppear(animated: Bool) {
        focusOnEmail()
    }
    
    func setupView() {
        loginB.backgroundColor = Color.color103_175_160
        loginB.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginB.addTarget(self, action: #selector(login), forControlEvents: .TouchUpInside)
        
        signUpB.backgroundColor = Color.color251_243_64
        signUpB.setTitleColor(Color.color103_175_160, forState: .Normal)
    }
    
    func focusOnEmail() {
        emailTf.becomeFirstResponder()
        let moveDistance: CGFloat = DeviceType.IS_IPHONE_5 ? -50 : 0
        loginCenterY.constant = moveDistance
        view.layoutIfNeeded()
    }
    
    func login() {
        
        LoginCommunicator.login(emailTf.text!,
                                password: passwordTf.text!,
                                success: { (data) in
            let controller = UIStoryboard(name: "Home", bundle: nil).instantiateViewControllerWithIdentifier("TabViewController")
            self.presentViewController(controller, animated: true, completion: {
                self.view.window?.rootViewController = controller
            })
                                    
            let name = self.emailTf.text!.componentsSeparatedByString("@").first!
            NSUserDefaults.standardUserDefaults().setValue(name, forKey: "name")
            }) { (message) in
                let alert = UIAlertController(title: "Login", message: message, preferredStyle: .Alert)
                let action = UIAlertAction(title: "Retry", style: .Default, handler: { [unowned self] (action) in
                    self.login()
                    })
                
                let cancel = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
                alert.addAction(action)
                alert.addAction(cancel)
                self.presentViewController(alert, animated: true, completion: nil)

        }
    }

}
