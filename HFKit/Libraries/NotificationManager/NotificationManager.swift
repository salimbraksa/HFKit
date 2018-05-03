//
//  NotificationManager.swift
//  HFKit
//
//  Created by Salim Braksa on 4/30/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

open class NotificationManager {
    
    private let center = NotificationCenter.default
    private let name: Notification.Name
    
    public init(_ name: String) {
        self.name = Notification.Name(rawValue: name)
    }
    
    public init(_ name: Notification.Name) {
        self.name = name
    }
    
    public func send(_ payload: Any? = nil) {
        let userInfo = ["_payload": payload as Any]
        center.post(name: name, object: nil, userInfo: userInfo)
    }
    
    public func observe(_ observer: Any, selector: Selector) {
        center.addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    public func remove(observer: Any) {
        center.removeObserver(observer, name: name, object: nil)
    }
    
}

public extension Notification {
    
    public func payload<T>() -> T {
        return userInfo?["_payload"] as! T
    }
    
    public func payload<T>() -> T? {
        return userInfo?["_payload"] as? T
    }
    
}
