//
//  SeasonsTitleView.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/17/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

enum Season: Int {
    case winter = 0
    case spring
    case summer
    case autumn
    
    func image() -> UIImage? {
        switch self {
        case .winter:
            return UIImage(named: "Winter")
        case .spring:
            return UIImage(named: "Spring")
        case .summer:
            return UIImage(named: "Summer")
        case .autumn:
            return UIImage(named: "Autumn")
        }
    }
}

@IBDesignable
class SeasonsTitleView: UIView {
    
    var titleLabel: UILabel!
    var imageView: UIImageView!
    
    @IBInspectable var title: String? {
        didSet {
            titleLabel.text = title
            setNeedsLayout()
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var season: Season = .autumn {
        didSet {
            image = season.image()
        }
    }
    
    init(withSeason season: Season) {
        super.init(frame: CGRect.zero)
        self.season = season
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
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: UIFontWeightHeavy)
        titleLabel.textColor = UIColor.autumnColor
        titleLabel.shadowColor = UIColor.titleShadowColor
        titleLabel.shadowOffset = CGSize(width: 1, height: 1)
        addSubview(titleLabel)
        
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = titleLabel.intrinsicContentSize
        
        imageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        titleLabel.frame = CGRect(x: 72, y: 5, width: size.width, height: size.height)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = titleLabel.intrinsicContentSize
        
        return CGSize(width: size.width + 72, height: 70)
    }
    
    func clone() -> SeasonsTitleView {
        let clone = SeasonsTitleView(frame: frame)
        clone.title = title
        clone.season = season
        
        return clone
    }
}
