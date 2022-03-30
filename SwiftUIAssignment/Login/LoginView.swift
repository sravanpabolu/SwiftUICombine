//
//  LoginView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var isRegisterActive: Bool = false

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
        .alert(loginViewModel.alertMsg,
               isPresented: $loginViewModel.showingAlert) {
            Button(Constants.alert_ok, role: .cancel) {
                
            }
        }
    }
    var emailTextField: some View {
        CustomTextField(name: Constants.txt_email,
                        bindingField: $loginViewModel.email,
                        keyboardType: .emailAddress,
                        errorText: "")
    }
    
    var passwordTextField: some View {
        CustomTextField(name: Constants.txt_password, bindingField: $loginViewModel.password, isSecure: true)
    }
    
    var loginButton: some View {
        Button(action: {
            loginViewModel.submitLogin()
        }) {
            Text(Constants.btn_login)
                .font(.system(size: 12, weight: .semibold))
                .frame(alignment: .center)
        }
        .background(NavigationLink(destination: AlbumListView(), isActive: $loginViewModel.isLoginSuccess) {
            Text("")
        })
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
