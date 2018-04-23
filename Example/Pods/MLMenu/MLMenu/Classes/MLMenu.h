//
//  MLMenu.h
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#ifndef MLMenu_h
#define MLMenu_h

#define MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)
#import "MLMenuView.h"
#import "MLMenuItem.h"
#import "MLMenuCell.h"
#endif /* MLMenu_h */
