//
//  UserRegistrationViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 23/03/22.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var gender: Gender = .male
    @Published var dob: Date = Date.now
    @Published var country: Country = .india
    @Published var password: String = ""
    @Published var introduction: String = "Add your bio here"
    @Published var showingAlert = false
//    var dob: Int = Calendar.current.dateComponents([.year], from: Date()).year!
    
    var alertMsg: String {
        isRegistrationValid ? Constants.alert_success : Constants.alert_err_msg
    }
    
    var emailPrompt: String {
        isEmailValid ? "" : Constants.err_email
    }
    
    var namePrompt: String {
        isNameValid ? "" : Constants.err_name
    }
    
    var phonePrompt: String {
        isPhoneNumberValid ? "" : Constants.err_phoneno
    }
    
//    var dobPrompt: String {
//        isDOBValid ? "" : Constants.err_dob
//    }
    
    private var isEmailValid: Bool {
        Utils.isEmailValid(email: email)
    }
    
    private var isNameValid: Bool {
        name.count < 3 ? false : true
    }
    
//    private var isDOBValid: Bool {
//        (Calendar.current.dateComponents([.year], from: Date()).year! - dob) >= 21
//    }
    
    private var isPhoneNumberValid: Bool {
//        let test = NSPredicate(format: "SELF MATCHES %@",
//                                    "^((\\+)?(\\d{2}[-])?(\\d{10}){1})?(\\d{11}){0,1}?$")
//        return test.evaluate(with: phone)
        
        phone.isEmpty ? false : true
    }
    
    private var isRegistrationValid: Bool {
        isEmailValid && isNameValid && isPhoneNumberValid
//        && isDOBValid
    }
    
    func submitForm() {
        if isRegistrationValid {
            print("VALID REGISTRATION")
            StorageManager.shared.saveData(for: email, value: password)
        } else {
            print("INVALID DATA")
        }
        showingAlert = true
    }
    
    func resetFields() {
        name = ""
        email = ""
        phone = ""
        gender = .male
        dob = Date.now
        country = .india
        introduction = ""
        password = ""
    }
}
