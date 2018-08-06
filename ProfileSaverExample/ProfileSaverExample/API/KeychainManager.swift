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
    private let expirationInterval = 600.0
    
    var token: String? {
        var rawToken = ""
        do {
            rawToken = try load(account: KeychainConstants.tokenAccount, with: KeychainConstants.tokenService)
        } catch {
            return nil
        }
        guard let unpackedRawToken = unpack(rawToken: rawToken) else { return nil }
        return unpackedRawToken.rawValue
    }
    
    var isValidatedTokenExist: Bool {
        var rawToken = ""
        do {
            rawToken = try load(account: KeychainConstants.tokenAccount, with: KeychainConstants.tokenService)
        } catch {
            return false
        }
        guard let unpackedRawToken = unpack(rawToken: rawToken) else { return false }
        return checkExpiration(of: unpackedRawToken.rawExpirationDate)
    }
    
    func unpack(rawToken: String) -> (rawValue: String, rawExpirationDate: Int)? {
        let tokenArray = rawToken.components(separatedBy: ";")
        guard tokenArray.count == 2,
            let tokenValue = tokenArray.first,
            let tokenExpirationIntDate = Int(tokenArray[1]) else { return nil }
        return (rawValue: tokenValue, rawExpirationDate: tokenExpirationIntDate)
    }
    
    func checkExpiration(of tokenIntDate: Int) -> Bool {
        return Date(timeIntervalSince1970: Double(tokenIntDate)).addingTimeInterval(expirationInterval) < Date()
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
            try KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount).deleteItem()
        } catch {
            throw KeychainManagerErrors.keychainRemoveFailed
        }
    }
}
