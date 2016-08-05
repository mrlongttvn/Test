//
//  SignUpViewController.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/5/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTf: NewTextField!
    
    @IBOutlet weak var emailTf: NewTextField!
    
    @IBOutlet weak var passwordTf: NewTextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    @IBOutlet weak var signUpB: UIButton!
    
    @IBOutlet weak var signUpCenterY: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        focusOnName()
        navigationController?.navigationBarHidden = true
    }
    
    func setupView() {
        loginB.backgroundColor = Color.color103_175_160
        loginB.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginB.addTarget(self, action: #selector(login), forControlEvents: .TouchUpInside)
        
        signUpB.backgroundColor = Color.color251_243_64
        signUpB.setTitleColor(Color.color103_175_160, forState: .Normal)
        signUpB.addTarget(self, action: #selector(signUp), forControlEvents: .TouchUpInside)
    }
    
    func focusOnName() {
        nameTf.becomeFirstResponder()
        let moveDistance: CGFloat = DeviceType.IS_IPHONE_5 ? -50 : 0
        signUpCenterY.constant = moveDistance
        view.layoutIfNeeded()
    }
    
    func login() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    func signUp() {
        
        SignUpCommunicator.signUpWithName(nameTf.text!,
                                          email: emailTf.text!,
                                          password: passwordTf.text!,
                                          success: { (message) in
            let alert = UIAlertController(title: "Sign up", message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Login now", style: .Default, handler: { [unowned self] (action) in
                self.login()
            })
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            }) { message in
                
                let alert = UIAlertController(title: "Sign up", message: message, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
