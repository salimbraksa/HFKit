//
//  ViewLifecyclePresenting.swift
//  HFKit
//
//  Created by Salim Braksa on 2/25/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import Foundation

public protocol Presenting: class {
}

// MARK: -

public protocol ViewLifecyclePresenting: Presenting {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func viewWillDisappear()
    
    func viewDidDisappear()
    
}

public extension ViewLifecyclePresenting {
    
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
    
}
