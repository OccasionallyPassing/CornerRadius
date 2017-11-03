//
//  UIView+XYCornerRadius.h
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYCornerRadius)

- (void)XY_AddCornerWithViewColor:(UIColor*)viewColor;
- (void)XY_AddCorner:(CGFloat)cornerRadius viewColor:(UIColor *)viewColor;
- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners viewColor:(UIColor *)viewColor;

- (void)XY_AddCornerAndShadow:(UIColor*)viewColor;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius viewColor:(UIColor *)viewColor;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners viewColor:(UIColor *)viewColor;
@end
