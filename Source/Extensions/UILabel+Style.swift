//
//  UILabel+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Attributes

extension Property {
    
    public static let font                         = Property(#keyPath(UILabel.font), MIType.font>!)
    public static let textColor                    = Property(#keyPath(UILabel.textColor), MIType.color>!)
    public static let textAlignment                = Property(#keyPath(UILabel.textAlignment), .textAlignment)
    public static let lineBreakMode                = Property(#keyPath(UILabel.lineBreakMode), .lineBreakMode)
    public static let isEnabled                    = Property(#keyPath(UILabel.isEnabled), .bool)
    public static let adjustsFontSizeToFitWidth    = Property(#keyPath(UILabel.adjustsFontSizeToFitWidth), .bool)
    public static let allowsDefaultTighteningForTruncation = Property(#keyPath(UILabel.allowsDefaultTighteningForTruncation), .bool)
    public static let baselineAdjustment           = Property(#keyPath(UILabel.baselineAdjustment), .baselineAdjustment)
    public static let minimumScaleFactor           = Property(#keyPath(UILabel.minimumScaleFactor), .cgFloat)
    public static let numberOfLines                = Property(#keyPath(UILabel.numberOfLines), .int)
    public static let highlightedTextColor         = Property(#keyPath(UILabel.highlightedTextColor), MIType.color>?)
    public static let isHighlighted                = Property(#keyPath(UILabel.isHighlighted), .bool)
    public static let shadowColor                  = Property(#keyPath(UILabel.shadowColor), MIType.color>?)
    public static let shadowOffset                 = Property(#keyPath(UILabel.shadowOffset), .cgSize)
}

// MARK: - Special Attributes
extension UILabel {
    
    open override var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            #keyPath(UILabel.textAlignment),
            #keyPath(UILabel.lineBreakMode),
            #keyPath(UILabel.isEnabled),
            #keyPath(UILabel.baselineAdjustment),
            #keyPath(UILabel.isHighlighted)
        ])
        
        return properties
    }
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case #keyPath(UILabel.textAlignment):
            self.textAlignment = value as! NSTextAlignment
        case #keyPath(UILabel.lineBreakMode):
            self.lineBreakMode = value as! NSLineBreakMode
        case #keyPath(UILabel.isEnabled):
            self.isEnabled = value as! Bool
        case #keyPath(UILabel.baselineAdjustment):
            self.baselineAdjustment = value as! UIBaselineAdjustment
        case #keyPath(UILabel.isHighlighted):
            self.isHighlighted = value as! Bool
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
