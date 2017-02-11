//
//  UILabel+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .font:                         font                            <<< (value as! UIFont)
        case .textColor:                    textColor                       <<< (value as! UIColor)
        case .textAlignment:                textAlignment                   <<< (value as! NSTextAlignment)
        case .lineBreakMode:                lineBreakMode                   <<< (value as! NSLineBreakMode)
        case .isEnabled:                    isEnabled                       <<< (value as! Bool)
        case .adjustsFontSizeToFitWidth:    adjustsFontSizeToFitWidth       <<< (value as! Bool)
        case .baselineAdjustment:           baselineAdjustment              <<< (value as! UIBaselineAdjustment)
        case .minimumScaleFactor:           minimumScaleFactor              <<< (CGFloat(value as! NSNumber))
        case .numberOfLines:                numberOfLines                   <<< (Int(value as! NSNumber))
        case .highlightedTextColor:         highlightedTextColor            <<< (value as? UIColor)
        case .isHighlighted:                isHighlighted                   <<< (value as! Bool)
        case .shadowColor:                  shadowColor                     <<< (value as? UIColor)
        case .shadowOffset:                 shadowOffset                    <<< (value as! CGSize)
        case .allowsDefaultTighteningForTruncation:
            if #available(iOS 9.0, *) {
                allowsDefaultTighteningForTruncation <<< (value as! Bool)
            }
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
