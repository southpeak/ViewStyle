//
//  Property.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation

/// `Property` struct
///
/// This struct is used to describe a property of the UIView or its subclass.
/// We need two informations of the property:
/// 1. name: which is used when we set the value of the property with KVC or special method;
/// 2. type: which is used to check the type is correct in debug mode.
public struct Property {
    
    /// Property's name
    var name: String
    
    /// Property's type, you must make sure the type is correct if you want to define
    /// an `Property` for a property, or it will crash when debugging.
    var type: MIType
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - name: property's name
    ///   - type: property's type
    public init(_ name: String, _ type: MIType) {
        self.name = name
        self.type = type
    }
}

// MARK: Hashable
extension Property: Hashable {
    public var hashValue: Int {
        return name.hashValue
    }
}

// MARK: Equatable
extension Property: Equatable {
    public static func ==(lhs: Property, rhs: Property) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }
}
