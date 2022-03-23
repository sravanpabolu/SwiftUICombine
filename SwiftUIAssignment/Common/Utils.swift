//
//  Utils.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import Foundation

struct Utils {
    
    static func validate(text: String) -> Bool {
        if text.isEmpty, text.count > 2 {
            return false
        }
        return true
    }
    
    static func validate(email: String) -> Bool {
        return true
    }
    
    static private func validateEmpty(text: String) -> Bool {
        !text.isEmpty ? true : false
    }
}
