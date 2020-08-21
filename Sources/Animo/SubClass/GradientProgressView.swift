//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 8/21/20.
//

import UIKit

public class GradientProgressView: UIProgressView {
    
    private var colors: [UIColor] = [.white, .black] {
        didSet {
            self.updateView()
        }
    }
    
    public init(frame: CGRect, colors: [UIColor]) {
        self.colors = colors
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
                
        if let gradientImage = UIImage(bounds: self.bounds, colors: self.colors) {
            self.progressImage = gradientImage
        }
        
    }
}
