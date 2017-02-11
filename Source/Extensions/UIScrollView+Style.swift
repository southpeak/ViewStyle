//
//  UIScrollView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/24.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .contentSize:                  contentSize                     <<< (value as! CGSize)
        case .contentInset:                 contentInset                    <<< (value as! UIEdgeInsets)
        case .isScrollEnabled:              isScrollEnabled                 <<< (value as! Bool)
        case .isDirectionalLockEnabled:     isDirectionalLockEnabled        <<< (value as! Bool)
        case .scrollsToTop:                 scrollsToTop                    <<< (value as! Bool)
        case .isPagingEnabled:              isPagingEnabled                 <<< (value as! Bool)
        case .bounces:                      bounces                         <<< (value as! Bool)
        case .alwaysBounceVertical:         alwaysBounceVertical            <<< (value as! Bool)
        case .alwaysBounceHorizontal:       alwaysBounceHorizontal          <<< (value as! Bool)
        case .indicatorStyle:               indicatorStyle                  <<< (value as! UIScrollViewIndicatorStyle)
        case .scrollIndicatorInsets:        scrollIndicatorInsets           <<< (value as! UIEdgeInsets)
        case .showsVerticalScrollIndicator: showsVerticalScrollIndicator    <<< (value as! Bool)
        case .showsHorizontalScrollIndicator: showsHorizontalScrollIndicator <<< (value as! Bool)
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
