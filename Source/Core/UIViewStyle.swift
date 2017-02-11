//
//  UIViewStyle.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView Extension for setting style properties of UIView
extension UIView {
    
    // An computed MIProperty to set UIView's style. The MIProperty's getter is just return nil,
    // so you can't get the style that you have set with this MIProperty.
    public var mi_styles: [MIProperty : Any]? {
        
        get {
            return nil
        }
        
        set {
            
            guard let styles = newValue, styles.count > 0 else {
                return
            }
            
            for (key, value) in styles {
                mi_setValue(value, forKey: key.rawValue)
            }
        }
    }
    
    open func mi_setValue(_ value: Any, forKey key: String) {
        
        let style = MIProperty(rawValue: key)!
        
        switch style {
        case .backgroundColor:              backgroundColor                 <<< (value as? UIColor)
        case .isHidden:                     isHidden                        <<< (value as! Bool)
        case .alpha:                        alpha                           <<< (CGFloat(value as! NSNumber))
        case .isOpaque:                     isOpaque                        <<< (value as! Bool)
        case .tintColor:                    tintColor                       <<< (value as! UIColor)
        case .tintAdjustmentMode:           tintAdjustmentMode              <<< (value as! UIViewTintAdjustmentMode)
        case .clipsToBounds:                clipsToBounds                   <<< (value as! Bool)
        case .clearsContextBeforeDrawing:   clearsContextBeforeDrawing      <<< (value as! Bool)
        case .layerContentsGravity:         layer.contentsGravity           <<< (value as! String)
        case .layerOpacity:                 layer.opacity                   <<< (Float(value as! NSNumber))
        case .layerIsHidden:                layer.isHidden                  <<< (value as! Bool)
        case .layerMasksToBounds:           layer.masksToBounds             <<< (value as! Bool)
        case .layerMask:                    layer.mask                      <<< (value as? CALayer)
        case .layerIsDoubleSided:           layer.isDoubleSided             <<< (value as! Bool)
        case .layerCornerRadius:            layer.cornerRadius              <<< (CGFloat(value as! NSNumber))
        case .layerBorderWidth:             layer.borderWidth               <<< (CGFloat(value as! NSNumber))
        case .layerBorderColor:             layer.borderColor               <<< (value as! CGColor)
        case .layerBackgroundColor:         layer.backgroundColor           <<< (value as! CGColor)
        case .layerShadowOpacity:           layer.shadowOpacity             <<< (Float(value as! NSNumber))
        case .layerShadowRadius:            layer.shadowRadius              <<< (CGFloat(value as! NSNumber))
        case .layerShadowOffset:            layer.shadowOffset              <<< (value as! CGSize)
        case .layerShadowColor:             layer.shadowColor               <<< (value as! CGColor)
        case .layerShadowPath:              layer.shadowPath                <<< (value as! CGPath)
        case .layerAllowsEdgeAntialiasing:  layer.allowsEdgeAntialiasing    <<< (value as! Bool)
        case .layerAllowsGroupOpacity:      layer.allowsGroupOpacity        <<< (value as! Bool)
        default: ()
        }
    }
}

// MARK: - Operator
infix operator <<<

public func <<< <PropertyType>(property: inout PropertyType, object: PropertyType?) {
    setValue(&property, object: object)
}

public func <<< <PropertyType>(property: inout PropertyType?, object: PropertyType?) {
    setValue(&property, object: object)
}

public func <<< <PropertyType>(property: inout PropertyType!, object: PropertyType?) {
    setValue(&property, object: object)
}

// MARK: - Set value
private func setValue<PropertyType>(_ property: inout PropertyType, object: PropertyType?) {
    if let value = object {
        property = value
    }
}

private func setValue<PropertyType>(_ property: inout PropertyType?, object: PropertyType?) {
    property = object
}

private func setValue<PropertyType>(_ property: inout PropertyType!, object: PropertyType?) {
    property = object
}
