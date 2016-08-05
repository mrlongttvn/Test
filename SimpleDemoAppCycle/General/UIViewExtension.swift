//
//  UIViewExtension.swift
//  SimpleDemoAppCycle
//
//  Created by Ky Nguyen on 8/6/16.
//  Copyright © 2016 phuot. All rights reserved.
//

import UIKit

extension UIView {
    
    func createRoundCorner(radius: CGFloat) {
        
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func createCircleShape() {
        
        createRoundCorner(self.frame.size.width / 2)
    }
}