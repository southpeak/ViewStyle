//
//  UISwitch+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/24.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UISwitch {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .onTintColor:                  onTintColor                     <<< (value as? UIColor)
        case .tintColor:                    tintColor                       <<< (value as! UIColor)
        case .thumbTintColor:               thumbTintColor                  <<< (value as? UIColor)
        case .onImage:                      onImage                         <<< (value as? UIImage)
        case .offImage:                     offImage                        <<< (value as? UIImage)
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
