//
//  LoginViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showingAlert: Bool = false
    @Published var isLoginSuccess: Bool = false

    var alertMsg: String = ""
    
    private var isEmailValid: Bool {
        Utils.isEmailValid(email: email)
    }
    
    private var isPasswordValid: Bool {
        !password.isEmpty
    }

    private var allFieldsValid: Bool {
        isEmailValid && isPasswordValid
    }
    
    func submitLogin() {
        if allFieldsValid {
            do {
                try validateUser()
                showingAlert = false
                isLoginSuccess = true
            } catch let err as LoginError {
                switch err {
                case LoginError.noUser:
                    alertMsg = "No User"
                case LoginError.passwordError:
                    alertMsg = "Wrong Password"
                }
                showingAlert = true
            } catch {
                alertMsg = "Unknown Error"
                showingAlert = true
            }
        } else {
            alertMsg = Constants.alert_err_msg
            showingAlert = true
        }
    }
    
    private func validateUser() throws {
        guard let retrievedPassword = StorageManager.shared.getData(for: email, type: String.self) else {
            /// Assuming no user
            throw LoginError.noUser
        }
        
        /// Password Error
        if password != retrievedPassword {
            throw LoginError.passwordError
        }
    }
}
