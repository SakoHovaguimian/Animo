//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/23/19.
//

import Foundation

extension Date {
    
    
    static public func currentTime(_ format: String) -> String {
         
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current

        formatter.dateFormat = format
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"

        return formatter.string(from: now)
         
      }

    static public func currentDate(_ format: String) -> String {
         
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format
        return formatter.string(from: now)
         
      }
    
    static public func currentDayAsString() -> String {
         
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: now).capitalized
         
      }
    
    @available(iOS 13.0, *)
    static public func timeBetween(_ date1: Date, _ date2: Date, unitStyle: RelativeDateTimeFormatter.UnitsStyle) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = unitStyle
        return formatter.localizedString(for: date1, relativeTo: date2)
    }
    
}
