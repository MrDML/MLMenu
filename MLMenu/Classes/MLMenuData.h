//
//  MLMenuData.h
//  MLMenu
//
//  Created by MrDML on 2018/7/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MLMenuData : NSObject

- (void)defaultVaule;
/**
 设置标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 设置字体大小
 */

@property (nonatomic, strong) UIFont *font;

/**
 标题数组
 */
@property (nonatomic, strong) NSArray *titles;

/**
 图片数组
 */
@property (nonatomic, strong) NSArray *imageNames;
/**
 线条颜色
 */
@property (nonatomic, strong) UIColor *separatorColor;
/**
 设置线条距左右的间距
 */
@property (nonatomic, assign) CGFloat separatorOffSet;

/**
 设置线条的透明度
 */
@property (nonatomic, assign) CGFloat separatorAlpha;
/**
 背景颜色
 */
@property (nonatomic, strong) UIColor *contentColor;

/**
 预留参数，微调视图位置
 */
@property (nonatomic, assign) CGFloat contentLeftOffset;

@end
