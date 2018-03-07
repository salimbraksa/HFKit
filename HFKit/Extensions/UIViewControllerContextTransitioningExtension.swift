//
//  UIViewControllerContextTransitioningExtension.swift
//  Luckiecat
//
//  Created by Salim Braksa on 3/7/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

extension UIViewControllerContextTransitioning {
    
    var destinationViewController: UIViewController {
        return viewController(forKey: .to)!
    }
    
    var sourceViewController: UIViewController {
        return viewController(forKey: .from)!
    }
    
}
