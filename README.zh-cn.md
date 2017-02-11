# ViewStyle

`ViewStyle`提供了一种类似于CSS的方法，来设置iOS中视图的外观样式。

# 出发点

Web前端的一般结构是HTML用于组织视图基本结构，而CSS用于设置视图标签的显示样式。在iOS中，如果**用纯代码来手撸界面**的话，也需要我们自己去设置视图元素的各种显示样式。鉴于HTML与CSS的方式的基本思想，`ViewStyle`提供了一种类似的方法，希望将视图的结构与样式设置分离。

# 基本用法

我们以`UITableView`为例，一般我们会按以下方式来设置一个`UITableView`：

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

这种方式设置一个视图稍微有点繁杂，特别是视图代码多的时候。这种情况下可以考虑将样式设置的代码分离出来。`ViewStyle`为`UIView`提供了一个`mi_styles`计算属性，用于设置一样基本样式，使用方法如下：

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


# 问题

由于这是个写着玩的东西，所以只是设置一些简单的样式属性，所以`ViewStyle`目前存在一些明显的问题：

1. 无法设置视图的布局(太复杂)，这个需要自行使用`AutoLayout`；
2. 性能问题待查

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

