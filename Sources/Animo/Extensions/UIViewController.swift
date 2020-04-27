//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit
import LocalAuthentication

extension UIViewController {
    
    //MARK:- SIMPLE ALERT
    
    public func showSimpleError(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(dismissAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    public func requestFacialAuthorization(completion: @escaping (Bool) -> ()) {
        
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Must be used to authorize you"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
               success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        } else {
            completion(false)
        }
        
    }
    
    //MARK:- CONSTRAINT HELPER
    
    
    
    //MARK:- SIMPLE ACTIVITY INDICATOR
    
    @available(iOS 13.0, *)
    public func shouldPresentLoadingView(_ present: Bool, message: String? = nil, alpha: CGFloat = 0.7) {
        
        if present {
            
            let loadingView = UIView()
            loadingView.frame = self.view.frame
            loadingView.backgroundColor = .black
            loadingView.alpha = 0
            loadingView.tag = 1000
            
            let indicator = UIActivityIndicatorView()
            indicator.style = .large
            indicator.color = .white
            indicator.center = self.view.center
            indicator.startAnimating()
            
            let label = UILabel()
            label.text = message
            label.font = UIFont.systemFont(ofSize: 20.0)
            label.textColor = .white
            label.textAlignment = .center
            label.alpha = 0.87
            
            self.view.addSubview(loadingView)
            loadingView.addSubview(indicator)
            loadingView.addSubview(label)
            
            label.centerX(inView: self.view)
            label.anchor(top: indicator.bottomAnchor, paddingTop: 32)
            
            UIView.animate(withDuration: 0.3) {
                loadingView.alpha = alpha
            }
            
        } else {
            
            self.view.subviews.forEach({ (subview) in
                if subview.tag == 1000 {
                    UIView.animate(withDuration: 0.3, animations: {
                        subview.alpha = 0.0
                    }) { (_) in
                        subview.removeFromSuperview()
                    }
                }
            })
            
        }
        
    }
    
}
