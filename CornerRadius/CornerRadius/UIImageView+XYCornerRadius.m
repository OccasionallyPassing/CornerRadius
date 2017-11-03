//
//  UIImageView+XYCornerRadius.m
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import "UIImageView+XYCornerRadius.h"
#import "UIImage+XYCornerRadius.h"

@implementation UIImageView (XYCornerRadius)

- (void)XY_AddCorner{
    NSAssert(self.bounds.size.width == self.bounds.size.height, @"imageView宽高不同");
    [self XY_AddCorner:self.bounds.size.width];
}

- (void)XY_AddCorner:(CGFloat)cornerRadius{
    NSAssert(self.image, @"imageView.image为空");
    UIImage *image = [self.image XY_AddCorner:cornerRadius size:self.bounds.size];
    self.image = image;
}

- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners{
    NSAssert(self.image, @"imageView.image为空");
    UIImage *image = [self.image XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:corners];
    self.image = image;
}

- (void)XY_AddCornerAndShadow{
    [self XY_AddCorner];
    [self addShadowLayer:self.bounds.size.width byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius{
    [self XY_AddCorner:cornerRadius];
    [self addShadowLayer:cornerRadius byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners{
    [self XY_AddCorner:cornerRadius byRoundingCorners:corners];
    [self addShadowLayer:cornerRadius byRoundingCorners:corners];
}

#pragma mark - private method
- (void)addShadowLayer:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners{
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = self.frame;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0, 0);
    shadowLayer.shadowOpacity = 0.8;
    shadowLayer.shadowRadius = 3;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    shadowLayer.shadowPath = bezierPath.CGPath;
    [self.layer.superlayer insertSublayer:shadowLayer below:self.layer];
}
@end
