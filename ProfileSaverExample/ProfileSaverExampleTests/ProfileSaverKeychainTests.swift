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
        let keychainItem = KeychainPasswordItem(service: "testservice", account: "test")
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        testDelete()
    }
    
    func testSimpleWriteRead() {
        let keychainItem = KeychainPasswordItem(service: "testservice", account: "test")
        do {
            try keychainItem.savePassword("testPassword")
        } catch {
            XCTAssert(false, "KEYCHAIN WRITE FAILED")
        }
        
        do {
            try KeychainPasswordItem(service: "testservice", account: "test").readPassword()
        } catch {
            XCTAssert(false, "KEYCHAIN LOAD FAILED")
        }
        testDelete()
    }
    
    func testDelete() {
        do {
            try KeychainPasswordItem(service: "testservice", account: "test").deleteItem()
        } catch {
            XCTAssert(false, "KEYCHAIN DELETION FAILED")
        }
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
