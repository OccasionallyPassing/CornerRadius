//
//  UIView+XYCornerRadius.m
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import "UIView+XYCornerRadius.h"
#import "UIImage+XYCornerRadius.h"

@implementation UIView (XYCornerRadius)

- (void)XY_AddCornerWithViewColor:(UIColor*)viewColor{
    NSAssert(self.frame.size.width == self.frame.size.height, @"view的宽高不相同");
    UIImage *image = [self XY_AddCorner:self.frame.size.width/2 size:self.bounds.size byRoundingCorners:UIRectCornerAllCorners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
}

- (void)XY_AddCorner:(CGFloat)cornerRadius viewColor:(UIColor *)viewColor{
    UIImage *image = [self XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:UIRectCornerAllCorners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
}

- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners viewColor:(UIColor *)viewColor{
    UIImage *image = [self XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:corners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
}

- (void)XY_AddCornerAndShadow:(UIColor*)viewColor{
    NSAssert(self.frame.size.width == self.frame.size.height, @"view的宽高不相同");
    UIImage *image = [self XY_AddCorner:self.frame.size.width/2 size:self.bounds.size byRoundingCorners:UIRectCornerAllCorners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
    [self addShadowLayer:self.frame.size.width/2 byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius viewColor:(UIColor *)viewColor{
    UIImage *image = [self XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:UIRectCornerAllCorners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
    [self addShadowLayer:cornerRadius byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners viewColor:(UIColor *)viewColor{
    UIImage *image = [self XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:corners viewColor:viewColor];
    self.layer.contents = (id)image.CGImage;
    [self addShadowLayer:cornerRadius byRoundingCorners:corners];
}

#pragma mark - private method
- (UIImage *)XY_AddCorner:(CGFloat)cornerRadius
                     size:(CGSize)size
        byRoundingCorners:(UIRectCorner)corners
                viewColor:(UIColor *)viewColor{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    [bezierPath addClip];
    [self.layer renderInContext:ctx];
    [viewColor setFill];
    [bezierPath fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)addShadowLayer:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners{
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = self.frame;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(3, -3);
    shadowLayer.shadowOpacity = 0.8;
    shadowLayer.shadowRadius = 3;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    shadowLayer.shadowPath = bezierPath.CGPath;
    [self.layer.superlayer insertSublayer:shadowLayer below:self.layer];
}

@end
