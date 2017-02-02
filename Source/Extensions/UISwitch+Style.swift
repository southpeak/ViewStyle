//
//  UISwitch+Style.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/24.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

extension Property {
    
    public static let onTintColor           = Property(#keyPath(UISwitch.onTintColor), MIType.color>?)
    public static let thumbTintColor        = Property(#keyPath(UISwitch.thumbTintColor), MIType.color>?)
    public static let onImage               = Property(#keyPath(UISwitch.onImage), MIType.image>?)
    public static let offImage              = Property(#keyPath(UISwitch.offImage), MIType.image>?)
}
