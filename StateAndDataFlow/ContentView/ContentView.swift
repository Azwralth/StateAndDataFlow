//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 23.04.2024.
//

import SwiftUI

struct ContentView: View {
    private var contentViewVM = ContentViewViewModel()
    private let storageManager = StorageManager.shared
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(storageManager.read().name)")
                .font(.title)
                .padding(.top, 100)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(color: .red, title: contentViewVM.buttonTitle, action: contentViewVM.startTimer)
            
            ButtonView(color: .blue, title: "LogOut") {
                contentViewVM.logOut()
                loginViewVM.user.name = ""
            }
                .padding(.top, 40)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel())
}
