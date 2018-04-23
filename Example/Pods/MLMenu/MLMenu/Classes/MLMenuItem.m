//
//  MLMenuItem.m
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import "MLMenuItem.h"

@implementation MLMenuItem

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = [dict objectForKey:@"title"];
        self.imageName = [dict objectForKey:@"imageName"];
    }
    return self;
}

+ (instancetype)menuItemWithDict:(NSDictionary *)dict
{
    return  [[MLMenuItem alloc] initWithDict:dict];
}


@end
