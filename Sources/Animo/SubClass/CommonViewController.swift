//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/9/19.
//

import UIKit

public class CommonViewController: UIViewController {
    
    //MARK:- RAISING VIEW WHEN TEXTFIELD IS CALLED
    
    public var activeTextField: UITextField?
    
    public var keyboardHeight: CGFloat = -1 //The value of how high the keyboard is raised
    
    public func keyboardSetup() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    ///Meant to be used with `activeTextField`. Assign your textfield as `active` and watch this baby work
    public func dynamicKeyboardSetup() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillRaiseDynamically(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= self.keyboardHeight != -1 ? self.keyboardHeight : keyboardSize.height
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = 0
            }
        }
    }
    
   @objc private func keyboardWillRaiseDynamically(notification: NSNotification) {
    
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let keyboardHeight = keyboardSize.height
            let activeTextFieldMaxY = (activeTextField!.superview?.convert(activeTextField!.frame.origin,
                                                                           to: self.view).y)! + activeTextField!.frame.height
            let visibleMaxY = self.view.frame.height - keyboardHeight
            
            if activeTextFieldMaxY > visibleMaxY {
                UIView.animate(withDuration: 0.5) {
                self.view.frame.origin.y = -(activeTextFieldMaxY - (self.view.frame.height - keyboardHeight)) - 10
                }
            }
        }
    
    }

}
