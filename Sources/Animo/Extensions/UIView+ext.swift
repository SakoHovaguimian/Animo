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
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
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
    
    
}
