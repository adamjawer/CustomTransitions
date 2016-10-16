//
//  StartingViewController.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    @IBOutlet weak var winterTree: UIImageView!
    @IBOutlet weak var springTree: UIImageView!
    @IBOutlet weak var summerTree: UIImageView!
    @IBOutlet weak var fallTree: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        winterTree.alpha = 1
        springTree.alpha = 0
        summerTree.alpha = 0
        fallTree.alpha = 0
        
        currentSeason = .winter
    }

    enum Season {
        case winter
        case spring
        case summer
        case fall
    }
    
    var currentSeason: Season = .summer {
        didSet {
            UIView.animate(
                withDuration: 4.0,
                animations: { [unowned self] in
                    self.winterTree.alpha = self.currentSeason == .winter ? 1 : 0
                    self.springTree.alpha = self.currentSeason == .spring ? 1 : 0
                    self.summerTree.alpha = self.currentSeason == .summer ? 1 : 0
                    self.fallTree.alpha = self.currentSeason == .fall ? 1 : 0
                }) { [unowned self] (completed) in
                    switch self.currentSeason {
                    case .winter:
                        self.currentSeason = .spring
                    case .spring:
                        self.currentSeason = .summer
                    case .summer:
                        self.currentSeason = .fall
                    case .fall:
                        self.currentSeason = .winter
                    }
            }
        }
    }
}
