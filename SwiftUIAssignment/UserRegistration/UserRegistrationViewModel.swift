//
//  UserRegistrationViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 23/03/22.
//

import Foundation

class UserRegistrationViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var gender: Gender = .male
    @Published var dob: Date = Date.now
    @Published var country: Country = .india
    @Published var password: String = ""
    @Published var introduction: String = "Add your bio here"
//    var dob: Int = Calendar.current.dateComponents([.year], from: Date()).year!

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
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    private var isNameValid: Bool {
        name.count < 3 ? false : true
    }
    
//    private var isDOBValid: Bool {
//        (Calendar.current.dateComponents([.year], from: Date()).year! - dob) >= 21
//    }
    
    private var isPhoneNumberValid: Bool {
        let test = NSPredicate(format: "SELF MATCHES %@",
                                    "^((\\+)?(\\d{2}[-])?(\\d{10}){1})?(\\d{11}){0,1}?$")
        return test.evaluate(with: phone)
    }
    
    private var isRegistrationValid: Bool {
        isEmailValid && isNameValid && isPhoneNumberValid
//        && isDOBValid
    }
    
    func submitForm() {
        if isRegistrationValid {
           print("VALID REGISTRATION")
        } else {
            print("INVALID DATA")
        }
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
