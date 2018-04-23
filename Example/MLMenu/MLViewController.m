//
//  MLViewController.m
//  MLMenu
//
//  Created by MrDML on 04/23/2018.
//  Copyright (c) 2018 MrDML. All rights reserved.
//

#import "MLViewController.h"
#import <MLMenu/MLMenu.h>
@interface MLViewController ()

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



- (void)testCode_One
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
   
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];;
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
    
}

- (void)testCode_Two
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];

    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];
    [menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
}


- (void)testCode_Three
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleRight];
}

- (void)testCode_Four
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    
        MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4)  WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:64];
    [menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleTop];
}

- (void)testCode_Five
{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];

    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];
    [menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
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
