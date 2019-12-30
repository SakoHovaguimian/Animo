//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

extension UITextField {
    
    
    //MARK:- ADDING AN IMAGE TO THE RIGHT OF THE TEXTFIELD
    
    public func attachImage(image: UIImage) {
        
        let viewPasswordButton = UIButton(type: .custom)
        
        viewPasswordButton.setImage(image, for: .normal)
        viewPasswordButton.imageView?.contentMode = .scaleAspectFit
        viewPasswordButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: -16, bottom: 0, right: 0)
        viewPasswordButton.frame = CGRect(x: self.frame.width, y: 0, width: 17, height: 20)
        
        self.rightView = viewPasswordButton
        self.rightViewMode = .always
        
    }
    
    public func areFieldsEmpty() -> Bool {
        
        guard self.text?.isEmpty == true else {
            self.layer.borderWidth = 0.0
            return false
        }
        
        self.layer.borderColor = UIColor.systemRed.cgColor
        self.layer.borderWidth = 2.0
        
        return true
        
    }
    
}
