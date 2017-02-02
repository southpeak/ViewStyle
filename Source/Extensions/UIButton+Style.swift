//
//  UIButton+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

internal struct MIButton {
    
    struct titleColor {
        static let normal           = "buttonTitleColorNormal"
        static let highlighted      = "buttonTitleColorHighlighted"
        static let disabled         = "buttonTitleColorDisabled"
        static let selected         = "buttonTitleColorSelected"
    }
    
    struct titleShadowColor {
        static let normal           = "buttonTitleShadowColorNormal"
        static let highlighted      = "buttonTitleShadowColorHighlighted"
        static let disabled         = "buttonTitleShadowColorDisabled"
        static let selected         = "buttonTitleShadowColorSelected"
    }
    
    struct backgroundImage {
        
        static let normal           = "buttonBackgroundImageNormal"
        static let highlighted      = "buttonBackgroundImageHighlighted"
        static let disabled         = "buttonBackgroundImageDisabled"
        static let selected         = "buttonBackgroundImageSelected"
    }
    
    struct image {
        static let normal           = "buttonImageNormal"
        static let highlighted      = "buttonImageHighlighted"
        static let disabled         = "buttonImageDisabled"
        static let selected         = "buttonImageSelected"
    }
}

extension Property {
    
    public struct titleColor {
        public static let normal           = Property(MIButton.titleColor.normal,            MIType.color>?)
        public static let hightlighted     = Property(MIButton.titleColor.highlighted,       MIType.color>?)
        public static let disabled         = Property(MIButton.titleColor.disabled,          MIType.color>?)
        public static let selected         = Property(MIButton.titleColor.selected,          MIType.color>?)
    }
    
    public struct titleShadowColor {
        public static let normal           = Property(MIButton.titleShadowColor.normal,      MIType.color>?)
        public static let highlighted      = Property(MIButton.titleShadowColor.highlighted, MIType.color>?)
        public static let disabled         = Property(MIButton.titleShadowColor.disabled,    MIType.color>?)
        public static let selected         = Property(MIButton.titleShadowColor.selected,    MIType.color>?)
    }
    
    public struct backgroundImage {
        public static let normal           = Property(MIButton.backgroundImage.normal,       MIType.image>?)
        public static let highlighted      = Property(MIButton.backgroundImage.highlighted,  MIType.image>?)
        public static let disabled         = Property(MIButton.backgroundImage.disabled,     MIType.image>?)
        public static let selected         = Property(MIButton.backgroundImage.selected,     MIType.image>?)
    }
    
    public struct icon {
        public static let normal           = Property(MIButton.image.normal,                 MIType.image>?)
        public static let highlighted      = Property(MIButton.image.highlighted,            MIType.image>?)
        public static let disabled         = Property(MIButton.image.disabled,               MIType.image>?)
        public static let selected         = Property(MIButton.image.selected,               MIType.image>?)
    }
    
    public static let adjustsImageWhenHighlighted  = Property(#keyPath(UIButton.adjustsImageWhenHighlighted), .bool)
    public static let adjustsImageWhenDisabled     = Property(#keyPath(UIButton.adjustsImageWhenDisabled),    .bool)
    public static let showsTouchWhenHighlighted    = Property(#keyPath(UIButton.showsTouchWhenHighlighted),   .bool)
    public static let contentEdgeInsets            = Property(#keyPath(UIButton.contentEdgeInsets),           .edgeInsets)
    public static let titleEdgeInsets              = Property(#keyPath(UIButton.titleEdgeInsets),             .edgeInsets)
    public static let imageEdgeInsets              = Property(#keyPath(UIButton.imageEdgeInsets),             .edgeInsets)
}

extension UIButton {
    
    override open var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            MIButton.titleColor.normal,
            MIButton.titleColor.highlighted,
            MIButton.titleColor.disabled,
            MIButton.titleColor.selected,
            MIButton.titleShadowColor.normal,
            MIButton.titleShadowColor.highlighted,
            MIButton.titleShadowColor.disabled,
            MIButton.titleShadowColor.selected,
            MIButton.backgroundImage.normal,
            MIButton.backgroundImage.highlighted,
            MIButton.backgroundImage.disabled,
            MIButton.backgroundImage.selected,
            MIButton.image.normal,
            MIButton.image.highlighted,
            MIButton.image.disabled,
            MIButton.image.selected
        ])
        
        return properties
    }
    
    override open func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case MIButton.titleColor.normal:
            self.setTitleColor(value as? UIColor, for: .normal)
        case MIButton.titleColor.highlighted:
            self.setTitleColor(value as? UIColor, for: .highlighted)
        case MIButton.titleColor.disabled:
            self.setTitleColor(value as? UIColor, for: .disabled)
        case MIButton.titleColor.selected:
            self.setTitleColor(value as? UIColor, for: .selected)
        case MIButton.titleShadowColor.normal:
            self.setTitleShadowColor(value as? UIColor, for: .normal)
        case MIButton.titleShadowColor.highlighted:
            self.setTitleShadowColor(value as? UIColor, for: .highlighted)
        case MIButton.titleShadowColor.disabled:
            self.setTitleShadowColor(value as? UIColor, for: .disabled)
        case MIButton.titleShadowColor.selected:
            self.setTitleShadowColor(value as? UIColor, for: .selected)
        case MIButton.backgroundImage.normal:
            self.setBackgroundImage(value as? UIImage, for: .normal)
        case MIButton.backgroundImage.highlighted:
            self.setBackgroundImage(value as? UIImage, for: .highlighted)
        case MIButton.backgroundImage.disabled:
            self.setBackgroundImage(value as? UIImage, for: .disabled)
        case MIButton.backgroundImage.selected:
            self.setBackgroundImage(value as? UIImage, for: .selected)
        case MIButton.image.normal:
            self.setImage(value as? UIImage, for: .normal)
        case MIButton.image.highlighted:
            self.setImage(value as? UIImage, for: .highlighted)
        case MIButton.image.disabled:
            self.setImage(value as? UIImage, for: .disabled)
        case MIButton.image.selected:
            self.setImage(value as? UIImage, for: .selected)
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
