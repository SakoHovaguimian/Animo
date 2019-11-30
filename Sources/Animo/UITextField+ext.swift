//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

extension UITextField {
    
    
    //MARK:- ADDING AN IMAGE TO THE RIGHT OF THE TEXTFIELD
    
    public func attachImage(image: UIImage, width: CGFloat, height: CGFloat) {
        
        let viewPasswordButton = UIButton(type: .custom)
        viewPasswordButton.setImage(image, for: .normal)
        viewPasswordButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        viewPasswordButton.frame = CGRect(x: self.frame.width, y: 0, width: width, height: height)
        self.rightView = viewPasswordButton
        self.rightViewMode = .always
        
    }
    
    
}
