//
//  UITextView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .font:                         font                            <<< (value as? UIFont)
        case .textColor:                    textColor                       <<< (value as? UIColor)
        case .isEditable:                   isEditable                      <<< (value as! Bool)
        case .allowsEditingTextAttributes:  allowsEditingTextAttributes     <<< (value as! Bool)
        case .textAlignment:                textAlignment                   <<< (value as! NSTextAlignment)
        case .textContainerInset:           textContainerInset              <<< (value as! UIEdgeInsets)
        case .isSelectable:                 isSelectable                    <<< (value as! Bool)
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
