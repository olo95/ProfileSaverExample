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
    case keychainRemoveFailed
}

class KeychainManager {
    
    static let shared = KeychainManager()
    private init() {}
    
    func token(account: String = KeychainConstants.tokenAccount, service: String = KeychainConstants.tokenService) -> (rawValue: String, rawExpirationDate: Int)? {
        var rawToken = ""
        do {
            rawToken = try load(account: account, with: service)
        } catch {
            return nil
        }
        return unpack(rawToken: rawToken)
    }
    
    func isValidatedTokenExist(account: String = KeychainConstants.tokenAccount, service: String = KeychainConstants.tokenService) -> Bool {
        guard let token = token(account: account, service: service) else { return false }
        return !isExpired(tokenIntDate: token.rawExpirationDate)
    }
    
    func unpack(rawToken: String) -> (rawValue: String, rawExpirationDate: Int)? {
        let tokenArray = rawToken.components(separatedBy: ";")
        guard tokenArray.count == 2,
            let tokenValue = tokenArray.first,
            let tokenExpirationIntDate = Int(tokenArray[1]) else { return nil }
        return (rawValue: tokenValue, rawExpirationDate: tokenExpirationIntDate)
    }
    
    func isExpired(tokenIntDate: Int) -> Bool {
        return Date(timeIntervalSince1970: Double(tokenIntDate)).addingTimeInterval(KeychainConstants.expirationInterval) < Date()
    }
    
    func save(_ token: Token) throws {
        let rawTokenValue = "\(token.accessToken);\(token.createdAt)"
        try save(account: KeychainConstants.tokenAccount, value: rawTokenValue, with: KeychainConstants.tokenService)
    }
    
    func save(account: String, value: String, with service: String) throws {
        do {
            try KeychainPasswordItem(service: service, account: account).savePassword(value)
        } catch {
            throw KeychainManagerErrors.keychainSaveFailed
        }
    }
    
    func load(account: String, with service: String) throws -> String {
        do {
            let keychainItem = KeychainPasswordItem(service: service, account: account)
            return try keychainItem.readPassword()
        } catch {
            throw KeychainManagerErrors.keychainLoadFailed
        }
    }
    
    func remove(account: String, with service: String) throws {
        do {
            try KeychainPasswordItem(service: service, account: account).deleteItem()
        } catch {
            throw KeychainManagerErrors.keychainRemoveFailed
        }
    }
}
