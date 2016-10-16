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
    case fall
    
    func nextSeason() -> Season {
        switch self {
        case .winter:
            return .spring
        case .spring:
            return .summer
        case .summer:
            return .fall
        case .fall:
            return .winter
        }
    }
}

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var titleView: AnimatedTitleView?
    
    @IBOutlet weak var titleContainer: UIView! {
        didSet {
            if let titleView = Bundle.main.loadNibNamed("AnimatedTitleView", owner: nil, options: nil)?.first as? AnimatedTitleView {
                self.titleView = titleView
                titleView.frame = titleContainer.bounds
                titleContainer.addSubview(titleView)
            }
        }
    }

    
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
