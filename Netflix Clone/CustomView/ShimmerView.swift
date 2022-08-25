//
//  ShimmerView.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 24/08/22.
//

import UIKit

extension UIView {
    func loadShimmer(cornerRadius: Int = 0) {
        // Create the gradient
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)

        // Add the gradient to the label. Causes this sublayer to appear on top.
        layer.addSublayer(gradient)

        // Create the shimmer animation
        let animationGroup = makeAnimationGroup()
        animationGroup.beginTime = 0.0
        gradient.add(animationGroup, forKey: "backgroundColor")

        // Set the gradients frame to the labels bounds
        gradient.frame = bounds
    }

    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
        let animDuration: CFTimeInterval = 1.5

        let anim1 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim1.fromValue = UIColor.lightGray.cgColor
        anim1.toValue = UIColor.darkGray.cgColor
        anim1.duration = animDuration
        anim1.beginTime = 0.0

        let anim2 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim2.fromValue = UIColor.darkGray.cgColor
        anim2.toValue = UIColor.lightGray.cgColor
        anim2.duration = animDuration
        anim2.beginTime = anim1.beginTime + anim1.duration

        let group = CAAnimationGroup()
        group.animations = [anim1, anim2]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = anim2.beginTime + anim2.duration
        group.isRemovedOnCompletion = false

        if let previousGroup = previousGroup {
            // Offset groups by 0.33 seconds for effect
            group.beginTime = previousGroup.beginTime + 0.33
        }
        return group
    }

    func removeShimmerView() {
        for layer in (self.layer.sublayers ?? []) {
            if (layer as? CAGradientLayer) != nil {
                layer.removeFromSuperlayer()
                return
            }
        }
    }
}
