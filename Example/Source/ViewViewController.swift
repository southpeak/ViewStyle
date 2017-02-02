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
    
    var normalStyle: [Property: Any] {
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
    
    var layerStyle: [Property: Any] {
        return [
            .clipsToBounds: false,
            Property.layer.borderWidth: 1.0,
            Property.layer.borderColor: UIColor.red.cgColor,
            Property.layer.shadowRadius: 4.0,
            Property.layer.shadowColor: UIColor.green.cgColor,
            Property.layer.shadowOffset: CGSize(width: 10, height: 10),
            Property.layer.shadowOpacity: 0.8
        ]
    }
    
    var imageStyle: [Property: Any] {
        return [
            Property.layer.masksToBounds: true,
            Property.layer.cornerRadius: 8.0,
            .image: UIImage(named: "view")!
        ]
    }
}
