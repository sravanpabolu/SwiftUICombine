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
    
    static let txt_email    = "User name (email address)"
    static let txt_password = "Password"
    
    static let btn_register = "Register"
    static let btn_login    = "Login"
    
    
}

enum NetworkError: Error {
    case badUrl, badResponse, badParsing
    case custom(description: String)
}
