//
//  SeasonsTransitionAnimator.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class SeasonsTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var reverse: Bool = false
    
    init(reverse: Bool = false) {
        self.reverse = reverse
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if !reverse {
            if let toView = transitionContext.view(forKey: .to),
                let toViewController = transitionContext.viewController(forKey: .to) as? RegistrationViewController {
                
                let finalFrame = transitionContext.finalFrame(for: toViewController)
                
                toView.frame = CGRect(x: 0, y: finalFrame.height, width: finalFrame.width, height: finalFrame.height)
                
                transitionContext.containerView.addSubview(toView)
            
                UIView.animate(
                    withDuration: transitionDuration(using: transitionContext),
                    animations: {
                        toView.frame = finalFrame
                    },
                    completion: { (completed) in
                        transitionContext.completeTransition(completed)
                })
            }
        }
        else {
            if let fromView = transitionContext.view(forKey: .from),
                let fromViewController = transitionContext.viewController(forKey: .from) as? RegistrationViewController,
                let toView = transitionContext.view(forKey: .to),
                let toViewController = transitionContext.viewController(forKey: .to) as? StartingViewController {
                
                let finalToFrame = transitionContext.finalFrame(for: toViewController)
                toView.frame = finalToFrame
                
                let initialFrame = transitionContext.initialFrame(for: fromViewController)
                
                let finalFrame = CGRect(x: 0, y: -initialFrame.height, width: initialFrame.width, height: initialFrame.height)
                
                // Must add the toView under the fromView
                transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
                
                UIView.animate(
                    withDuration: transitionDuration(using: transitionContext),
                    animations: {
                        fromView.frame = finalFrame
                    },
                    completion: { (finished) in
                        transitionContext.completeTransition(true)
                })
                
            }
        }
    }
}
