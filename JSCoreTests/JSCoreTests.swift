//
//  JSCoreTests.swift
//  JSCoreTests
//
//  Created by Lex Tang on 4/27/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit
import JSCore
import XCTest

class JSCoreTests: XCTestCase {
    
    let js = JSCore.newContext()
    
    override func setUp() {
        super.setUp()
        js.requireRequestModule()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFuntions() {
        let sumResult = js.run("sum(1, 2)") as! Int
        XCTAssert(sumResult == 3, "Must be 3.")
    }
    
    func testGet() {
        let responseHTML = js.run("new Request('http://www.baidu.com/').get().match(/baidu\\.com/ig)[0]") as! String
        XCTAssert(responseHTML == "baidu.com", "There must be a link of Baidu.")
    }
    
    func testPostFormWithNoParam() {
        let responseString = js.run("new Request('http://api.t.sina.com.cn/statuses/update.json').post(['status=test']).match(/403/g)[0]") as! NSString
        println(responseString)
        XCTAssert(responseString == "403", "Result of postForm must not be nil.")
    }
    
    func testPostFormWithParams() {
        let responseString = js.run("new Request('http://www.hashemian.com/tools/form-post-tester.php').post([\"q=lexrus\"]).match(/lexrus/ig)[0]") as! NSString
        XCTAssert(responseString == "lexrus", "Result of postForm must not be nil.")
    }
    
}
