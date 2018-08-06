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
    
    private let testService = "testService"
    private let testAccount = "testAccount"
    private let testTokenService = "testTokenService"
    private let testTokenAccount = "testTokenAccount"
    
    func testSimpleWrite() {
        let keychainItem = KeychainPasswordItem(service: testService, account: testAccount)
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        testDelete()
    }
    
    func testSimpleWriteRead() {
        let keychainItem = KeychainPasswordItem(service: testService, account: testAccount)
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        
        do {
            try KeychainPasswordItem(service: testService, account: testAccount).readPassword()
        } catch {
            XCTAssert(false, "KEYCHAIN LOAD FAILED")
        }
        testDelete()
    }
    
    func testDelete() {
        do {
            try KeychainPasswordItem(service: testService, account: testAccount).deleteItem()
        } catch {
            XCTAssert(false, "KEYCHAIN DELETION FAILED")
        }
    }
    
    func testEmptyRecordRead() {
        testDelete()
        do {
            try KeychainPasswordItem(service: testService, account: testAccount).readPassword()
        } catch {
            XCTAssert(true)
            return
        }
        XCTAssert(false, "THERE IS UNDELETED RECORD")
    }
    
    func testRawTokenUnpack() {
        testDelete()
        XCTAssertTrue((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb3245352nb35;1231213515") != nil))
        XCTAssertFalse((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb3245352nb351231213515") != nil))
        XCTAssertFalse((KeychainManager.shared.unpack(rawToken: "asdjubijugbsdjgb;3245352nb35;1231213515") != nil))
    }
    
    func testEmptyToken() {
        XCTAssertFalse(KeychainManager.shared.isValidatedTokenExist)
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
