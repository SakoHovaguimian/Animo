//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/13/19.
//

import UIKit

protocol Storyboarded {
    static func instantiate(nameOf storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(nameOf storyboard: String) -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
        
    }
}
