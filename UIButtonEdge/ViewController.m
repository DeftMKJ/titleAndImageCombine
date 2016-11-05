//
//  ViewController.m
//  UIButtonEdge
//
//  Created by MKJING on 16/10/26.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;

@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;

@property (weak, nonatomic) IBOutlet UIView *dashLine;
@property (weak, nonatomic) IBOutlet UIView *dashLine1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addBorderLine];
    

    
//    CGFloat labelWidth = [self.button.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size.width;
//    CGFloat labelHeight = [self.button.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size.height;
//    
//    CGFloat labelWidth = [self.button.titleLabel.text sizeWithFont:self.button.titleLabel.font].width;
//    CGFloat labelHeight = [self.button.titleLabel.text sizeWithFont:self.button.titleLabel.font].height;
    
    CGFloat gap = 10.f;
    CGFloat labelWidth = self.button.titleLabel.bounds.size.width;
    CGFloat imageWidth = self.button.imageView.bounds.size.width;
    CGFloat imageHeight = self.button.imageView.bounds.size.height;
    CGFloat labelHeight = self.button.titleLabel.bounds.size.height;
    
    // 这里都计算完毕了，很简单，例如 imageWidth是A  labelWidth是B
    // 那么image要居中就要X轴移动 （A+B）/2 - A/2
    // label要居中就要X轴移动 （A+B）/2 - B/2
    // Y轴移动就直接除以2 然后加上间隙就好了
    // 图片中心对齐控件XY轴的偏移量
    CGFloat imageOffSetX = labelWidth / 2;
    CGFloat imageOffSetY = imageHeight / 2 + gap / 2;
    CGFloat labelOffSetX = imageWidth / 2;
    CGFloat labelOffSetY = labelHeight / 2 + gap / 2;
    
    // 让UIButton能保证边缘自适应 居中的时候需要
    // 当上下排布的时候，要根据edge来填充content大小
    CGFloat maxWidth = MAX(imageWidth,labelWidth); // 上下排布宽度肯定变小 获取最大宽度的那个
    CGFloat changeWidth = imageWidth + labelWidth - maxWidth; // 横向缩小的总宽度
    CGFloat maxHeight = MAX(imageHeight,labelHeight); // 获取最大高度那个 （就是水平默认排布的时候的原始高度）
    CGFloat changeHeight = imageHeight + labelHeight + gap - maxHeight; // 总高度减去原始高度就是纵向宽大宗高度
    
    // 左图右字
    self.button.imageEdgeInsets = UIEdgeInsetsMake(0, -gap / 2, 0, gap / 2);
    self.button.titleEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0 , - gap / 2);
    
    self.button1.imageEdgeInsets = UIEdgeInsetsMake(0, -gap / 2, 0, gap / 2);
    self.button1.titleEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0 , - gap / 2);
    self.button1.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
    
    
    // 右图左字
    self.button2.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth + gap / 2 , 0, -labelWidth - gap / 2);
    self.button2.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - gap / 2, 0, imageWidth+gap / 2);
    
    
    self.button3.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth + gap / 2 , 0, -labelWidth - gap / 2);
    self.button3.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - gap / 2, 0, imageWidth+gap / 2);
    self.button3.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
    
    // 上图下字
    
    self.button4.imageEdgeInsets = UIEdgeInsetsMake(-imageOffSetY, imageOffSetX, imageOffSetY, -imageOffSetX);
    self.button4.titleEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -labelOffSetX, -labelOffSetY, labelOffSetX);
    
    self.button5.imageEdgeInsets = UIEdgeInsetsMake(-imageOffSetY, imageOffSetX, imageOffSetY, -imageOffSetX);
    self.button5.titleEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -labelOffSetX, -labelOffSetY, labelOffSetX);
    self.button5.contentEdgeInsets = UIEdgeInsetsMake(changeHeight - labelOffSetY, - changeWidth / 2, labelOffSetY, -changeWidth / 2);
    
    
    // 上字下图
    self.button6.imageEdgeInsets = UIEdgeInsetsMake(imageOffSetY, imageOffSetX, -imageOffSetY, -imageOffSetX);
    self.button6.titleEdgeInsets = UIEdgeInsetsMake(-labelOffSetY, -labelOffSetX, labelOffSetY, labelOffSetX);
    
    
    self.button7.imageEdgeInsets = UIEdgeInsetsMake(imageOffSetY, imageOffSetX, -imageOffSetY, -imageOffSetX);
    self.button7.titleEdgeInsets = UIEdgeInsetsMake(-labelOffSetY, -labelOffSetX, labelOffSetY, labelOffSetX);
    self.button7.contentEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -changeWidth / 2, changeHeight - labelOffSetY, -changeWidth / 2);
    
    
    // 画个虚线玩玩
    self.dashLine1.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 5);
    [self drawDashLine:self.dashLine1 lineLength:2 lineSpacing:2 lineColor:[UIColor blueColor]];
    
    CGRect rec = self.dashLine.frame;
    rec.size.height = 2.0f;
    self.dashLine.frame = rec;
    [self drawDashLine:self.dashLine lineLength:2 lineSpacing:2 lineColor:[UIColor redColor]];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 64, 0, 0)];
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:18];
    label.text = @"呵呵呵呵";
    CGSize sizeThatFit = [label sizeThatFits:CGSizeMake(1000, 1000)];
    NSLog(@"sizeThatFit------> width = %lf,height = %lf",sizeThatFit.width,sizeThatFit.height);
    // sizeThatFit------> width = 73.500000,height = 21.500000
    
    NSLog(@"sizeThatFit之后的labelFrame ------> width = %lf,height = %lf",label.frame.size.width,label.frame.size.height);
    // sizeThatFit之后的labelFrame ------> width = 0.000000,height = 0.000000  没有变化 只是返回值而已，不改变调用者frame
    [label sizeToFit];
    NSLog(@"sizeTofit之后的labelFrame ——----> width = %lf.height = %lf",label.frame.size.width,label.frame.size.height);
    
    //sizeTofit之后的labelFrame ——----> width = 73.500000.height = 21.500000 第一计算frame，第二根据sizeThatFit计算返回的frame改变调用者frame
    
    
    
}


- (void)addBorderLine
{
    [self addButtonLine:self.button];
    [self addButtonLine:self.button1];
    [self addButtonLine:self.button2];
    [self addButtonLine:self.button3];
    [self addButtonLine:self.button4];
    [self addButtonLine:self.button5];
    [self addButtonLine:self.button6];
    [self addButtonLine:self.button7];
}

- (void)addButtonLine:(UIButton *)button
{
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.0f;
    
    button.titleLabel.layer.borderColor = [UIColor redColor].CGColor;
    button.titleLabel.layer.borderWidth = 1.0f;
    
    button.imageView.layer.borderColor = [UIColor yellowColor].CGColor;
    button.imageView.layer.borderWidth = 1.0f;
}


// zhe
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
