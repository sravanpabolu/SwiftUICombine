//
//  LoginViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import Foundation

class LoginViewModel {
    func validateEmail(email: String) -> Bool {
        if email.isEmpty, email.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassword(text: String) -> Bool {
        if text.isEmpty, text.count < 4 {
            return false
        }
        
        return true
    }
    
    func validateUser(username email: String, password: String) -> Bool {
        //TODO: Verify User from DB
        return true
    }
}
