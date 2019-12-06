//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit

//MARK:- PRINTING DICTIONARIES AND ARRAYS CLEANLY INTO THE CONSOLE

public func prettyPrinted(value: Any) {
    print(value as! NSDictionary)
}

public func logError(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
    print("\(message) called from \(function) located in file: \(file): line: \(line)")
}


