//
//  UIButton+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .adjustsImageWhenHighlighted:  adjustsImageWhenHighlighted     <<< (value as! Bool)
        case .adjustsImageWhenDisabled:     adjustsImageWhenDisabled        <<< (value as! Bool)
        case .showsTouchWhenHighlighted:    showsTouchWhenHighlighted       <<< (value as! Bool)
        case .tintColor:                    tintColor                       <<< (value as! UIColor)
        case .contentEdgeInsets:            contentEdgeInsets               <<< (value as! UIEdgeInsets)
        case .titleEdgeInsets:              titleEdgeInsets                 <<< (value as! UIEdgeInsets)
        case .imageEdgeInsets:              imageEdgeInsets                 <<< (value as! UIEdgeInsets)
            
        case .titleColorNormal:             setTitleColor(value as? UIColor, for: .normal)
        case .titleColorHightlighted:       setTitleColor(value as? UIColor, for: .highlighted)
        case .titleColorDisabled:           setTitleColor(value as? UIColor, for: .disabled)
        case .titleColorSelected:           setTitleColor(value as? UIColor, for: .selected)
            
        case .titleShadowColorNormal:       setTitleShadowColor(value as? UIColor, for: .normal)
        case .titleShadowColorHighlighted:  setTitleShadowColor(value as? UIColor, for: .highlighted)
        case .titleShadowColorDisabled:     setTitleShadowColor(value as? UIColor, for: .disabled)
        case .titleShadowColorSelected:     setTitleShadowColor(value as? UIColor, for: .selected)
            
        case .backgroundImageNormal:        setBackgroundImage(value as? UIImage, for: .normal)
        case .backgroundImageHighlighted:   setBackgroundImage(value as? UIImage, for: .highlighted)
        case .backgroundImageDisabled:      setBackgroundImage(value as? UIImage, for: .disabled)
        case .backgroundImageSelected:      setBackgroundImage(value as? UIImage, for: .selected)
            
        case .imageNormal:                  setImage(value as? UIImage, for: .normal)
        case .imageHighlighted:             setImage(value as? UIImage, for: .highlighted)
        case .imageDisabled:                setImage(value as? UIImage, for: .disabled)
        case .imageSelected:                setImage(value as? UIImage, for: .selected)
            
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
