//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 23.04.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var loginVewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(loginVewVM)
    }
}
