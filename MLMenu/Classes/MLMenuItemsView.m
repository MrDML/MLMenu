//
//  MLMenuItemsView.m
//  MLMenu
//
//  Created by 戴明亮 on 2018/5/29.
//

#import "MLMenuItemsView.h"

@interface MLMenuItemsView ()<MLMenuItemViewDelegate>

@end

@implementation MLMenuItemsView 

- (void)loadMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames{
    self.titles = titles;
    self.imageNames = imageNames;
    if (titles.count <= 0) return;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0; i < titles.count; i ++) {

        MLMenuItemView *itemView = [[MLMenuItemView alloc] initWithTitle:titles[i] ImageName:imageNames[i] WithAtIndex:i];
        itemView.title = titles[i];
        itemView.imageName = imageNames[i];
        itemView.delegate = self;
        [self addSubview:itemView];
        if (i == titles.count - 1) {
            itemView.isHiddenLin = YES;
        }

    }
}


- (instancetype)initWiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames
{
    self = [super init];
    if (self) {
         [self loadMenuItemTitles:titles ImageNames:imageNames];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame WiithMenuItemTitles:(nonnull NSArray *)titles ImageNames:(NSArray *)imageNames{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadMenuItemTitles:titles ImageNames:imageNames];
    }
    return self;
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

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.title = _titles[i];
    }
}

- (void)setImageNames:(NSArray *)imageNames{
    _imageNames = imageNames;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.imageName = _imageNames[i];
    }
}


- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.titleColor = _titleColor;
    }
}

- (void)setFont:(UIFont *)font{
    _font = font;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.font = _font;
    }
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    _separatorColor = separatorColor;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.separatorColor = _separatorColor;
    }
}

- (void)setSeparatorOffset:(CGFloat)separatorOffset{
    _separatorOffset = separatorOffset;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.separatorOffset = _separatorOffset;
    }
}

- (void)setSeparatorAlpha:(CGFloat)separatorAlpha{
    _separatorAlpha = separatorAlpha;
    for (int i = 0; i < self.subviews.count; i ++) {
        MLMenuItemView *itemView = self.subviews[i];
        itemView.separatorAlpha = _separatorAlpha;
    }
}

- (void)setContentColor:(UIColor *)contentColor{
    _contentColor = contentColor;
    self.backgroundColor = _contentColor;
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
@end

@implementation MLMenuItemView


- (instancetype)initWithTitle:(nonnull NSString *)title ImageName:(nullable NSString *)imageName WithAtIndex:(NSInteger)index {
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        _index = index;
        [self initialize:index];
    }
    return self;
}

- (void)initialize:(NSInteger)index{
    
    MLButton *button = [MLButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:self.title forState:UIControlStateNormal];
    button.tag = index;
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


- (void)setTitle:(NSString *)title{
    _title = title;
    [_button setTitle:_title forState:UIControlStateNormal];
}

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    if (_imageName) {
        [_button setImage:[UIImage imageNamed:_imageName] forState:UIControlStateNormal];
    }
    
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [_button setTitleColor:_titleColor forState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font{
    _font = font;
    _button.titleLabel.font = _font;
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    _separatorColor = separatorColor;
    _viewLine.lineCustomeColor = _separatorColor;
    [_viewLine setNeedsLayout];
}

- (void)setSeparatorOffset:(CGFloat)separatorOffset{
    _separatorOffset = separatorOffset;
   _viewLine.frame = CGRectMake(_separatorOffset, CGRectGetMaxY(_button.frame), self.bounds.size.width - (_separatorOffset * 2), 2);
}

- (void)setSeparatorAlpha:(CGFloat)separatorAlpha{
    _separatorAlpha = separatorAlpha;
    _viewLine.alpha = _separatorAlpha;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _button.frame = CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height - 2);
    _viewLine.frame = CGRectMake(_separatorOffset, CGRectGetMaxY(_button.frame), self.bounds.size.width - (_separatorOffset * 2), 2);
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
        self.imageView.center = CGPointMake(10 + self.imageView.image.size.width * 0.5, self.bounds.size.height * 0.5);
        self.imageView.bounds = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        CGRect frame = self.titleLabel.frame;
        frame.origin.x = CGRectGetMaxX(self.imageView.frame) + 5;
        self.titleLabel.frame = frame;
    }

}

@end







