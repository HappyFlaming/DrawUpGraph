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
@property (nonatomic) CGFloat startDegres;//设置起始弧度    系统默认水平右侧为0度开始弧度
@end
