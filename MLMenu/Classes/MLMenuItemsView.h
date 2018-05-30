//
//  MLMenuItemsView.h
//  MLMenu
//
//  Created by 戴明亮 on 2018/5/29.
//

#import <UIKit/UIKit.h>
@class MLMenuItemsView;
@protocol MLMenuItemsViewDelegate <NSObject>
- (void)menuItemsView:(MLMenuItemsView *)itemView didSelectItemAtIndex:(NSInteger)index;
@end
@interface MLMenuItemsView : UIView
@property (nonatomic, copy) void (^menuDidSelectBlock)(NSInteger index);
@property (nonatomic, weak) id <MLMenuItemsViewDelegate>delegate;
@property (nonatomic, copy, nonnull) NSArray *titles;
@property (nonatomic, copy, nullable) NSArray *imageNames;
@property (nonatomic, strong, nullable) UIFont *font;
@property (nonatomic, strong, nullable) UIColor *titleColor;
@property (nonatomic, strong, nullable) UIColor *contentColor;
@property (nonatomic, strong, nullable) UIColor *separatorColor;
@property (nonatomic, assign) CGFloat separatorOffset;
@property (nonatomic, assign) CGFloat separatorAlpha;
- (instancetype)initWiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames;
- (instancetype)initWithFrame:(CGRect)frame WiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames;
@end

@class MLMenuItemView;
@protocol MLMenuItemViewDelegate <NSObject>
- (void)menuItemView:(MLMenuItemView *)itemView didSelectItemAtIndex:(NSInteger)index;
@end

@interface MLMenuItemView : UIView
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *imageName;
@property (nonatomic, strong, nullable) UIFont *font;
@property (nonatomic, strong, nullable) UIColor *titleColor;
@property (nonatomic, strong, nullable) UIColor *separatorColor;
@property (nonatomic, assign) CGFloat separatorOffset;
@property (nonatomic, assign) CGFloat separatorAlpha;
@property (nonatomic, assign) BOOL isHiddenLin;
@property (nonatomic, weak) id <MLMenuItemViewDelegate>delegate;
- (instancetype)initWithTitle:(nonnull NSString *)title ImageName:(nullable NSString *)imageName WithAtIndex:(NSInteger)index;

@end

@interface MLButton: UIButton


@end

@interface MLViewLin:UIView
//- (void)setLineCustomeColor:(UIColor *)lineCustomeColor;
@property (nonatomic,strong) UIColor *lineCustomeColor;
@end

