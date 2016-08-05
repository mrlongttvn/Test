//
//  NewTextField.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

class NewTextField: UITextField {

    var underline : UIView!
    var underlineColor : UIColor!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupControl()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupControl()
    }
    
    func setupControl() {
        underline = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
        underline.translatesAutoresizingMaskIntoConstraints = true
        underline.autoresizingMask = [UIViewAutoresizing.FlexibleWidth]
        underline.backgroundColor = Color.inactiveColor
        self.addSubview(underline)
    }
    
    override func becomeFirstResponder() -> Bool {
        underline.backgroundColor =  underlineColor != nil ? underlineColor! : Color.activeColor
        super.becomeFirstResponder()
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        underline.backgroundColor = Color.inactiveColor
        super.resignFirstResponder()
        return true
    }
}
