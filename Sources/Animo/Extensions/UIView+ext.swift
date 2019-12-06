//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

extension UIView {
    
    public func rounded() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    public func addShadow(shadow color: UIColor, opacity: Float, offSet: CGSize, raidus: CGFloat) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = raidus
        
    }
    
    public func simpleGradient(colors: [UIColor]) {
        
        self.layer.sublayers?.filter({$0.name == "MyGradient"}).forEach({$0.removeFromSuperlayer()})
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "MyGradient"
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}
