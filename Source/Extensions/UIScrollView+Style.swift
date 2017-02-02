//
//  UIScrollView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/24.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension Property {
    
    public static let contentSize               = Property(#keyPath(UIScrollView.contentSize), .cgSize)
    public static let contentInset              = Property(#keyPath(UIScrollView.contentInset), .edgeInsets)
    
    public static let isScrollEnabled           = Property(#keyPath(UIScrollView.isScrollEnabled), .bool)
    public static let isDirectionalLockEnabled  = Property(#keyPath(UIScrollView.isDirectionalLockEnabled), .bool)
    public static let scrollsToTop              = Property(#keyPath(UIScrollView.scrollsToTop), .bool)
    public static let isPagingEnabled           = Property(#keyPath(UIScrollView.isPagingEnabled), .bool)
    public static let bounces                   = Property(#keyPath(UIScrollView.bounces), .bool)
    public static let alwaysBounceVertical      = Property(#keyPath(UIScrollView.alwaysBounceVertical), .bool)
    public static let alwaysBounceHorizontal    = Property(#keyPath(UIScrollView.alwaysBounceHorizontal), .bool)
    
    public static let indicatorStyle            = Property(#keyPath(UIScrollView.indicatorStyle), .scrollViewIndicatorStyle)
    public static let scrollIndicatorInsets     = Property(#keyPath(UIScrollView.scrollIndicatorInsets), .edgeInsets)
    
    public static let showsHorizontalScrollIndicator    = Property(#keyPath(UIScrollView.showsHorizontalScrollIndicator), .bool)
    public static let showsVerticalScrollIndicator      = Property(#keyPath(UIScrollView.showsVerticalScrollIndicator), .bool)
}

extension UIScrollView {
    
    open override var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            #keyPath(UIScrollView.indicatorStyle)
        ])
        
        return properties
    }
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        switch key {
        case #keyPath(UIScrollView.indicatorStyle):
            self.indicatorStyle = value as! UIScrollViewIndicatorStyle
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
