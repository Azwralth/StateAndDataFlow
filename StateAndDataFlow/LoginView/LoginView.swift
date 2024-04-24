//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            ExtractedView(
                name: $loginViewVM.user.name,
                nameIsValid: loginViewVM.isNameValid
            )
        }
        Button(action: login) {
            Label("OK", systemImage: "checkmark.circle")
        }
        .disabled(!loginViewVM.isNameValid)
    }
    
    private func login() {
        loginViewVM.user.isRegistered.toggle()
        StorageManager.shared.save(user: loginViewVM.user)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}

struct ExtractedView: View {
    @Binding var name: String
    var nameIsValid: Bool
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Text("\(name.count)")
                .padding()
                .foregroundStyle(nameIsValid ? .green : .red)
        }
    }
}
