//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import Combine

final class LoginViewViewModel: ObservableObject {
    @Published var user = User()
    
    var isNameValid: Bool {
        user.name.count >= 3
    }
}
