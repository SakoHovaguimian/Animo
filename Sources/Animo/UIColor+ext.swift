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

    //RGB
    public static let skyBlue = setColor(r: 87, g: 154, b: 230)
    
    //HEX
    public static let mintGreen = UIColor(hex: "#55efc4")
    public static let regalPurple = UIColor(hex: "#6c5ce7")
    public static let blackishGray = UIColor(hex: "#2d3436")
    public static let purplishBlack = UIColor(hex: "#2B2D42")
    public static let armyGreen = UIColor(hex: "#646E68")
    public static let soothingGray = UIColor(hex: "#D7D9D7")
    public static let imgurGreen = UIColor(hex: "#3E885B")
    public static let maroon = UIColor(hex: "#EF5B58")
    public static let eggShell = UIColor(hex: "#EAEFD3")
    
    
    //MARK:- SETS COLOR WITHOUT THE 255 SYNTAX
    
    public static func setColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    //MARK:- USE HEX TO SET COLORS WITH INIT
    
    public convenience init?(hex: String) {

        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            self.init(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(1))
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init (
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
        
    }

    
    

    
    
    
    
}

