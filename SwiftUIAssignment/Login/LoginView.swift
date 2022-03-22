//
//  LoginView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import SwiftUI

struct LoginView: View {
    private var loginViewModel = LoginViewModel()
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    @State private var isEmailValid: Bool = false
    @State private var isPasswordValid: Bool = false
    
    @State private var isRegisterActive: Bool = false
    
//    @FocusState private var emailFieldIsFocused: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                emailTextField
                passwordTextField
                
                HStack {
                    Spacer()
                    loginButton
                    Spacer()
                    registerButton
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle(Constants.title_login)
    }
    
    var emailTextField: some View {
        TextField(
            Constants.txt_email,
            text: $emailText
//            onEditingChanged: { isTextChanged in
//                if isTextChanged {
//                    self.isEmailValid = loginViewModel.validateEmail(email: self.emailText)
//                }
//            }
        )
//            .focused($emailFieldIsFocused)
            .onSubmit {
                print("Username ON SUBMIT")
                validateTextFields()
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
//            .padding()
//            .background(.teal)
    }
    
    var passwordTextField: some View {
        SecureField(Constants.txt_password,
                    text: $passwordText)
            .onSubmit {
                print("Password ON SUBMIT")
                validateTextFields()
            }
            .border(.secondary)
//            .padding()
    }
    
    var loginButton: some View {
        Button(Constants.btn_login) {
            print("Login ON SUBMIT")
            
            validateTextFields()
            
            // TODO: Should use error handling
            if self.isEmailValid, self.isPasswordValid {
                let isValidUser = loginViewModel.validateUser(username: emailText, password: passwordText)
                
                if isValidUser {
                    print("isValidUser")
                } else {
                    print("isNOTValidUser")
                }
            } else {
                print("Email or password not valid")
            }
        }
        .padding()
        .border(.secondary)
    }
    
    var registerButton: some View {
        NavigationLink(isActive: $isRegisterActive) {
            UserRegistrationView()
        } label: {
            Text(Constants.btn_register)
                .padding()
                .border(.secondary)
        }

        
//        (destination: UserRegistrationView(),
//                       isActive: $isRegisterActive,
//                       label: {
//            Text(Constants.title_register)
//        }) {
//            Text(Constants.btn_register)
//                .padding()
//                .border(.secondary)
//        }
    }
    
    private func validateTextFields() {
        print("validateTextFields")
        
        isEmailValid = self.loginViewModel.validateEmail(email: self.emailText)
        isPasswordValid = loginViewModel.validatePassword(text: self.passwordText)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
