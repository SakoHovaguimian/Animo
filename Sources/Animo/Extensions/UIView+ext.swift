//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 11/30/19.
//

import UIKit
import AVFoundation
import AVKit

extension UIView {
    
    //Round Corners If Height/Width Equal
    
    public func rounded() {
        self.layer.cornerRadius = self.frame.height / 2
    }

    /// Make sure to call `LayoutSubViewsIfNeeded()`.
    /// This takes an array of corners to hate your designer a little less.
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        }
    }
    
    //Add A Simple Shadow
    
    public func addShadow(shadow color: UIColor, opacity: Float, offSet: CGSize, raidus: CGFloat) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = raidus
        
    }
    
    //Add A Simple Gradient
    
    public func simpleGradient(colors: [UIColor]) {
        
        self.layer.sublayers?.filter({$0.name == "MyGradient"}).forEach({$0.removeFromSuperlayer()})
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "MyGradient"
        gradientLayer.colors = colors.map({ $0.cgColor })
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    /// Make sure to call `LayoutSubViewsIfNeeded()`.
    public func addBottomBorder(color: UIColor) {
        
        if let textView = self as? UITextField {
            textView.borderStyle = UITextField.BorderStyle.none
        }
        
        self.backgroundColor = UIColor.clear
        let width: CGFloat = 1.0
        
        let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width))
        borderLine.backgroundColor = color
        self.addSubview(borderLine)
        
    }
    
    //Add Videos To Subview
    
    public func playVideoFromPath(path: String, extType: String, player: AVPlayer, videoView: UIView, loop: Bool) {
        
        if let filePath = Bundle.main.path(forResource: path, ofType: extType) {
            
            let url = URL(fileURLWithPath: filePath)
            
            player.replaceCurrentItem(with: AVPlayerItem(url: url))
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.position = .zero
            playerLayer.frame = videoView.bounds
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

            
            if loop == true {
                
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { (_) in
                    player.seek(to: .zero)
                    player.play()
                }
                
            }

            
            videoView.layer.addSublayer(playerLayer)
            player.play()
            
        }
        
        self.addSubview(videoView)
        
    }
    
    //MARK:- CONSTRAINT HELPER
    
    @available(iOS 9.0, *)
    public func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    @available(iOS 9.0, *)
    public func centerX(inView view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @available(iOS 9.0, *)
    public func centerY(inView view: UIView, constant: CGFloat = 0, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let leftAnchor = leftAnchor {
            anchor(left: leftAnchor, paddingLeft: paddingLeft)
        }
        
    }
    
    @available(iOS 9.0, *)
    public func setDimmensions(height: CGFloat, width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    @available(iOS 9.0, *)
    public func addConstraintsToFillView(_ view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    
}
