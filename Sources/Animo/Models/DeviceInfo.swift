//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 9/12/20.
//

import Foundation
import UIKit

public struct DeviceInfo {
    
    public struct Orientation {

        static public var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isLandscape
                    : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }

        static public var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isPortrait
                    : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
        
    }
    
}
