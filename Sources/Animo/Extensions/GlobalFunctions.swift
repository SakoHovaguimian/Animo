//
//  File 2.swift
//  
//
//  Created by Sako Hovaguimian on 3/7/20.
//

import UIKit

//Dynamic Content Sizing
@available(iOS 9.0, *)
public func size(forWidth width: CGFloat, withContent content: String) -> CGSize {
    
    let measurementLabel = UILabel()
    measurementLabel.text = content
    measurementLabel.numberOfLines = 0
    measurementLabel.lineBreakMode = .byWordWrapping
    measurementLabel.translatesAutoresizingMaskIntoConstraints = false
    measurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    return measurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    
}
