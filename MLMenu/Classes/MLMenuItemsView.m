//
//  MLMenuItemsView.m
//  MLMenu
//
//  Created by 戴明亮 on 2018/5/29.
//

#import "MLMenuItemsView.h"
#import "MLMenuData.h"

@interface MLMenuItemsView ()<MLMenuItemViewDelegate>{
   
}
@property (nonatomic, strong) MLMenuData *menuData;
@end

@implementation MLMenuItemsView 

- (void)loadMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames withMenuData:(MLMenuData *)menuData{
    self.titles = titles;
    self.imageNames = imageNames;
    [self loadItemView:menuData];
   
}




- (instancetype)initWiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames withMenuData:(MLMenuData *)menuData
{
    self = [super init];
    if (self) {
         [self loadMenuItemTitles:titles ImageNames:imageNames withMenuData:menuData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame WiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames withMenuData:(MLMenuData *)menuData{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadMenuItemTitles:titles ImageNames:imageNames withMenuData:menuData];
    }
    return self;
}

- (void)loadItemView:(MLMenuData *)menuData{
    if (menuData.titles.count <= 0) return;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    self.titles = menuData.titles;
    self.imageNames = menuData.imageNames;
    for (int i = 0; i < menuData.titles.count; i ++) {
        
        MLMenuItemView *itemView = [[MLMenuItemView alloc] initWithTitle:self.titles[i] ImageName:self.imageNames[i] WithAtIndex:i withMenuData:menuData];

        itemView.delegate = self;
        
        [self addSubview:itemView];
        if (i == menuData.titles.count - 1) {
            itemView.isHiddenLin = YES;
        }
        
    }
}

- (void)updateMenuItemsView:(MLMenuData *)menuData{
    _menuData = menuData;
    [self loadItemView:menuData];
    [self setNeedsDisplay];
    [self setNeedsLayout];
    self.backgroundColor = _menuData.contentColor;
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
   
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        CGRect frame = CGRectZero;
        frame.origin.x = 0;
        frame.origin.y = (44 + 1) * i;
        frame.size = CGSizeMake(self.bounds.size.width, (44 + 1));
        itemView.frame = frame;
    }
}


- (void)menuItemView:(MLMenuItemView *)itemView didSelectItemAtIndex:(NSInteger)index{
    
    if ([_delegate respondsToSelector:@selector(menuItemsView:didSelectItemAtIndex:)]) {
        [_delegate menuItemsView:self didSelectItemAtIndex:index];
    }
    if (_menuDidSelectBlock) {
        _menuDidSelectBlock(index);
    }
}

@end


@interface MLMenuItemView(){
    
    UIImageView    *_imageView;
    MLViewLin      *_viewLine;
    UILabel        *_label;
    MLButton       *_button;
    NSInteger      _index;
}
@property (nonatomic, strong)MLMenuData *menuData;
@end

@implementation MLMenuItemView


- (instancetype)initWithTitle:(nonnull NSString *)title ImageName:(nullable NSString *)imageName WithAtIndex:(NSInteger)index withMenuData:(MLMenuData *)menuData {
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        _index = index;
        self.menuData = menuData;
        
    }
    return self;
}


- (void)setMenuData:(MLMenuData *)menuData{
    _menuData = menuData;
    [self initialize:_index];
    _viewLine.lineCustomeColor = menuData.separatorColor;
    _viewLine.alpha = menuData.separatorAlpha;
}

- (void)initialize:(NSInteger)index{
    
    MLButton *button = [MLButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    [button setTitleColor:self.menuData.titleColor forState:UIControlStateNormal];
    button.titleLabel.font = self.menuData.font;
    [button setTitle:self.title forState:UIControlStateNormal];
    button.tag = index;
    button.menuData = self.menuData;
    [button addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    button.backgroundColor = [UIColor clearColor];
    if (self.imageName) {
        [button setImage:[UIImage imageNamed:self.imageName] forState:UIControlStateNormal];
    }

    MLViewLin *viewLine = [[MLViewLin alloc] init];
    _viewLine = viewLine;
    viewLine.backgroundColor = [UIColor clearColor];
    [self addSubview:viewLine];
    
    // default
    _separatorOffset = 0;
   
    
}

- (void)itemAction:(MLButton *)sender{
    if ([_delegate respondsToSelector:@selector(menuItemView:didSelectItemAtIndex:)]) {
        [_delegate menuItemView:self didSelectItemAtIndex:sender.tag];
    }
}

- (void)setIsHiddenLin:(BOOL)isHiddenLin{
    _isHiddenLin = isHiddenLin;
    _viewLine.hidden = _isHiddenLin;
}




- (void)layoutSubviews{
    [super layoutSubviews];
    _button.center = CGPointMake(self.bounds.size.width * 0.5 , (self.bounds.size.height - 2) * 0.5);
    _button.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 2);
    _viewLine.frame = CGRectMake(self.menuData.separatorOffSet, CGRectGetMaxY(_button.frame), self.bounds.size.width - (self.menuData.separatorOffSet * 2), 2);
}


@end



@implementation MLViewLin

- (instancetype)init
{
    self = [super init];
    if (self) {
        // default color
        self.lineCustomeColor = [UIColor whiteColor];
    }
    return self;
}



- (void)setLineCustomeColor:(UIColor *)lineCustomeColor{
    _lineCustomeColor = lineCustomeColor;
}


- (void)drawRect:(CGRect)rect{
    [self drawRectLine:nil];
}


- (void)drawRectLine:(UIColor *)color{
    CGContextRef contextRef =  UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetLineWidth(contextRef, 1);
    [self.lineCustomeColor setStroke];
    CGPathMoveToPoint(path, NULL, 0, 1);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width, 1);
    CGContextAddPath(contextRef, path);
    CGContextStrokePath(contextRef);
    CGPathRelease(path);
}

@end


@implementation MLButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.imageView.image != nil) {
        
        CGFloat leftOffset = 10;
        CGFloat x =  (self.frame.size.width - (self.imageView.image.size.width + 5 + self.titleLabel.frame.size.width)) * 0.5;
        leftOffset = MIN(leftOffset, x);
        
        self.imageView.center = CGPointMake(leftOffset + self.menuData.contentLeftOffset +self.imageView.image.size.width * 0.5, self.bounds.size.height * 0.5);
        self.imageView.bounds = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
       
        
        CGRect frame = self.titleLabel.frame;
        frame.origin.x = CGRectGetMaxX(self.imageView.frame) + 5;
        self.titleLabel.frame = frame;
    }

}

@end







