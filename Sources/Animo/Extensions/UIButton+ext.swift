//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

 extension UIButton {
    
    func applyGraident(colors: [CGColor]) {
        
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
