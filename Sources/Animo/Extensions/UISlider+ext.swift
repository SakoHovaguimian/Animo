//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 8/21/20.
//

import UIKit

extension UISlider {
    
    var thumbCenterX: CGFloat {
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: bounds, value: value)
        return thumbRect.midX
    }
    
}
