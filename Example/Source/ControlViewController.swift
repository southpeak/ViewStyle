//
//  ControlViewController.swift
//  ViewStyleExample
//
//  Created by Konka on 2017/2/1.
//  Copyright © 2017年 Minya. All rights reserved.
//

import UIKit
import ViewStyle

class ControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.title = "Control"
        
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 200, height: 40))
        label.text = "This is a label"
        label.mi_styles = labelStyle
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 10, y: 150, width: 300, height: 40))
        button.setTitle("This is a button", for: .normal)
        button.mi_styles = buttonStyle
        self.view.addSubview(button)
        
        let switchButton = UISwitch(frame: CGRect(x: 10, y: 200, width: 60, height: 40))
        switchButton.mi_styles = switchStyle
        self.view.addSubview(switchButton)
    }
}

extension ControlViewController {
    var labelStyle: [MIProperty: Any] {
        return [
            .font: UIFont(name: "Helvetica Neue", size: 30)!,
            .textColor: UIColor.blue,
            .textAlignment: NSTextAlignment.center,
            .shadowColor: UIColor.red,
            .shadowOffset: CGSize(width: 3.0, height: 3.0),
            .layerBorderWidth: 1.0,
            .layerBorderColor: UIColor.blue
        ]
    }
    
    var buttonStyle: [MIProperty: Any] {
        return [
            .backgroundColor: UIColor.blue,
            .titleColorNormal: UIColor.white,
            .titleColorHightlighted: UIColor.gray,
            .titleShadowColorNormal: UIColor.yellow,
            .imageNormal: UIImage(named: "add")!,
            .titleEdgeInsets: UIEdgeInsets(top: 0.0, left: 50, bottom: 0.0, right: 5.0),
            .imageEdgeInsets: UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 100.0)
        ]
    }
    
    var switchStyle: [MIProperty: Any] {
        return [
            .onTintColor: UIColor.red,
            .tintColor: UIColor.blue,
            .thumbTintColor: UIColor.yellow,
            .onImage: UIImage(),
            .offImage: UIImage()
        ]
    }
}
