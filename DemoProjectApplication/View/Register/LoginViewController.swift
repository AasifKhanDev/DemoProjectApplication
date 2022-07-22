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
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        let emailStr = emailTextField.text ?? ""
        let passwordStr = passwordTextField.text ?? ""
        loginVM.loginApi(emailStr, passwordStr)
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
        guard let loginResult = result else {
            debugPrint(error ?? "Login failed")
            return
        }
        print(loginResult.token, loginResult.id)
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
}
