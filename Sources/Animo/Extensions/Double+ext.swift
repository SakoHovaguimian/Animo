//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 3/7/20.
//

import Foundation

extension Double {

    //Truncating Values
    public func truncate(to places: Int) -> Double {
        return Double(Int(pow(10, Double(places)) * self)) / pow(10, Double(places))
    }

}
