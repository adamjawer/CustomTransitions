//
//  AnimatedTitleView.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class AnimatedTitleView: UIView {
    var winterTree: UIImageView!
    var springTree: UIImageView!
    var summerTree: UIImageView!
    var autumnTree: UIImageView!
    
    var titleLabel: UILabel!
    
    var _currentSeason: Season = .summer {
        didSet {
            guard self.winterTree != nil else { return }
            
            self.winterTree.alpha = _currentSeason == .winter ? 1 : 0
            self.springTree.alpha = _currentSeason == .spring ? 1 : 0
            self.summerTree.alpha = _currentSeason == .summer ? 1 : 0
            self.autumnTree.alpha = _currentSeason == .autumn ? 1 : 0
        }
    }
    
    var currentSeason: Season {
        get {
            return _currentSeason
        }
        
        set (newSeason) {
            UIView.animate(
                withDuration: 4.0,
                delay: 0,
                options: .beginFromCurrentState,
                animations: {
                    self._currentSeason = newSeason
            }) { [unowned self] (completed) in
                self.currentSeason = self.currentSeason.nextSeason()
            }
        }
    }

    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        winterTree = makeTree(named: "Winter")
        springTree = makeTree(named: "Spring")
        summerTree = makeTree(named: "Summer")
        autumnTree = makeTree(named: "Autumn")

//        _currentSeason = .summer
//        currentSeason = .summer
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: UIFontWeightHeavy)
        titleLabel.shadowColor = UIColor(red: 30.0 / 255.0, green: 30.0 / 255.0, blue: 30.0 / 255.0, alpha: 1)
        titleLabel.shadowOffset = CGSize(width: 1, height: 1)
        titleLabel.text = "Seasons"
        addSubview(titleLabel)

        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = titleLabel.intrinsicContentSize
        
        titleLabel.frame = CGRect(x: 72, y: 5, width: size.width, height: size.height)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = titleLabel.intrinsicContentSize
        
        return CGSize(width: size.width + 72, height: 70)
    }
    
    private func makeTree(named name: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFit
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
        
        addSubview(imageView)
        
        return imageView
    }
}
