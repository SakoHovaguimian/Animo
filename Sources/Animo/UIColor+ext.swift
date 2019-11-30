//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

@available(iOS 10.0, *)

extension UIColor {
    
    //MARK:- LIST OF COLORS I LOVE

    public static let skyBlue = setColor(r: 87, g: 154, b: 230)
    public static let mintGreen = UIColor(hex: "#55efc4")
    public static let regalPurple = UIColor(hex: "#6c5ce7")
    public static let blackishGray = UIColor(hex: "#2d3436")
    public static let purplishBlack = UIColor(hex: "#2B2D42")
    public static let armyGreen = UIColor(hex: "#646E68")
    public static let soothingGray = UIColor(hex: "#D7D9D7")
    public static let imgurGreen = UIColor(hex: "#3E885B")
    public static let maroon = UIColor(hex: "#EF5B58")
    
    
    //MARK:- SETS COLOR WITHOUT THE 255 SYNTAX
    
    public static func setColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    //MARK:- USE HEX TO SET COLORS
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }

    
    

    
    
    
    
}

