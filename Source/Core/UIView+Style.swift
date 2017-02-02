//
//  UIView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView & CALayer Attribute

extension Property {
    
    public static let backgroundColor              = Property(#keyPath(UIView.backgroundColor), MIType.color>?)
    public static let isHidden                     = Property(#keyPath(UIView.isHidden), .bool)
    public static let alpha                        = Property(#keyPath(UIView.alpha), .cgFloat)
    public static let isOpaque                     = Property(#keyPath(UIView.isOpaque), .bool)
    public static let tintColor                    = Property(#keyPath(UIView.tintColor), MIType.color>!)
    public static let tintAdjustmentMode           = Property(#keyPath(UIView.tintAdjustmentMode), .viewTintAdjustmentMode)
    public static let clipsToBounds                = Property(#keyPath(UIView.clipsToBounds), .bool)
    public static let clearsContextBeforeDrawing   = Property(#keyPath(UIView.clearsContextBeforeDrawing), .bool)
    
    public struct layer {
        public static let contentsGravity          = Property(#keyPath(UIView.layer.contentsGravity), .string)
        public static let opacity                  = Property(#keyPath(UIView.layer.opacity), .float)
        public static let isHidden                 = Property(#keyPath(UIView.layer.isHidden), .bool)
        public static let masksToBounds            = Property(#keyPath(UIView.layer.masksToBounds), .bool)
        public static let mask                     = Property(#keyPath(UIView.layer.mask), MIType.layer>?)
        public static let isDoubleSided            = Property(#keyPath(UIView.layer.isDoubleSided), .bool)
        public static let cornerRadius             = Property(#keyPath(UIView.layer.cornerRadius), .cgFloat)
        public static let borderWidth              = Property(#keyPath(UIView.layer.borderWidth), .cgFloat)
        public static let borderColor              = Property(#keyPath(UIView.layer.borderColor), MIType.cgColor>?)
        public static let backgroundColor          = Property(#keyPath(UIView.layer.backgroundColor), MIType.cgColor>?)
        public static let shadowOpacity            = Property(#keyPath(UIView.layer.shadowOpacity), .float)
        public static let shadowRadius             = Property(#keyPath(UIView.layer.shadowRadius), .cgFloat)
        public static let shadowOffset             = Property(#keyPath(UIView.layer.shadowOffset), .cgSize)
        public static let shadowColor              = Property(#keyPath(UIView.layer.shadowColor), MIType.cgColor>?)
        public static let shadowPath               = Property(#keyPath(UIView.layer.shadowPath), MIType.cgPath>?)
        public static let allowsEdgeAntialiasing   = Property(#keyPath(UIView.layer.allowsEdgeAntialiasing), .bool)
        public static let allowsGroupOpacity       = Property(#keyPath(UIView.layer.allowsGroupOpacity), .bool)
    }
}

// MARK: - UIView Extension for Special Properties

/// This extension for UIView is used to define actions for special properties.
/// When the properties can not be set with KVC, such as button's title color,
/// you must override these properties and functions to do the job at you
/// subclasses or subclasses' extension
extension UIView {
    
    /// An array for special properties that should be specially treated.
    ///
    /// Sometimes, the special property name is not equal to the property name,
    /// just like button title color that you must assign for special property
    /// name for diffeent state: normal, highlighted, disabled, selected.
    /// You can assign a name for each state and handle it in the na_setValue
    /// method.
    open var mi_specialProperties: [String] {
        return [
            #keyPath(UIView.isHidden),
            #keyPath(UIView.isOpaque),
            #keyPath(UIView.tintAdjustmentMode)
        ]
    }
    
    /// Set value for a special property.
    ///
    /// - Notes: If you override this method in you subclasses' extension, you must 
    ///          call super.na_setValue(_:forKey) in the default case.
    ///
    /// - Parameters:
    ///   - value: value for the property
    ///   - key: key for the property
    open func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case #keyPath(UIView.isHidden):
            self.isHidden = value as! Bool
        case #keyPath(UIView.isOpaque):
            self.isOpaque = value as! Bool
        case #keyPath(UIView.tintAdjustmentMode):
            self.tintAdjustmentMode = value as! UIViewTintAdjustmentMode
        default:
            break
        }
    }
}
