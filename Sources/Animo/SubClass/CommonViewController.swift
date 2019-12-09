//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/9/19.
//

import UIKit

open class CommonViewController: UIViewController {
    
    //MARK:- RAISING VIEW WHEN TEXTFIELD IS CALLED
    
    public var height: CGFloat = -1 //The value of how high the keyboard is raised
    
    public func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= self.height != -1 ? self.height : keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
}
