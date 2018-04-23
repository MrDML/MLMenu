//
//  MLMenuCell.m
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import "MLMenuCell.h"

@interface MLMenuCell ()
@property (nonatomic, strong) UIImageView *imageViewAccessory;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIView *viewLine;

@end

@implementation MLMenuCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
  
    
    CGSize imageSize = self.imageViewAccessory.hidden ? CGSizeZero:CGSizeMake(20, 20);
     self.imageViewAccessory.center = CGPointMake(10 + imageSize.width * 0.5, self.frame.size.height * 0.5);
     self.imageViewAccessory.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    

    CGFloat titleCenterX;
    CGFloat titleCenterY = self.frame.size.height * 0.5;
    self.labelTitle.bounds = CGRectMake(0, 0, self.frame.size.width - 10 - imageSize.width - 10, self.frame.size.height);
    
    titleCenterX = self.imageViewAccessory.hidden?(self.frame.size.width - 10 - 10) * 0.5  + 10:(self.frame.size.width -self.imageViewAccessory.bounds.size.width - 10 - 10 - 10) * 0.5 + 10 + self.imageViewAccessory.bounds.size.width + 10;
    self.labelTitle.center = CGPointMake(titleCenterX, titleCenterY);
    
    self.viewLine.frame = CGRectMake(10, self.contentView.bounds.size.height - 1, self.contentView.bounds.size.width - 20, 1);
}


- (void)setSubViews
{
   
    self.imageViewAccessory = [[UIImageView alloc] init];
    self.imageViewAccessory.contentMode = UIViewContentModeScaleAspectFill;
    self.imageViewAccessory.clipsToBounds = YES;
//    self.imageViewAccessory.image = [UIImage imageNamed:@"img3"];
    self.imageViewAccessory.hidden = YES;
    [self.contentView addSubview:self.imageViewAccessory];

    self.labelTitle = [[UILabel alloc] init];
    self.labelTitle.font = [UIFont systemFontOfSize:14];
    self.labelTitle.textColor = [UIColor whiteColor];
    self.labelTitle.textAlignment = NSTextAlignmentLeft;
    self.labelTitle.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.labelTitle];
    
    self.viewLine = [[UIView alloc] init];
    self.viewLine.backgroundColor = MLClolor(92, 92, 92, 1);
    [self.contentView addSubview:self.viewLine];
    
}

- (void)setMenuItem:(MLMenuItem *)menuItem
{
    _menuItem = menuItem;
    
    self.labelTitle.text = menuItem.title;
    self.labelTitle.textColor = menuItem.titleColor ? menuItem.titleColor :[UIColor whiteColor];
    self.labelTitle.font = [UIFont systemFontOfSize:menuItem.fontSzie ? menuItem.fontSzie : 14];

    if (menuItem.imageNames.count > 0 && menuItem.imageNames.count == menuItem.titls.count) {
          self.imageViewAccessory.image = [UIImage imageNamed:menuItem.imageName ? menuItem.imageName:@"img3"];
          self.imageViewAccessory.hidden = NO;
        [self layoutSubviews];
    }
    self.viewLine.backgroundColor = menuItem.separatorColor ?  menuItem.separatorColor :MLClolor(92, 92, 92, 1);
  
    self.labelTitle.textAlignment = self.imageViewAccessory.hidden ? NSTextAlignmentCenter : NSTextAlignmentLeft;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setSubViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
