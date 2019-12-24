//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/13/19.
//

import UIKit

public protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    
}

//Add Extension to this when Swinject is imported

/*
 
 extension Coordinator /* DI */ {
     
     var resolver: Resolver? {
         get {
             return objc_getAssociatedObject(self, &AssociatedKeys.resolver) as? Resolver
         }
         set {
             objc_setAssociatedObject(self, &AssociatedKeys.resolver, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
         }
     }
 }
 
 */
