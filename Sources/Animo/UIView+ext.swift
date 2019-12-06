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
    
}
