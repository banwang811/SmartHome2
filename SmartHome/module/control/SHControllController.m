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
        self.buttonRadius = 55;
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
    [self crearArcBackground:self.radius + self.buttonRadius/2 color:RGB(42, 110, 160, 1)];
    [self crearArcBackground:self.radius2 + self.buttonRadius/2 color:RGB(22, 68, 101, 1)];
    [self crearArcBackground:self.radius3 + self.buttonRadius/2 color:RGB(53, 126, 170, 1)];
    
    [self creatCircleWithtype:BWButtonType_outside buttonCount:8];
    [self creatCircleWithtype:BWButtonType_middle buttonCount:8];
    [self creatCircleWithtype:BWButtonType_inside buttonCount:4];
}


- (void)crearArcBackground:(CGFloat)radius color:(UIColor *)color{
    UIGraphicsBeginImageContext(CGSizeMake(gScreenwidth,gScreenheight));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 0.5);//线的宽度
//    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetFillColorWithColor(ctx,color.CGColor);
    CGContextAddArc(ctx, _circleCenter.x, _circleCenter.y, radius, 0, 2*M_PI, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);
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
        BWButton *button = [[BWButton alloc] initWithFrame:CGRectMake(0, 0, self.buttonRadius, self.buttonRadius) imageName:@"light" title:[NSString stringWithFormat:@"电视%d",i]];
        button.startAngle = self.currentRadian * i/180.0 *M_PI + M_PI;
        button.center = CGPointMake(_circleCenter.x + self.currentRadius * cosf(button.startAngle) , _circleCenter.y + self.currentRadius * sinf(button.startAngle));
        button.layer.cornerRadius = 10;
        button.transform = CGAffineTransformMakeRotation(button.startAngle + M_PI/2);
        button.rotationAngle = button.startAngle + M_PI/2;
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
    self.type = button.type;
    [self setCurrentArrayAndRadiusWithType:button.type];
    //计算整体的偏移弧度
    NSInteger index = floor(button.startAngle/(2*M_PI));
    self.offAngle = 3/2.0*M_PI - (button.startAngle - 2*M_PI * index);
    if (self.offAngle <= 0) {
        self.offAngle += 2*M_PI;
    }
    NSLog(@"index === %ld self.offAngle ==%f button.rotationAngle == %f",button.tag,self.offAngle,button.rotationAngle);
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
    
    //旋转动画
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //2.设置动画属性初始值、结束值
    basicAnimation.fromValue = [NSNumber numberWithFloat:button.rotationAngle];

    basicAnimation.toValue=[NSNumber numberWithFloat:self.offAngle + button.rotationAngle];
    //设置其他动画属性
    basicAnimation.duration = self.timer;
    button.rotationAngle = self.offAngle + button.rotationAngle;
    [button.layer addAnimation:basicAnimation forKey:@"jakillTest2"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setCurrentArrayAndRadiusWithType:self.type];
    for (int i = 0; i < [self.currentArray count]; i++) {
        BWButton *button = [self.currentArray objectAtIndex:i];
        button.center = CGPointMake(_circleCenter.x + self.currentRadius * cosf(button.startAngle) , _circleCenter.y + self.currentRadius * sinf(button.startAngle));
        button.transform = CGAffineTransformMakeRotation(button.rotationAngle);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
