//
//  ExtentionUIView.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 20/07/22.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground() {
//        let colorTop =  UIColor(red: 255.0/255.0, green: 180.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 255.0/255.0, green: 20.0/255.0, blue: 30.0/255.0, alpha: 1.0).cgColor
        
//        gradientLayer.locations = [0, 1]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        let colorTop =  UIColor(red: 255.0/255.0, green: 180.0/255.0, blue:
                                    0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 20.0/255.0, blue: 30.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setViewStyle() {
        self.setGradientBackground()
        self.layoutIfNeeded()
        self.layer.cornerRadius = 30.0
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.masksToBounds = true
    }
    
    func setBtnStyle() {
        self.setGradientBackground()
        self.layer.cornerRadius = 7.0
        self.layer.masksToBounds = true
    }
}
