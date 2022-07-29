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
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
//        emailTextField.text = "eve.holt@reqres.in"
//        passwordTextField.text = "12345"
        resetForm()
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
    private func resetForm() {
        signupBtn.isEnabled = false
        nameErrorLbl.isHidden = false
         emailErrorLbl.isHidden = false
         passwordErrorLbl.isHidden = false
        nameErrorLbl.text = ""
        nameTextField.text = ""
         emailErrorLbl.text = ""
         passwordErrorLbl.text = ""
         emailTextField.text = ""
         passwordTextField.text = ""
         signupBtn.alpha = 0.5
     }
    
    @IBAction func didChangeName(_ sender: Any) {
         let name = nameTextField.text ?? ""
        if let errorMsg = name.isValidName() {
            nameErrorLbl.text = errorMsg
            nameErrorLbl.isHidden = false
            nameErrorLbl.textColor = UIColor.systemRed
            nameErrorView.backgroundColor = UIColor.systemRed
            signupBtn.isEnabled = false
            signupBtn.alpha = 0.5
        } else {
            nameErrorLbl.isHidden = false
            nameErrorLbl.text = "Name"
            nameErrorLbl.textColor = UIColor.white
            nameErrorView.backgroundColor = UIColor.white
        }
        checkValidation()
    }
    
    @IBAction func didChangeEmail(_ sender: Any) {
         let email = emailTextField.text ?? ""
        if let errorMsg = email.isValidEmail() {
            emailErrorLbl.text = errorMsg
            emailErrorLbl.isHidden = false
            emailErrorLbl.textColor = UIColor.systemRed
            emailErrorView.backgroundColor = UIColor.systemRed
            signupBtn.isEnabled = false
            signupBtn.alpha = 0.5
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
            signupBtn.isEnabled = false
            signupBtn.alpha = 0.5
       } else {
           passwordErrorLbl.isHidden = false
           passwordErrorLbl.text = "Password"
           passwordErrorLbl.textColor = UIColor.white
           passwordErrorView.backgroundColor = UIColor.white
       }
        checkValidation()
    }

    private func checkValidation() {
        if nameTextField.text != nil && (nameErrorLbl.text == "Name") && emailTextField.text != nil && passwordTextField.text != nil && (emailErrorLbl.text == "Email" && passwordErrorLbl.text == "Password") {
            signupBtn.isEnabled = true
            signupBtn.alpha = 1.0
        } else {
            signupBtn.isEnabled = false
            signupBtn.alpha = 0.5
        }
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        debugPrint("Signup Button Pressed")
        let emailStr = emailTextField.text ?? ""
        let passwordStr = passwordTextField.text ?? ""
        signupVM.SignupApi(emailStr, passwordStr)
        LoadingIndicator.shared.showLoader(self.view)
      
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
    // MARK: - Extension
extension SignupViewController: SignupViewModelDelegate {
    func didReceiveSignupResponse(_ result: BasicResponseModel?, _ error: String?) {
        LoadingIndicator.shared.hideLoader()
        guard let signupResponse = result else {
            debugPrint(error ?? "Error Register Failed")
            return
        }
        debugPrint("\(signupResponse.id)", signupResponse.token)
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
