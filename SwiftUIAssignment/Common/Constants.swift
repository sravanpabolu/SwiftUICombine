//
//  Constants.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import Foundation

struct Constants {
    static let albumApiUrl = "https://jsonplaceholder.typicode.com/photos"
    
    static let noImageIcon = "no-image-icon"
    
    static let title_login = "Login"
    static let title_register = "Register"
    static let title_Albums   = "Albums List"
    
    static let txt_username = "User name (email address)"
    static let txt_password = "Password"
    
    static let btn_register = "Register"
    static let btn_login    = "Login"
    static let btn_submit   = "Submit"
    static let btn_reset    = "Reset"
    
    static let txt_name     = "Name"
    static let txt_gender   = "Gender"
    static let txt_email    = "Email"
    static let txt_phoneno  = "Phone Number"
    static let txt_dob      = "Date of Birth"
    static let txt_country  = "Country"
    static let txt_intro    = "Introduction"
    
    static let err_name     = "Enter valid name"
    static let err_email    = "Enter valid email"
    static let err_phoneno  = "Enter valid phone number"
    static let err_dob      = "Age must be more than 21 years"
    static let err_intro    = "Enter some introduction"
}

enum NetworkError: Error {
    case badUrl, badResponse, badParsing
    case custom(description: String)
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case others = "Others"
}

enum Country: String, CaseIterable {
    case india = "India"
    case us = "US"
    case uk = "UK"
}
