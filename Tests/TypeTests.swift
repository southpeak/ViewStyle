//
//  TypeTests.swift
//  ViewStyle
//
//  Created by Konka on 2017/2/1.
//  Copyright © 2017年 Minya. All rights reserved.
//

import XCTest

@testable import ViewStyle

class TypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialize() {
        
        let type = MIType("UIView")
        
        XCTAssertNotNil(type)
        
        XCTAssertEqual("UIView", type.name)
    }
    
    func testUnwrap() {
        let optional = MIType("Optional<UIView>")
        var unwrappedType = optional.unwrap
        
        XCTAssertEqual(unwrappedType.name, "UIView")
        
        let implicitly = MIType("ImplicitlyUnwrappedOptional<UIColor>")
        unwrappedType = implicitly.unwrap
        XCTAssertEqual(unwrappedType.name, "UIColor")
    }
    
    func testIsOptional() {
        var type = MIType("UIView")
        
        XCTAssertFalse(type.__isOptional, "'UIView' is not optional type")
        XCTAssertFalse(type.__isImplicitlyUnwrappedOptional, "'UIView' is not implicitly unwrapped optional type")
        
        type = MIType("Optional<UIView>")
        XCTAssertTrue(type.__isOptional, "'Optional<UIView>' is an optional type")
        XCTAssertFalse(type.__isImplicitlyUnwrappedOptional, "'Optional<UIView>' is not implicitly unwrapped optional type")
        
        type = MIType("ImplicitlyUnwrappedOptional<UIView>")
        XCTAssertFalse(type.__isOptional, "'ImplicitlyUnwrappedOptional<UIView>' is not optional type")
        XCTAssertTrue(type.__isImplicitlyUnwrappedOptional, "'ImplicitlyUnwrappedOptional<UIView>' is an implicitly unwrapped optional type")
    }
    
    func testIsKindOfType() {
        let normalType = MIType("UIView")
        let optionalType = MIType("Optional<UIView>")
        let implicitlyType = MIType("ImplicitlyUnwrappedOptional<UIView>")
        
        XCTAssertTrue(normalType.isKindOf(type: MIType("UIView")))
        XCTAssertTrue(optionalType.isKindOf(type: MIType("Optional<UIView>")))
        XCTAssertTrue(implicitlyType.isKindOf(type: MIType("ImplicitlyUnwrappedOptional<UIView>")))
        
        XCTAssertTrue(normalType.isKindOf(type: optionalType))
        XCTAssertTrue(implicitlyType.isKindOf(type: optionalType))
        
        XCTAssertTrue(normalType.isKindOf(type: implicitlyType))
        
        XCTAssertFalse(optionalType.isKindOf(type: implicitlyType))
        XCTAssertFalse(implicitlyType.isKindOf(type: normalType))
    }
    
    func testConvertOperator() {
        var type = MIType("UIView")
        
        XCTAssertEqual(type>?, MIType("Optional<UIView>"))
        XCTAssertEqual(type>!, MIType("ImplicitlyUnwrappedOptional<UIView>"))
        
        type = MIType("Optional<UIView>")
        XCTAssertEqual(type>?, MIType("Optional<Optional<UIView>>"))
        XCTAssertEqual(type>!, MIType("ImplicitlyUnwrappedOptional<Optional<UIView>>"))
    }
}
