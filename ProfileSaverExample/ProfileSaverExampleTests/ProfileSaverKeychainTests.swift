//
//  ProfileSaverKeychainTests.swift
//  ProfileSaverExampleTests
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import XCTest
@testable import ProfileSaverExample

class ProfileSaverKeychainTests: XCTestCase {
    
    func testSimpleWrite() {
        let keychainItem = KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount)
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        testSimpleDelete()
    }
    
    func testSimpleWriteRead() {
        let keychainItem = KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount)
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        
        do {
            try KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount).readPassword()
        } catch {
            XCTAssert(false, "KEYCHAIN LOAD FAILED")
        }
        testSimpleDelete()
    }
    
    func testSimpleDelete() {
        do {
            try KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount).deleteItem()
        } catch {
            XCTAssert(false, "KEYCHAIN DELETION FAILED")
        }
    }
    
    func testEmptyRecordRead() {
        testSimpleDelete()
        do {
            try KeychainPasswordItem(service: KeychainConstants.testService, account: KeychainConstants.testAccount).readPassword()
        } catch {
            XCTAssert(true)
            return
        }
        XCTAssert(false, "THERE IS UNDELETED RECORD")
    }
    
    func testRawTokenUnpack() {
        XCTAssertTrue((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb3245352nb35;1231213515") != nil))
        XCTAssertFalse((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb3245352nb351231213515") != nil))
        XCTAssertFalse((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb;3245352nb35;1231213515") != nil))
        XCTAssertFalse((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb3245352nb35;123asd213515") != nil))
    }
    
    func testEmptyToken() {
        XCTAssert(((try? KeychainManager.shared.remove(account: KeychainConstants.testTokenAccount, with: KeychainConstants.testTokenService)) != nil))
        XCTAssertFalse(((try? KeychainManager.shared.load(account: KeychainConstants.testTokenAccount, with: KeychainConstants.testTokenService)) != nil))
    }
    
    func testValidToken() {
        let currentTime = Date()
        let timeInterval = currentTime.timeIntervalSince1970
        let timeIntervalInt = Int(timeInterval)
        
        do {
            try KeychainPasswordItem(service: KeychainConstants.testTokenService, account: KeychainConstants.testTokenAccount).deleteItem()
            try KeychainPasswordItem(service: KeychainConstants.testTokenService, account: KeychainConstants.testTokenAccount).savePassword("asdwfsdvewgtweg;\(timeIntervalInt)")
        } catch {
            XCTAssert(false, "KEYCHAIN SAVE OR LOAD FAILED")
        }
        XCTAssertTrue(KeychainManager.shared.isValidatedTokenExist(account: KeychainConstants.testTokenAccount, service: KeychainConstants.testTokenService))
    }
    
    func testInvalidToken() {
        let currentTime = Date()
        let timeInterval = currentTime.timeIntervalSince1970
        let timeIntervalInt = Int(timeInterval) + Int(KeychainConstants.expirationInterval) + 1
        
        do {
            try KeychainPasswordItem(service: KeychainConstants.testTokenService, account: KeychainConstants.testTokenAccount).deleteItem()
            try KeychainPasswordItem(service: KeychainConstants.testTokenService, account: KeychainConstants.testTokenAccount).savePassword("asdwfsdvewgtweg;\(timeIntervalInt)")
        } catch {
            XCTAssert(false, "KEYCHAIN SAVE OR LOAD FAILED")
        }
        XCTAssertFalse(KeychainManager.shared.isValidatedTokenExist(account: KeychainConstants.testTokenAccount, service: KeychainConstants.testTokenService))
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
