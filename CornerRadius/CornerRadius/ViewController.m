//
//  ViewController.m
//  CornerRadius
//
//  Created by MiPai on 2017/11/1.
//  Copyright © 2017年 wangyu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+XYCornerRadius.h"
#import "UIImageView+XYCornerRadius.h"
#import "UIView+XYCornerRadius.h"
#import "UIButton+XYCornerRadius.h"
#import "Masonry.h"

static const CGFloat BtnWidth = 100.f;

@interface ViewController (){
    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buttonCorner];
}
- (void)buttonCorner{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.center = CGPointMake(self.view.frame.size.width/2, BtnWidth*1.5f);
//    button.bounds = CGRectMake(0, 0, BtnWidth, BtnWidth);
    [button setImage:[UIImage imageNamed:@"elepha.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 0, 10));
        make.height.mas_equalTo(@200);
    }];
    
    [self.view layoutIfNeeded];
    [button XY_AddCornerAndShadow:40 byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft forState:UIControlStateNormal];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewCorner{
    UIView *view = [UIView new];
    view.center = CGPointMake(self.view.frame.size.width/2, BtnWidth*1.5f);
    view.bounds = CGRectMake(0, 0, BtnWidth, BtnWidth);
    [self.view addSubview:view];
    //    view.backgroundColor = [UIColor cyanColor];
//    [view XY_AddCornerWithViewColor:[UIColor redColor]];
//        [view XY_AddCorner:50 byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerTopRight viewColor:[UIColor redColor]];
    [view XY_AddCornerAndShadow:20 byRoundingCorners:UIRectCornerTopRight|UIRectCornerTopLeft viewColor:[UIColor greenColor]];
}

- (void)imageviewCorner{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.center = CGPointMake(self.view.frame.size.width/2, BtnWidth*1.5f);
    imageView.bounds = CGRectMake(0, 0, BtnWidth, BtnWidth*2);
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"logo"];
//    [imageView XY_AddCornerAndShadow:20.f byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight];
    
//    imageView.backgroundColor = [UIColor redColor];
    

}

- (void)sceenReder{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    btn1.center = CGPointMake(self.view.frame.size.width/2, BtnWidth/2);
    btn1.bounds = CGRectMake(0, 0, BtnWidth, BtnWidth);
    [self.view addSubview:btn1];
    
    [btn1 setBackgroundImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    //    [btn1 setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    btn1.layer.cornerRadius = BtnWidth/2;
    btn1.layer.masksToBounds = YES;
    //btn 在设置背景图片的基础上 添加masktobounds 会产生离屏渲染
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.center = CGPointMake(self.view.frame.size.width/2, BtnWidth*1.5f);
    imageView.bounds = CGRectMake(0, 0, BtnWidth, BtnWidth);
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"logo"];
    imageView.layer.cornerRadius = BtnWidth/2;
    imageView.layer.masksToBounds = YES;
    imageView.backgroundColor = [UIColor redColor];
    //imageview 在设置背景色情况下 添加masktobounds 会产生离屏渲染
    
    //cornerRadius 不会产生off screen render masktobounds会产生
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
