//
//  RootVie.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        if loginViewVM.user.isRegistered {
            ContentView()
                .onAppear(perform: {
                    loginViewVM.user = StorageManager.shared.read()
                })
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(LoginViewViewModel())
}
