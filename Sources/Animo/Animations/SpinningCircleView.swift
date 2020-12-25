//
//  SpinningCircleView.swift
//  ProjectPractice
//
//  Created by Sako Hovaguimian on 4/10/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public class SpinningCircleView: UIView {
    
    public let spinningCircle = CAShapeLayer()
    
    public var strokeColor: CGColor = UIColor.lightGray.cgColor
    public var fillColor: CGColor = UIColor.clear.cgColor
    
    public var lineWidth: CGFloat = 10
    public var strokeEnd: CGFloat = 0.25
    
    public var animationDuration: Double = 0.5
    
    private var shouldStopAnimations = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        self.spinningCircle.path = circularPath.cgPath
        self.spinningCircle.fillColor = self.fillColor
        self.spinningCircle.strokeColor = self.strokeColor
        self.spinningCircle.lineWidth = self.lineWidth
        self.spinningCircle.strokeEnd = self.strokeEnd
        self.spinningCircle.lineCap = .round
        
    }
    
    public func updateUI() {
        
        self.spinningCircle.fillColor = self.fillColor
        self.spinningCircle.strokeColor = self.strokeColor
        self.spinningCircle.lineWidth = self.lineWidth
        self.spinningCircle.strokeEnd = self.strokeEnd
        self.spinningCircle.lineCap = .round
        
    }
    
    public func startAnimation() {
        
        guard self.shouldStopAnimations == false else {
            self.shouldStopAnimations = true
            return
        }
        
        self.updateUI()
        
        self.layer.addSublayer(self.spinningCircle)
        
        UIView.animate(withDuration: self.animationDuration, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }) { _  in
            UIView.animate(withDuration: self.animationDuration, delay: 0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { _  in
                self.startAnimation()
            }
        }
        
    }
    
    public func stopAnimation() {
        self.layer.sublayers?.removeAll()
        self.shouldStopAnimations = true
    }
    
}
