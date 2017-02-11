//
//  ViewViewController.swift
//  ViewStyleExample
//
//  Created by Konka on 2017/2/1.
//  Copyright © 2017年 Minya. All rights reserved.
//

import UIKit
import ViewStyle

class ViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.title = "View"
        
        let view1 = UIView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        view1.mi_styles = self.normalStyle
        self.view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 10, y: 220, width: 200, height: 100))
        view2.backgroundColor = UIColor.blue
        view2.mi_styles = self.normalStyle
        view2.mi_styles = self.layerStyle
        self.view.addSubview(view2)
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 340, width: 200, height: 100))
        imageView.mi_styles = self.imageStyle
        self.view.addSubview(imageView)
    }

}

extension ViewViewController {
    
    var normalStyle: [MIProperty: Any] {
        return [
            .backgroundColor: UIColor.blue,
            .alpha: 0.5,
            .isOpaque: true,
            .tintColor: UIColor.red,
            .tintAdjustmentMode: UIViewTintAdjustmentMode.automatic,
            .clipsToBounds: true,
            .clearsContextBeforeDrawing: true,
        ]
    }
    
    var layerStyle: [MIProperty: Any] {
        return [
            .clipsToBounds: false,
            .layerBorderWidth: 1.0,
            .layerBorderColor: UIColor.red.cgColor,
            .layerShadowRadius: 4.0,
            .layerShadowColor: UIColor.green.cgColor,
            .layerShadowOffset: CGSize(width: 10, height: 10),
            .layerShadowOpacity: 0.8
        ]
    }
    
    var imageStyle: [MIProperty: Any] {
        return [
            .layerMasksToBounds: true,
            .layerCornerRadius: 8.0,
            .image: UIImage(named: "view")!
        ]
    }
}
