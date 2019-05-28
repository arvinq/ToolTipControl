//
//  PopTipServiceTests.swift
//  PopTipTests
//
//  Created by Arvin Quiliza on 5/28/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import XCTest
@testable import ToolTipControl

class PopTipServiceTests: XCTestCase {
    
    let service = MockService()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchInfo() {
        service.fetchInfo { pugs in
            
            guard let pugs = pugs else {
                XCTFail()
                return
            }
            
            XCTAssertNotNil(pugs)
        }
    }
    
}
