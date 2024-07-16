//
//  LoginView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI

struct LoginView: View {
    @State private var isDeleting: Bool = false
    var body: some View {
        ScrollView {
            TextField("Usernamne", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Button(role: .destructive) {
                isDeleting = true
            } label: {
                Text("Delete")
            }
            .alert("Hi Alert", isPresented: $isDeleting) {
                Button("Ok") {
                    
                }
            } message: {
                Text("This is the first time meet swift ui alert")
            }


        }

    }
}

#Preview {
    LoginView()
}
