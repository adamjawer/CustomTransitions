//
//  AnimatedTitleView.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class AnimatedTitleView: UIView {
    @IBOutlet weak var winterTree: UIImageView!
    @IBOutlet weak var springTree: UIImageView!
    @IBOutlet weak var summerTree: UIImageView!
    @IBOutlet weak var fallTree: UIImageView!
    
    var _currentSeason: Season = .summer {
        didSet {
            guard self.winterTree != nil else { return }
            
            self.winterTree.alpha = _currentSeason == .winter ? 1 : 0
            self.springTree.alpha = _currentSeason == .spring ? 1 : 0
            self.summerTree.alpha = _currentSeason == .summer ? 1 : 0
            self.fallTree.alpha = _currentSeason == .fall ? 1 : 0
        }
    }
    
    var currentSeason: Season {
        get {
            return _currentSeason
        }
        
        set (newSeason) {
            UIView.animate(
                withDuration: 4.0,
                animations: { [unowned self] in
                    self._currentSeason = newSeason
            }) { [unowned self] (completed) in
                self.currentSeason = self.currentSeason.nextSeason()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        _currentSeason = .summer
        currentSeason = .summer
    }
}
