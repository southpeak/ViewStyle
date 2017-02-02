//
//  UIViewStyle.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation
import UIKit

// MARK: - `Style` framework provides a way to set UIView's visual appearance properties like CSS
extension UIView {
    
    // An computed property to set UIView's style. The property's getter is just return nil,
    // so you can't get the style that you have set with this property.
    public var mi_styles: [Property : Any]? {
        
        get {
            return nil
        }
        
        set {
            
            guard let styles = newValue, styles.count > 0 else {
                return
            }
            
            #if DEBUG
                // Do some checking work in debug model
                __mi_hasAll(properties: styles)
                __mi_checkTypes(properties: styles)
            #endif
            
            for style in styles {
                
                // If the property is special, set it with the `mi_setValue(_:forKey)` method
                if self.mi_specialProperties.contains(style.key.name) {
                    self.mi_setValue(style.value, forKey: style.key.name)
                    continue
                }
                
                // If the name is a keypath, set it with `setValue(_:forKeyPath)`
                if style.key.name.contains(".") {
                    self.setValue(style.value, forKeyPath: style.key.name)
                } else {
                    self.setValue(style.value, forKey: style.key.name)
                }
            }
        }
    }
    
    // MARK: Private Methods
    
    /// Check the class has all properties in the parameters. If not, it will crash in debug model.
    ///
    /// - Notes: If the property is a special property that you will handle it by yourself,
    ///          the check handler will ignore it. You must make sure the property handled correctly
    ///
    /// - Parameter properties: all properties that should be set.
    private func __mi_hasAll(properties: [Property : Any]) {
        
        for (key, _) in properties {
            
            if self.mi_specialProperties.contains(key.name) {
                continue
            }
            
            // If the key is key path, we ignore it. 
            // And you must make sure the property is correctly.
            // So, if you define you own key path, i recommend you to use #keyPath
            if key.name.contains(".") {
                continue
            }
            
            assert(self.responds(to: NSSelectorFromString(key.name)), "\(type(of: self)) has no '\(key.name)' property")
        }
    }
    
    /// Check the value type of the property is correct.
    ///
    /// Some properties' document type is not the actual type, such as `UIColor` whose
    /// actual type is `UICachedDeviceRGBColor`, so we need convert the `UICachedDeviceRGBColor`
    /// to the document type to check.
    ///
    /// In addition, the numeric type can be converted automatically with the
    /// `setValue(_:forKey)` method, so we convert the value's type to the property's type
    /// for the checking work.
    ///
    /// If the property's type is in the `cfTypes` array, we will also convert the value's type
    /// to the property's type. For example, `CGColor`'s original type is `__NSCFType`, so we
    /// convert `__NSCFType` to `CGColor`
    ///
    /// - Parameter properties: All properties that should be check
    private func __mi_checkTypes(properties: [Property : Any]) {
        
        for (key, value) in properties {
            
            let valueType = String(describing: type(of: value))
            
            var type: MIType? = nil
            
            // If MIType.Map contain the valueType, we will map the original type
            // to the new type
            if MIType.Map.keys.contains(valueType) {
                type = MIType.Map[valueType]!
            }
            
            // If MIType.Numeric contain the valueType and the key type,
            // we will convert the valueType to the key type.
            // Because they could be converted between to numeric type.
            if MIType.Numeric.contains(valueType) && MIType.Numeric.contains(key.type.name) {
                type = MIType(key.type.name)
            }
            
            // If MIType.CFTypes contain the key type, we will convert the valueType
            // to the key type.
            if MIType.CFTypes.contains(key.type) || MIType.CFTypes.contains(key.type.unwrap) {
                type = key.type
            }
            
            guard let t = type else {
                continue
            }
            
            assert(t.isKindOf(type: key.type), "The type of \(key.name) property should be \(key.type.name), but not \(valueType)")
        }
    }
}
