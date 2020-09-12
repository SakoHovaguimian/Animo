//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 9/12/20.
//

import Foundation

open class Parser {

    static public func encode<T>(_ value: T) throws -> Any where T: Encodable {
        let jsonData = try JSONEncoder().encode(value)
        return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
    }
    
    static public func decode<T>(_ type: T.Type, from json: Any) throws -> T where T: Decodable {
        
        let jsonData = try JSONSerialization.data(withJSONObject: json as! Data, options: [])
        return try JSONDecoder().decode(type, from: jsonData)
    }
    
}
