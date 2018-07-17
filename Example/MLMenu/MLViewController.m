//
//  MLViewController.m
//  MLMenu
//
//  Created by MrDML on 04/23/2018.
//  Copyright (c) 2018 MrDML. All rights reserved.
//

#define  MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define  k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)
#import "MLViewController.h"
#import <MLMenu/MLMenuView.h>
@interface MLViewController ()
@property (nonatomic, strong)MLMenuView *menuView;
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (IBAction)addMenuEvent:(UIBarButtonItem *)sender {

    if (_menuStyle == MLMenuStyle_Title) {
        [self testCode_One];
    }else if (_menuStyle == MLMenuStyle_ImageAndTitle){
        [self testCode_Two];
    }else if (_menuStyle == MLMenuStyle_AnimationRight){
        [self testCode_Three];
    }else if (_menuStyle == MLMenuStyle_AnimationTop){
        [self testCode_Four];
    }else if (_menuStyle == MLMenuStyle_AnimationNone){
        [self testCode_Five];
    }else if (_menuStyle == MLMenuStyle_HasTriangle){
        [self testCode_Six];
    }else if (_menuStyle == MLMenuStyle_NoHasTriangle){
        [self testCode_Seven];
    }

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *titles = @[@"发起群聊"];
    self.menuView.titles = titles;
    [self.menuView showMenuEnterAnimation:MLAnimationStyleNone];
}


- (void)testCode_One
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
   
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:[UIColor whiteColor]];
    menuView.separatorOffSet = 10;
    menuView.separatorColor = MLClolor(51, 51, 51, 0.5);
    [menuView setMenuViewBackgroundColor:[UIColor whiteColor]];
    menuView.titleColor = [UIColor blackColor];
    [menuView setCoverViewBackgroundColor:MLClolor(51, 51, 51, 0.5)];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    
    self.menuView = menuView;
}

- (void)testCode_Two
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];

    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:nil];
    menuView.separatorOffSet = 10;
    menuView.separatorColor = MLClolor(51, 51, 51, 0.5);
    [menuView setMenuViewBackgroundColor:[UIColor grayColor]];
    menuView.titleColor = [UIColor blackColor];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLAnimationStyleNone];
}


- (void)testCode_Three
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80 triangleColor:nil];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLAnimationStyleTop];
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
    [menuView showMenuEnterAnimation:MLAnimationStyleRight];
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
    [menuView showMenuEnterAnimation:MLAnimationStyleTop];
}
- (void)testCode_Six
{
    [self testCode_Two];
    
}
- (void)testCode_Seven
{
    [self testCode_Four];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
