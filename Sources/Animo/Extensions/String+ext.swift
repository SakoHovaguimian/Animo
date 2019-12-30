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
    
    ///Meant to be used for `testing`. Doesn't `cache` data. Please use `AlamofireImage` / `KingFisher` / `SDWebImage`
    public func loadImageFromURL(completion: @escaping (UIImage?) -> ()) {
        
        DispatchQueue.main.async {
            
            guard let url = URL(string: self) else { return completion(nil) }
            guard let data = try? Data(contentsOf: url) else { return completion(nil) }
            
            let image = UIImage(data: data)
            completion(image)
            
        }
        
    }
    
}
