//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 8/21/20.
//

import UIKit

@available(iOS 9.0, *)
extension UIStackView {
    
    func findSelectedXPosition(_ sender: Int) -> CGFloat {
        return self.arrangedSubviews[sender].frame.origin.x
    }
    
}
