//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/5/19.
//

import UIKit

public enum GradientOrientation {
    case vertical
    case horizontal
}

extension UIImage {
    
    //Extract Average Color From Image, Deafults To Background Color If NIL
    public func extractImageColor(backupColor: UIColor) -> UIColor? {
        
        guard let inputImage = CIImage(image: self) else { return nil }
        
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return backupColor }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
        
    }
    
    //Resize Image
    public func resized(toWidth width: CGFloat) -> UIImage? {
        
      let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
      UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
      defer { UIGraphicsEndImageContext() }
      draw(in: CGRect(origin: .zero, size: canvasSize))
      return UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    //Convert Image To Base64
    public func convertImageToBase64(compression: CGFloat) -> String {
        let imageData = self.jpegData(compressionQuality: compression)!
        return (imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters))
    }
    
    public convenience init?(bounds: CGRect, colors: [UIColor], orientation: GradientOrientation = .horizontal) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map({ $0.cgColor })
        
        if orientation == .horizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5);
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5);
        }
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }

    
}
