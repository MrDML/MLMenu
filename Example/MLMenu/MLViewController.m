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
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    NSArray *images = @[@"scan",@"scan",@"scan",@"scan"];
    
    //    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 20, 0, 100, 88)  WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:64];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 88) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];
    [menuView setCoverViewBackgroundColor:[UIColor lightGrayColor]];
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"====>%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleTop];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
