//
//  UIImage+XYCornerRadius.m
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import "UIImage+XYCornerRadius.h"

@implementation UIImage (XYCornerRadius)

- (UIImage *)XY_AddCorner:(CGFloat )cornerRadius size:(CGSize)size{
    return [self XY_AddCorner:cornerRadius size:size byRoundingCorners:UIRectCornerAllCorners];
}

- (UIImage *)XY_AddCorner:(CGFloat)cornerRadius
                size:(CGSize)size
   byRoundingCorners:(UIRectCorner)corners{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(ctx, bezierPath.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)XY_AddCorner:(CGFloat)cornerRadius
                     size:(CGSize)size
        byRoundingCorners:(UIRectCorner)corners
                viewColor:(UIColor *)viewColor{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.f);
    CGContextSetFillColorWithColor(ctx, viewColor.CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
//    CGContextAddPath(ctx, bezierPath.CGPath);
//    CGContextClip(ctx);
//    [self drawInRect:rect];
//    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
//    CGRect rect = CGRectMake(0, 0, size.width, size.height);
//    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    CGContextAddPath(ctx, bezierPath.CGPath);
//    CGContextClip(ctx);
//    [self drawInRect:rect];
//    CGContextDrawPath(ctx, kCGPathFillStroke);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;

}



@end
