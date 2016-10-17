//
//  CustomView.swift
//  CustomTransitions
//
//  Created by Adam Jawer on 10/16/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    var label: UILabel?
    var winterTree: UIImageView!
    var springTree: UIImageView!
    var summerTree: UIImageView!
    var autumnTree: UIImageView!
    
    private func makeImageView(imageName name: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFit
        if let image = UIImage(named: name) {
            imageView.image = image
        }
        addSubview(imageView)
        
        return imageView
    }
    
    func setup() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label?.font = UIFont.systemFont(ofSize: 50, weight: UIFontWeightHeavy)
        label?.text = "Seasons"
        addSubview(label!)
        
        winterTree = makeImageView(imageName: "Winter")
        springTree = makeImageView(imageName: "Spring")
        summerTree = makeImageView(imageName: "Summer")
        autumnTree = makeImageView(imageName: "Autumn")
        
        
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        setNeedsDisplay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let size = label?.sizeThatFits(CGSize(width: Int.max, height: Int.max)) {
            label?.frame = CGRect(x: 72, y: (bounds.height - size.height) / 2, width: size.width, height: size.height)
        }
        
        winterTree.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        springTree.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        summerTree.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        autumnTree.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
    }
    
    override var intrinsicContentSize: CGSize {
        if let label = label {
            return CGSize(width: label.intrinsicContentSize.width + 72, height: 70)
        }
        else {
            return CGSize(width: UIViewNoIntrinsicMetric, height: 70)
        }
    }

}
