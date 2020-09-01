//
//  HKColorIGradientTool.h
//  Takeaway
//
//  Created by hank on 2020/9/1.
//  Copyright © 2020 CJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 渐变方式
 
 - IHGradientChangeDirectionLevel:              水平渐变
 - IHGradientChangeDirectionVertical:           竖直渐变
 - IHGradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
 - IHGradientChangeDirectionDownDiagonalLine:   向上对角线渐变
 */
typedef NS_ENUM(NSInteger, HKGradientChangeDirection) {
    HKGradientChangeDirectionLevel,
    HKGradientChangeDirectionVertical,
    HKGradientChangeDirectionUpwardDiagonalLine,
    HKGradientChangeDirectionDownDiagonalLine,
};

@interface HKColorIGradientTool : NSObject
/**
 创建渐变颜色
 
 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色
 
 @return 创建的渐变颜色
 */
+ (UIColor*)bm_colorGradientChangeWithSize:(CGSize)size
                                     direction:(HKGradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;


// 其他曲线渐变暂不考虑


@end

NS_ASSUME_NONNULL_END
