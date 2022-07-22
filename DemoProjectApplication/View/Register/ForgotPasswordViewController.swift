//
//  ForgotPasswordViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 19/07/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sendResetPasswordBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emalErrorLbl: UILabel!
    @IBOutlet weak var emailErrorView: UIView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        mainView.setViewStyle()
        sendResetPasswordBtn.setBtnStyle()
    }
    
    // MARK: - Action Methods
    @IBAction func BackBtnPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func sendResetPasswordBtnLinkPressed(_ sender: UIButton) {
        debugPrint("Send Reset Password Link")
    }
}
