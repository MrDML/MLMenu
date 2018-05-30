# MLMenu

[![CI Status](http://img.shields.io/travis/MrDML/MLMenu.svg?style=flat)](https://travis-ci.org/MrDML/MLMenu)
[![Version](https://img.shields.io/cocoapods/v/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)
[![License](https://img.shields.io/cocoapods/l/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)
[![Platform](https://img.shields.io/cocoapods/p/MLMenu.svg?style=flat)](http://cocoapods.org/pods/MLMenu)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Preview
![Demo](https://github.com/MrDML/MLMenu/blob/master/MLMenuGif.gif)

## Requirements!
iOS 8.0
## Installation

MLMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MLMenu'
```
## Use
// 导入头文件
```````````
#import <MLMenu/MLMenuView.h>
```````````
```````````
- (void)testCode_One
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
   
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:[UIColor whiteColor]];
    menuView.separatorOffSet = 10;
    menuView.separatorColor = MLClolor(51, 51, 51, 1);
    [menuView setMenuViewBackgroundColor:[UIColor whiteColor]];
    menuView.titleColor = [UIColor blackColor];
    [menuView setCoverViewBackgroundColor:MLClolor(51, 51, 51, 0.5)];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
    
}

- (void)testCode_Two
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];

    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:nil];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
}


- (void)testCode_Three
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:nil];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleRight];
}

- (void)testCode_Four
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    
        MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4)  WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight];
    [menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleTop];
}

- (void)testCode_Five
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];

    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:[UIColor whiteColor]];
    [menuView setCoverViewBackgroundColor:MLClolor(51, 51, 51, 0.5)];
    menuView.separatorColor = MLClolor(51, 51, 51, 0.5);
    [menuView setMenuViewBackgroundColor:[UIColor whiteColor]];
    menuView.titleColor =  MLClolor(51, 51, 51, 1);
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
}
```````````

## Other Use

`````
// 设置线条颜色(线条可调整透明度)
menuView.separatorColor = [UIColor ...];
// 设置字体大小
menuView.font = [UIFont systemFontOfSize:...];
// 设置字体颜色
menuView.titleColor = [UIColor ...];
// 设置背景颜色
[menuView setMenuViewBackgroundColor:...];
// 设置蒙版背景颜色
[menuView setCoverViewBackgroundColor:..];

`````

## Author

MrDML, dml1630@163.com

## License

MLMenu is available under the MIT license. See the LICENSE file for more info.

