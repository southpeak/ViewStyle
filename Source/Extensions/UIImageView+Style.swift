//
//  UIImageView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation

extension UIImageView {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .image:                        image                           <<< (value as? UIImage)
        case .highlightedImage:             highlightedImage                <<< (value as? UIImage)
        case .isUserInteractionEnabled:     isUserInteractionEnabled        <<< (value as! Bool)
        case .isHighlighted:                isHighlighted                   <<< (value as! Bool)
        case .tintColor:                    tintColor                       <<< (value as! UIColor)
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
