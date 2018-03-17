//
//  StatusBarStyleProvider.swift
//  HFKit
//
//  Created by Salim Braksa on 3/17/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public protocol StatusBarStyleProvider {
    
    var preferredStatusBarStyle: UIStatusBarStyle { get }
    
}

// MARK: -

public extension UIStatusBarStyle {
    
    static var global: UIStatusBarStyle {
        guard
            let rawValue = Bundle.main.object(forInfoDictionaryKey: "HFDefaultStatusBarStyle") as? Int,
            let style = UIStatusBarStyle(rawValue: rawValue)
            else { return .default }
        return style
    }
    
}

// MARK: -

public extension UINavigationController {
    
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        if let visibleViewController = self.childViewControllers.last, visibleViewController is StatusBarStyleProvider {
            return visibleViewController
        }
        return nil
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.global
    }
    
}

public extension UITabBarController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        if let viewController = self.selectedViewController, viewController is StatusBarStyleProvider || !viewController.childViewControllers.isEmpty {
            return viewController
        }
        return nil
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.global
    }
    
}
