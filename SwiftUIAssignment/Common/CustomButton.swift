//
//  CustomButton.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 23/03/22.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(title, action: action)
        .padding()
        .border(.secondary)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Sample Button") {
            print("Sample button")
        }
    }
}
