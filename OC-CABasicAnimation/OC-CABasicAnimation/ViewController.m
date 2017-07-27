//
//  ViewController.m
//  OC-CABasicAnimation
//
//  Created by 呆仔～林枫 on 2017/7/27.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak,nonatomic) CALayer *redLayer;
@property (weak,nonatomic) CALayer *greenLayer;
@property (weak,nonatomic) CALayer *blueLayer;
@property (weak,nonatomic) CALayer *grayLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.redLayer addAnimation:[self setAnimationFromValue:_redLayer.position toValue:CGPointMake(300, _redLayer.position.y) timingFunction:kCAMediaTimingFunctionLinear] forKey:@"linear"];
    [self.greenLayer addAnimation:[self setAnimationFromValue:_greenLayer.position toValue:CGPointMake(300, _greenLayer.position.y) timingFunction:kCAMediaTimingFunctionEaseIn] forKey:@"easeIn"];
     [self.blueLayer addAnimation:[self setAnimationFromValue:_blueLayer.position toValue:CGPointMake(300, _blueLayer.position.y) timingFunction:kCAMediaTimingFunctionEaseOut] forKey:@"easeOut"];
    [self.grayLayer addAnimation:[self setAnimationFromValue:_grayLayer.position toValue:CGPointMake(300, _grayLayer.position.y) timingFunction:kCAMediaTimingFunctionEaseInEaseOut] forKey:@"easeInEaseOut"];
}


- (CABasicAnimation *)setAnimationFromValue:(CGPoint)fromValue toValue:(CGPoint)toValue timingFunction:(NSString *)timingFunction {

    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"position";
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    basicAnimation.repeatCount = CGFLOAT_MAX;
    basicAnimation.fromValue = [NSValue valueWithCGPoint:fromValue];
    basicAnimation.toValue = [NSValue valueWithCGPoint:toValue];
    basicAnimation.duration = 2.4f;
    return basicAnimation;
}

- (CALayer *)createLayerPosition:(CGPoint)position backColor:(UIColor *)backColor {

    CALayer *layer = [CALayer layer];
    layer.position = position;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = backColor.CGColor;
    [self.view.layer addSublayer:layer];
    return layer;
}

#pragma mark : Lazy
- (CALayer *)redLayer {

    if (!_redLayer) {
        _redLayer = [self createLayerPosition:CGPointMake(50, 130) backColor:[UIColor redColor]];
    }
    return _redLayer;
}

- (CALayer *)greenLayer {
    if (!_greenLayer) {
        _greenLayer = [self createLayerPosition:CGPointMake(50, 250) backColor:[UIColor greenColor]];
    }
    return _greenLayer;
}

- (CALayer *)blueLayer {

    if (!_blueLayer) {
        _blueLayer = [self createLayerPosition:CGPointMake(50, 370) backColor:[UIColor blueColor]];
    }
    return _blueLayer;
}

- (CALayer *)grayLayer {

    if (!_grayLayer) {
        _grayLayer = [self createLayerPosition:CGPointMake(50, 490) backColor:[UIColor grayColor]];
    }
    return _grayLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
