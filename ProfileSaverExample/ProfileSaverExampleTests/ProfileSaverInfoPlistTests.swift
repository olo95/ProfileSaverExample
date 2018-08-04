//
//  ProfileSaverInfoPlistTests.swift
//  ProfileSaverExampleTests
//
//  Created by Alexander Stolar on 04/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import XCTest
@testable import ProfileSaverExample

class ProfileSaverInfoPlistTests: XCTestCase {
    
    func testInfoPlistParsing() {
        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist") else {
            XCTAssert(false, "CANT FIND INFO PLIST FILE")
            return
        }
        
        guard let data = try? Data(contentsOf: url),
              let _ = try? PropertyListDecoder().decode(InfoPlist.self, from: data) else {
                XCTAssert(false, "COULDN'T PARSE PLIST FILE INTO INFOPLIST STRUCT")
                return
        }
    }
    
    func testInfoPlistUrls() {
        guard let infoPlist = InfoPlist.shared else {
            XCTAssert(false, "COULDN'T RETRIEVIE VALID INFO.PLIST")
            return
        }
        XCTAssert((URL(string: infoPlist.baseUrl) != nil), "BASE URL IS NOT VALID")
        XCTAssert((URL(string: infoPlist.baseOauthUrl) != nil), "BASE OAUTH URL IS NOT VALID")
        XCTAssert((URL(string: infoPlist.redirectUri) != nil), "REDIRECT URI IS NOT VALID")
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
