//
//  StartingViewController.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    
    @IBOutlet weak var titleView: SeasonsTitleView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    func setButtonsAlpha(alpha: CGFloat) {
        registerButton.alpha = alpha
        logInButton.alpha = alpha
    }

    func setButtonTransform(_ transform: CGAffineTransform) {
        registerButton.transform = transform
        logInButton.transform = transform
    }
    
    //Must contain a strong reference to this object
    lazy var customTransitionDelegate = SeasonsTransitionDelegate()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Simple" {
            if let controller = segue.destination as? RegistrationViewController {
                customTransitionDelegate.transitionKind = .simple
                controller.transitioningDelegate = customTransitionDelegate
            }
        } else if segue.identifier == "Complex" {
            if let controller = segue.destination as? RegistrationViewController {
                customTransitionDelegate.transitionKind = .complex
                controller.transitioningDelegate = customTransitionDelegate
                controller.displayMode = .clearBackground
            }
        }
    }
}
