//
//  MIProperty.swift
//  ViewStyle
//
//  Created by Konka on 2017/1/23.
//  Copyright © 2017年 Minya. All rights reserved.
//

import Foundation

/// Style Property key
public enum MIProperty: String {
    
    // MARK: - UIView
    case backgroundColor
    case isHidden
    case alpha
    case isOpaque
    case tintColor
    case tintAdjustmentMode
    case clipsToBounds
    case clearsContextBeforeDrawing
    
    // MARK: - CALayer
    case layerContentsGravity
    case layerOpacity
    case layerIsHidden
    case layerMasksToBounds
    case layerMask
    case layerIsDoubleSided
    case layerCornerRadius
    case layerBorderWidth
    case layerBorderColor
    case layerBackgroundColor
    case layerShadowOpacity
    case layerShadowRadius
    case layerShadowOffset
    case layerShadowColor
    case layerShadowPath
    case layerAllowsEdgeAntialiasing
    case layerAllowsGroupOpacity
    
    // MARK: - UITextView
    case isEditable
    case allowsEditingTextAttributes
    case isSelectable
    case textContainerInset
    
    // MARK: - UITextField
    
    case borderStyle
    case background
    case disabledBackground
    case clearButtonMode
    case rightViewMode
    
    // MARK: - UITableView
    case rowHeight
    case separatorStyle
    case separatorColor
    case separatorEffect
    case backgroundView
    case separatorInset
    case cellLayoutMarginsFollowReadableWidth
    
    // MARK: - UISwitch
    case onTintColor
    case thumbTintColor
    case onImage
    case offImage
    
    // MARK: - UIScrollView
    case contentSize
    case contentInset
    case isScrollEnabled
    case isDirectionalLockEnabled
    case scrollsToTop
    case isPagingEnabled
    case bounces
    case alwaysBounceVertical
    case alwaysBounceHorizontal
    case indicatorStyle
    case scrollIndicatorInsets
    case showsHorizontalScrollIndicator
    case showsVerticalScrollIndicator
    
    // MARK: - UILabel
    case font
    case textColor
    case textAlignment
    case lineBreakMode
    case isEnabled
    case adjustsFontSizeToFitWidth
    case allowsDefaultTighteningForTruncation
    case baselineAdjustment
    case minimumScaleFactor
    case numberOfLines
    case highlightedTextColor
    case isHighlighted
    case shadowColor
    case shadowOffset
    
    // MARK: - UIImageView
    case image
    case highlightedImage
    case isUserInteractionEnabled
    
    // MARK: - UIButton
    case adjustsImageWhenHighlighted
    case adjustsImageWhenDisabled
    case showsTouchWhenHighlighted
    case contentEdgeInsets
    case titleEdgeInsets
    case imageEdgeInsets
    
    case titleColorNormal
    case titleColorHightlighted
    case titleColorDisabled
    case titleColorSelected
    
    case titleShadowColorNormal
    case titleShadowColorHighlighted
    case titleShadowColorDisabled
    case titleShadowColorSelected
    
    case backgroundImageNormal
    case backgroundImageHighlighted
    case backgroundImageDisabled
    case backgroundImageSelected
    
    case imageNormal
    case imageHighlighted
    case imageDisabled
    case imageSelected
}
