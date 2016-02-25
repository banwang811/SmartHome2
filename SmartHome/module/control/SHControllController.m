//
//  ViewController.m
//  CircleDemo
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHControllController.h"
#import "BWButton.h"

#define gScreenheight [UIScreen mainScreen].bounds.size.height

#define gScreenwidth [UIScreen mainScreen].bounds.size.width

@interface SHControllController ()

@property (nonatomic, strong) NSMutableArray            *array;

@property (nonatomic, strong) NSMutableArray            *array2;

@property (nonatomic, strong) NSMutableArray            *array3;

@property (nonatomic, assign) CGFloat                   offAngle;

@property (nonatomic, assign) CGFloat                   timer;

@property (nonatomic, assign) CGFloat                   radius;
//
@property (nonatomic, assign) CGFloat                   radius2;

@property (nonatomic, assign) CGFloat                   radius3;

@property (nonatomic, assign) CGFloat                   buttonRadius;


@property (nonatomic, assign) BWButtonType              type;

@property (nonatomic, strong) NSMutableArray            *currentArray;

@property (nonatomic, assign) CGFloat                   currentRadius;

@property (nonatomic, assign) CGPoint                   circleCenter;

@property (nonatomic, assign) CGFloat                   currentRadian;

@end

@implementation SHControllController

- (instancetype)init{
    if (self = [super init]) {
        self.buttonRadius = 50;
        self.radius = gScreenwidth/2;
        self.radius2 = gScreenwidth/2 - self.buttonRadius;
        self.radius3 = gScreenwidth/2 - self.buttonRadius *2;
        self.circleCenter = CGPointMake(gScreenwidth/2, gScreenheight - 75);
        self.array = [NSMutableArray array];
        self.array2 = [NSMutableArray array];
        self.array3 = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"控制面板";
    [self creatCircleWithtype:BWButtonType_outside buttonCount:8];
    [self creatCircleWithtype:BWButtonType_middle buttonCount:8];
    [self creatCircleWithtype:BWButtonType_inside buttonCount:4];
    [self crearArcBackground:self.radius + self.buttonRadius/2];
    [self crearArcBackground:self.radius2 + self.buttonRadius/2];
    [self crearArcBackground:self.radius3 + self.buttonRadius/2];
}

- (void)crearArcBackground:(CGFloat)radius{
    UIGraphicsBeginImageContext(CGSizeMake(gScreenwidth,gScreenheight));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddArc(ctx, _circleCenter.x, _circleCenter.y, radius, 0, 2*M_PI, 1);
    CGContextDrawPath(ctx, kCGPathStroke);
    UIImage *curve = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, gScreenwidth, gScreenheight)];
    imageView.image = curve;
    [self.view addSubview:imageView];
}

- (void)setCurrentArrayAndRadiusWithType:(BWButtonType)type{
    if (type == BWButtonType_inside) {
        self.currentRadius = self.radius3;
        self.currentArray = self.array3;
        self.currentRadian = 90;
    }else if (type == BWButtonType_middle){
        self.currentRadius = self.radius2;
        self.currentArray = self.array2;
        self.currentRadian = 30;
    }else{
        self.currentRadius = self.radius;
        self.currentArray = self.array;
        self.currentRadian = 30;
    }
}

- (void)creatCircleWithtype:(BWButtonType)type buttonCount:(NSInteger)count{
    [self setCurrentArrayAndRadiusWithType:type];
    for (int i = 0; i < count; i ++ ) {
        BWButton *button = [[BWButton alloc] initWithFrame:CGRectMake(0, 0, self.buttonRadius, self.buttonRadius) imageName:@"" title:[NSString stringWithFormat:@"%d",i]];
        button.backgroundColor = [UIColor redColor];
        button.startAngle = self.currentRadian * i/180.0 *M_PI + M_PI;
        button.center = CGPointMake(_circleCenter.x + self.currentRadius * cosf(button.startAngle) , _circleCenter.y + self.currentRadius * sinf(button.startAngle));
        button.layer.cornerRadius = 25;
        button.tag = i;
        button.type = type;
        button.block = ^(BWButton *button){
            [self buttonClick:button];
        };
        [self.currentArray addObject:button];
        [self.view addSubview:button];
    }
}

- (void)buttonClick:(BWButton *)button{
    NSLog(@"index === %ld",button.tag);
    self.type = button.type;
    [self setCurrentArrayAndRadiusWithType:button.type];
    //计算整体的偏移弧度
    NSInteger index = floor(button.startAngle/(2*M_PI));
    self.offAngle = 3/2.0*M_PI - (button.startAngle - 2*M_PI * index);
    if (self.offAngle <= 0) {
        self.offAngle += 2*M_PI;
    }
    self.timer = self.offAngle/(2*M_PI)*(180.0/self.currentRadian)*0.4;
    for (int i = 0; i < [self.currentArray count]; i++) {
        BWButton *activeButton = [self.currentArray objectAtIndex:i];
        //计算endAngle = startAngle + offAngle
        float endAngle  = activeButton.startAngle + self.offAngle;
        [self createAnimation:activeButton.startAngle andEndAngle:endAngle radius:self.currentRadius button:activeButton];
    }
}

- (void)createAnimation:(float)startAngle andEndAngle:(float)endAngle radius:(CGFloat)radius button:(BWButton *)button{
    button.startAngle = endAngle;
    //创建运转动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = self.timer;
    pathAnimation.delegate = self;
    //设置运转动画的路径
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathAddArc(curvedPath, NULL, _circleCenter.x, _circleCenter.y, radius, startAngle, endAngle, 0);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [button.layer addAnimation:pathAnimation forKey:@"jakillTest"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setCurrentArrayAndRadiusWithType:self.type];
    for (int i = 0; i < [self.currentArray count]; i++) {
        BWButton *button = [self.currentArray objectAtIndex:i];
        button.center = CGPointMake(_circleCenter.x + self.currentRadius * cosf(button.startAngle) , _circleCenter.y + self.currentRadius * sinf(button.startAngle));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
