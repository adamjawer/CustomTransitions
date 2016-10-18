//
//  SeasonsTransitionAnimator.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class SeasonsTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var direction: AnimationDirection = .forward
    
    init(direction: AnimationDirection = .forward) {
        self.direction = direction
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if direction == .forward {
            
            // Presenting the destination view controller
            
            // Get the "toView" and the "toViewController"
            if let toView = transitionContext.view(forKey: .to),
                
                let toViewController = transitionContext.viewController(forKey: .to) as? RegistrationViewController {
                
                // set the initial values
                let finalFrame = transitionContext.finalFrame(for: toViewController)
                
                toView.frame = CGRect(
                    x: 0,
                    y: -finalFrame.height,
                    width: finalFrame.width,
                    height: finalFrame.height
                )
                
                // Add the participating subviews to the container view
                // ** In the forward transition, the fromView is already a subview of the containerView
                transitionContext.containerView.addSubview(toView)
                
                // Animate the change
                // create an animator
                let animator = UIViewPropertyAnimator(
                    duration: transitionDuration(using: transitionContext),
                    curve:.easeInOut
                )
                
                // add animations to it
                animator.addAnimations {
                    toView.frame = finalFrame
                }
                
                // Be sure to call completeTransition when it's finished
                animator.addCompletion { (_) in
                    transitionContext.completeTransition(true)
                }
                
                animator.startAnimation()
            }
        }
        else {
            // Dismissing the presented view controller
            
            if let fromView = transitionContext.view(forKey: .from),
                
                let fromViewController = transitionContext.viewController(forKey: .from) as? RegistrationViewController,
                
                let toView = transitionContext.view(forKey: .to),
                
                let toViewController = transitionContext.viewController(forKey: .to) {
                
                let initialFrame = transitionContext.initialFrame(for: fromViewController)
                
                let finalFrame = CGRect(
                    x: initialFrame.width,
                    y: 0,
                    width: initialFrame.width,
                    height: initialFrame.height
                )
                
                toView.frame = transitionContext.finalFrame(for: toViewController)
                
                transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
                
                let animator = UIViewPropertyAnimator(
                    duration: transitionDuration(using: transitionContext),
                    curve:.easeInOut
                )
                
                animator.addAnimations {
                    fromView.frame = finalFrame
                }
                
                animator.addCompletion { (_) in
                    transitionContext.completeTransition(true)
                }
                
                animator.startAnimation()
            }
        }
    }
    
}
