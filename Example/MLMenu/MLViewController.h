//
//  MLViewController.h
//  MLMenu
//
//  Created by MrDML on 04/23/2018.
//  Copyright (c) 2018 MrDML. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, MLMenuStyle) {
    MLMenuStyle_Title,
    MLMenuStyle_ImageAndTitle,
    MLMenuStyle_AnimationRight,
    MLMenuStyle_AnimationTop,
    MLMenuStyle_AnimationNone,
    MLMenuStyle_HasTriangle,
    MLMenuStyle_NoHasTriangle
    
};

@interface MLViewController : UIViewController
@property (nonatomic, assign) MLMenuStyle menuStyle;
@end
