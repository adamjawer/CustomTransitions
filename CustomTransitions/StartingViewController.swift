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

}


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// MARK: - Custom Transition
// Uncomment to use the custom transition
/*
     //Must contain a strong reference to this object
    lazy var customTransitionDelegate = SeasonsTransitionDelegate()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Register" {
            if let controller = segue.destination as? RegistrationViewController {
                controller.transitioningDelegate = customTransitionDelegate
            }
        }
    }
*/
