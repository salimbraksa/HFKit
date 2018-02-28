//
//  Validatable.swift
//  HFKit
//
//  Created by Salim Braksa on 2/25/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

public protocol Validatable {
    
    func validate() -> [NSError]
    
}
