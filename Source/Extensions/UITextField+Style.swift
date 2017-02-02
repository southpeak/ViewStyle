//
//  UITextField+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITextField Attributes
extension Property {
    
    public static let borderStyle               = Property(#keyPath(UITextField.borderStyle), .textBorderStyle)
    public static let background                = Property(#keyPath(UITextField.background), MIType.image>?)
    public static let disabledBackground        = Property(#keyPath(UITextField.disabledBackground), MIType.image>?)
    public static let clearButtonMode           = Property(#keyPath(UITextField.clearButtonMode), .textFieldViewMode)
}

// MARK: - Special Attributes
extension UITextField {
    
    open override var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            #keyPath(UITextField.textAlignment),
        ])
        
        return properties
    }
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case #keyPath(UITextField.textAlignment):
            self.textAlignment = value as! NSTextAlignment
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
