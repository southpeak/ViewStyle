//
//  UITableView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableView Attributes
extension Property {
    
    public static let rowHeight                 = Property(#keyPath(UITableView.rowHeight), .cgFloat)
    public static let separatorStyle            = Property(#keyPath(UITableView.separatorStyle), .tableViewCellSeparatorStyle)
    public static let separatorColor            = Property(#keyPath(UITableView.separatorColor), MIType.color>?)
    public static let separatorEffect           = Property(#keyPath(UITableView.separatorEffect), MIType.visualEffect>?)
    public static let backgroundView            = Property(#keyPath(UITableView.backgroundView), MIType.view>?)
    public static let separatorInset            = Property(#keyPath(UITableView.separatorInset), .edgeInsets)
    public static let cellLayoutMarginsFollowReadableWidth = Property(#keyPath(UITableView.cellLayoutMarginsFollowReadableWidth), .bool)
}


// MARK: - Extension for Special Attributes
extension UITableView {
    
    open override var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            #keyPath(UITableView.separatorStyle)
        ])
        
        return properties
    }
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case #keyPath(UITableView.separatorStyle):
            self.separatorStyle = value as! UITableViewCellSeparatorStyle
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
