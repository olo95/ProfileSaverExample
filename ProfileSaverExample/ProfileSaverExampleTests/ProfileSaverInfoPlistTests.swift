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
            assert(false, "CANT FIND INFO PLIST FILE")
        }
        
        guard let data = try? Data(contentsOf: url),
              let _ = try? PropertyListDecoder().decode(InfoPlist.self, from: data) else {
                assert(false, "COULDN'T PARSE PLIST FILE INTO INFOPLIST STRUCT")
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
