//
//  RootVie.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        if storageManager.read().isLoggedIn {
            ContentView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(LoginViewViewModel())
}
