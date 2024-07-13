//
//  LoginView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ScrollView {
            TextField("Usernamne", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
        }

    }
}

#Preview {
    LoginView()
}
