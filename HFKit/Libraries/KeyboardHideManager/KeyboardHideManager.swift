//
//  KeyboardHideManager.swift
//  KeyboardHideManager
//
//  Created by Bondar Yaroslav on 01.12.16.
//  Copyright © 2016 Bondar Yaroslav. All rights reserved.
//

import UIKit

/// Codeless manager to hide keyboard by tapping on views for iOS written in Swift.
///
/// Usage:
/// 1. Drag Object from Object library
/// 2. Setup KeyboardHideManager in Class field
/// 3. Connect views with targets
///
/// Target must be UIView subclass and user iteraction enabled is on.
/// To use with xib you must add strong property to controller.
///
/// See ReadMe for screenshots and more details

open class KeyboardHideManager: NSObject {
    
    /// Here will be saved targets added from IB
    public var targets: [UIView]! {
        didSet {
            targets.forEach { addGesture(to: $0) }
        }
    }
    
    /// if true will apply gesture to view without subviews
    @IBInspectable internal var scrollSupport: Bool = true
    
    /// Add UITapGestureRecognizer with action dismissKeyboard
    /// - Parameter target: A target that will be used to add gesture
    internal func addGesture(to target: UIView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        target.addGestureRecognizer(gesture)
        if scrollSupport {
            gesture.cancelsTouchesInView = false
            gesture.delegate = self
        }
    }
    
    /// Execute endEditing(true) for top superview to hide keyboard
    @objc internal func dismissKeyboard() {
        targets.first?.endEditing(true)
    }
}

extension KeyboardHideManager: UIGestureRecognizerDelegate {
    
    /// need for scrollSupport
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = gestureRecognizer.view else { return true }
        let point = touch.location(in: view)
        guard let touchedView = view.hitTest(point, with: nil) else { return true }
        return !((touchedView is UIControl) && touchedView.isUserInteractionEnabled)
    }
    
}
