//
//  UITableView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .rowHeight:                    rowHeight                       <<< (CGFloat(value as! NSNumber))
        case .separatorStyle:               separatorStyle                  <<< (value as! UITableViewCellSeparatorStyle)
        case .separatorColor:               separatorColor                  <<< (value as? UIColor)
        case .separatorEffect:              separatorEffect                 <<< (value as? UIVisualEffect)
        case .backgroundView:               backgroundView                  <<< (value as? UIView)
        case .separatorInset:               separatorInset                  <<< (value as! UIEdgeInsets)
        case .cellLayoutMarginsFollowReadableWidth:
            if #available(iOS 9.0, *) {
                cellLayoutMarginsFollowReadableWidth    <<< (value as! Bool)
            }
        default: super.mi_setValue(value, forKey: key)
        }
    }
}
