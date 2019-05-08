//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Desarrollo on 5/6/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {

    var entryUnderTest: Entry!
    
    override func setUp() {
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }
   
    override func tearDown() {
        super.tearDown()
        entryUnderTest = nil
    }
    
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Title does not match")
    }
}
