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
    
    @AppStorage("name") var name = ""
    @AppStorage("isRegistered") var isRegistered = false
    
    private init() {}
    
    func read() -> User {
        User(name: name, isRegistered: isRegistered)
    }
    
    func delete() {
        name = ""
        isRegistered = false
    }
    
    func save(name: String, isRegistered: Bool) {
        self.name = name
        self.isRegistered = isRegistered
    }
}
