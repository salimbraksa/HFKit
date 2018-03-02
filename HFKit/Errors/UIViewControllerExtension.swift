//
//  UIViewControllerExtension.swift
//  Luckiecat
//
//  Created by Heitem OULED-LAGHRIYEB on 3/2/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func show(error: ErrorViewModel) {
        let title = error.title
        let description = error.description
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alertController.addAction(close)
        present(alertController, animated: true, completion: nil)
    }
}
