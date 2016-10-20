//
//  RegistrationViewController.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

enum DisplayMode {
    case normal
    case clearBackground
}

class RegistrationViewController: UIViewController {

    @IBOutlet weak var titleView: SeasonsTitleView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var signOnOptionsLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signOnWithSocialMedia(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }

    @IBAction func register(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    var displayMode = DisplayMode.normal
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if displayMode == .clearBackground {
            setLabelColors(forLabel: subTitleLabel)
            setLabelColors(forLabel: signOnOptionsLabel)
            
            view.backgroundColor = UIColor.clear
        }
    }

    private func setLabelColors(forLabel label: UILabel) {
        label.textColor = UIColor.autumnColor
        label.shadowColor = UIColor.titleShadowColor
        label.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 7
        label.layer.shadowOpacity = 0.9
    }
    
}





























/*
// MARK: - setup for Cool transition
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setLabelColors(forLabel: subTitleLabel)
        setLabelColors(forLabel: signOnOptionsLabel)
        
        view.backgroundColor = UIColor.clear
    }
    
    func setLabelColors(forLabel label: UILabel) {
        label.textColor = UIColor.autumnColor
        label.shadowColor = UIColor.titleShadowColor
        label.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 7
        label.layer.shadowOpacity = 0.9
    }
*/
