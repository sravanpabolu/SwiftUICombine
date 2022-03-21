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
}

enum NetworkError: Error {
    case badUrl, badResponse, badParsing
    case custom(description: String)
}
