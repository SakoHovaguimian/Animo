//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 8/22/20.
//

import UIKit

extension UITabBar {
    
    public func getFrameForTabAt(index: Int) -> CGRect? {
        var frames = self.subviews.compactMap { return $0 is UIControl ? $0.frame : nil }
        frames.sort { $0.origin.x < $1.origin.x }
        return frames[index]
    }
    
}
