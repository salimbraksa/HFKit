//
//  ErrorViewModel.swift
//  HFKit
//
//  Created by Heitem OULED-LAGHRIYEB on 3/2/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

open class ErrorViewModel {
    
    var title: String
    var description: String
    
    public init(error: NSError) {
        
        let domain = error.domain
        let errorCode = error.code
        
        var description: String?
        var title: String?
        
        let bundles = Bundle.allBundles
        var bundle = Bundle()
        for bun in bundles {
            if let _ = bun.path(forResource: "errors", ofType: "plist") {
                bundle = bun
            } else {
                bundle = Bundle.main
            }
        }
        let errorsPath = bundle.path(forResource: "errors", ofType: "plist") ?? ""
        let errorsDictionary = (NSDictionary(contentsOfFile: errorsPath) as? [String: Any]) ?? [:]
        
        if let errors = errorsDictionary[domain] as? [String: Any] {
            if let errorDictionnary = errors["\(errorCode)"] as? [String: Any] {
                title = errorDictionnary["title"] as? String
                description = errorDictionnary["description"] as? String
            } else if let desc = errors["\(errorCode)"] as? String {
                description = desc
            }
        } else if let _ = errorsDictionary[domain] as? String {
            description = error.localizedDescription
        }
        
        self.description = description ??  "The application has encountered an unknown error."
        
        self.title = title ?? "Oops!"
    }
}
