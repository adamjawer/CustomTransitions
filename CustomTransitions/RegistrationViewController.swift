//
//  RegistrationViewController.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var titleView: AnimatedTitleView!
    
    @IBAction func signOnWithSocialMedia(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
