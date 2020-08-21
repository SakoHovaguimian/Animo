//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 7/24/20.
//

import UIKit

public class ThumbTextSlider: UISlider {
    
    public lazy var thumbTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbTextLabel.frame = thumbFrame
        thumbTextLabel.text = Int(value).description
        
        self.thumbTextLabel.frame = CGRect.init(x: self.thumbCenterX - 14,
                                                y: -self.frame.height + -15,
                                                width: 32,
                                                height: 20)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.thumbTextLabel.frame = CGRect(x: 0, y: -30, width: 32, height: 20)
        addSubview(thumbTextLabel)
        
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
