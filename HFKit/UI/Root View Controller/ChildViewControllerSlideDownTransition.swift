//
//  ChildViewControllerSlideDownTransition.swift
//  Luckiecat
//
//  Created by Salim Braksa on 3/7/18.
//  Copyright © 2018 Hidden Founders. All rights reserved.
//

import UIKit

class ChildViewControllerSlideDownTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Setup
        let destination = transitionContext.destinationViewController
        let source = transitionContext.sourceViewController
        transitionContext.containerView.insertSubview(destination.view, at: 0)
        
        // Animation
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            source.view.transform = CGAffineTransform(translationX: 0, y: source.view.bounds.height)
        }) { finished in
            source.willMove(toParentViewController: nil)
            source.view.removeFromSuperview()
            source.removeFromParentViewController()
            transitionContext.completeTransition(finished)
        }
        
    }
    
}
