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
    public static let darkTeal = setColor(r: 0, g: 93, b: 105)
    
    //HEX
    
    //Blacks
    public static let notSoBlack = UIColor(hex: "#101010")
    
    //Whites
    public static let notSoWhite = UIColor(hex: "#E6E6E6")
    public static let eggShell = UIColor(hex: "#EAEFD3")
    
    //Grays
    public static let blackishGray = UIColor(hex: "#2d3436")
    public static let soothingGray = UIColor(hex: "#D7D9D7")
    
    //Reds
    public static let maroon = UIColor(hex: "#EF5B58")
    
    //Blues
    public static let darkBlue = UIColor(hex: "#072028")
    public static let midnightTeal = UIColor(hex: "#0092A4")
    public static let muddyBlue = UIColor(hex: "#6F8E8E")
    public static let lightTeal = UIColor(hex: "#04C3DB")
    
    //Purples
    public static let regalPurple = UIColor(hex: "#6c5ce7")
    public static let purplishBlack = UIColor(hex: "#2B2D42")
    
    //Greens
    public static let mintGreen = UIColor(hex: "#55efc4")
    public static let armyGreen = UIColor(hex: "#646E68")
    public static let imgurGreen = UIColor(hex: "#3E885B")
    
    //Pinks
    public static let lightSalmon = UIColor(hex: "#E9C0B3")
    public static let sexySalmon = UIColor(hex: "#EB3939")
    public static let tinderOrange = UIColor(hex: "#F5504A")
    
    
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

    //MARK:- Auto Adapt To Dark Mode and Listens to Events
    @available(iOS 13.0, *)
    public convenience init(light: UIColor, dark: UIColor) {
            self.init { trait -> UIColor in
                return trait.userInterfaceStyle == .dark ? dark : light
        }
    }
    
}

