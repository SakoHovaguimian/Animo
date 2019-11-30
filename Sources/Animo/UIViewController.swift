//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

extension UIViewController {
    
    //MARK:- SIMPLE ALERT
    
    public func showSimpleError(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(dismissAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- RAISING VIEW WHEN TEXTFIELD IS CALLED
    
    
    
}
