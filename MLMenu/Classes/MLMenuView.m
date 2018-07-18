//
//  MLMenuView.m
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import "MLMenuView.h"
#import "MLMenuItemsView.h"
#import "MLMenuData.h"
#define  MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define  k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)
#define FontSizeDefault   [UIFont systemFontOfSize:14]
#define TitleColorDefault [UIColor whiteColor]
#define SeparatorColorDefault [UIColor whiteColor]
#define SeparatorOffsetDefault 0

static  NSString * const IDETIFIRE = @"MLMENUCELLIDETIFIRE";

@interface MLMenuView ()<UIGestureRecognizerDelegate,MLMenuItemsViewDelegate>{
    CGRect _frame;
    CGFloat _triangleOffsetLeft;
    CGFloat _menuViewOffsetTop;
    BOOL _isHasTriangle;
    MLAnimationStyle _animationStyle;
    UIColor *_triangleColor;
}
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) MLMenuItemsView *itemsView;
@property (nonatomic, strong) MLMenuData *menuData;
@end

@implementation MLMenuView


- (instancetype)initWithFrame:(CGRect)frame WithTitles:(nonnull NSArray *)titles WithImageNames:(nullable NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top WithTriangleOffsetLeft:(CGFloat)left triangleColor:(nullable UIColor *)triangleColor{
    self = [super initWithFrame:CGRectMake(0, 0, k_ScreenWidth, k_ScreenHeight)];
    if (self) {
        _frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, titles.count * 44);
       _menuViewOffsetTop = _menuViewOffsetTop < k_StatusBarAndNavigationBarHeight ? k_StatusBarAndNavigationBarHeight : _menuViewOffsetTop;
        _triangleOffsetLeft = left;
        _menuViewOffsetTop = top;
        _isHasTriangle = YES;
        _titles = titles;
        _imageNames = imageNames;
        _triangleColor = (triangleColor != nil)?triangleColor :MLClolor(73, 72, 75, 1);
        self.backgroundColor = [UIColor clearColor];
         _menuData = [[MLMenuData alloc] init];
        _menuData.titles = titles;
        _menuData.imageNames = imageNames;
        [_menuData defaultVaule];

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame WithTitles:(nonnull NSArray *)titles WithImageNames:(nullable NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top{

    self = [self initWithFrame:frame WithTitles:titles WithImageNames:imageNames WithMenuViewOffsetTop:top WithTriangleOffsetLeft:0 triangleColor:nil];
    _isHasTriangle = NO;
    return self;
}


- (void)setMenuViewBackgroundColor:(UIColor *)backgroundColor{
    self.menuData.contentColor = backgroundColor;
}

- (void)setCoverViewBackgroundColor:(UIColor *)backgroundColor{
  self.coverView.backgroundColor =  backgroundColor != nil ?  backgroundColor : [UIColor clearColor];
}


- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.menuData.titleColor = _titleColor;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.menuData.titles = _titles;
}

- (void)setImageNames:(NSArray *)imageNames{
    _imageNames = imageNames;
    self.menuData.imageNames = _imageNames;
}

- (void)setFont:(UIFont *)font{
    _font = font;
    self.menuData.font = _font;
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    _separatorColor = separatorColor;
    self.menuData.separatorColor = _separatorColor;
}


- (void)setSeparatorOffSet:(CGFloat)separatorOffSet{
    _separatorOffSet = separatorOffSet;
    self.menuData.separatorOffSet = _separatorOffSet;
}

- (void)setSeparatorAlpha:(CGFloat)separatorAlpha{
    _separatorAlpha = separatorAlpha;
    self.menuData.separatorAlpha = _separatorAlpha;
}


- (void)setContentLeftOffset:(CGFloat)contentLeftOffset{
    _contentLeftOffset = contentLeftOffset;
    self.menuData.contentLeftOffset = contentLeftOffset;
}


- (void)setSubViews{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    [self addSubview:self.coverView];
    [self.coverView addSubview:self.contentView];
   
    [self.contentView addSubview:self.itemsView];
    [self.itemsView updateMenuItemsView:self.menuData];
  
    _isHasTriangle ? [self drawRectCoverViewTriangleOffset:_triangleOffsetLeft] : nil;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat itemHeight = 45;
    NSInteger count = self.titles.count;
    
    CGRect frame = CGRectZero;
    frame.origin.x = _frame.origin.x - ([self calculateMenuWidth] - _frame.size.width);
    frame.origin.y = 0;
    frame.size.width = [self calculateMenuWidth];
    frame.size.height = _isHasTriangle? (itemHeight * count) + 10 : itemHeight * count;
    self.contentView.frame = frame;
    
    
    CGRect frameItemsView = CGRectZero;
    frameItemsView.origin.x = 0;
    frameItemsView.origin.y = _isHasTriangle ? 10 : 0;
    frameItemsView.size.width = self.contentView.frame.size.width;
    frameItemsView.size.height = _isHasTriangle? self.contentView.frame.size.height - 10 : self.contentView.frame.size.height;
    self.itemsView.frame = frameItemsView;
  
}

- (CGFloat)calculateMenuWidth{
    
    CGFloat titleWidth = 0;
    for (NSString *title in self.titles) {
      CGSize size  = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.menuData.font} context:nil].size;
        titleWidth = MAX(_frame.size.width, size.width);
    }
    
    CGFloat imageWidth = 0;
    if (self.imageNames.count > 0) {
        for (NSString *imageName in self.imageNames) {
            UIImage *image = [UIImage imageNamed:imageName];
            imageWidth = MAX(imageWidth, image.size.width);
        }
    }
    
    return titleWidth + imageWidth;
    
    
    
}


