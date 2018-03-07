//
//  ChildViewControllerContextTransitioning.swift
//  Luckiecat
//
//  Created by Salim Braksa on 8/6/17.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

import UIKit

class ChildViewControllerContextTransitioning: NSObject, UIViewControllerContextTransitioning {
    
    // MARK: - Properties
    
    weak var source: UIViewController?
    weak var destination: UIViewController!
    weak var container: UIViewController!
    
    // MARK: - Initializer
    
    init(source: UIViewController?, destination: UIViewController, container: UIViewController) {
        self.source = source
        self.destination = destination
        self.container = container
    }
    
    // MARK: - Methods & Properties that matter
    
    func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
        switch key {
        case UITransitionContextViewControllerKey.from: return source
        case UITransitionContextViewControllerKey.to: return destination
        default: return nil
        }
    }
    
    func view(forKey key: UITransitionContextViewKey) -> UIView? {
        switch key {
        case UITransitionContextViewKey.from: return source?.view
        case UITransitionContextViewKey.to: return destination.view
        default: return nil
        }
    }
    
    var containerView: UIView {
        return container.view
    }
    
    func completeTransition(_ didComplete: Bool) {
        destination.didMove(toParentViewController: container)
    }
    
    func initialFrame(for vc: UIViewController) -> CGRect {
        return vc.view.frame
    }
    
    func finalFrame(for vc: UIViewController) -> CGRect {
        return container.view.bounds
    }
    
    // MARK: - Boilerplate
    
    var isAnimated: Bool { return true }
    var isInteractive: Bool { return false }
    var presentationStyle: UIModalPresentationStyle { return .custom }
    var transitionWasCancelled: Bool { return false }
    var targetTransform: CGAffineTransform { return .identity }
    func updateInteractiveTransition(_ percentComplete: CGFloat) { }
    func finishInteractiveTransition() { }
    func cancelInteractiveTransition() { }
    func pauseInteractiveTransition() { }
    
}
