//
//  UIButton+XYCornerRadius.m
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import "UIButton+XYCornerRadius.h"
#import "UIImage+XYCornerRadius.h"

@implementation UIButton (XYCornerRadius)

- (void)XY_AddCornerforState:(UIControlState)state{
    NSAssert(self.bounds.size.width == self.bounds.size.height, @"imageView宽高不同");
    [self XY_AddCorner:self.bounds.size.width forState:state];
}

- (void)XY_AddCorner:(CGFloat)cornerRadius forState:(UIControlState)state{
    NSAssert(self.imageView.image, @"imageView.image为空");
    UIImage *image = [self.imageView.image XY_AddCorner:cornerRadius size:self.bounds.size];
    [self setImage:image forState:state];
}

- (void)XY_AddCorner:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners forState:(UIControlState)state{
    NSAssert(self.imageView.image, @"imageView.image为空");
    UIImage *image = [self.imageView.image XY_AddCorner:cornerRadius size:self.bounds.size byRoundingCorners:corners];
    [self setImage:image forState:state];
}

- (void)XY_AddCornerAndShadowforState:(UIControlState)state{
    [self XY_AddCornerforState:state];
    [self addShadowLayer:self.bounds.size.width byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius forState:(UIControlState)state{
    [self XY_AddCorner:cornerRadius forState:state];
    [self addShadowLayer:cornerRadius byRoundingCorners:UIRectCornerAllCorners];
}

- (void)XY_AddCornerAndShadow:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners forState:(UIControlState)state{
    [self XY_AddCorner:cornerRadius byRoundingCorners:corners forState:state];
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
    [self layoutIfNeeded];
}

@end
