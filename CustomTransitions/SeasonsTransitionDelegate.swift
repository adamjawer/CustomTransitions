//
//  SeasonsTransitionDelegate.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

enum SeasonsTransitionKind {
    case simple
    case complex
}

class SeasonsTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    var transitionKind = SeasonsTransitionKind.simple
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch transitionKind {
        case .simple:
            return SeasonsTransitionAnimator(direction: .forward)
        case .complex:
            return SeasonsTransitionAnimator2(direction: .forward)
        }
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch transitionKind {
        case .simple:
            return SeasonsTransitionAnimator(direction: .reverse)
        case .complex:
            return SeasonsTransitionAnimator2(direction: .reverse)
        }
    }
}
