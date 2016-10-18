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
        return 0.5
    }
    
    // Basic Animation

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if !reverse {
            
            // Direction = Forward - Presenting the destination view controller
            
            // Get the "toView" and the "toViewController"
            if let toView = transitionContext.view(forKey: .to),
                let toViewController = transitionContext.viewController(forKey: .to) as? RegistrationViewController {
                
                // set the initial values
                let finalFrame = transitionContext.finalFrame(for: toViewController)
                let initialFrame = CGRect(
                    x: 0,
                    y: -finalFrame.height,
                    width: finalFrame.width,
                    height: finalFrame.height
                )
                toView.frame = initialFrame
                
                // Add the participating subviews to the container view
                // ** In the forward transition, the fromView is already a subview of the containerView
                transitionContext.containerView.addSubview(toView)
                
                // Animate the change
                // create an animator
                let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeInOut)
                
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
            // Direction = reverse - Dismissing the presented view controller
            
            if let fromView = transitionContext.view(forKey: .from),
                let fromViewController = transitionContext.viewController(forKey: .from) as? RegistrationViewController {
                
                let initialFrame = transitionContext.initialFrame(for: fromViewController)
                
                let finalFrame = CGRect(
                    x: 0,
                    y: -initialFrame.height,
                    width: initialFrame.width,
                    height: initialFrame.height
                )
                
                let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeInOut)
                
                animator.addAnimations {
                    fromView.frame = finalFrame
                }
                
                animator.addCompletion { (position) in
                    transitionContext.completeTransition(position == .end)
                }
                
                animator.startAnimation()
            }
        }
    }
    
}
