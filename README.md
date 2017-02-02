# ViewStyle

ViewStyle提供了一种类似于CSS的方法，来设置iOS中视图的外观样式。

# 出发点

Web前端的一般结构是HTML用于组织视图基本结构，而CSS用于设置视图标签的显示样式。在iOS中，如果**用纯代码来手撸界面**的话，也需要我们自己去设置视图元素的各种显示样式。鉴于HTML与CSS的方式的基本思想，ViewStyle提供了一种类似的方法，希望将视图的结构与样式设置分离。

# 基本用法

我们以UITableView为例，一般我们会按以下方式来设置一个UITableView：

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

这种方式设置一个视图稍微有点繁杂，特别是视图代码多的时候。这种情况下可以考虑将样式设置的代码分离出来。ViewStyle为UIView提供了一个`mi_styles`计算属性，用于设置一样基本样式，使用方法如下：

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

style的定义有两种方式：一种是定义成类的计算属性；一种定义成全局常量，方便复用。可以根据实际情况处理。

> 注：如果对同一个视图设置多个`mi_styles`，且style中有相同的属性，则后面的设置会覆盖前面的设置。

# KVC及非KVC属性的处理

ViewStyle的实现没有什么特别之处，就是通过KVC来批量设置属性。

需要注意的是有些属性并不支持KVC，对于这类属性需要特殊处理。可以在`mi_specialProperties`中指定这些特殊属性，然后在`mi_setValue(_:forKey:)`方法中来逐个设置这些属性的值。

> 在UIView的子类中重写`mi_setValue(_:forKey:)`方法，需要调用父类的对应方法，以确保继承链中所有的非KVC属性得以正确的设置。

# DEBUG模式下的检测

在**DEBUG**模式下，做了两步的检测：

1. 检测所设置的属性是否是类所拥有的属性。这个检测不包含非KVC属性及keyPath类型的属性，这两者需要自行保证正确性。后续版本会添加相应检测；
2. 检测所设置属性的值的类型是否正确。

在第2步检测中，做了一些特殊处理：

1. 有些属性的实际类型与开发文档中的属性并不一致，例如有些颜色属性在文档中给的类型是`UIColor`，但实际上是`UICachedDeviceRGBColor`，对于这类属性，我们做了一个映射，将实际类型映射成文档中的类型，以便判断。这个判断稍显粗糙；
2. 数值类型在用`setValue(forKey:)`时，不管给定的是什么数值类型，该方法都会帮我们自动转换，所以对于数值类型，不管给定的是什么数值(Int, Int32, Float)，在判断时将其类型统一转换为属性的类型，不加以区分；
3. 有一些CG类型(如CGColor、CGPath)其原始类型为`__NSCFType`，我们会将`__NSCFType`转换为你设定的类型做判断

在DEBUG模式下，如果这两步有一个检测失败，则会走断言处理。

# 扩展

如果想扩展一个视图类的属性，可以扩展`Property`结构体，添加需要的属性，如下所示：

```swift
// UITextField+Style

extension Property {
    
    public static let borderStyle               = Property(#keyPath(UITextField.borderStyle), .textBorderStyle)
    public static let background                = Property(#keyPath(UITextField.background), MIType.image>?)
    public static let disabledBackground        = Property(#keyPath(UITextField.disabledBackground), MIType.image>?)
    public static let clearButtonMode           = Property(#keyPath(UITextField.clearButtonMode), .textFieldViewMode)
}
```

如果有非KVC的属性，则需要特殊处理，即UIView的重写`mi_specialProperties`属性和`mi_setValue(_:forKey:)`方法，如下代码所示：

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

理论上来说，扩展不仅仅局限于视图的显示属性，可以使用这种方式添加你需要的任何属性。

# 问题

由于这是个写着玩的东西，所以只是设置一些简单的样式属性，所以ViewStyle目前存在一些明显的问题：

1. 无法设置视图的布局(太复杂)，这个需要自行使用AutoLayout；
2. `mi_styles`的类型是`[Property: Any]`，即value的类型是Any，所以无法在编译时做类型检测，只是在DEBUG模式下做了个粗糙的类型判断。所以类型的正确性需要自行判断；
3. 对于非KVC的属性，需要自行设置判断方式，即重写`mi_specialProperties`属性和`mi_setValue(_:forKey:)`方法；
4. 性能问题待查

# 安装

## CocoaPods

1. 在 Podfile 中添加 `pod 'ViewStyle'`；
2. 执行 `pod install` 或 `pod update`；
3. 在需要使用的文件中导入`ViewStyle(import ViewStyle)`。

## Carthage

待添加

# 系统要求

该项目最低支持iOS 8.0。后续考虑加入其它系统的支持。

# LICENSE

ViewStyle使用MIT许可证，详情见 LICENSE 文件。

