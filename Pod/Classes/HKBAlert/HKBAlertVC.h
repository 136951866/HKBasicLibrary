//
//  HKBAlertVC.h
//  Takeaway
//
//  Created by hank on 2020/9/1.
//  Copyright © 2020 CJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HKBAlertVC : UIViewController
/// 弹窗创建工厂方法
+ (instancetype)presentAlert;

- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
