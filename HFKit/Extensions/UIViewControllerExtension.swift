//
//  UIViewControllerExtension.swift
//  HFKit
//
//  Created by Heitem OULED-LAGHRIYEB on 3/2/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    // MARK: - Displaying Errors
    
    public func show(error: NSError) {
        let alertController = UIAlertController(error: error)
        present(alertController, animated: true, completion: nil)
    }
    
    public func show(error: Error) {
        show(error: error as NSError)
    }
    
    public func show(error: ErrorViewModel) {
        let alertController = UIAlertController(error: error)
        present(alertController, animated: true, completion: nil)
    }
    
}
