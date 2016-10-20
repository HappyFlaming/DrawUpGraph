//
//  DrawFanPictureView.h
//  demo
//
//  Created by Litre on 2016/10/17.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawFanPictureView : UIView
/**
 *  扇形每部分所占比例和对应颜色dict
 *  key为比例数据     value为对应颜色值
 */
@property (nonatomic,strong)NSDictionary *dataDict;
@property (nonatomic) CGFloat startDegres;//设置起始弧度    系统默认水平右侧为0度开始弧度 由于我这里只考虑了不同比例的情况，若是比例值相同时就不能用字典的方式传数据了，相同比例的情况下可以用多个数组来处理。
@end
