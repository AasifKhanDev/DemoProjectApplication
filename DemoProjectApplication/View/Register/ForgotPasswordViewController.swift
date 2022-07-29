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
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var emailErrorView: UIView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        mainView.setViewStyle()
        sendResetPasswordBtn.setBtnStyle()
        resetForm()
    }
    private func resetForm() {
         sendResetPasswordBtn.isEnabled = false
         emailErrorLbl.isHidden = false
         emailErrorLbl.text = ""
         emailTextField.text = ""
         sendResetPasswordBtn.alpha = 0.5
     }
    
    @IBAction func didChangeEmail(_ sender: Any) {
         let email = emailTextField.text ?? ""
        if let errorMsg = email.isValidEmail() {
            emailErrorLbl.text = errorMsg
            emailErrorLbl.isHidden = false
            emailErrorLbl.textColor = UIColor.systemRed
            emailErrorView.backgroundColor = UIColor.systemRed
            sendResetPasswordBtn.isEnabled = false
            sendResetPasswordBtn.alpha = 0.5
        } else {
            emailErrorLbl.isHidden = false
            emailErrorLbl.text = "Email"
            emailErrorLbl.textColor = UIColor.white
            emailErrorView.backgroundColor = UIColor.white
            sendResetPasswordBtn.isEnabled = true
            sendResetPasswordBtn.alpha = 1.0
        }
    }
    
    // MARK: - Action Methods
    @IBAction func BackBtnPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func sendResetPasswordBtnLinkPressed(_ sender: UIButton) {
        debugPrint("Send Reset Password Link")
        LoadingIndicator.shared.showLoader(self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            LoadingIndicator.shared.hideLoader()
        }
    }
}
