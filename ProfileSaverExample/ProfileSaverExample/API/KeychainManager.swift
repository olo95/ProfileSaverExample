//
//  KeychainManager.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 02/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

enum KeychainManagerErrors: Error {
    case keychainSaveFailed
    case keychainLoadFailed
}

class KeychainManager {
    
    static let shared = KeychainManager()
    private init() {}
    
    let tokenService = "token"
    
    func checkToken() -> Bool {
        return true
    }
    
    func save(key: String, value: String, with service: String) throws {
        do {
            try KeychainPasswordItem(service: service, account: key).savePassword(value)
        } catch {
            throw KeychainManagerErrors.keychainSaveFailed
        }
    }
    
    func load(key: String, with service: String) throws -> String? {
        do {
            let keychainItem = KeychainPasswordItem(service: service, account: key)
            return try keychainItem.readPassword()
        } catch {
            throw KeychainManagerErrors.keychainLoadFailed
        }
    }
}
