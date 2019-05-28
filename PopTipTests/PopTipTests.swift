//
//  PopTipTests.swift
//  PopTipTests
//
//  Created by Arvin Quiliza on 5/28/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import XCTest
@testable import ToolTipControl

class PopTipTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPugViewModel() {
        let owner = Owner(firstName: "firstName", lastName: "lastName", image: "")
        let tag = Tag(title: "dummy")
        let pug = Pug(image: "", message: "Random Message", tags: [tag], owner: owner)
        let pugViewModel = PugViewModel(pug: pug)
        
        XCTAssertEqual(pug.message, pugViewModel.message)
        XCTAssertEqual(tag.title, pugViewModel.tags[0].title)
        XCTAssertEqual(owner.firstName, pugViewModel.owner.firstName)
        XCTAssertEqual(owner.lastName, pugViewModel.owner.lastName)
        XCTAssertEqual("Tags: \(tag.title)", pugViewModel.tagsText)
        
    }
    
    func testPugViewModelEmptyTag() {
        let owner = Owner(firstName: "firstName", lastName: "lastName", image: "")
        let tag = Tag(title: "")
        let pug = Pug(image: "", message: "random message", tags: [tag], owner: owner)
        let pugViewModel = PugViewModel(pug: pug)
        
        XCTAssertEqual("Tags: no tags available", pugViewModel.tagsText)
    }

}
