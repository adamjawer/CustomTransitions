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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if !reverse {
            if let toView = transitionContext.view(forKey: .to),
                let toViewController = transitionContext.viewController(forKey: .to) as? RegistrationViewController,
                let fromViewController = transitionContext.viewController(forKey: .from) as? StartingViewController {
                
                // prepare the fromViewController
                fromViewController.titleView.isHidden = true
                toViewController.titleView.isHidden = true
                
                let finalFrame = transitionContext.finalFrame(for: toViewController)
                let initialFrame = CGRect(x: 0, y: finalFrame.height, width: finalFrame.width, height: finalFrame.height)
                toView.frame = initialFrame
                
                transitionContext.containerView.addSubview(toView)

                // get a temporary view of the titleView and animate it's position up
                let initialTitleFrame = fromViewController.titleView.frame
                let mockTitleView = SeasonsTitleView(frame: initialTitleFrame)
                
                var finalTitleFrame = initialTitleFrame
                finalTitleFrame.origin.y = 28
                
                transitionContext.containerView.addSubview(mockTitleView)
                
                let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeOut)
                
                let yDistanceToView = fabs(finalFrame.origin.y - initialFrame.origin.y)
                let yDistanceTitle = fabs(finalTitleFrame.origin.y - initialTitleFrame.origin.y)
                
                let percent = Double(yDistanceTitle / yDistanceToView)
                
                animator.addAnimations {
                    UIView.animateKeyframes(withDuration: animator.duration,
                                            delay: 0,
                                            options: [.beginFromCurrentState],
                                            animations: {
                                                
                                                // Move the toView up from the bottom
                                                UIView.addKeyframe(
                                                    withRelativeStartTime: 0,
                                                    relativeDuration: 1) {
                                                        toView.frame = finalFrame
                                                }
                                                
                                                // fade out the buttons on the StartingViewController
                                                UIView.addKeyframe(
                                                    withRelativeStartTime: 0,
                                                    relativeDuration: 0.33) {
                                                        fromViewController.setButtonsAlpha(alpha: 0)
                                                }
                                                
                                                
                                                // Move the mockTitleView up into position, relative to the existing transition
                                                UIView.addKeyframe(
                                                    withRelativeStartTime: 1 - percent,
                                                    relativeDuration: percent) {
                                                        mockTitleView.frame = finalTitleFrame
                                                }
                                                
                        })
                }
                
                animator.addCompletion { (position) in
                    mockTitleView.removeFromSuperview()
                    toViewController.titleView.isHidden = false
                    transitionContext.completeTransition(position == .end)
                }
                
                animator.startAnimation()
            }
        }
        else {
            if let fromView = transitionContext.view(forKey: .from),
                let fromViewController = transitionContext.viewController(forKey: .from) as? RegistrationViewController,
                let toViewController = transitionContext.viewController(forKey: .to) as? StartingViewController  {
                
                toViewController.titleView.isHidden = false
                toViewController.titleView.transform = CGAffineTransform(translationX: 0, y: toViewController.view.bounds.height)
                
                let initialFrame = transitionContext.initialFrame(for: fromViewController)
                
                let finalFrame = CGRect(x: 0, y: -initialFrame.height, width: initialFrame.width, height: initialFrame.height)
     
                let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeInOut)
     
                toViewController.setButtonsAlpha(alpha: 1)
                toViewController.setButtonTransform(CGAffineTransform(translationX: 0, y: toViewController.view.bounds.height))
                    
                animator.addAnimations {
                    fromView.frame = finalFrame
                    toViewController.titleView.transform = CGAffineTransform.identity
                    toViewController.setButtonTransform(CGAffineTransform.identity)
                }
                
                animator.addCompletion { (position) in
                    transitionContext.completeTransition(position == .end)
                }
                
                animator.startAnimation()
            }
        }
    }
*/
    // Advanced Animation
 
/*
func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    if !reverse {
        if let toView = transitionContext.view(forKey: .to),
            let toViewController = transitionContext.viewController(forKey: .to) as? RegistrationViewController,
            let fromViewController = transitionContext.viewController(forKey: .from) as? StartingViewController {
            
            // prepare the fromViewController
            fromViewController.titleView.isHidden = true
            toViewController.titleView.isHidden = true
            
            let finalFrame = transitionContext.finalFrame(for: toViewController)
            let initialFrame = CGRect(x: 0, y: finalFrame.height, width: finalFrame.width, height: finalFrame.height)
            toView.frame = initialFrame
            
            transitionContext.containerView.addSubview(toView)
            
            // get a temporary view of the titleView and animate it's position up
            let initialTitleFrame = fromViewController.titleView.frame
            let mockTitleView = SeasonsTitleView(frame: initialTitleFrame)
            
            var finalTitleFrame = initialTitleFrame
            finalTitleFrame.origin.y = 28
            
            transitionContext.containerView.addSubview(mockTitleView)
            
            let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeOut)
            
            let yDistanceToView = fabs(finalFrame.origin.y - initialFrame.origin.y)
            let yDistanceTitle = fabs(finalTitleFrame.origin.y - initialTitleFrame.origin.y)
            
            let percent = Double(yDistanceTitle / yDistanceToView)
            
            animator.addAnimations {
                UIView.animateKeyframes(withDuration: animator.duration,
                                        delay: 0,
                                        options: [.beginFromCurrentState],
                                        animations: {
                                            
                                            // Move the toView up from the bottom
                                            UIView.addKeyframe(
                                                withRelativeStartTime: 0,
                                                relativeDuration: 1) {
                                                    toView.frame = finalFrame
                                            }
                                            
                                            // fade out the buttons on the StartingViewController
                                            UIView.addKeyframe(
                                                withRelativeStartTime: 0,
                                                relativeDuration: 0.33) {
                                                    fromViewController.setButtonsAlpha(alpha: 0)
                                            }
                                            
                                            
                                            // Move the mockTitleView up into position, relative to the existing transition
                                            UIView.addKeyframe(
                                                withRelativeStartTime: 1 - percent,
                                                relativeDuration: percent) {
                                                    mockTitleView.frame = finalTitleFrame
                                            }
                                            
                })
            }
            
            animator.addCompletion { (position) in
                mockTitleView.removeFromSuperview()
                toViewController.titleView.isHidden = false
                transitionContext.completeTransition(position == .end)
            }
            
            animator.startAnimation()
        }
    }
    else {
        if let fromView = transitionContext.view(forKey: .from),
            let fromViewController = transitionContext.viewController(forKey: .from) as? RegistrationViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? StartingViewController  {
            
            toViewController.titleView.isHidden = false
            
            let initialFrame = transitionContext.initialFrame(for: fromViewController)
            
            let finalFrame = CGRect(x: 0, y: -initialFrame.height, width: initialFrame.width, height: initialFrame.height)
            
            let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), curve:.easeInOut)
            
            toViewController.setButtonsAlpha(alpha: 1)
            
            let translationTransform = CGAffineTransform(translationX: 0, y: toViewController.view.bounds.height)
            toViewController.titleView.transform = translationTransform
            toViewController.setButtonTransform(translationTransform)
            
            animator.addAnimations {
                fromView.frame = finalFrame
                toViewController.titleView.transform = CGAffineTransform.identity
                toViewController.setButtonTransform(CGAffineTransform.identity)
            }
            
            animator.addCompletion { (position) in
                transitionContext.completeTransition(position == .end)
            }
            
            animator.startAnimation()
        }
    }
*/
