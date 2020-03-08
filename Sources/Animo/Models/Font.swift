//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 3/8/20.
//

import UIKit

public struct FontManager {
    
    init() {
        registerFont("PressStart2P-vaV7")
    }
    
    public enum GameFont: String {
        
        case light = "Custom-Font-Light"
        case medium = "Custom-Font-Medium"
        case bold = "Custom-Font-Large"
        
        
        public func fontSize(size: CGFloat) -> UIFont? {
            let fontName = self.rawValue
            return UIFont(name: fontName, size: size)
        }
        
    }
        
}

@discardableResult
public func registerFont(_ font: String) -> Bool {

    guard let fontUrl = Bundle.main.url(forResource: font, withExtension: "ttf") else {
        return false
    }

    let fontData = try! Data(contentsOf: fontUrl)

    if let provider = CGDataProvider.init(data: fontData as CFData) {

        var error: Unmanaged<CFError>?

        let font:CGFont = CGFont(provider)!
        if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
            print(error.debugDescription)
            return false
        } else {
            return true
        }
    }
    return false
}
