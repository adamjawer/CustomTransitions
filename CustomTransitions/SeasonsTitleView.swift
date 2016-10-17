//
//  SeasonsTitleView.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/17/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

@IBDesignable
class SeasonsTitleView: UIView {
    
    var titleLabel: UILabel!
    var autumnTree: UIImageView!
    
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
        autumnTree = makeTree(named: "Autumn")

        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: UIFontWeightHeavy)
        titleLabel.textColor = UIColor.autumnColor
        titleLabel.shadowColor = UIColor.titleShadowColor
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
