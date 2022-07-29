//
//  ProfileSettingViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 29/07/22.
//

import UIKit

class ProfileSettingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        cameraBtn.layer.cornerRadius = cameraBtn.frame.height/2
        cameraBtn.setGradientBackground()
        cameraBtn.layer.masksToBounds = true
    }

}
