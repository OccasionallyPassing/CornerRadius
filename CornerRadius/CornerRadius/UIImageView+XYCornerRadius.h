//
//  UIImageView+XYCornerRadius.h
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XYCornerRadius)

//加载出图片，才有效果
- (void)XY_AddCorner;
- (void)XY_AddCorner:(CGFloat)cornerRadius;
- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners;

- (void)XY_AddCornerAndShadow;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius;
- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners;
@end
