//
//  LCRotationViewController.m
//  OC-CABasicAnimation
//
//  Created by 呆仔～林枫 on 2017/7/27.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

#import "LCRotationViewController.h"

@interface LCRotationViewController ()

@property (weak,nonatomic) CALayer *leftRed;
@property (weak,nonatomic) CALayer *leftGray;
@property (weak,nonatomic) CALayer *leftBlue;
@property (weak,nonatomic) CALayer *leftGreen;

@property (weak,nonatomic) CALayer *rightRed;
@property (weak,nonatomic) CALayer *rightGray;
@property (weak,nonatomic) CALayer *rightBlue;
@property (weak,nonatomic) CALayer *rightGreen;

@end


@implementation LCRotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//缩放
    self.leftRed = [self createLayerPosition:CGPointMake(100, 120) backColor:[UIColor redColor]];
    [self.leftRed addAnimation:[self setAnimationKeyPath:@"transform.scale.x" toValue:0.1] forKey:nil];
    
    self.leftGray = [self createLayerPosition:CGPointMake(100, 230) backColor:[UIColor grayColor]];
    [self.leftGray addAnimation:[self setAnimationKeyPath:@"transform.scale.y" toValue:0.1] forKey:nil];
    
    self.leftBlue = [self createLayerPosition:CGPointMake(100, 340) backColor:[UIColor blueColor]];
    [self.leftBlue addAnimation:[self setAnimationKeyPath:@"transform.scale.z" toValue:0.1] forKey:nil];
    
    self.leftGreen = [self createLayerPosition:CGPointMake(100, 450) backColor:[UIColor greenColor]];
    [self.leftGreen addAnimation:[self setAnimationKeyPath:@"transform.scale" toValue:0.1] forKey:nil];
//旋转
    self.rightRed = [self createLayerPosition:CGPointMake(220, 120) backColor:[UIColor redColor]];
    [self.rightRed addAnimation:[self setAnimationKeyPath:@"transform.rotation.x" toValue:M_PI] forKey:nil];
    
    self.rightGray = [self createLayerPosition:CGPointMake(220, 230) backColor:[UIColor grayColor]];
    [self.rightGray addAnimation:[self setAnimationKeyPath:@"transform.rotation.y" toValue:M_PI] forKey:nil];
    
    self.rightBlue = [self createLayerPosition:CGPointMake(220, 340) backColor:[UIColor blueColor]];
    [self.rightBlue addAnimation:[self setAnimationKeyPath:@"transform.rotation.z" toValue:M_PI] forKey:nil];
    
    self.rightGreen = [self createLayerPosition:CGPointMake(220, 450) backColor:[UIColor greenColor]];
    [self.rightGreen addAnimation:[self setAnimationKeyPath:@"transform.rotation" toValue:-M_PI] forKey:nil];
}


- (CABasicAnimation *)setAnimationKeyPath:(NSString *)keyPath toValue:(CGFloat)toValue {

    CABasicAnimation *basicAni = [CABasicAnimation animation];
    basicAni.keyPath = keyPath;
    basicAni.toValue = @(toValue);
    basicAni.duration = 2.4;
    basicAni.repeatCount = CGFLOAT_MAX;
    [self.view setNeedsLayout];
    return basicAni;
}

- (CALayer *)createLayerPosition:(CGPoint)position backColor:(UIColor *)backColor {
    
    CALayer *layer = [CALayer layer];
    layer.position = position;
    layer.bounds = CGRectMake(0, 0, 80, 80);
    layer.backgroundColor = backColor.CGColor;
    [self.view.layer addSublayer:layer];
    return layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
