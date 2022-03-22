//
//  UserRegistrationView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 22/03/22.
//

import SwiftUI

struct UserRegistrationView: View {
    var body: some View {
        NavigationView {
            Text("User Registration")
        }
        .navigationTitle(Constants.title_register)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
