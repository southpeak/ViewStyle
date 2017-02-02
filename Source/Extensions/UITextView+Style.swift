//
//  UITextView+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/25.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension Property {
    
    public static let isEditable                    = Property(#keyPath(UITextView.isEditable), .bool)
    public static let allowsEditingTextAttributes   = Property(#keyPath(UITextView.allowsEditingTextAttributes), .bool)
    public static let isSelectable                  = Property(#keyPath(UITextView.isSelectable), .bool)
}
