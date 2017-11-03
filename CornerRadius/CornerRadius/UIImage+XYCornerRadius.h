//
//  UIImage+XYCornerRadius.h
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XYCornerRadius)

- (UIImage *)XY_AddCorner:(CGFloat )cornerRadius size:(CGSize)size;
- (UIImage *)XY_AddCorner:(CGFloat)cornerRadius
                     size:(CGSize)size
        byRoundingCorners:(UIRectCorner)corners;
- (UIImage *)XY_AddCorner:(CGFloat)cornerRadius
                     size:(CGSize)size
        byRoundingCorners:(UIRectCorner)corners
                viewColor:(UIColor *)viewColor;
@end
