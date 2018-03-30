//
//  SegmentedControlBehavior.swift
//  HFKit
//
//  Created by Salim Braksa on 3/30/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

open class SegmentedControlBehavior {
    
    private let controls: [UIControl]
    private lazy var lastSelectedControl: UIControl = {
        return controls.first!
    }()
    
    public var selectedIndex: Int {
        get { return controls.index(of: lastSelectedControl)! }
        set {
            let control = controls[newValue]
            self.handle(touchUpInside: control)
        }
    }
    
    public init(controls: [UIControl]) {
        assert(!controls.isEmpty, "You must provide at least 1 control")
        self.controls = controls
        self.controls.forEach { [unowned self] control in
            control.addTarget(self, action: #selector(handle(touchUpInside:)), for: .touchUpInside)
        }
    }
    
    @objc private func handle(touchUpInside control: UIControl) {
        control.isSelected = true
        guard control !== lastSelectedControl else { return }
        self.lastSelectedControl.isSelected = false
        self.lastSelectedControl = control
    }
    
}
