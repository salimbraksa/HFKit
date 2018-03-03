//
//  ErrorViewModel.swift
//  HFKit
//
//  Created by Heitem OULED-LAGHRIYEB on 3/2/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

open class ErrorViewModel {
    
    public var title: String
    public var description: String
    
    private(set) public var configuration: Configuration = Configuration.default
    
    public init(error: NSError, configuration: Configuration? = nil) {
        if let configuration = configuration {
            self.configuration = configuration
        }
        
        let domain = error.domain
        let errorCode = error.code
        
        var description: String?
        var title: String?

        let errorsPath = self.configuration.filePath ?? ""
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
    
    // MARK: -
    
    open class Configuration {
        
        public var filePath: String?
        
        public static var `default`: Configuration = {
            var configuration = Configuration()
            configuration.filePath = Bundle.main.path(forResource: "errors", ofType: "plist")
            return configuration
        }()
        
    }
    
}
