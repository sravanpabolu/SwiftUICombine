//
//  CustomTextField.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 23/03/22.
//

import SwiftUI

struct CustomTextField: View {
    var name: String
    @Binding var bindingField: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    var errorText: String = ""
    
    private let paddingValue: CGFloat   = 15.0
    private let cornerRadius: CGFloat   = 10.0
    private let leadingSpace: CGFloat   = 15.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer(minLength: leadingSpace)
                if !isSecure {
                    TextField(name, text: $bindingField)
                        .padding(paddingValue)
                        .keyboardType(keyboardType)
                        .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(.gray, lineWidth: 1))
                        .background(.background)
                } else {
                    SecureField(name, text: $bindingField)
                        .padding(paddingValue)
                        .keyboardType(keyboardType)
                        .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(.gray, lineWidth: 1))
                        .background(.background)
                }
                Spacer(minLength: leadingSpace)
            }
            ErrorTextView(errorText: errorText)
        }
    }
}

struct ErrorTextView: View {
    var errorText: String
    private let promptSpace: CGFloat    = 15.0
    
    var body: some View {
        Text(errorText)
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
            .padding(.leading, promptSpace)
            .foregroundColor(.red)
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    @State private var name: String = ""
//    @Binding var bindingField: String
//    
//    static var previews: some View {
//        CustomTextField(name: Constants.txt_name,
//                        bindingField: $bindingField)
//    }
//}