#pragma mark MLMenuItemsViewDelegate
- (void)menuItemsView:(MLMenuItemsView *)itemView didSelectItemAtIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(menuView:didselectItemIndex:)]) {
        [self.delegate menuView:self didselectItemIndex:index];
    }
    if (self.didSelectBlock) {
        self.didSelectBlock(index);
    }
    [self hidMenuExitAnimation:_animationStyle];
}


- (void)showMenuEnterAnimation:(MLAnimationStyle)animationStyle
{
    
   _animationStyle = animationStyle;
     [self setSubViews];
    if (animationStyle == MLAnimationStyleRight) {
        self.contentView.layer.position = CGPointMake(_frame.origin.x + _frame.size.width, 0);
        self.contentView.layer.anchorPoint = CGPointMake(1, 0);
        self.contentView.clipsToBounds = YES;
        self.contentView.transform = CGAffineTransformMakeScale(0.6, 0.6);
        self.contentView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 1;
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (animationStyle == MLAnimationStyleTop){
        self.contentView.layer.position = CGPointMake(_frame.origin.x + _frame.size.width * 0.5, _menuViewOffsetTop);
        self.contentView.layer.anchorPoint = CGPointMake(0.5, 0);
        self.contentView.clipsToBounds = YES;
        self.contentView.transform = CGAffineTransformMakeScale(1, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
         }];
    }else{
        self.coverView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
   

    
}


- (void)hidMenuExitAnimation:(MLAnimationStyle)animationStyle
{
    
    if (_animationStyle == MLAnimationStyleRight) {
        self.contentView.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 0;
            self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else if (_animationStyle == MLAnimationStyleTop){
        self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 0.001);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    
    }else{
        self.coverView.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 0;
        } completion:^(BOOL finished) {
             [self removeFromSuperview];
        }];
       
    }
   

}

- (void)singleTapCoverAction:(UITapGestureRecognizer *)gesture
{

    [self hidMenuExitAnimation:_animationStyle];
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSString *class = NSStringFromClass(touch.view.class);
    if ([class isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}


#pragma mark Getter
- (UIView *)coverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:CGRectMake(0, _menuViewOffsetTop, k_ScreenWidth, k_ScreenHeight - _menuViewOffsetTop)];
        _coverView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapCoverAction:)];
        tap.delegate = self;
        [_coverView addGestureRecognizer:tap];
    }
    return _coverView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView =[[UIView alloc] initWithFrame:CGRectMake(_frame.origin.x, 0, _frame.size.width, _isHasTriangle? _frame.size.height + 10 : _frame.size.height)];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}



- (MLMenuItemsView *)itemsView
{
    if (!_itemsView) {
        _itemsView = [[MLMenuItemsView alloc] initWiithMenuItemTitles:self.menuData.titles ImageNames:self.menuData.imageNames withMenuData:self.menuData];
        _itemsView.backgroundColor =  [UIColor colorWithRed:73/255.0 green:72/255.0 blue:75/255.0 alpha:1];
        _itemsView.delegate = self;
    }
    return _itemsView;
}


- (void)drawRectCoverViewTriangleOffset:(CGFloat)offset
{

    if (offset < 6) offset = 6;
    if (offset > [self calculateMenuWidth] - 6) offset = [self calculateMenuWidth] - 6;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(offset, 2)];
    [path addLineToPoint:CGPointMake(offset - 6, 10)];
    [path addLineToPoint:CGPointMake(offset + 6, 10)];
    CAShapeLayer *layer =[CAShapeLayer layer];
    layer.path = path.CGPath;
    [layer setFillColor:_triangleColor.CGColor];
    [self.contentView.layer addSublayer:layer];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
