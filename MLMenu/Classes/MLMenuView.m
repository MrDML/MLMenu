//
//  MLMenuView.m
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import "MLMenuView.h"
#import "MLMenu.h"


static  NSString * const IDETIFIRE = @"MLMENUCELLIDETIFIRE";

@interface MLMenuView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>{
    CGRect _frame;
    CGFloat _triangleOffsetLeft;
    CGFloat _menuViewOffsetTop;
    BOOL _isHasTriangle;
    MLEnterAnimationStyle _animationStyle;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation MLMenuView


- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithImageNames:(NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top WithTriangleOffsetLeft:(CGFloat)left
{
    self = [super initWithFrame:CGRectMake(0, 0, k_ScreenWidth, k_ScreenHeight)];
    if (self) {
        _frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, titles.count * 44);
       _menuViewOffsetTop = _menuViewOffsetTop < k_StatusBarAndNavigationBarHeight ? k_StatusBarAndNavigationBarHeight : _menuViewOffsetTop;
        _triangleOffsetLeft = left;
        _menuViewOffsetTop = top;
        _isHasTriangle = YES;
        self.titles = titles;
        self.imageNames = imageNames;
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithImageNames:(NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top
{

     self = [self initWithFrame:frame WithTitles:titles WithImageNames:imageNames WithMenuViewOffsetTop:top WithTriangleOffsetLeft:0];
    _isHasTriangle = NO;
    return self;
}


- (void)delaDataWithTitles:(NSArray *)titles WithImageNames:(NSArray *)imageNames
{
    int i = 0;
    [self.dataArray removeAllObjects];
    if (titles.count <= 0) return;
    for (NSString *title in titles) {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        [dictM setValue:title forKey:@"title"];
        [dictM setValue:imageNames[i] forKey:@"imageName"];
        MLMenuItem *item = [MLMenuItem menuItemWithDict:dictM];
        item.fontSzie = 14;
        item.titleColor = [UIColor whiteColor];
        item.separatorColor = MLClolor(92, 92, 92, 1);
        item.imageNames = imageNames;
        item.titls = titles;
        [self.dataArray addObject:item];
        i ++;
    }
    [self.tableView reloadData];
    
}

- (void)setMenuViewBackgroundColor:(UIColor *)backgroundColor
{
    self.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = backgroundColor != nil ? self.tableView.backgroundColor = backgroundColor : MLClolor(73, 72, 75, 1);;
}

- (void)setCoverViewBackgroundColor:(UIColor *)backgroundColor
{
  self.coverView.backgroundColor =  backgroundColor != nil ?  backgroundColor : [UIColor clearColor];
}


- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    if (self.dataArray.count > 0) return;
    for (MLMenuItem *item in self.dataArray) {
        item.titleColor = titleColor;
    }
    [self.tableView reloadData];
}

- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
     [self delaDataWithTitles:titles WithImageNames:self.imageNames];
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    [self delaDataWithTitles:self.titles WithImageNames:imageNames];
    
}

- (void)setTitleFont:(UIFont *)font
{
    _font = font;

    if (self.dataArray.count > 0) return;
    for (MLMenuItem *item in self.dataArray) {
        item.fontSzie = font.pointSize;
    }
    [self.tableView reloadData];
   
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;
    if (self.dataArray.count > 0) return;
    for (MLMenuItem *item in self.dataArray) {
        item.separatorColor = separatorColor;
    }
    [self.tableView reloadData];
}





- (void)setSubViews
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    [self addSubview:self.coverView];
    [self.coverView addSubview:self.contentView];
    [self.contentView addSubview:self.tableView];
    [self drawRectTableViewcornerRadius];
    _isHasTriangle ? [self drawRectCoverViewTriangleOffset:_triangleOffsetLeft] : nil;

    [self.tableView registerClass:[MLMenuCell class] forCellReuseIdentifier:IDETIFIRE];
    
}


- (void)drawRectTableViewcornerRadius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height) cornerRadius:5];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.tableView.layer.mask = layer;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    self.tableView.frame = CGRectMake(0,  _isHasTriangle ? 10 : 0, _frame.size.width, _frame.size.height);
    self.contentView.frame = CGRectMake(_frame.origin.x, 0, _frame.size.width, _isHasTriangle? _frame.size.height + 10 : _frame.size.height);
}



- (void)showMenuEnterAnimation:(MLEnterAnimationStyle)animationStyle
{
    
   _animationStyle = animationStyle;
    [self setSubViews];
    [self delaDataWithTitles:self.titles WithImageNames:self.imageNames];

    if (animationStyle == MLEnterAnimationStyleRight) {
        self.contentView.layer.position = CGPointMake(_frame.origin.x + _frame.size.width, 0);
        self.contentView.layer.anchorPoint = CGPointMake(1, 0);
        self.contentView.clipsToBounds = YES;
        self.contentView.transform = CGAffineTransformMakeScale(0.6, 0.6);
        self.contentView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 1;
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (animationStyle == MLEnterAnimationStyleTop){
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


- (void)hidMenuExitAnimation:(MLEnterAnimationStyle)animationStyle
{
    
    if (_animationStyle == MLEnterAnimationStyleRight) {
        self.contentView.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 0;
            self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else if (_animationStyle == MLEnterAnimationStyleTop){
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


#pragma mark UITableViewDataSource , UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MLMenuCell *cell =  [tableView dequeueReusableCellWithIdentifier:IDETIFIRE];
    
    if (!cell) {
        cell = [[MLMenuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDETIFIRE];
    }
    cell.backgroundColor = [UIColor clearColor];
    MLMenuItem *item = self.dataArray[indexPath.row];
    cell.menuItem = item;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if ([_delegate respondsToSelector:@selector(didselectItemIndex:)]) {
        [_delegate didselectItemIndex:indexPath.row];
    }
    if (_didSelectBlock) {
        _didSelectBlock(indexPath.row);
    }
    
    [self hidMenuExitAnimation:_animationStyle];
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



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0,  _isHasTriangle ? 10 : 0, _frame.size.width, _frame.size.height);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.scrollEnabled = NO;
        _tableView.backgroundColor = MLClolor(73, 72, 75, 1);
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)drawRectCoverViewTriangleOffset:(CGFloat)offset
{

    if (offset < 6) offset = 6;
    if (offset > _frame.size.width - 6) offset = _frame.size.width - 6;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(offset, 2)];
    [path addLineToPoint:CGPointMake(offset - 6, 10)];
    [path addLineToPoint:CGPointMake(offset + 6, 10)];
    CAShapeLayer *layer =[CAShapeLayer layer];
    layer.path = path.CGPath;
    [layer setFillColor:MLClolor(73, 72, 75, 1).CGColor];
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
