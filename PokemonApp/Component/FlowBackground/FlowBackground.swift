//
//  FlowBackground.swift
//  PokemonApp
//
//  Created by Prizega  on 10/05/23.
//

import Foundation
import UIKit

class FlowingBackgroundView: UIView {
//    override class var layerClass: AnyClass {
//        return CAGradientLayer.self
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        // Define the three colors for the gradient
//        let colors: [CGColor] = [
//            UIColor.orangeCustom.cgColor,
//            UIColor.greenCustom.cgColor,
//            UIColor.blueCustom.cgColor
//        ]
//        
//        // Create a gradient layer
//        guard let gradientLayer = layer as? CAGradientLayer else { return }
//        gradientLayer.colors = colors
//        
//        // Set the direction of the gradient (horizontal)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 200, y: 0.5)
//        
//        // Create an animation for the color flow
//        let animation = CABasicAnimation(keyPath: "colors")
//        animation.fromValue = colors
//        animation.toValue = [colors[1], colors[2], colors[0]]
//        animation.duration = 10.0
//        animation.repeatCount = Float.infinity
//        animation.autoreverses = true
//    
//        // Apply the animation to the gradient layer
//        gradientLayer.add(animation, forKey: "colorFlowAnimation")
//        
//        
//    }
    
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        let colors = [UIColor.orangeCustom.cgColor, UIColor.greenCustom.cgColor]
//        let locations: [CGFloat] = [0.0, 1.0]
//        let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: locations)!
//
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: bounds.width, y: bounds.height)
//
//        // Animate the colors
//        let animation = CABasicAnimation(keyPath: "colors")
//        animation.fromValue = colors
//        animation.toValue = colors.reversed()
//        animation.duration = 2.0
//        animation.autoreverses = true
//        animation.repeatCount = Float.infinity
//
//        let animationLayer = CALayer()
//        animationLayer.add(animation, forKey: "colorsAnimation")
//        context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
//    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
        
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
        
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor.greenCustom.cgColor,
            UIColor.blueCustom.cgColor,
            UIColor.orangeCustom.cgColor
        ]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
}
