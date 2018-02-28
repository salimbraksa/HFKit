//
//  UIButtonExtensions.swift
//  HFKit
//
//  Created by Salim Braksa on 2/25/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public extension UIButton {
    
    // MARK: - Customize Appearence
    
    public func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        let image = color.toImage
        setBackgroundImage(image, for: state)
    }
    
}
