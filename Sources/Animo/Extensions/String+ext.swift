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
  
    
    public func customAttributedString(_ text1: String, _ text2: String,
                                       font1: UIFont? = nil, font2: UIFont? = nil,
                                       font1Size: CGFloat, font2Size: CGFloat,
                                       color1: UIColor? = nil, color2: UIColor? = nil) -> NSAttributedString {
        
        let attributedString = NSAttributedString(string: text1,
                                                  attributes:[.foregroundColor: color1 ?? .black,
                                                      .font: font1 ?? UIFont.systemFont(ofSize: font1Size)])
        
        let attributedString2 = NSAttributedString(string: text2,
                                                   attributes:[.foregroundColor: color2 ?? .lightGray,
                                                                      .font: font2 ?? UIFont.systemFont(ofSize: font2Size)])
        let combination = NSMutableAttributedString()
        combination.append(attributedString)
        combination.append(attributedString2)
        
        return combination
        
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
}
