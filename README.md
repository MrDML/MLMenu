# MLMenu

[![CI Status](http://img.shields.io/travis/MrDML/MLMenu.svg?style=flat)](https://travis-ci.org/MrDML/MLMenu)
[![Version](https://img.shields.io/cocoapods/v/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)
[![License](https://img.shields.io/cocoapods/l/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)
[![Platform](https://img.shields.io/cocoapods/p/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Preview
![Demo](https://github.com/MrDML/MLMenu/blob/master/MLMenu.gif)
[MLMenu.gif](quiver-image-url/C2133BC13CE83BF2286EA4FD04F6A5A4.gif =339x587)

## Requirements!
iOS 8.0
## Installation

MLMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MLMenu' / pod 'MLMenu', '~> 0.1.7'
```
## Use

```````````
// 标题数组 必传
NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
// 图片数组
NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];

// 初始化一个带有三角形菜单控件
MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:
CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4)
WithTitles:titles WithImageNames:images
WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight
WithTriangleOffsetLeft:80];

// 设置覆盖层背景颜色 默认是透明
[menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
// 提供block回调和代理回调
menuView.didSelectBlock = ^(NSInteger index) {
NSLog(@"%zd",index);
};
[menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
```````````

## Other Use

`````
// 设置线条颜色
menuView.separatorColor = [UIColor ...];
// 设置字体大小
menuView.font = [UIFont systemFontOfSize:...];
// 设置字体颜色
menuView.titleColor = [UIColor ...];
// 设置背景颜色
menuView.backgroundColor = [UIColor ...];

`````

## Author

MrDML, dml1630@163.com

## License

MLMenu is available under the MIT license. See the LICENSE file for more info.

