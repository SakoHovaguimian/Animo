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

public func logMessage(_ message: String) {
    print(message)
}

public func logError(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
    print("\(message) called from \(function) located in file: \(file): line: \(line) 🔚🔚🔚🔚")
}

//MARK:- PARSE PLIST
public func getPlist<T>(withName name: String) -> [T]? {
    
    if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
        let xml = FileManager.default.contents(atPath: path) {
        
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [T]
    }

    return nil
    
}

//MARK:- ADD TO PLIST
public func addToPlist<T: Encodable>(_ plist: String, type: T) {
    
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .xml

    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(plist)

    do {
        
        let data = try encoder.encode(type.self)
        try data.write(to: path)
        
    } catch {
        
        print(error)
    }
    
}




