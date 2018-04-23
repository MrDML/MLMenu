//
//  MLMenuView.h
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLMenuView;

@protocol MLMenuViewDelegate <NSObject>
- (void)didselectItemIndex:(NSInteger)index;
@end

typedef NS_ENUM(NSInteger,MLEnterAnimationStyle) {
    MLEnterAnimationStyleNone,
    MLEnterAnimationStyleRight,
    MLEnterAnimationStyleTop,
};

typedef void(^MLDidSelectBlock)(NSInteger index);

@interface MLMenuView : UIView


/**
 MenuView 构造器 带有三角形的菜单

 @param frame 位置
 @param titles 标题数组 必传
 @param imageNames 图片数组 可以传nil
 @param top MenuView 距离顶部的偏移量
 @param left 三角形距离左边的偏移量
 @return MenuView
 */
- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithImageNames:(NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top WithTriangleOffsetLeft:(CGFloat)left;


/**
 MenuView 构造器 不带有三角形的菜单

 @param frame 位置
 @param titles 标题数组 必传
 @param imageNames 图片数组 可以传nil
 @param top 距离顶部的偏移量
 @return MenuView
 */
- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithImageNames:(NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top;

/**
 设置背景颜色

 @param backgroundColor backgroundColor description
 */
- (void)setMenuViewBackgroundColor:(UIColor *)backgroundColor;

/**
 设置蒙版层视图颜色

 @param backgroundColor backgroundColor description
 */
- (void)setCoverViewBackgroundColor:(UIColor *)backgroundColor;


@property (nonatomic, weak) id <MLMenuViewDelegate>delegate;


/**
 选中item block 回调
 */
@property (nonatomic, copy) MLDidSelectBlock didSelectBlock;

/**
 设置标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 设置字体大小
 */

@property (nonatomic, strong) UIFont *font;


/**
 线条颜色
 */
@property (nonatomic, strong) UIColor *separatorColor;

/**
 标题数组
 */
@property (nonatomic, strong) NSArray *titles;


/**
 图片数组
 */
@property (nonatomic, strong) NSArray *imageNames;

/**
 呈现菜单
 */
- (void)showMenuEnterAnimation:(MLEnterAnimationStyle)animationStyle;

/**
 隐藏菜单
 */
- (void)hidMenuExitAnimation:(MLEnterAnimationStyle)animationStyle;

@end
