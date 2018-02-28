//
//  Validator.swift
//  HFKit
//
//  Created by Salim Braksa on 2/25/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

public typealias Validator<T> = (T) -> Bool

public extension String {
    
    public static var isBlank: Validator<String?> {
        return { string in return (string ?? "").trimmingCharacters(in: .whitespaces).isEmpty }
    }
    
}
