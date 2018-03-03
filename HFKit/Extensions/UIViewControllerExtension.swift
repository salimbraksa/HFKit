//
//  UIViewControllerExtension.swift
//  HFKit
//
//  Created by Heitem OULED-LAGHRIYEB on 3/2/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func show(error: NSError) {
        let alertController = UIAlertController(error: error)
        present(alertController, animated: true, completion: nil)
    }
    
}
