//
//  UIAlertControllerExtensions.swift
//  HFKit
//
//  Created by Salim Braksa on 3/3/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    convenience init(error: NSError, preferredStyle style: UIAlertControllerStyle = .alert) {
        let viewModel = ErrorViewModel(error: error)
        self.init(error: error, preferredStyle: style)
    }
    
    convenience init(error: ErrorViewModel, preferredStyle style: UIAlertControllerStyle = .alert) {
        self.init(title: error.title, message: error.description, preferredStyle: style)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        addAction(close)
    }
    
}
