//
//  StringExtension.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 25/07/22.
//

import Foundation

extension String {
    
    func isValidEmail() -> String? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if !emailPred.evaluate(with: self) {
            return "Please Enter Valid Email"
        }
        return nil
    }
    
    func isValidName() -> String? {
        let nameRegEx = "(?<! )[-a-zA-Z' ]{1,20}"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        if !namePred.evaluate(with: self) {
            return "Please enter you Email"
        }
        if self == "" {
            return "Please enter your name."
        }
        return nil
    }
    
    func isValidPassword() -> String? {
        if self == "" {
            return "Please enter your password."
        } else if self.count < 6 {
            return "Password must contains atleast 6 characters."
        }
        return nil
    }
    
}
