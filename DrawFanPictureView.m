//
//  DrawFanPictureView.m
//  demo
//
//  Created by Litre on 2016/10/17.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DrawFanPictureView.h"
@interface DrawFanPictureView ()
@property (nonatomic) CGFloat pictureDataSum;//比例总和
@end
@implementation DrawFanPictureView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setDataDict:(NSDictionary *)dataDict {
    _dataDict = dataDict;
    [self dataSum];
    //刷新view
    [self setNeedsDisplay];
}

//比例总和
- (void)dataSum {
    [_dataDict.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        _pictureDataSum += [obj floatValue];
    }];
}
//绘图
- (void)drawRect:(CGRect)rect {
    //设置开始弧度
    CGFloat endDegres = 0+_startDegres;
    //提取比例数据
    NSArray *dataarr = _dataDict.allKeys;
    for (int i=0; i<dataarr.count; i++) {
        //求结束弧度
        endDegres += M_PI*2*((CGFloat)[dataarr[i] floatValue]/_pictureDataSum);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:MIN(self.frame.size.width/2, self.frame.size.height/2) startAngle:_startDegres endAngle:endDegres clockwise:YES];
        [path addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
        
#if 0
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        UIColor *color = _dataDict[dataarr[i]];
        layer.fillColor = color.CGColor;//设置填充颜色
        layer.path = path.CGPath;
        
        [self.layer addSublayer:layer];
#else
        UIColor *color = _dataDict[dataarr[i]];        
        //设置填充颜色
        [color setFill];
        //开始填充
        [path fill];
#endif
//        CGPoint point = [self calcCircleCoordinateWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) andWithAngle:endDegres-_startDegres andWithRadius:MIN(self.frame.size.width/2, self.frame.size.height/2)];
//        UILabel *labe = [[UILabel alloc] init];
//        labe.center = point;
//        labe.text = dataarr[i];
//        [labe sizeToFit];
//        labe.font = [UIFont systemFontOfSize:10];
//        labe.backgroundColor = [UIColor yellowColor];
//        [self addSubview:labe];
        
        //重新设定开始弧度
        _startDegres = endDegres;
    }
}

- (CGPoint) calcCircleCoordinateWithCenter:(CGPoint)center  andWithAngle:(CGFloat)angle andWithRadius:(CGFloat)radius{
    CGFloat x2 = -radius*cosf(angle*180/M_PI);
    CGFloat y2 = -radius*sinf(angle*180/M_PI);
    return CGPointMake(center.x-x2, center.y+y2);
    
    //x=a+(x0-a)cosα-(y0-b)sinα ,y=b+(x0-a)sinα+(y0-b)cosα .
}
@end
