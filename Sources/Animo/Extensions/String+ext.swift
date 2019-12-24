//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/23/19.
//

import Foundation
import UIKit


extension String {
    
    //Convert Base64 To Image
    public func convertBase64ToImage() -> UIImage {
      let imageData = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
      return UIImage(data: imageData)!
    }
    
}
