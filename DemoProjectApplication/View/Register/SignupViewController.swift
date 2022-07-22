//
//  SignupViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 19/07/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameErrorLbl: UILabel!
    @IBOutlet weak var nameErrorView: UIView!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var emailErrorView: UIView!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    @IBOutlet weak var passwordErrorView: UIView!
    
    // MARK: - Properties
    let signupVM = SignupViewModel()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setViewStyle()
        signupBtn.setBtnStyle()
        signupVM.delegate = self
        emailTextField.text = "eve.holt@reqres.in"
        passwordTextField.text = "12345"
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
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        debugPrint("Signup Button Pressed")
        let emailStr = emailTextField.text ?? ""
        let passwordStr = passwordTextField.text ?? ""
        signupVM.SignupApi(emailStr, passwordStr)
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
    // MARK: - Extension
extension SignupViewController: SignupViewModelDelegate {
    func didReceiveSignupResponse(_ result: BasicResponseModel?, _ error: String?) {
        guard let signupResponse = result else {
            
            debugPrint(error ?? "Error Register Failed")
            return
        }
        debugPrint("\(signupResponse.id)", signupResponse.token)
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
