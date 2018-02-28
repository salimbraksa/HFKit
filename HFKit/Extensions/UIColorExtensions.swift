//
//  UIColor.swift
//  HFKit
//
//  Created by Salim Braksa on 2/25/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // MARK: - Conversions
    
    public var toImage: UIImage? {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
        
    }
    
    // MARK: - Initializers
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    public convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
