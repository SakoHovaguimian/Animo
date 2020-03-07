//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 3/7/20.
//

import UIKit

public enum Font: String {
    
    case GAMEFONT_LIGHT = "PressStart2P"
    case OTHER_FONT = "Something"
    
    func font(_ size: CGFloat) -> UIFont? {
        let name = self.rawValue
        return UIFont(name: name, size: size)
    }
}

