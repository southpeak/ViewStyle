//
//  UITextField+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .font:                         font                            <<< (value as? UIFont)
        case .textColor:                    textColor                       <<< (value as? UIColor)
        case .textAlignment:                textAlignment                   <<< (value as! NSTextAlignment)
        case .borderStyle:                  borderStyle                     <<< (value as! UITextBorderStyle)
        case .background:                   background                      <<< (value as? UIImage)
        case .disabledBackground:           disabledBackground              <<< (value as? UIImage)
        case .clearButtonMode:              clearButtonMode                 <<< (value as! UITextFieldViewMode)
        case .rightViewMode:                rightViewMode                   <<< (value as! UITextFieldViewMode)
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
