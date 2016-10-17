//
//  StartingViewController.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

enum Season {
    case winter
    case spring
    case summer
    case autumn
    
    func nextSeason() -> Season {
        switch self {
        case .winter:
            return .spring
        case .spring:
            return .summer
        case .summer:
            return .autumn
        case .autumn:
            return .winter
        }
    }
}

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var titleView: AnimatedTitleView!

    
    // Must contain a strong reference to this object
    lazy var customTransitionDelegate = SeasonsTransitionDelegate()
    
    // MARK: - Custom Transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Register" {
            if let controller = segue.destination as? RegistrationViewController {
                controller.transitioningDelegate = customTransitionDelegate
            }
        }
    }
}
