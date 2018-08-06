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
    
    let tokenService = "tokenService"
    let tokenAccount = "tokenAccount"
    let testTokenService = "testTokenService"
    let testTokenAccount = "testTokenAccount"
    private let expirationInterval = 600.0
    
    var isValidatedTokenExist: Bool {
        var rawToken = ""
        do {
            rawToken = try readToken()
        } catch {
            return false
        }
        guard let unpackedRawToken = unpack(rawToken: rawToken) else { return false }
        return checkExpiration(of: unpackedRawToken.rawExpirationDate)
    }
    
    private func readToken() throws -> String {
        do {
            return try load(key: tokenAccount, with: tokenService)
        } catch KeychainManagerErrors.keychainLoadFailed {
            throw KeychainManagerErrors.keychainLoadFailed
        }
    }
    
    private func unpack(rawToken: String) -> (rawValue: String, rawExpirationDate: Int)? {
        let tokenArray = rawToken.components(separatedBy: ";")
        guard tokenArray.count == 2,
            let tokenValue = tokenArray.first,
            let tokenExpirationIntDate = Int(tokenArray[1]) else { return nil }
        return (rawValue: tokenValue, rawExpirationDate: tokenExpirationIntDate)
    }
    
    private func checkExpiration(of tokenIntDate: Int) -> Bool {
        return Date(timeIntervalSince1970: Double(tokenIntDate)).addingTimeInterval(expirationInterval) < Date()
    }
    
    func save(key: String, value: String, with service: String) throws {
        do {
            try KeychainPasswordItem(service: service, account: key).savePassword(value)
        } catch {
            throw KeychainManagerErrors.keychainSaveFailed
        }
    }
    
    func load(key: String, with service: String) throws -> String {
        do {
            let keychainItem = KeychainPasswordItem(service: service, account: key)
            return try keychainItem.readPassword()
        } catch {
            throw KeychainManagerErrors.keychainLoadFailed
        }
    }
}
