//
//  RootViewController.swift
//  Luckiecat
//
//  Created by Salim Braksa on 3/4/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

open class RootViewController: UIViewController {
    
    public var delegate: RootViewControllerDelegateProtocol? {
        didSet { didSet(delegate: self.delegate) }
    }
    
    // MARK: Private
    
    private var lookupStrategy: ViewControllerLookUpStrategy?
    
    // MARK: - Initializers
    
    convenience public init(initialViewControllerLookUpStrategy strategy: ViewControllerLookUpStrategy) {
        self.init()
        self.lookupStrategy = strategy
        switch strategy {
        case .manual(let controller): set(childViewController: controller)
        default: break
        }
    }
    
    convenience public init(childViewController: UIViewController) {
        self.init()
        set(childViewController: childViewController)
    }
    
    // MARK: -
    
    override open func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
    }
    
    // MARK: - Appearence
    
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        return childViewControllers.last
    }
    
    // MARK: - Public Interface
    
    public func set(childViewController: UIViewController, transition: UIViewControllerAnimatedTransitioning? = nil) {
     
        let currentChildViewController = childViewControllers.first
        let newViewController = childViewController
        load(viewController: newViewController, animated: transition != nil)
        
        // Perform transition if it's provided
        if let transition = transition {
            let context = ChildViewControllerContextTransitioning(source: currentChildViewController, destination: newViewController, container: self)
            transition.animateTransition(using: context)
        } else {
            currentChildViewController?.willMove(toParentViewController: nil)
            currentChildViewController?.view.removeFromSuperview()
            currentChildViewController?.removeFromParentViewController()
        }
        
        // Animate status bar change
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
        
    }
    
    public func present(childViewController: UIViewController) {
        let transition = ChildViewControllerSlideUpTransition()
        set(childViewController: childViewController, transition: transition)
    }
    
    public func dismiss(childViewController: UIViewController) {
        let transition = ChildViewControllerSlideDownTransition()
        set(childViewController: childViewController, transition: transition)
        childViewControllers.last?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    private func load(viewController: UIViewController, animated: Bool = false) {
        addChildViewController(viewController)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if !animated {
            view.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)
        }
    }
    
    private func didSet(delegate: RootViewControllerDelegateProtocol?) {
        
        guard let strategy = self.lookupStrategy else { return }
        
        switch strategy {
        case .automatic:
            guard let controller = delegate?.firstViewController(for: self) else { return }
            set(childViewController: controller)
        default: break
        }

        
    }
    
    // MARK: - Types
    
    public enum ViewControllerLookUpStrategy {
        case automatic
        case manual(UIViewController)
    }
    
    
    
}

public protocol RootViewControllerDelegateProtocol {
    
    func firstViewController(for rootViewController: RootViewController) -> UIViewController
    
}
