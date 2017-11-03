//
//  UIButton+XYCornerRadius.h
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XYCornerRadius)

//加载出图片，才有效果
- (void)XY_AddCornerforState:(UIControlState)state;
- (void)XY_AddCorner:(CGFloat)cornerRadius forState:(UIControlState)state;
- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners forState:(UIControlState)state;

- (void)XY_AddCornerAndShadowforState:(UIControlState)state;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius forState:(UIControlState)state;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners forState:(UIControlState)state;

@end
