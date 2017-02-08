# ViewStyle

`ViewStyle` provides a CSS-like way to set the style of a view in iOS.

The general structure of the Web front-end is that HTML is used to organize the basic structure of the view, and CSS is used to set the display style of HTML. In iOS, if you draw the UI with pure code but not Interface Builder, you need to set the view style manually. Just like HTML and CSS, the aim of `ViewStyle` is to separate the view structure and style code.

# How to use

Generally, we will set up a `UITableView` as follow:

```swift
tableView = UITableView(frame: self.view.bounds)
tableView!.dataSource = self
tableView!.delegate = self
tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
   
tableView!.rowHeight = 60.0
tableView!.separatorStyle = UITableViewCellSeparatorStyle.singleLine
tableView!.separatorColor = UIColor.lightGray
tableView!.backgroundView = UIView()
tableView!.separatorInset = UIEdgeInsets(top: 10.0, left: 5.0, bottom: 3.0, right: 10.0)
tableView!.cellLayoutMarginsFollowReadableWidth = true
   
self.view.addSubview(tableView!)
```

It is a little bit complicated, especially when there are a lot the views to set. In this case, we might consider to separate the code for the style settings. `ViewStyle` provides a `mi_styles` property for the UIView to set some basic style, just like the following way:

```swift
class ViewController: UIViewController {
    
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ... 
        
        tableView = UITableView(frame: self.view.bounds)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        tableView!.mi_styles = self.tableViewStyle
        
        self.view.addSubview(tableView!)
    }
}

// MARK: - Table View Style

extension ViewController {
    var tableViewStyle: [Property: Any] {
        return [
            .rowHeight: 60.0,
            .separatorStyle: UITableViewCellSeparatorStyle.singleLine,
            .separatorColor: UIColor.lightGray,
            .backgroundView: UIView(),
            .separatorInset: UIEdgeInsets(top: 10.0, left: 5.0, bottom: 3.0, right: 10.0),
            .cellLayoutMarginsFollowReadableWidth: true
        ]
    }
}
```

There are two ways to define a style: 

* Computing properties of the class
* Global constants

It is according to the actual situations.

> Note: If you set multiple `mi_styles` for the same view, and the style has the same property, then the settings will override the previous settings.

# KVC and Non-KVC

`ViewStyle` set the properties in bulk through KVC. However, some properties is non-KVC and these properties need special treatment. You can point out these properties in `mi_specialProperties` property of UIView or its subclasses, then set the value of these properties one by one in the `mi_setValue(_:forKey:)` method.

> Note: When overriding the `mi_setValue(_:forKey:)` method in a subclass of UIView, call the `mi_setValue(_:forKey:)` method of super class to ensure that all non-KVC properties in the inheritance chain are properly set.

# Detection in the DEBUG mode

In debug mode, there are two detections:

1. Check the class has all of the properties. However, it is not including the non-KVC properties or key path properties, such as `layer.borderColor` of UIView. You must ensure the correctness of these properties.
2. Check the type of the value is correct.

We do some special work in the second step of the detections:

1. The actual type of some properties is not the same as the type in the document, such as some color properties' type in the document is `UIColor`, but in fact it is `UICachedDeviceRGBColor`. We made a mapping for these types for detection.
2. There is no different between numeric type when set the value with `setValue(forKey:)`, so we treat the numeric types unanimously.
3. The original type of some CG types, such as `CGColor` or `CGPath`, is `__NSCFType`. We do not check them carefully.

In debug mode, if one of these detections is failed, it will run assertion processing.

# Extension

In `ViewStyle`, if you want to add a property of a view class, you can extend the `Property` struct and add the property as follows:

```swift
// UITextField+Style

extension Property {
    
    public static let borderStyle               = Property(#keyPath(UITextField.borderStyle), .textBorderStyle)
    public static let background                = Property(#keyPath(UITextField.background), MIType.image>?)
    public static let disabledBackground        = Property(#keyPath(UITextField.disabledBackground), MIType.image>?)
    public static let clearButtonMode           = Property(#keyPath(UITextField.clearButtonMode), .textFieldViewMode)
}
```

You have to do some special work for non-KVC properties. Override `mi_specialProperties` property and `mi_setValue(_:forKey:)` method of `UIView`, just like follows:

```swift
// MARK: - Special Attributes
extension UITextField {
    
    open override var mi_specialProperties: [String] {
        
        var properties = super.mi_specialProperties
        
        properties.append(contentsOf: [
            #keyPath(UITextField.textAlignment),
        ])
        
        return properties
    }
    
    open override func mi_setValue(_ value: Any, forKey key: String) {
        
        switch key {
        case #keyPath(UITextField.textAlignment):
            self.textAlignment = value as! NSTextAlignment
        default:
            super.mi_setValue(value, forKey: key)
        }
    }
}
```

In theory, you can add any property you need, but not just display properties.

# Problems

There are some obvious problems in `ViewStyle`:

1. It is not used for layout;
2. The type of `mi_styles` is `[Property: Any]`, and the type of `value` is `Any`, so compile-time detection for type is impossible. You must ensure the correct for all value types.
3. You need check the non-KVC properties with `mi_specialProperties` property and `mi_setValue(_:forKey:)` method.

# Install

## CocoaPods

1. Add `pod 'ViewStyle'` to your Podfile;
2. Run `pod install` or `pod update`;
3. `import ViewStyle)`

# Requirements

This library requires iOS 8.0+.

# LICENSE

ViewStyle is provided under the MIT license. See LICENSE file for details.

