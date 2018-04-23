//
//  MLMenuItem.h
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLMenuItem : NSObject
/** title */
@property (nonatomic, copy) NSString *title;
/** imageName */
@property (nonatomic, copy) NSString *imageName;
/** title Array */
@property (nonatomic, strong) NSArray *titls;
/** image Array */
@property (nonatomic, strong) NSArray *imageNames;
/** fontSzie */
@property (nonatomic, assign) CGFloat fontSzie;
/** titleColor */
@property (nonatomic, strong) UIColor *titleColor;
/**
 separatorColor
 */
@property (nonatomic, strong) UIColor *separatorColor;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)menuItemWithDict:(NSDictionary *)dict;
@end
