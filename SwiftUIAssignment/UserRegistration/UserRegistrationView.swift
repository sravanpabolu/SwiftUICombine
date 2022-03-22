//
//  UserRegistrationView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import SwiftUI

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

struct UserRegistrationView: View {
    @State private var name: String = ""
    @State private var gender: Gender = .male
    @State private var email: String = ""
    @State private var phone: String = "9999999999"
    @State private var dob: Date = Date.now
    @State private var country: Country = .india
    @State private var password: String = ""
    @State private var introduction: String = "Add your bio here"
    
    var body: some View {
        NavigationView {
            ScrollView {
                nameTextField
                genderSegmentControl
                emailTextField
                phoneTextField
                dobTextField
                countryPicker
                passwordTextField
                introductionView
                
                HStack {
                    Spacer()
                    resetButton
                    Spacer()
                    submitButton
                    Spacer()
                }
            }
        }
        .navigationTitle(Constants.title_register)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var nameTextField: some View {
        TextField(Constants.txt_name, text: $name)
            .padding()
            .keyboardType(.default)
    }
    
    var genderSegmentControl: some View {
        Picker(Constants.txt_gender, selection: $gender) {
            ForEach(Gender.allCases, id: \.self) { Text($0.rawValue).tag($0) }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    var emailTextField: some View {
        TextField(Constants.txt_email, text: $email)
            .padding()
            .keyboardType(.emailAddress)
    }
    
    var phoneTextField: some View {
        TextField(Constants.txt_phoneno, text: $phone)
            .padding()
            .keyboardType(.namePhonePad)
    }
    
    var dobTextField: some View {
        DatePicker(Constants.txt_dob, selection: $dob)
            .padding()
    }
    
    var countryPicker: some View {
        Picker(Constants.txt_country, selection: $country) {
            ForEach(Country.allCases, id: \.self) { Text($0.rawValue).tag($0) }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    var passwordTextField: some View {
        SecureField(Constants.txt_password, text: $password)
            .padding()
    }
    
    var introductionView: some View {
        VStack(alignment: .leading) {
            Text(Constants.txt_intro)
                .padding()
            TextEditor(text: $introduction)
                .foregroundColor(.secondary)
                .border(.secondary)
                .padding()
        }
    }
    
    var submitButton: some View {
        Button(Constants.btn_submit) {
            print("Submit")
        }
        .padding()
        .border(.secondary)
    }
    
    var resetButton: some View {
        Button(Constants.btn_reset) {
            print("Reset")
        }
        .padding()
        .border(.secondary)
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
