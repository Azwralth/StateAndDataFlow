//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func read() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func delete(userModel: LoginViewViewModel) {
        userModel.user.isRegistered.toggle()
        userModel.user.name = ""
        userData = nil
    }
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
}
