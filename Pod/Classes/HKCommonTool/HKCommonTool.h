//
//  HKCommonTool.h
//  Takeaway
//
//  Created by hank on 2020/8/19.
//  Copyright © 2020 LZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface HKCommonTool : NSObject

/**
*  拿指定VC
*/
+ (id)getVCWithClassWtihClassName:(Class)targetClass targetResponderView:(UIResponder *)targetResponder;
+ (UIViewController *)getClassWtihClassName:(Class)aClass targetVC:(UIViewController *)target;

//color->image
+ (UIImage*) createImageWithColor:(UIColor*) color;

//打电话
+ (void)showWithTellPhone:(NSString *)Number inView:(UIView *)view;

//模态相关
+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;
+ (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion;


//保存图片到沙盒
+ (NSString *)getImagePath:(UIImage *)Image filename:(NSString*)filaname;
+ (NSString *)getNoCompressImagePath:(UIImage *)Image filename:(NSString*)filaname;
@end

NS_ASSUME_NONNULL_END
