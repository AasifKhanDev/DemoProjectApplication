//
//  ViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 19/07/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var loginBn: UIButton!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var emailErrorView: UIView!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    @IBOutlet weak var passwordErrorView: UIView!
   
    // MARK: - Properties
    let loginVM = LoginViewModel()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        mainView.setViewStyle()
        loginBn.setBtnStyle()
        emailTextField.text = "eve.holt@reqres.in"
        passwordTextField.text = "12345"
        loginVM.delegate = self
        //resetForm()
    }
    
    private func resetForm() {
        loginBn.isEnabled = false
         emailErrorLbl.isHidden = false
         passwordErrorLbl.isHidden = false
         emailErrorLbl.text = ""
         passwordErrorLbl.text = ""
         emailTextField.text = ""
         passwordTextField.text = ""
         loginBn.alpha = 0.5
     }
    
    // MARK: - Action Methods
    @IBAction func showBtnPressed(_ sender: UIButton) {
        if(showBtn.isSelected == true) {
                   passwordTextField.isSecureTextEntry = true
               } else {
                   passwordTextField.isSecureTextEntry = false
               }
        sender.isSelected = !sender.isSelected
        
    }
    
    @IBAction func didChangeEmail(_ sender: Any) {
         let email = emailTextField.text ?? ""
        if let errorMsg = email.isValidEmail() {
            emailErrorLbl.text = errorMsg
            emailErrorLbl.isHidden = false
            emailErrorLbl.textColor = UIColor.systemRed
            emailErrorView.backgroundColor = UIColor.systemRed
            loginBn.isEnabled = false
            loginBn.alpha = 0.5
        } else {
            emailErrorLbl.isHidden = false
            emailErrorLbl.text = "Email"
            emailErrorLbl.textColor = UIColor.white
            emailErrorView.backgroundColor = UIColor.white
        }
        checkValidation()
    }
    
    @IBAction func didChangePassword(_ sender: Any) {
        let password = passwordTextField.text ?? ""
        if let errorMsg = password.isValidPassword() {
           passwordErrorLbl.text = errorMsg
           passwordErrorLbl.isHidden = false
           passwordErrorLbl.textColor = UIColor.systemRed
           passwordErrorView.backgroundColor = UIColor.systemRed
           loginBn.isEnabled = false
           loginBn.alpha = 0.5
       } else {
           passwordErrorLbl.isHidden = false
           passwordErrorLbl.text = "Password"
           passwordErrorLbl.textColor = UIColor.white
           passwordErrorView.backgroundColor = UIColor.white
       }
        checkValidation()
    }
    
    private func checkValidation() {
        if emailTextField.text != nil && passwordTextField.text != nil && (emailErrorLbl.text == "Email" && passwordErrorLbl.text == "Password") {
            loginBn.isEnabled = true
            loginBn.alpha = 1.0
        } else {
            loginBn.isEnabled = false
            loginBn.alpha = 0.5
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        let emailStr = emailTextField.text ?? ""
        let passwordStr = passwordTextField.text ?? ""
        
        loginVM.loginApi(emailStr, passwordStr)
        LoadingIndicator.shared.showLoader(self.view)
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        let forgotPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    func didReceiveResponse(_ result: BasicResponseModel?, _ error: String?) {
        let emailStr = emailTextField.text
        LoadingIndicator.shared.hideLoader()
        guard let loginResult = result else {
            debugPrint(error ?? "Login failed")
            return
        }
        print(loginResult.token, loginResult.id)
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
}
