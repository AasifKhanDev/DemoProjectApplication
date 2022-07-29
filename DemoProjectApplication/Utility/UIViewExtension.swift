//
//  UIViewExtension.swift
//  DesignPractice
//
//  Created by DW-10 on 23/06/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class LoadingIndicator: UIView {
    
   public static let shared = LoadingIndicator()
    
    private var indicator = NVActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 40), type: .ballSpinFadeLoader, color: .white, padding: 10)
    private var mainLoadeView: UIView!
    
    func showLoader(_ forView: UIView) {
        print("show loader")
        mainLoadeView = UIView(frame: forView.bounds)
        mainLoadeView.backgroundColor = .clear
        forView.addSubview(mainLoadeView)
        self.indicator.startAnimating()
        mainLoadeView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerYAnchor.constraint(equalTo: mainLoadeView.centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: mainLoadeView.centerXAnchor).isActive = true
        indicator.widthAnchor.constraint(equalToConstant: 60).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func hideLoader() {
        print("hide loader")
        self.indicator.stopAnimating()
        mainLoadeView.removeFromSuperview()
    }
}
