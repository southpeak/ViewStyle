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

# Problems

There are some obvious problems in `ViewStyle`:

1. It is not used for layout;

# Install

## CocoaPods

1. Add `pod 'ViewStyle'` to your Podfile;
2. Run `pod install` or `pod update`;
3. `import ViewStyle)`

# Requirements

This library requires iOS 8.0+.

# LICENSE

ViewStyle is provided under the MIT license. See LICENSE file for details.

