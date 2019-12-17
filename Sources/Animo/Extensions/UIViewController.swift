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
    
}
