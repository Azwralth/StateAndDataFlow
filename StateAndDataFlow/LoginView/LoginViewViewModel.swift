//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import Combine

final class LoginViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var isLoggedIn = false
    
    private let storageManager = StorageManager.shared
    
    var isNameValid: Bool {
        name.count >= 3
    }
    
    func logIn() {
        if !name.isEmpty {
            isLoggedIn.toggle()
            storageManager.save(name: name, isRegistered: true)
        }
    }
}
