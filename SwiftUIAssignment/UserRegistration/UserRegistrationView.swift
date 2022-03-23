//
//  UserRegistrationView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import SwiftUI


struct UserRegistrationView: View {
    @StateObject var userRegistrationViewModel = UserRegistrationViewModel()
    
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
        CustomTextField(name: Constants.txt_name,
                        bindingField: $userRegistrationViewModel.name,
                        errorText: userRegistrationViewModel.namePrompt)
    }
    
    var genderSegmentControl: some View {
        HStack {
            Text(Constants.txt_gender)
            Picker(Constants.txt_gender,
                   selection: $userRegistrationViewModel.gender) {
                ForEach(Gender.allCases, id: \.self) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
    
    var emailTextField: some View {
        CustomTextField(name: Constants.txt_email,
                        bindingField: $userRegistrationViewModel.email,
                        keyboardType: .emailAddress,
                        errorText: userRegistrationViewModel.emailPrompt)
    }
    
    var phoneTextField: some View {
        CustomTextField(name: Constants.txt_phoneno,
                        bindingField: $userRegistrationViewModel.phone,
                        keyboardType: .namePhonePad,
                        errorText: userRegistrationViewModel.phonePrompt)
    }
    
    var dobTextField: some View {
        //TODO: Few dates like Mar 23, 26 are showing in DD/MM/YYYY format. they are getting reset to DD-MMM-YYYY, when any other date is selected or segment value changed in gender or value changed in country
        
        VStack {
            DatePicker(Constants.txt_dob,
                       selection: $userRegistrationViewModel.dob,
                       displayedComponents: [.date])
                .padding()
//            ErrorTextView(errorText: Constants.err_dob)
        }
    }
    
    var countryPicker: some View {
        HStack {
            Text(Constants.txt_country)
            Spacer()
            Picker(Constants.txt_country, selection: $userRegistrationViewModel.country) {
                ForEach(Country.allCases, id: \.self) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.menu)
        }
        .padding()
    }
    
    var passwordTextField: some View {
        CustomTextField(name: Constants.txt_password, bindingField: $userRegistrationViewModel.password, isSecure: true)
    }
    
    var introductionView: some View {
        VStack(alignment: .leading) {
            Text(Constants.txt_intro)
                .padding()
            TextEditor(text: $userRegistrationViewModel.introduction)
                .foregroundColor(.secondary)
                .border(.secondary)
                .padding()
        }
    }
    
    var submitButton: some View {
        CustomButton(title: Constants.btn_submit) {
            userRegistrationViewModel.submitForm()
        }
    }
    
    var resetButton: some View {
        CustomButton(title: Constants.btn_reset) {
            userRegistrationViewModel.resetFields()
        }
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
