//
//  MIType.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation

postfix operator >?
postfix operator >!

/// Type Definitions for ViewStyle
public struct MIType {
    
    internal var name: String
    
    public init(_ typeName: String) {
        name = typeName
    }
    
    // MARK: - Public Methods
    
    /// Get the unwrapped type of the string.
    ///
    /// For example, if the string is an optional form, just like `Optional<UIColor>`,
    /// it will return `UIColor`; or if the string is an ImplicitlyUnwrappedOptional form,
    /// just like 'ImplicitlyUnwrappedOptional<UIColor>', it will also return `UIColor`.
    /// However, if the string is nested optional form, just like `Optional<Optional<UIColor>>`,
    /// it will just return `Optional<UIColor>`, so if you want to get `UIColor`, you must
    /// call this property twice, such as following code:
    ///
    /// `"Optional<Optional<UIColor>>".unwrap.unwrap`
    ///
    public var unwrap: MIType {
        
        let startIndex = name.range(of: "<")
        let endIndex = name.range(of: ">", options: .backwards, range: nil, locale: nil)
        
        guard let start = startIndex, let end = endIndex else {
            return self
        }
        
        let unwrappedName = name.substring(with: Range(uncheckedBounds: (start.upperBound, end.lowerBound)))
        
        return MIType(unwrappedName)
    }
    
    // MARK: - Internal Methods
    
    /// Check the string is equal to the `type`
    ///
    /// - Notes: There are three situations to return true:
    ///
    ///          1. Current string is equal to parameter `type`;
    ///          2. If `type` is optional form, string's value is corresponding to
    ///             `type`'s non-optional form or implicitly unwrapped optional form.
    ///             For example, if `type` is `Optional<UIColor>`, we can assign a value
    ///             of the type `UIColor` or `ImplicitlyUnwrappedOptional<UIColor>`;
    ///          3. If `type` is implicitly unwrapped optional form, string's value
    ///             is corresponding to `type`'s normal type. For example, if `type`
    ///             is `ImplicitlyUnwrappedOptional<UIColor>`, we can assign a value
    ///             of the type `UIColor`, but not a `Optional<UIColor>`
    ///
    /// - Parameter type: The target type of the string
    /// - Returns: If self is equal to the type, return true; else return false
    internal func isKindOf(type: MIType) -> Bool {
        
        if self == type {
            return true
        }
        
        if type.__isOptional {
            // If type is optional, you can assign three types value
            // 1. Normal type
            // 2. Optional type
            // 3. ImplicitlyUnwrappedOptional type
            return self == type.unwrap || self == type.unwrap>!
        } else if type.__isImplicitlyUnwrappedOptional {
            // If type is ImplicitlyUnwrappedOptional, you can assign two types value:
            // 1. Normal type
            // 2. ImplicitlyUnwrappedOptional type
            return self == type.unwrap
        }
        
        return false
    }
    
    // MARK: - Private Methods
    
    /// Check if string is optional form.
    private var __isOptional: Bool {
        return name.hasPrefix("Optional<")
    }
    
    /// Check if string is ImplicitlyUnwrappedOptional form.
    private var __isImplicitlyUnwrappedOptional: Bool {
        return name.hasPrefix("ImplicitlyUnwrappedOptional<")
    }
}

// MARK: - Operator Definitions
extension MIType {
    
    /// Get the optional form of the string.
    ///
    /// This method will wrap the string with `Optional<>`. For example, if the
    /// current string is `UIColor`, it will return `Optional<UIColor>`; or if the
    /// current string is `Optional<UIColor>`, it will return `Optional<Optional<UIColor>>`
    ///
    /// - Returns: Optional form of the string
    public static postfix func >?(type: MIType) -> MIType {
        return MIType("Optional<\(type.name)>")
    }
    
    /// Get the implicitly unwrapped optional form of the string.
    ///
    /// This method will wrap the string with `OptionalImplicitlyUnwrappedOptional<>`.
    /// For example, if the current string is `UIColor`, it will return `ImplicitlyUnwrappedOptional<UIColor>`;
    /// or if the current string is `Optional<UIColor>`, it will return `ImplicitlyUnwrappedOptional<Optional<UIColor>>`
    ///
    /// - Returns: Implicitly unwrapped optional form of the string
    public static postfix func >!(type: MIType) -> MIType {
        return MIType("ImplicitlyUnwrappedOptional<\(type.name)>")
    }
}

// MARK: - Equatable
extension MIType: Equatable {
    public static func ==(lhs: MIType, rhs: MIType) -> Bool {
        return lhs.name == rhs.name
    }
}

// MARK: -
extension MIType {
    
    public static let color         = MIType("UIColor")
    public static let image         = MIType("UIImage")
    public static let font          = MIType("UIFont")
    public static let bool          = MIType("Bool")
    public static let cgFloat       = MIType("CGFloat")
    public static let float         = MIType("Float")
    public static let int           = MIType("Int")
    public static let string        = MIType("String")
    public static let cgColor       = MIType("CGColor")
    public static let cgSize        = MIType("CGSize")
    public static let cgPath        = MIType("CGPath")
    public static let edgeInsets    = MIType("UIEdgeInsets")
    public static let layer         = MIType("CALayer")
    public static let visualEffect  = MIType("UIVisualEffect")
    public static let view          = MIType("UIView")
    public static let textAlignment = MIType("NSTextAlignment")
    public static let lineBreakMode = MIType("NSLineBreakMode")
    
    public static let viewTintAdjustmentMode        = MIType("UIViewTintAdjustmentMode")
    public static let textBorderStyle               = MIType("UITextBorderStyle")
    public static let textFieldViewMode             = MIType("UITextFieldViewMode")
    public static let tableViewCellSeparatorStyle   = MIType("UITableViewCellSeparatorStyle")
    public static let scrollViewIndicatorStyle      = MIType("UIScrollViewIndicatorStyle")
    public static let baselineAdjustment            = MIType("UIBaselineAdjustment")
}

// MARK: -

extension MIType {
    
    /// Type Map
    /// Some properties' real type is not the type represented in the document,
    /// so we should map the real type to the document type for checking type action
    public static var Map: [String: MIType] = [
        "UICachedDeviceRGBColor" : .color,
        "UICachedDeviceWhiteColor": .color,
        "UICTFont": .font
    ]
    
    /// Numeric types
    public static var Numeric: Set<String> = [
        "Int",
        "UInt",
        "Int8",
        "UInt8",
        "Int16",
        "UInt16",
        "Int32",
        "UInt32",
        "Int64",
        "UInt64",
        "Float",
        "Float80",
        "Double",
        "CGFloat"
    ]
    
    /// CFTypes
    /// The original type of these types is __NSCFType, we will convert __NSCFType
    /// to the type you specify.
    public static var CFTypes: [MIType] = [
        .cgColor,
        .cgPath
    ]
}
