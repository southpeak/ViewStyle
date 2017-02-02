//
//  UIImageView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation

extension Property {
    public static let image       = Property(#keyPath(UIImageView.image), MIType.image>?)
    public static let highlightedImage  = Property(#keyPath(UIImageView.highlightedImage), MIType.image>?)
    
    public static let isUserInteractionEnabled = Property(#keyPath(UIImageView.isUserInteractionEnabled), .bool)
    
//    public static let isHighlighted     = Property(#keyPath(UIImageView.isHighlighted), .bool)
//    public static let tintColor         = Property(#keyPath(UIImageView.tintColor), MIType.color>!)
}
